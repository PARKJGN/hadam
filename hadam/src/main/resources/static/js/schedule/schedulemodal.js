
// 카테고리 종류들
var eat = ['전체', '한식', '중식', '일식', '양식']

var see = ['전체', '영화', '전시', '등', '등등']

var category = [{ id: 'eat', text: '먹기' }, { id: 'drink', text: '마시기' }, { id: 'see', text: '보기' }, { id: 'play', text: '놀기' }, { id: 'walk', text: '걷기' }]

var pageNum;

// 대분류 카테고리 바꿀때마다 중분류 카테고리 바뀌는 함수
var catechange = (middlecategory) => {
	$('.middlecate').select2("destroy")
	$('.middlecate option').remove();
	$('.middlecate').select2({
		data: middlecategory,
		dropdownParent: $('#schedulemodal')
	})

}
$(() => {
	// select태그를 검색가능한 select태그로 바꿔주는 플러그인
	$('.addr').select2({
		dropdownParent: $('#schedulemodal'),
	});

	$('.middlecate').select2({
		data: eat,
		dropdownParent: $('#schedulemodal'),
	})

	$('.cate').select2({
		data: category,
		dropdownParent: $('#schedulemodal'),
	})

	// 대분류 카테고리 바뀔때마다 중분류 바꿔주는 이벤트
	$('.cate').change(function() {
		//console.log($(this).val())
		//console.log($(this).select2('data')[0].text)
		switch ($(this).val()) {
			case 'see': middlecategory = see
				break;
			case 'drink': middlecategory = drink
				break;
			case 'eat': middlecategory = eat
				break;
		}

		catechange(middlecategory)
	})

	$(document).on("click", '.searchbtn',function() {

		// 유저가 선택한 구
		let addrname = $('.addr').select2('data')[0].text
		
		// 유저가 입력한 장소이름
		let locationname = $('.searchinput').val()
		
		// 유저가 선택한 대분류
		let largecate = $('.cate').select2('data')[0].text
		
		//유저가 선택한 중분류
		let middlecate = $('.middlecate').val()
		
		// 유저가 선택한 index를 알기위한 id		
		let pageNum =$(this).attr('id')
		
		
		$.ajax({
			url: "locationsearch",
			type: "post",
			datatype: "json",
			data: {
				
				addrName: addrname,
				locationName: locationname,
				middleCate: middlecate,
				pageNum: pageNum,
				largeCate: largecate
			},
			success: function(res) {
				
				console.log(res)

				// 가져온 결과가 0개일때 처리
				if (res.list.length == 0) {
						
					// 결과가 0개인데 화면에 검색을 시작하세요 or 해당정보가 없습니다 일때는 span지우고 추가
					if ($('.locationlist').children('span').length) {
						console.log(1)
						return false
					} else {
						console.log(2)
						$('.locationlist').empty()
						$('.locationlist').append("<span class = 'baisc'>해당 정보가 없습니다.</span>")
					}
				}else{
					// 결과가 있으면 기존의 화면 비워주고 결과값 출력
					$('.locationlist').empty()
					$('.modal-footer').empty()
					$.each(res.list, function(i, item) {
						
						var files = new Image;
						files.src = `/images/location/${item.locationImageOriginalname}`
						files.onerror = function(){
							item.locationImageOriginalname = '사진없음.jpg'
						}
						
					$('.locationlist').append(`<div style="width: 50%;" class="dashboard-list">
						<div class="dashboard-message">
							<div class="dashboard-listing-table-image">
								<a href="listing-single.html"><img src="/images/location/${item.locationImageOriginalname}"
									alt=""></a>
							</div>
							<div style = "height:75px;"class="dashboard-listing-table-text">
								<h4 style="padding-bottom : 0">
									<a class = "locationname" href="#">${item.locationName}</a>
								</h4>
								<span class="dashboard-listing-table-address">
								운영시간<span style = "padding-left:10;">${item.locationOpenTime} ~ ${item.locationCloseTime}</span></span>
								<span style="display : block; padding-top: 10px;" class="dashboard-listing-table-address">
								${item.smallCategory}<a href = "javascript:void(0);" class="scheduleadd btn-two blue small">선택하기</a></span>
								<input type="hidden" class= "locationLatitude" value="${item.locationLatitude}" />
								<input type="hidden" class= "locationLongitude" value="${item.locationLongitude}" />
							</div>
						</div>
					</div>`)
					})
					
					// 다음 페이지
					var pageprevNum = Number(pageNum)-1 < 1 ? 1: Number(pageNum)-1;
					// 이전 페이지
					var pagenextNum = Number(pageNum) + 1 > res.paging.lastPage ? res.paging.lastPage: Number(pageNum) + 1;
					
					// 모달 푸터에 달 페이징 번호
					var paging = '';
					
					paging += '<div class="page_wrap">'
					paging += '<div class="page_nation">'
					paging += `<a id=1 class="arrow pprev searchbtn" ></a> <a id=${pageprevNum} class="arrow prev searchbtn"></a>`
					
					for( i = res.paging.startpage; i <= res.paging.endpage; i++){
						if(i==pageNum){
							paging += `<a id= ${i} class="searchbtn active">${i}</a>`
						} else{
							paging += `<a id= ${i} class ="searchbtn">${i}</a>`
						}
					}
					
					paging += `<a id=${pagenextNum} class="searchbtn arrow next"></a> <a id = ${res.paging.lastPage} class="searchbtn arrow nnext"></a>`
					paging += '</div></div>'
					
					
					$('.modal-footer').append(paging)
				}
			},
			error: function(err) {
				alert(err)
			}
		})



	})

});