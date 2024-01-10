$(function(){
	var checkbox_a = document.getElementById('check-a')
	if($('#check-a').is(':checked')){
		checkbox_a.classList.add('next-form');
	}
	$('#rule_agree').on('click',function(Event){
		if(!$('#check-a').is(':checked')){
			alert("동의안하냐")
			Event.preventDefault();
			Event.stopPropagation();
			Event.stopImmediatePropagation();
				
			return false;
		}
		else{
			
		}
	})
})
