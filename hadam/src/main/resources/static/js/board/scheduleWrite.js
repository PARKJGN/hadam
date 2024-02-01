/**
 * 
 */

// 스케줄 불러오기 클릭시
 $('.scheduleSelectBtn').on('click', function() {
			    var scheduleTableId = $(this).data('schedule-id');
	    
			    scheduleSelect(scheduleTableId);
			});
			
			// 해당하는 scheduleTableId 가져오기
			function scheduleSelect(scheduleTableId) {
			    $.ajax({
			        type: "post",
			        url: "/community/scheduleSelect",
			        data: {
			            scheduleTableId: scheduleTableId
			        },
			        dataType: "json",
			        success: function(result) {
						
			            console.log("작성 성공");
			            let output = "<div/>"
				             
							output += "<div class=;listing-item-container init-grid-items fl-wrap three-columns-grid' id='listBox'>";
							
							// 스케줄 불러오기 클릭 후 리스트 출력
							for (let i in result) {
				            output += "<div class='listing-item' id='listItem'>";
				            output += "<article class='geodir-category-listing fl-wrap'>";
				            output += "<div class='geodir-category-img imgSize'>";
				            																// 불러온 스케줄 장소이미지 출력 
				            output += "<a href='listing-single.html'><img src='/images/location/"+result[i].locationName+".jpg' alt=''></a>";
				            output += "<div class='geodir-category-opt'>";
				            output += "</div>";
				            output += "</div>";
				            output += "<div class='geodir-category-content fl-wrap title-sin_item'>";
				            output += "<div class='geodir-category-content-title fl-wrap'>";
				            output += "<div class='geodir-category-content-title-item'>";
				            						// 불러온 스케줄 장소 시작시간 ~ 끝 시간 출력
				            output += "<h3 class='title-sin_map'>"+result[i].scheduleStartTime+"~"+result[i].scheduleEndTime+"</h3>";
				            																													// 불러온 스케줄 장소명 출력
				            output += "<div class='geodir-category-location fl-wrap'><a href='#' class='map-item'><i class='fas fa-map-marker-alt'>"+result[i].locationName+"</i></a></div>";
				            output += "</div>";
				            output += "</div>";
				            output += "</div>";
				            output += "</article>";
				            output += "</div>";
				            
				            // 마지막 화살표 안보이게
				           	if ( i < result.length -1){
								   output += "<div class='arrowBox'>";
				            	   output += "<div class='arrow'></div>";
				                   output += "</div>";
							   }
				            }
				            
				            // 스케줄 수정시 form태그안 scheduleTableId 놓기
			            	output += `<input name ='scheduleTableId' type='hidden' value=${scheduleTableId}>`
			            	output += `<input name ='scheduleTableName' type='hidden' value=${result[0].scheduleTableName}>`

				            output += "</div>";

				            document.getElementById('modalScheduleTableList').innerHTML = output;           		
			        },
			        error: function() {
			            console.log("실패");
			        }
			    });
			}
			
const label = document.querySelector('.label');
const options = document.querySelectorAll('.optionItem');

// 클릭한 옵션의 텍스트를 라벨 안에 넣음
const handleSelect = (item) => {
  label.parentNode.classList.remove('active');
  label.innerHTML = item.textContent;
}
// 옵션 클릭시 클릭한 옵션을 넘김
options.forEach(option => {
	option.addEventListener('click', () => handleSelect(option))
})

// 라벨을 클릭시 옵션 목록이 열림/닫힘
label.addEventListener('click', () => {
  if(label.parentNode.classList.contains('active')) {
  	label.parentNode.classList.remove('active');
  } else {
  	label.parentNode.classList.add('active');
  }
})

