/**
 * 
 */

// 스케줄 불러오기 버튼 클릭시
  $('.scheduleSelectBtn').on('click', function() {
			    var scheduleTableId = $(this).data('schedule-id');
			    
			    scheduleSelect(scheduleTableId);
			});
			
			// 해당하는 scheduleTableId 들고오기
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
			
							for (let i in result) {

				            output += "<div class='listing-item' id='listItem'>";
				            output += "<article class='geodir-category-listing fl-wrap'>";
				            output += "<div class='geodir-category-img imgSize'>";
				            output += "<a href='listing-single.html'><img src='/images/location/"+result[i].locationName+".jpg' alt=''></a>";
				            output += "<div class='geodir-category-opt'>";
				            output += "</div>";
				            output += "</div>";
				            output += "<div class='geodir-category-content fl-wrap title-sin_item'>";
				            output += "<div class='geodir-category-content-title fl-wrap'>";
				            output += "<div class='geodir-category-content-title-item'>";
				            output += "<h3 class='title-sin_map'>"+result[i].scheduleStartTime+"~"+result[i].scheduleEndTime+"</h3>";
				            output += "<div class='geodir-category-location fl-wrap'><a href='#' class='map-item'><i class='fas fa-map-marker-alt'>"+result[i].locationName+"</i></a></div>";
				            output += "</div>";
				            output += "</div>";
				            output += "</div>";
				            output += "</article>";
				            output += "</div>";
				            
				           	// 마지막 화살표는 안보이게
				           	if ( i !== result.length -1){
								   output += "<div class='arrowBox'>";
				            	   output += "<div class='arrow'></div>";
				                   output += "</div>";
							   }
				           	
				            }
				            
				            // 스케줄 수정시 scheduleTableId form태그안에 설정
			            	output += `<input name ='scheduleTableId' type='hidden' value=${scheduleTableId}>`
				            output += "</div>";

				            document.getElementById('modalScheduleTableList').innerHTML = output;
			           		
			           		
			        },
			        error: function() {
			            console.log("실패");
			        }
			    });
			}