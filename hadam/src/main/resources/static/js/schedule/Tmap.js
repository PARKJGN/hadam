
/*var map = new Tmapv2.Map("map-main", { // 지도가 생성될 div
			center : new Tmapv2.LatLng(37.731636, 127.051142),
			zoom : 17
		});*/

// TMAP 대중교통 API 호출
function searchPubTransPathAJAX() {
	
	const data = {
    startX: 127.051142,		// 출발지 정보
    startY: 37.731636,
    endX: 126.9378052037011,	// 도착지 정보
    endY: 37.55251992055766
    // searchDttm(2023010111120)	타임머신: 시간까지 계산
};

	var xhr = new XMLHttpRequest();
	var url = "https://apis.openapi.sk.com/transit/routes";
	xhr.open("post", url, true);
	xhr.setRequestHeader('content-type', 'application/json')
	xhr.setRequestHeader("appKey", "bTzxg9y1S91QlJO5guOD39akE04QLCba8oakDcja");
	xhr.send(JSON.stringify(data));
	xhr.onreadystatechange = function() {
	
		if (xhr.readyState == 4 && xhr.status == 200) {			// readyState 가 4면 요청 완료, 3이면 로딩중 사용자한테 보여줄때 로딩까지 처리
			
			drawNaverMarker(127.051142,37.731636);					// 출발지 마커 표시
			drawNaverMarker(126.9378052037011,37.55251992055766);					// 도착지 마커 표시
			var resultJsonData = JSON.parse(xhr.responseText);
			
			
			
			// 12 : 출발지 정류장 매핑 실패, 13: 도착지 정류장 매핑 실패, 21: 필수 입력 값 형식 및 범위 오류, 22: 필수 입력 값 누락 오류, 23: 서비스 지역 아님, 24: 타임머신 시각 오류, 32: 기타 오류
			if (resultJsonData.result.status == 11){
				// 보행자 API 호출하기
				// 거리가 짧아서 정보가 나오지 않는다.
			} else if(resultJsonData.result.status == 14){
				// 검색결과가 없다
			} else if(resultJsonData.result.status == 31){
				// 일정 시간 응답이 없음
			}
			drawNaverPolyLine(resultJsonData)
			
			
		}
		
		
	}
}

/*searchPubTransPathAJAX()*/
	

// 마커찍는 함수
// 출발지가 경유지 도착지만 찍으면 됨
function drawNaverMarker(x,y){
		var marker = new Tmapv2.Marker({
			position: new Tmapv2.LatLng(y, x), //Marker의 중심좌표 설정.
			map: map //Marker가 표시될 Map 설정..
		});
	}
	
// 경로찍는 함수
// 종류에 따라 선 커스텀
function drawNaverPolyLine(data){
	
	// itineraries : 시작지부터 도착지까지 갈 수 있는 방법
		var lineArray;
			for(var j=0 ; j <data.metaData.plan.itineraries[0].legs.length; j++){
				lineArray = null;
				lineArray = new Array();
				console.log(data.metaData.plan.itineraries[i].legs[j])
				console.log(data.metaData.plan.itineraries[i])
				if(data.metaData.plan.itineraries[i].legs[j].mode == "WALK"){
					if(Object.keys(data.metaData.plan.itineraries[i].legs[j]).includes("steps")){
						console.log("여기로안와?")
						for(var k=0 ; k < data.metaData.plan.itineraries[i].legs[j].steps.length; k++){
							var list = data.metaData.plan.itineraries[i].legs[j].steps[k].linestring.split(" ")
							for(var f = 0; f < list.length; f++){
								lineArray.push(new Tmapv2.LatLng(list[f].split(",")[1], list[f].split(",")[0]))
								}
							}
					} else {
						var list = data.metaData.plan.itineraries[i].legs[j].passShape.linestring.split(" ")
						for(var k=0; k< list.length; k++){
						lineArray.push(new Tmapv2.LatLng(list[k].split(",")[1], list[k].split(",")[0]))
						}
					}
					
				} else if(data.metaData.plan.itineraries[i].legs[j].mode == "BUS" || data.metaData.plan.itineraries[i].legs[j].mode == "SUBWAY"){
					var list = data.metaData.plan.itineraries[i].legs[j].passShape.linestring.split(" ")
					
					for(var k=0; k< list.length; k++){
						lineArray.push(new Tmapv2.LatLng(list[k].split(",")[1], list[k].split(",")[0]))
					}
					
				}
					
				
				var polyline = new Tmapv2.Polyline({
					    map: map,
					    path: lineArray,
					    strokeWeight: 7,
					    strokeColor: '#003499',
				});	
			
			}
	}