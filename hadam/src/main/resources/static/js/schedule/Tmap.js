$(() => {
	let maps = new Tmapv2.Map("map-main", { // 지도가 생성될 div
		center: new Tmapv2.LatLng(37.731636, 127.051142),
		zoom: 17
	});

})

// 이동시간 구하는 함수
const DurationOfTime = async (imgcount) => {

	// 이동시간 리스트
	let totalTimelist = [];

	let imgc = Object.entries(imgcount)
	console.log(imgc)
	// entries하면 lenghth와 prevObject가 존재해서 그걸 빼는 작업
	imgc.pop()
	imgc.pop()
	for (const [idx, element] of imgc) {

		// 마커와 마커에 해당하는 장소 정보를 보여주는 창 생성 함수
		drawLocationMarkerAndInfoWindow(element, idx)

		// 지도의 추가된 스케줄의 -1개만큼 이동시간 구하기		
		if (idx > 0) {
			let prevlati = $(imgcount[idx - 1]).attr('name').split(",")[0]
			let prevlogi = $(imgcount[idx - 1]).attr('name').split(",")[1]
			let lati = $(element).attr('name').split(",")[0]
			let logi = $(element).attr('name').split(",")[1]
			// 지도불러온 후 계산해서 나온 이동시간 리스트에 넣기
			const transitData = await Tmaptransit(prevlati, prevlogi, lati, logi)
			// 대중교통을 이용해서 이동을 하는 경우
			if (transitData.hasOwnProperty('metaData')) {
				totalTimelist.push(Math.round(transitData.metaData.plan.itineraries[0].totalTime / 60))
				console.log(transitData)
				drawTmapTransitPolyLine(transitData)

			} else {
				switch (transitData.result.status) {
					// 거리가 너무 가까워서 대중교통을 이용할 필요가 없는 경우
					//보행자 API
					case 11: const pedestrianData = await TmapPedestrian(prevlati, prevlogi, lati, logi)
						totalTimelist.push(Math.round(pedestrianData.features[0].properties.totalTime / 60))
						drawTmapPedestrianPolyLine(pedestrianData)
						break
					// 검색결과가 존재하지 않을때 처리
					case 14: break
					// 응답시간이 길때 처리
					case 31: break
					// 12 : 출발지 정류장 매핑 실패, 13: 도착지 정류장 매핑 실패, 21: 필수 입력 값 형식 및 범위 오류, 22: 필수 입력 값 누락 오류, 23: 서비스 지역 아님, 24: 타임머신 시각 오류, 32: 기타 오류
					// 나머지 처리
				}
			}
		}
	}
	// 총시간을 가지고 요약표를 만들기
	changesummary(totalTimelist)
}

// TMAP 보행자 API 호출
const TmapPedestrian = async (startY, startX, endY, endX) => {
	const data = {
		startX: startX,		// 출발지 정보
		startY: startY,
		endX: endX,	// 도착지 정보
		endY: endY,
		startName: "출발지",
		endName: "도착지"
		// searchDttm(2023010111120)	타임머신: 시간까지 계산
	};

	let url = "https://apis.openapi.sk.com/tmap/routes/pedestrian";

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
const Tmaptransit = async (startY, startX, endY, endX) => {
	const data = {
		startX: startX,		// 출발지 정보
		startY: startY,
		endX: endX,	// 도착지 정보
		endY: endY
		// searchDttm(2023010111120)	타임머신: 시간까지 계산
	};

	let url = "https://apis.openapi.sk.com/transit/routes";

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
const drawTmapPedestrianPolyLine = (data) => {
	// 0번째는 출발 포인트
	// 마지막은 도착지 포인트
	for (var j = 1; j < data.features.length - 1; j++) {
		lineArray = null;
		lineArray = new Array();
		for (var k = 0; k < data.features[j].geometry.coordinates.length; k++) {
			var list = data.features[j].geometry.coordinates[k]
			lineArray.push(new Tmapv2.LatLng(list[1], list[0]))
		}

		let polyline = new Tmapv2.Polyline({
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
const drawTmapTransitPolyLine = (data) => {
	// itineraries : 시작지부터 도착지까지 갈 수 있는 방법
	for (var j = 0; j < data.metaData.plan.itineraries[0].legs.length; j++) {
		lineArray = null;
		lineArray = new Array();
		if (data.metaData.plan.itineraries[0].legs[j].mode == "WALK") {
			if (Object.keys(data.metaData.plan.itineraries[0].legs[j]).includes("steps")) {
				for (var k = 0; k < data.metaData.plan.itineraries[0].legs[j].steps.length; k++) {
					let list = data.metaData.plan.itineraries[0].legs[j].steps[k].linestring.split(" ")
					for (var f = 0; f < list.length; f++) {
						lineArray.push(new Tmapv2.LatLng(list[f].split(",")[1], list[f].split(",")[0]))
					}
				}
			} else {
				let list = data.metaData.plan.itineraries[0].legs[j].passShape.linestring.split(" ")
				for (var k = 0; k < list.length; k++) {
					lineArray.push(new Tmapv2.LatLng(list[k].split(",")[1], list[k].split(",")[0]))
				}
			}

		} else if (data.metaData.plan.itineraries[0].legs[j].mode == "BUS" || data.metaData.plan.itineraries[0].legs[j].mode == "SUBWAY") {
			let startStation = data.metaData.plan.itineraries[0].legs[j]

			// 버스 정류장 or 지하철 정류장 출발지 마커와 인포 생성 함수
			drawTransitMarkerAndInfoWindow(startStation)
			let list = data.metaData.plan.itineraries[0].legs[j].passShape.linestring.split(" ")

			for (var k = 0; k < list.length; k++) {
				lineArray.push(new Tmapv2.LatLng(list[k].split(",")[1], list[k].split(",")[0]))
			}

		}

		// 대중교통의 종류에 따라서 색상 변경
		if (data.metaData.plan.itineraries[0].legs[j].mode == "WALK") {
			let polyline = new Tmapv2.Polyline({
				map: map,
				path: lineArray,
				strokeWeight: 5,
				direction: true,
				strokeColor: '#000000',
				strokeStyle: "dot",
			});
		} else if (data.metaData.plan.itineraries[0].legs[j].mode == "SUBWAY") {
			let lineColor = '#' + data.metaData.plan.itineraries[0].legs[j].routeColor
			let polyline = new Tmapv2.Polyline({
				map: map,
				path: lineArray,
				strokeWeight: 8,
				direction: true,
				strokeColor: lineColor,
				strokeStyle: "solid"
			});

		} else if (data.metaData.plan.itineraries[0].legs[j].mode == "BUS") {
			let lineColor = '#' + data.metaData.plan.itineraries[0].legs[j].routeColor
			let polyline = new Tmapv2.Polyline({
				map: map,
				path: lineArray,
				strokeWeight: 8,
				direction: true,
				strokeColor: lineColor,
				strokeStyle: "dash"
			});

		} else {
			let polyline = new Tmapv2.Polyline({
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
const changemap = async () => {

	$('#map-main').empty()
	let imgcount = $(".scheduleTable").find('img')

	// 스케줄이 1개 남아있었는데 삭제했을 경우
	if (imgcount.length == 0) {

		$('#listBox').empty()

		return false
	}

	let [lat, lng] = imgcount.attr('name').split(",")
	
	map = new Tmapv2.Map("map-main", { // 지도가 생성될 div
			center: new Tmapv2.LatLng(lat, lng),
			zoom: 17,
			zIndexInfoWindow :11
		})

	// 스케줄이 하나일때는 대중교통API를 불러올 필요가 없다
	if (imgcount.length == 1) {
		
		drawLocationMarkerAndInfoWindow(imgcount, 0)
		changesummary()
	}
	// 스케줄이 2개 이상일때
	else if (imgcount.length > 1) {

		$(".loader-wrap").fadeIn(200)

		// 이동시간 구하는 함수 호출
		DurationOfTime(imgcount)
	}
}

// 장소 마커, 정보 생성 함수
const drawLocationMarkerAndInfoWindow = (element, idx) => {

	let [lat, lng] = $(element).attr('name').split(",")
	console.log(idx)

	// 마커안와 매핑되는 인포윈도우의 내용들
	let content = "<div class='m-pop' style='position: static; top: 180px; left : 320px; display: flex; font-size: 14px; box-shadow: 5px 5px 5px #00000040; border-radius: 10px; width : 400px; height:100px; background-color: #FFFFFF; align-items: center; padding: 5px;'>" +
		`<div class='img-box' style='width: 110px; height: 90px;'>` +
		`<img onerror = "this.src=/images/gal/no_image2.jpg" src="${$(element).attr('src')}" style = "width:110px; height:90px; background-size: cover; border-radius: 10px; background: #f5f5f5 no-repeat center;";></div>` +
		"<div class='info-box' style='margin-left : 10px'>" +
		"<p style='margin-bottom: 7px;'>" +
		`<span class='tit' style=' font-size: 16px; font-weight: bold;'>${$(element).attr('alt')}</span>` +
		"<p>" +
		`<span class='new-addr'>${$(element).attr('name').split(",")[2]}</span>` +
		"</p>" +
		"</div>" +
		`<a href='javascript:void(0)' onclick=$(this).parent().parent().css("visibility","hidden") class='btn-close' style='position: absolute; top: 10px; right: 10px; display: block; width: 15px; height: 15px;'></a>` +
		"</div>";

	// 인포윈도우생성
	const infoWindow = new Tmapv2.InfoWindow({
		position: new Tmapv2.LatLng(lat, lng), //Popup 이 표출될 맵 좌표
		content: content, //Popup 표시될 text
		border: '0px solid #FF0000', //Popup의 테두리 border 설정.
		type: 2, //Popup의 type 설정.
		map: map, //Popup이 표시될 맵 객체
		visible: false
	});

	// 마커생성
	const maker = new Tmapv2.Marker({
		position: new Tmapv2.LatLng(lat, lng), //Marker의 중심좌표 설정.
		map: map, //Marker가 표시될 Map 설정..
		icon: `http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_${Number(idx) + 1}.png`,
	});

	// 마커를 클릭했을때 이벤트
	maker.addListener('click', (e) => {
		if ($(infoWindow._htmlElement).css("visibility") == "hidden") {
			infoWindow.setVisible(true)
		} else {
			infoWindow.setVisible(false)
		}
	});
}

// 마커, 해당 장소 정보 생성 함수
const drawTransitMarkerAndInfoWindow = (startStation) => {

	let content = "<div class='m-pop' style='position: static; top: 180px; left : 320px; display: flex; font-size: 14px; box-shadow: 5px 5px 5px #00000040; border-radius: 10px; width : 250px; height:auto; background-color: #FFFFFF; align-items: center; padding: 5px;'>" +
		"<div class='info-box' style='margin-left : 10px'>" +
		"<p style=' text-align: left; margin-bottom: 7px;'>" +
		`<span class='tit' style=' font-size: 16px; font-weight: bold;'>${startStation.route}</span>` +
		"<p style='text-align: left; display: block;'>" +
		`<span style="display: block;" class='new-addr'>승차 : ${startStation.start.name}</span>` +
		`<span style="display: block;" class='new-addr'>하차 : ${startStation.end.name}</span>` +
		"</p>" +
		"</div>" +
		"<a href='javascript:void(0)' onclick = $(this).parent().parent().css('visibility','hidden') class='btn-close' style='position: absolute; top: 10px; right: 10px; display: block; width: 15px; height: 15px;'></a>" +
		"</div>";

	// 인포윈도우생성
	const infoWindow = new Tmapv2.InfoWindow({
		position: new Tmapv2.LatLng(startStation.start.lat, startStation.start.lon), //Popup 이 표출될 맵 좌표
		content: content, //Popup 표시될 text
		border: '0px solid #FF0000', //Popup의 테두리 border 설정.
		type: 2, //Popup의 type 설정.
		map: map, //Popup이 표시될 맵 객체
		visible: false
	});

	// 마커생성
	const maker = new Tmapv2.Marker({
		position: new Tmapv2.LatLng(startStation.start.lat, startStation.start.lon), //Marker의 중심좌표 설정.
		map: map, //Marker가 표시될 Map 설정..
		icon: `/images/marker/${startStation.mode}.png`,
	});

	// 마커를 클릭했을때 이벤트
	maker.addListener('click', (e) => {
		if ($(infoWindow._htmlElement).css("visibility") == "hidden") {
			infoWindow.setVisible(true)
		} else {
			infoWindow.setVisible(false)
		}
	});
}
