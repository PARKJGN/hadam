$(function() {
	$('#signout').on('click', function() {
		console.log('??');
		$.ajax({
			url: '/signin/logout',
			type: 'post',
			success: function(result) {
				location.reload();
			},
			error : function(){
				
			}

		})
	})
})