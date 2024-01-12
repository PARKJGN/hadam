$(() => {
	
	// 스케줄추가할떄 전역 변수
	var td;
	
	// 드래그 시작지점 전역 변수
	var startdrag;
	
	// 리사이즈 할때 클릭 막는 변수
	var clickprevent = 0;
	
	var aa = 20;
	
	var left
	
	var right
	
	var bb = 0;
	
	// 타임테이블의 thead의 th생성
	for(i = 0; i < 25; i++){
		
		$('.bg-light-gray').append(`<th>${i}:00</th>`)
		
		}
	
	
	// 타임테이블의 tbody의 td생성
	for(i = 0; i < 25; i++){
		$('.scheduleTable').append("<td></td>")
		
		if(i==1){
			$('.scheduleTable').children().first().append('<img src=/images/schedule/bg/123.jpg>')
		}
	}
	 // img의 사이즈를 옆으로 늘릴수 있는 이벤트
	 // div가 생기기때문에 드래그 했을때의 이벤트보다 먼저 실행되야함
	$('.scheduleTable').find('img').resizable({
	 handles: "e",
	 animate: true,
	 grid:90,
	 containment: ".scheduleTable",
	 ghost:true,
	 maxHeight : 150,
	 minWidth: 180,
	 resize: function(event, ui){
		 console.log(event)
		 console.log(ui)
	 },
	 stop: function( event, ui ) {
		 // 클릭막는 변수
		 clickprevent = 1
	 }
 })
 
 // 스케줄표 사진 크기 맞추기
 $(".ui-wrapper").css("width", "180px")
 $(".ui-resizable").css("width", "180px")
	
	
	// 사진을 드래그 했을때의 사진이 가진 이벤트
	$(".scheduleTable").find('img').parent().draggable({
		// 어디 축으로만 움직일건지
		axis: 'x',
		// 그래그중에 투명도를 어느정도 할지
		opacity: 0.7,
		
		containment: '.scheduleTable',
		// 드래그를 하고 드랍했을때 제자리로 돌아간다. 값으로 함수도 가능
		revert: true,
		// 제자리로 돌아가는 ms
		revertDuration: 0,
		// 어디에서만 움직일 수 있게 할지
		// 드래그 한 위치 기억
		start: function( event, ui ) {
			console.log($(event.target).parent())
			startdrag = $(event.target).parent()
		},
		
	})
	
	
  
  	// 사진을 칸에 드롭했을때 칸에 생기는 이벤트
  	$('.scheduleTable').children('td').droppable({
		  // hover했을때 클래스 추가해서 색상바꾸기
		  classes:{
			  "ui-droppable-hover": "scheduledrophover"
		  },
		  
		  // 드랍했을때
		drop: function(event, ui){
		  
		  // 드랍한 칸에 자식이 없으면 해당 td에 img가 따라 붙는다
			if(!$(event.target).children().length){
				console.log("자식없어요")
				$(event.target).append($(ui.draggable[0]))
				// 드랍한 칸에 자식이 있으면 서로 img를 교한한다.(제자리에 놨을때는 제외)
	  		} else{
				startdrag.append($(event.target).children())
				$(event.target).append(ui.draggable[0])
			  }
		}
		
 	 })
  
  // 리사이즈 스탑 clickprevent를 1로 바꾸고 다시 클릭 함수를 불렀을때 return되는 오류를 해결하는 이벤트 
  $('.scheduleTable').children('td').mousedown(function() {
      clickprevent = 0
  });
  
  // 모달창 띄워주는 이벤트
  $('.scheduleTable').children('td').click(function(e){
	  	
	  
	 	e.preventDefault();
	 	
	 	td = $(this)
	 	
	 	
	 	//자식이 없으면 모달창을 띄워준다
	 	if(!td.children().length && td.parent().find('img').length < 5){
			$('#exampleModal').modal("show");
		}
		// 리사이중에 클릭함수 막는 조건
		else if(clickprevent == 1){
			return false
		}
		// 자식이 있으면 모달창에 해당 내용을 지울지 물어본다
		else{
			
			if(confirm("해당 장소를 일정에서 삭제 하시겠습니까?")){
				td.empty()
			}
			
			
		}
		
		clickprevent = 0
		
	 })

// 모달창의 추가하기 눌렀을때 스케줄표에 사진 추가하는 이벤트
  $('.scheduleadd').click(function(e){
	  
	  
		e.preventDefault();
		
	  	$('#exampleModal').modal("hide");
	  	
	  	td.append("<img style=width : 180px src=/images/schedule/bg/graybasic.png>")
	  	
	  	
	  	td.children().resizable({
	 		handles: "e",
	 		grid:90,
			 ghost:true,
	 		maxHeight : 150,
			 minWidth: 180,
			 aspectRatio: false,
			 start: function(event, ui){
				console.log(ui) 
			 },
	 		 stop: function( event, ui ) {
				 // 클릭막는 변수
		 		clickprevent = 1
			 }
 		})
	  	
	  	td.children().draggable({
			axis: 'x',
			opacity: 0.7,
			revert: true,
			revertDuration: 0,
			containment: '.scheduleTable',
			start: function( event, ui ) {
			console.log($(event.target).parent())
			startdrag = $(event.target).parent()
			}
		  })
		
		  
		  // 스케줄summary창에 추가한 장소 보여주기
	  	console.log($('.scheduleTable').find('img'))
	  	var ss = $('.scheduleTable').find('img')
	  	console.log(ss[0])
  	})
  
/*var summaryAdd = function(){
	
	
}  
  */
 
 
// 인벤토리에 있는 사진을 드래그 했을때의 사진이 가진 이벤트
	$(".scheduleinven").find('img').draggable({
		// 어디 축으로만 움직일건지
		axis: 'x, y',
		// 그래그중에 투명도를 어느정도 할지
		opacity: 0.7,
		
		containment: '.table-responsive',
		// 드래그를 하고 드랍했을때 제자리로 돌아간다. 값으로 함수도 가능
		revert: true,
		// 제자리로 돌아가는 ms
		revertDuration: 0,
		// 어디에서만 움직일 수 있게 할지
		// 드래그 한 위치 기억
		start: function( event, ui ) {
			console.log($(event.target).parent())
			startdrag = $(event.target).parent()
		},
		
	})
 
 
  
});

