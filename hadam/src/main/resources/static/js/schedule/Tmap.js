$(() => {
	var map = new Tmapv2.Map("map-main", { // 지도가 생성될 div
		center: new Tmapv2.LatLng(37.731636, 127.051142),
		zoom: 17
	});

})

// 이동시간 리스트
var totalTimelist = [];

var lineArray;

// 이동시간 구하는 함수
async function DurationOfTime(imgcount) {
	var imgc = Object.entries(imgcount)
	// entries하면 lenghth와 pre 가 존재해서 그걸 빼는 작업
	imgc.pop()
	imgc.pop()
	for (const [idx, element] of imgc) {
		var content = "<div class='m-pop' style='position: static; top: 180px; left : 320px; display: flex; font-size: 14px; box-shadow: 5px 5px 5px #00000040; border-radius: 10px; width : 400px; height:100px; background-color: #FFFFFF; align-items: center; padding: 5px;'>" +
			`<div class='img-box' style='width: 110px; height: 90px;'><img src=${$(element).attr('src')} style = "width:110px; height:90px; background-size: cover; border-radius: 10px; background: #f5f5f5 no-repeat center;";></div>` +
			"<div class='info-box' style='margin-left : 10px'>" +
			"<p style='margin-bottom: 7px;'>" +
			`<span class='tit' style=' font-size: 16px; font-weight: bold;'>${$(element).attr('alt')}</span>` +
			"<p>" +
			`<span class='new-addr'>${$(element).attr('id')}</span>` +
			"</p>" +
			"</div>" +
			`<a href='javascript:void(0)' onclick=$(this).parent().parent().css("visibility","hidden") class='btn-close' style='position: absolute; top: 10px; right: 10px; display: block; width: 15px; height: 15px;'></a>` +
			"</div>";

		// 마커생성
		const maker = new Tmapv2.Marker({
			position: new Tmapv2.LatLng($(element).attr('name').split(",")[0], $(element).attr('name').split(",")[1]), //Marker의 중심좌표 설정.
			map: map, //Marker가 표시될 Map 설정..
		});

		// 인포윈도우생성
		const infoWindow = new Tmapv2.InfoWindow({
			position: new Tmapv2.LatLng($(element).attr('name').split(",")[0], $(element).attr('name').split(",")[1]), //Popup 이 표출될 맵 좌표
			content: content, //Popup 표시될 text
			border: '0px solid #FF0000', //Popup의 테두리 border 설정.
			type: 2, //Popup의 type 설정.
			map: map //Popup이 표시될 맵 객체
		});

		// 마커를 클릭했을때 이벤트
		maker.addListener('click', (e) => {
			// 마커와 infoWindow를 매핑해주는 변수
			makeridx = $(maker._htmlElement).index()
			markdiv = $(maker._htmlElement).parent().next().children().eq(Math.floor(makeridx / 2))
			if ($(markdiv).css('visibility') == "hidden") {
				$(markdiv).css('visibility', '')
			} else {
				$(markdiv).css('visibility', 'hidden')
			}
		});

		// 지도의 추가된 스케줄의 -1개만큼 이동시간 구하기		
		if (idx > 0) {
			let prevlati = $(imgcount[idx - 1]).attr('name').split(",")[0]
			let prevlogi = $(imgcount[idx - 1]).attr('name').split(",")[1]
			let lati = $(element).attr('name').split(",")[0]
			let logi = $(element).attr('name').split(",")[1]

			// 지도불러온 후 계산해서 나온 이동시간 리스트에 넣기
			await Tmaptransit(prevlati, prevlogi, lati, logi).then(async (data) => {
				// 대중교통을 이용해서 이동을 하는 경우
				if (data.hasOwnProperty('metaData')) {
					totalTimelist.push(Math.round(data.metaData.plan.itineraries[0].totalTime / 60))
					drawTmapTransitPolyLine(data)
				} else if (data.hasOwnProperty('result')) {
					// 거리가 너무 가까워서 대중교통을 이용할 필요가 없는 경우
					if (data.result.status == 11) {
						//보행자 API
						await TmapPedestrian(prevlati, prevlogi, lati, logi).then((data) => {
							totalTimelist.push(Math.round(data.features[0].properties.totalTime / 60))
							drawTmapPedestrianPolyLine(data)
						})
					} else if (data.result.status == 14) {
						// 검색결과가 존재하지 않을때 처리
					} else if (data.result.status == 31) {
						// 응답시간이 길때 처리
					} else {
						// 12 : 출발지 정류장 매핑 실패, 13: 도착지 정류장 매핑 실패, 21: 필수 입력 값 형식 및 범위 오류, 22: 필수 입력 값 누락 오류, 23: 서비스 지역 아님, 24: 타임머신 시각 오류, 32: 기타 오류
						// 나머지 처리
					}
				}
			}).catch((error) => { console.log(error) })
		}
	}
	// 총시간을 가지고 요약표를 만들기
	changesummary(totalTimelist)
}

// TMAP 보행자 API 호출
async function TmapPedestrian(startY, startX, endY, endX) {
	const data = {
		startX: startX,		// 출발지 정보
		startY: startY,
		endX: endX,	// 도착지 정보
		endY: endY,
		startName: "출발지",
		endName: "도착지"
		// searchDttm(2023010111120)	타임머신: 시간까지 계산
	};

	var url = "https://apis.openapi.sk.com/tmap/routes/pedestrian";

	const options = {
		method: "POST",
		headers: {
			"Content-Type": "application/json",
			"appKey": "bTzxg9y1S91QlJO5guOD39akE04QLCba8oakDcja"
		},
		body: JSON.stringify(data)
	}

	const res = await fetch(url, options)
	const datas = await res.json()

	if (res.ok) {
		return datas;
	} else {
		throw Error(data)
	}
}

// TMAP 대중교통 API 호출
async function Tmaptransit(startY, startX, endY, endX) {
	const data = {
		startX: startX,		// 출발지 정보
		startY: startY,
		endX: endX,	// 도착지 정보
		endY: endY
		// searchDttm(2023010111120)	타임머신: 시간까지 계산
	};

	var url = "https://apis.openapi.sk.com/transit/routes";

	const options = {
		method: "POST",
		headers: {
			"Content-Type": "application/json",
			"appKey": "bTzxg9y1S91QlJO5guOD39akE04QLCba8oakDcja"
		},
		body: JSON.stringify(data)
	}

	const res = await fetch(url, options)
	const datas = await res.json()
	if (res.ok) {
		return datas;
	} else {
		throw Error(data)
	}
}

// 보행자 이동경로찍는 함수
function drawTmapPedestrianPolyLine(data) {
	// 0번째는 출발 포인트
	// 마지막은 도착지 포인트
	for (var j = 1; j < data.features.length - 1; j++) {
		lineArray = null;
		lineArray = new Array();
		for (var k = 0; k < data.features[j].geometry.coordinates.length; k++) {
			var list = data.features[j].geometry.coordinates[k]
			lineArray.push(new Tmapv2.LatLng(list[1], list[0]))
		}

		var polyline = new Tmapv2.Polyline({
			map: map,
			path: lineArray,
			strokeWeight: 5,
			strokeColor: '#000000',
			strokeStyle: "dot",
		});
	}
}


// 대중교통경로찍는 함수
// 종류에 따라 선 커스텀
function drawTmapTransitPolyLine(data) {
	// itineraries : 시작지부터 도착지까지 갈 수 있는 방법
	for (var j = 0; j < data.metaData.plan.itineraries[0].legs.length; j++) {
		lineArray = null;
		lineArray = new Array();
		if (data.metaData.plan.itineraries[0].legs[j].mode == "WALK") {
			if (Object.keys(data.metaData.plan.itineraries[0].legs[j]).includes("steps")) {
				for (var k = 0; k < data.metaData.plan.itineraries[0].legs[j].steps.length; k++) {
					var list = data.metaData.plan.itineraries[0].legs[j].steps[k].linestring.split(" ")
					for (var f = 0; f < list.length; f++) {
						lineArray.push(new Tmapv2.LatLng(list[f].split(",")[1], list[f].split(",")[0]))
					}
				}
			} else {
				var list = data.metaData.plan.itineraries[0].legs[j].passShape.linestring.split(" ")
				for (var k = 0; k < list.length; k++) {
					lineArray.push(new Tmapv2.LatLng(list[k].split(",")[1], list[k].split(",")[0]))
				}
			}

		} else if (data.metaData.plan.itineraries[0].legs[j].mode == "BUS" || data.metaData.plan.itineraries[0].legs[j].mode == "SUBWAY") {
			var list = data.metaData.plan.itineraries[0].legs[j].passShape.linestring.split(" ")

			for (var k = 0; k < list.length; k++) {
				lineArray.push(new Tmapv2.LatLng(list[k].split(",")[1], list[k].split(",")[0]))
			}

		} 

		// 대중교통의 종류에 따라서 색상 변경
		if (data.metaData.plan.itineraries[0].legs[j].mode == "WALK") {
			var polyline = new Tmapv2.Polyline({
				map: map,
				path: lineArray,
				strokeWeight: 5,
				direction: true,
				strokeColor: '#000000',
				strokeStyle: "dot",
			});
		} else if (data.metaData.plan.itineraries[0].legs[j].mode == "SUBWAY") {
			var lineColor = '#' + data.metaData.plan.itineraries[0].legs[j].routeColor
			var polyline = new Tmapv2.Polyline({
				map: map,
				path: lineArray,
				strokeWeight: 8,
				direction: true,
				strokeColor: lineColor,
				strokeStyle: "solid"
			});

		} else if (data.metaData.plan.itineraries[0].legs[j].mode == "BUS") {
			var lineColor = '#' + data.metaData.plan.itineraries[0].legs[j].routeColor
			var polyline = new Tmapv2.Polyline({
				map: map,
				path: lineArray,
				strokeWeight: 8,
				direction: true,
				strokeColor: lineColor,
				strokeStyle: "dash"
			});

		} else {
			var polyline = new Tmapv2.Polyline({
				map: map,
				path: lineArray,
				direction: true,
				strokeWeight: 8,
				strokeColor: '#003499',
			});
		}


	}
}

// 스케줄이 바뀔때마다 맵을 바꿔주는 함수
let changemap = async () => {
	$('#map-main').empty()
	totalTimelist = [];

	var imgcount = $(".scheduleTable").find('img')

	// 스케줄이 하나일때는 대중교통API를 불러올 필요가 없다
	if (imgcount.length == 1) {

		var content = "<div class='m-pop' style='position: static; top: 180px; left : 320px; display: flex; font-size: 14px; box-shadow: 5px 5px 5px #00000040; border-radius: 10px; width : 400px; height:100px; background-color: #FFFFFF; align-items: center; padding: 5px;'>" +
			`<div class='img-box' style='width: 110px; height: 90px;'><img src=${imgcount.attr('src')} style = "width:110px; height:90px; background-size: cover; border-radius: 10px; background: #f5f5f5 no-repeat center;";></div>` +
			"<div class='info-box' style='margin-left : 10px'>" +
			"<p style='margin-bottom: 7px;'>" +
			`<span class='tit' style=' font-size: 16px; font-weight: bold;'>${imgcount.attr('alt')}</span>` +
			"<p>" +
			`<span class='new-addr'>${imgcount.attr('id')}</span>` +
			"</p>" +
			"</div>" +
			"<a href='javascript:void(0)' onclick= infoWindow.setVisible(false); class='btn-close' style='position: absolute; top: 10px; right: 10px; display: block; width: 15px; height: 15px;'></a>" +
			"</div>";
		map = new Tmapv2.Map("map-main", { // 지도가 생성될 div
			center: new Tmapv2.LatLng(imgcount.attr('name').split(",")[0], imgcount.attr('name').split(",")[1]),
			zoom: 17
		})

		infoWindow = new Tmapv2.InfoWindow({
			position: new Tmapv2.LatLng(imgcount.attr('name').split(",")[0], imgcount.attr('name').split(",")[1]), //Popup 이 표출될 맵 좌표
			content: content, //Popup 표시될 text
			border: '0px solid #FF0000', //Popup의 테두리 border 설정.
			type: 2, //Popup의 type 설정.
			map: map //Popup이 표시될 맵 객체
		});

		var marker = new Tmapv2.Marker({
			position: new Tmapv2.LatLng(imgcount.attr('name').split(",")[0], imgcount.attr('name').split(",")[1]), //Marker의 중심좌표 설정.
			map: map //Marker가 표시될 Map 설정..
		});

		marker.addListener("click", function(evt) {
			infoWindow.setVisible(true)
		});
		changesummary()
	}
	// 스케줄이 2개 이상일때
	else {
		$('#map-main').empty()

		var imgcount = $(".scheduleTable").find('img')
		map = new Tmapv2.Map("map-main", { // 지도가 생성될 div
			center: new Tmapv2.LatLng($(imgcount[0]).attr('name').split(",")[0], $(imgcount[0]).attr('name').split(",")[1]),
			zoom: 17
		})

		// 이동시간 구하는 함수 호출
		DurationOfTime(imgcount)
	}

}






