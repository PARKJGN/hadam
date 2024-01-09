/*var container = document.getElementById('map-main'); //지도를 담을 영역의 DOM 레퍼런스
	
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(37.731636, 127.051142), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};*/

var map = new Tmapv2.Map("map-main", { // 지도가 생성될 div
			center : new Tmapv2.LatLng(37.731636, 127.051142),
			zoom : 17
		});


		
/*var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

var bounds = new kakao.maps.LatLngBounds();

var points = [
    new kakao.maps.LatLng(37.731636, 127.051142),
    new kakao.maps.LatLng(37.55251992055766, 126.9378052037011),
];


var i, marker;

for (i = 0; i < points.length; i++) {
    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
    marker =     new kakao.maps.Marker({ position : points[i] });
    marker.setMap(map);
        bounds.extend(points[i]);
}

function setBounds() {
    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
    map.setBounds(bounds);
}

setBounds()*/
	
// 지도에 마커를 표시합니다 
/*
var marker = new kakao.maps.Marker({
   	map: map, 
    position: new kakao.maps.LatLng(37.731636, 127.051142)
});

var marker2 = new kakao.maps.Marker({
   	map: map, 
    position: new kakao.maps.LatLng(37.394469584427156, 127.10966790676201)
});

var marker3 = new kakao.maps.Marker({
   	map: map, 
    position: new kakao.maps.LatLng(37.40242613861426, 127.10967543155922)
});

var marker4 = new kakao.maps.Marker({
   	map: map, 
    position: new kakao.maps.LatLng(37.55251992055766, 126.93780520370113)
});
*/
	
/*var content = '<div class="wrap">' + 
           '    <div class="info">' + 
           '        <div class="title">' + 
           '            카카오 스페이스닷원' + 
           '            <div class="close" onclick="closeOverlay1()" title="닫기"></div>' + 
           '        </div>' + 
           '        <div class="body">' + 
           '            <div class="img">' +
           '                <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumnail.png" width="73" height="70">' +
           '           </div>' + 
           '            <div class="desc">' + 
           '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
           '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
           '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
           '            </div>' + 
           '        </div>' + 
           '    </div>' +    
           '</div>';
           
var content2 = '<div class="wrap">' + 
           '    <div class="info">' + 
           '        <div class="title">' + 
           '            ICT 교육' + 
           '            <div class="close" onclick="closeOverlay2()" title="닫기"></div>' + 
           '        </div>' + 
           '        <div class="body">' + 
           '            <div class="img">' +
           '                <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumnail.png" width="73" height="70">' +
           '           </div>' + 
           '            <div class="desc">' + 
           '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
           '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
           '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
           '            </div>' + 
           '        </div>' + 
           '    </div>' +    
           '</div>';
            
   // 마커 위에 커스텀오버레이를 표시합니다
	// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
var overlay = new kakao.maps.CustomOverlay({
     content: content,
  	 map: map,
   	 position: marker.getPosition()       
});

var overlay2 = new kakao.maps.CustomOverlay({
    content: content2,
  	 map: map,
   	 position: marker4.getPosition()       
});

kakao.maps.event.addListener(marker, 'click', function() {
    overlay.setMap(map);
});

kakao.maps.event.addListener(marker4, 'click', function() {
    overlay2.setMap(map);
});*/
	
// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
/*function closeOverlay1() {
   		overlay.setMap(null);     
	}
	
function closeOverlay2() {
   		overlay2.setMap(null);     
	}*/	
	
//odsay api 교통정보 불러오기
function searchPubTransPathAJAX() {
	var xhr = new XMLHttpRequest();
	var url = "https://api.odsay.com/v1/api/searchPubTransPathT?SX=127.051142&SY=37.731636&EX=126.93780520370113&EY=37.55251992055766&apiKey=6hCoSiQwtD3Sd7PLdkTzNN33sPhgei5iWZnQaSaWtIk";
	xhr.open("GET", url, true);
	xhr.send();
	xhr.onreadystatechange = function() {

		if (xhr.readyState == 4 && xhr.status == 200) {
			console.log( xhr.responseText ); // <- xhr.responseText 로 결과를 가져올 수 있음
			callMapObjApiAJAX((JSON.parse(xhr.responseText))["result"]["path"][0].info.mapObj);
		}
	}
}

searchPubTransPathAJAX()


function callMapObjApiAJAX(mabObj){
		var xhr = new XMLHttpRequest();
		//ODsay apiKey 입력
		var url = "https://api.odsay.com/v1/api/loadLane?mapObject=0:0@"+mabObj+"&apiKey=6hCoSiQwtD3Sd7PLdkTzNN33sPhgei5iWZnQaSaWtIk";
		xhr.open("GET", url, true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var resultJsonData = JSON.parse(xhr.responseText);
				console.log(resultJsonData)
				drawNaverMarker(127.051142,37.731636);					// 출발지 마커 표시
				drawNaverMarker(126.9378052037011,37.55251992055766);					// 도착지 마커 표시
				drawNaverPolyLine(resultJsonData);		// 노선그래픽데이터 지도위 표시
				// boundary 데이터가 있을경우, 해당 boundary로 지도이동
				/*if(resultJsonData.result.boundary){
						var boundary = new kakao.maps.LatLngBounds(
				                new kakao.maps.LatLng(resultJsonData.result.boundary.top, resultJsonData.result.boundary.left),
				                new kakao.maps.LatLng(resultJsonData.result.boundary.bottom, resultJsonData.result.boundary.right)
				                );
						map.panToBounds(boundary);
				}*/
			}
		}
	}
	

	
function drawNaverMarker(x,y){
		var marker = new Tmapv2.Marker({
			position: new Tmapv2.LatLng(y, x), //Marker의 중심좌표 설정.
			map: map //Marker가 표시될 Map 설정..
		});
	}
	
function drawNaverPolyLine(data){
	
		var lineArray;
		
		for(var i = 0 ; i < data.result.lane.length; i++){
			for(var j=0 ; j <data.result.lane[i].section.length; j++){
				lineArray = null;
				lineArray = new Array();
				for(var k=0 ; k < data.result.lane[i].section[j].graphPos.length; k++){
					
					lineArray.push(new Tmapv2.LatLng(data.result.lane[i].section[j].graphPos[k].y, data.result.lane[i].section[j].graphPos[k].x));
					
				}
				
				
			//지하철결과의 경우 노선에 따른 라인색상 지정하는 부분 (1,2호선의 경우만 예로 들음)
				if(data.result.lane[i].type == 1){
					var polyline = new Tmapv2.Polyline({
					    map: map,
					    path: lineArray,
					    strokeWeight: 7,
					    strokeColor: '#003499',
					    zIndex: 9999
					});
				}else if(data.result.lane[i].type == 2){
					var polyline =new Tmapv2.Polyline({
					    map: map,
					    path: lineArray,
					    strokeWeight: 4,
					    strokeColor: '#37b42d',
					    zIndex: 9999
					});
				}else if(data.result.lane[i].type == 3){
					var polyline = new Tmapv2.Polyline({
					    map: map,
					    path: lineArray,
					    strokeWeight: 4,
					    strokeColor: '#FF6347',
					    zIndex: 9999
					});
				}else if(data.result.lane[i].type == 4){
					var polyline = new Tmapv2.Polyline({
					    map: map,
					    path: lineArray,
					    strokeWeight: 4,
					    strokeColor: '#FF0000',
					    zIndex: 9999
					});
				}else if(data.result.lane[i].type == 5){
					var polyline = new Tmapv2.Polyline({
					    map: map,
					    path: lineArray,
					    strokeWeight: 4,
					    strokeColor: '#00FF00',
					    zIndex: 9999
					});
				}else if(data.result.lane[i].type == 6){
					var polyline = new Tmapv2.Polyline({
					    map: map,
					    path: lineArray,
					    strokeWeight: 4,
					    strokeColor: '#4682B4',
					    zIndex: 9999
					});
				}else{
					var polyline = new Tmapv2.Polyline({
					    map: map,
					    path: lineArray,
					    strokeWeight: 4,
					    zIndex: 9999
					});
					
			
				}
			}
		}
	}