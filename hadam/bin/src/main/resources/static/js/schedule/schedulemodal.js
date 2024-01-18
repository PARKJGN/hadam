
var eat = [{id:0,text:'한식'},{id:1,text:'중식'},{id:2,text:'일식'},{id:3,text:'양식'}]

var see = ['영화', '전시', '등', '등등']

var category = ['먹기', '마시기', '보기', '놀기', '걷기']

$(() => {
	
	

	$('.location').select2({
		dropdownParent: $('#exampleModal'),
	});
	
	$('.eat').select2({
		data: eat,
		dropdownParent: $('#exampleModal'),
	})
	
	$('.cate').select2({
		data: category,
		dropdownParent: $('#exampleModal'),
	})
	
	$('.cate').change(function(){
		if($(this).val()=="보기"){
			$('.eat').select2("destroy")
			$(".eat option").remove();
			$('.eat').select2({
				data:see,
				dropdownParent: $('#exampleModal')
			})
			
		}
		
	})

});

