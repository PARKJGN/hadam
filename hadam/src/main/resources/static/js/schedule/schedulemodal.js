
// 카테고리 종류들
var eat = ['전체', '한식', '중식', '일식', '양식']

var see = ['전체', '영화', '전시', '등', '등등']

var category = [{ id: 'eat', text: '먹기' }, { id: 'drink', text: '마시기' }, { id: 'see', text: '보기' }, { id: 'play', text: '놀기' }, { id: 'walk', text: '걷기' }]

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
	$('.location').select2({
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
	
	$('.searchbtn').click(function(){
		
		locationname = $('.location').select2('data')[0].text
		largecate = $('.cate').select2('data')[0].text
		middlecate = $('.middlecate').val()
		
		$.ajax({
			url:"locationsearch",
			type:"post",
			datatype: "json",
			data : {
				locationname : locationname,
				middlecate : middlecate,
				largecate : largecate
			},
			success: function(res){
				alert(res)
			},
			error:function(err){
				alert(err)
			}
		})
		
		
		
	})

});

/*<div style="width: 50%;" class="dashboard-list">
						<div class="dashboard-message">
							<div class="dashboard-listing-table-image">
								<a href="listing-single.html"><img src="/images/gal/1.jpg"
									alt=""></a>
							</div>
							<div style = "height:75px;"class="dashboard-listing-table-text">
								<h4 style="padding-bottom : 0">
									<a class = "locationname" href="#">가게이름</a>
								</h4>
								<span class="dashboard-listing-table-address">
								운영시간<span style = "padding-left:10;">18:00 ~ 20:00</span></span>
								<span style="display : block; padding-top: 10px;" class="dashboard-listing-table-address">
								소분류<a data-bs-dismiss="modal" href = "javascript:void(0);" class="scheduleadd btn-two blue small">선택하기</a></span>
								
							</div>
						</div>
					</div> */



