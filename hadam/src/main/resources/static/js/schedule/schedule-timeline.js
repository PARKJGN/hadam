$(() => {

	// 스케줄추가할떄 전역 변수
	var td;

	// 드래그 시작지점 전역 변수
	var startdrag;

	// 드래그 시작하는 td 의 index
	var startindex;
	// 리사이즈 할때 클릭 막는 변수
	var clickprevent = 0;

	// 리사이즈 할때 시작 td
	var startresize;

	// 드래그 한 img 사이즈
	var startdragsize;

	// 타임테이블의 thead의 th생성
	// 30분 단위로 끊으려고 colspan2
	for (i = 0; i < 25; i++) {

		$('.bg-light-gray').append(`<th colspan = "2" >${i}:00</th>`)

	}


	// 타임테이블의 tbody의 td생성
	for (i = 0; i < 49; i++) {
		$('.scheduleTable').append("<td></td>")
	}

	// 사진을 칸에 드롭했을때 칸에 생기는 이벤트
	$('.scheduleTable').children('td').droppable({
		// hover했을때 클래스 추가해서 색상바꾸기
		classes: {
			"ui-droppable-hover": "scheduledrophover"
		},

		// 드랍했을때
		drop: function(event, ui) {

			// 드랍한 칸에 자식이 없을때
			if (!$(event.target).children().length) {
				console.log($(event.target).next().children().length)
				// 인벤토리에 있는 이미지를 드랍했들때
				// 인벤토리에서 옮길때는 90px 고정이므로 다음칸에만 자식이 없으면된다. 
				if ($(startdrag[0]).hasClass("scheduleinven")) {
					if ($(event.target).next().children().length == 1) return false
					// 해당 이미지의 그래그 속성 제거하고
					$(ui.draggable[0]).draggable("destroy");
					$(event.target).append($(ui.draggable[0]))

					// 드래그 속성과 리사이즈 속성 다시 추가
					$(ui.draggable[0]).resizable({
						handles: "e",
						grid: 90,
						containment: ".scheduleTable",
						maxHeight: 150,
						minWidth: 180,
						resize: function(event, ui) {

						},
						// 리사이즈를 멈췄을때
						stop: function(event, ui) {
							$(this).css("opacity", 1)
							$(this).css("z-index", 0)
							// 클릭막는 변수
							clickprevent = 1
							// div가 이상한 곳으로 가는걸 막아주는 css
							$(ui.element[0]).css("left", 0)
							stopresize = startresize + $(ui.element[0]).width() / 90 - 1

							// 리사이즈를 멈췄을때 늘어난 칸안에 다른 요소가 있으면 인벤토리로 보내는 이벤트
							for (var i = startresize + 2; i <= stopresize; i++) {

								var img = $(".scheduleTable").children().eq(i).find('img')

								if (!img.length == 0) {
									console.log(img)
									console.log($(".scheduleTable").children().eq(i).children().width() / 90)
									console.log(i)
									for (j = i + 1; j <= i + $(".scheduleTable").children().eq(i).children().width() / 90 - 1; j++) {

										$(".scheduleTable").children().eq(j).droppable("enable")
										console.log("aa")
									}

									// 걸어놨던 리사이즈 초기화
									img.resizable("destroy")

									// css 초기화
									img.removeAttr("style")

									// 인벤토리 드래그 이벤트 적용
									img.draggable({
										// 어디 축으로만 움직일건지
										axis: 'x, y',
										// 그래그중에 투명도를 어느정도 할지
										opacity: 0.7,
										containment: '.schedulecontent',
										// 드래그를 하고 드랍했을때 제자리로 돌아간다. 값으로 함수도 가능
										revert: true,
										// 제자리로 돌아가는 ms
										revertDuration: 0,
										// 어디에서만 움직일 수 있게 할지
										// 드래그 한 위치 기억
										start: function(event, ui) {
											startdrag = $(event.target).parent()
										},

									})
									// 인벤토리에 붙이기
									img.hide()
									// 사라졌다가 나타나는 애니메이션
									$(".scheduleinven").append(img.fadeIn())
									// 옮긴 img 스케줄 테이블에서 제거

								}


							}
							// 리사이즈 적용 후 해당 칸들 드랍 묶기
							for (var i = startresize; i <= startresize + $(this).width() / 90 - 1; i++) {
								$(".scheduleTable").children().eq(i).droppable("disable")
							}


						},
						// 리사이즈 시작했을때
						start: function(event, ui) {
							$(this).css("opacity", 0.7)
							$(this).css("z-index", 1)
							startresize = $(this).parent().index()

							// 리사이즈 시작했을때 차지하고 있던 칸들 드랍되게 풀기
							for (var i = startresize; i <= startresize + $(this).width() / 90 - 1; i++) {
								$(".scheduleTable").children().eq(i).droppable("enable")
							}

						}
					})


					$(ui.draggable[0]).parent().draggable({
						axis: 'x',
						opacity: 0.7,
						revert: true,
						revertDuration: 0,
						containment: '.scheduleTable',
						// 드래그 시작했을떄
						start: function(event, ui) {
							startdrag = $(event.target).parent()
							startdragsize = $(event.target).width()
							startindex = $(event.target).parent().index()


							// 드래그 시작했을때 드롭할 수 없었던 td들 드랍 풀기
							for (var i = startindex; i <= startindex + $(event.target).width() / 90 - 1; i++) {
								$(".scheduleTable").children().eq(i).droppable("enable")
							}



						},

						// 드래그 멈췄을때
						stop: function(event, ui) {
							// 드래그를 시작하고 제자리에서 멈췄을때
							// 그자리에 다시 드랍 묶기
							if (startdrag.index() === $(event.target).parent().index()) {
								for (var i = startindex; i <= startindex + $(event.target).width() / 90 - 1; i++) {
									$(".scheduleTable").children().eq(i).droppable("disable")
								}
							}

						}
					})


					// td 칸에 잘 들어올 수 있게 잔처리
					$(ui.draggable[0]).parent().css("left", 0)
					$(ui.draggable[0]).parent().css("top", 0)

					// 드랍한 칸 드롭 묶기

					invendrop = $(event.target).index()

					$(".scheduleTable").children().eq(invendrop).droppable("disable")
					$(".scheduleTable").children().eq(invendrop + 1).droppable("disable")
					//해당 칸에 자식이 없으면서 인벤토리가 아닌 스케줄표에 있는거 드랍했을때
				} else {
					enddragindex = $(event.target).index()
					console.log(enddragindex)
					console.log(startdragsize / 90 - 1)
					if (enddragindex + (startdragsize / 90 - 1) >= 50) {
						return false
					}
					// 드랍했을때 드랍한 img의 길이 안에 다른 img가 있을때 그 이미지 인벤토리로 보내기
					// 자기 img면 안되게 만들어야함
					for (var i = enddragindex; i <= enddragindex + startdragsize / 90 - 1; i++) {
						// 자기 img가 아니고 드랍칸에 자식이 있을때
						if (i !== startindex && $(".scheduleTable").children().eq(i).children().length) {
							console.log($(".scheduleTable").children().eq(i).children().width())

							// 다른 이미지가 있으면 해당 이미지 인벤토리에 보내면서 그 이미지가 차지하고 있던 칸의 드랍 풀기
							for (var j = i; j <= i + $(".scheduleTable").children().eq(i).children().width() / 90 - 1; j++) {
								$(".scheduleTable").children().eq(j).droppable("enable")
							}
							var img = $(".scheduleTable").children().eq(i).find("img")
							// 걸어놨던 리사이즈 초기화
							img.resizable("destroy")

							// css 초기화
							img.removeAttr("style")

							// 인벤토리 드래그 이벤트 적용
							img.draggable({
								// 어디 축으로만 움직일건지
								axis: 'x, y',
								// 그래그중에 투명도를 어느정도 할지
								opacity: 0.7,
								containment: '.schedulecontent',
								// 드래그를 하고 드랍했을때 제자리로 돌아간다. 값으로 함수도 가능
								revert: true,
								// 제자리로 돌아가는 ms
								revertDuration: 0,
								// 어디에서만 움직일 수 있게 할지
								// 드래그 한 위치 기억
								start: function(event, ui) {
									startdrag = $(event.target).parent()
								},

							})
							// 인벤토리에 붙이기
							// 사라졌다가 나타나는 애니메이션
							img.hide()
							$(".scheduleinven").append(img.fadeIn())
							// 옮긴 img 스케줄 테이블에서 제거
							$(".scheduleTable").children().eq(i).empty();

						}
					}
					$(event.target).append($(ui.draggable[0]))
					// 드랍한 img의 길이만큼 칸 드랍 묶기
					for (var i = enddragindex; i <= enddragindex + startdragsize / 90 - 1; i++) {
						$(".scheduleTable").children().eq(i).droppable("disable")
					}

				}

				// 드랍한 칸에 자식이 있으면
			} /*else {

				// 인벤토리에서 놓은거라면 교환이 되지않게
				if (!$(startdrag[0]).hasClass("scheduleinven")) {
					startdrag.append($(event.target).children())
					$(event.target).append(ui.draggable[0])
				}
			}*/
		}	// end of drop

	})

	// 리사이즈 스탑 clickprevent를 1로 바꾸고 다시 클릭 함수를 불렀을때 return되는 오류를 해결하는 이벤트 
	$('.scheduleTable').children('td').mousedown(function() {
		clickprevent = 0
	});

	// 모달창 띄워주는 이벤트
	$('.scheduleTable').children('td').click(function(e) {


		e.preventDefault();

		td = $(this)


		//자식이 없으면 모달창을 띄워준다
		if (!td.children().length && td.parent().find('img').length < 5) {
			// 클릭한 td옆에 다른 스케줄이 있으면 추가되지않게 or 끝칸에서 추가하기 눌렀을때
			if (td.next().children().length == 1 || td.index() == 49) return false

			$('#schedulemodal').modal("show");
		}
		// 리사이즈중에 클릭함수 막는 조건
		else if (clickprevent == 1) {
			return false
		}
		// 자식이 있으면 모달창에 해당 내용을 지울지 물어본다
		else {

			if (confirm("해당 장소를 일정에서 삭제 하시겠습니까?")) {
				// 삭제 후 스케줄 크기만큼 드랍 풀기
				for (var i = td.index(); i <= td.index() + td.children().width() / 90 - 1; i++) {
					$(".scheduleTable").children().eq(i).droppable("enable")
				}
				td.empty()
			}


		}

		clickprevent = 0

	})

	// 모달창의 추가하기 눌렀을때 스케줄표에 사진 추가하는 이벤트
	$(document).on("click", '.scheduleadd', function(e) {


		e.preventDefault();

		$('#schedulemodal').modal("hide");

		td.append("<img style=width : 180px src=/images/schedule/bg/graybasic.png>")


		td.children().resizable({
			handles: "e",
			grid: 90,
			containment: ".scheduleTable",
			maxHeight: 150,
			minWidth: 180,
			resize: function(event, ui) {

			},
			// 리사이즈를 멈췄을때
			stop: function(event, ui) {
				// 고스트 모드 해제
				$(this).css("opacity", 1)
				$(this).css("z-index", 0)
				// 클릭막는 변수
				clickprevent = 1
				// div가 이상한 곳으로 가는걸 막아주는 css
				$(ui.element[0]).css("left", 0)
				stopresize = startresize + $(ui.element[0]).width() / 90 - 1

				// 리사이즈를 멈췄을때 늘어난 칸안에 다른 요소가 있으면 인벤토리로 보내는 이벤트
				for (var i = startresize + 2; i <= stopresize; i++) {

					var img = $(".scheduleTable").children().eq(i).find('img')
					// 인벤토리로 보내는 img의 길이만큼 묶여있던 드랍칸 풀기
					if (!img.length == 0) {
						for (j = i + 1; j <= i + $(".scheduleTable").children().eq(i).children().width() / 90 - 1; j++) {
							$(".scheduleTable").children().eq(j).droppable("enable")
						}

						// 걸어놨던 리사이즈 초기화
						img.resizable("destroy")

						// css 초기화
						img.removeAttr("style")

						// 인벤토리 드래그 이벤트 적용
						img.draggable({
							// 어디 축으로만 움직일건지
							axis: 'x, y',
							// 그래그중에 투명도를 어느정도 할지
							opacity: 0.7,
							containment: '.schedulecontent',
							// 드래그를 하고 드랍했을때 제자리로 돌아간다. 값으로 함수도 가능
							revert: true,
							// 제자리로 돌아가는 ms
							revertDuration: 0,
							// 어디에서만 움직일 수 있게 할지
							// 드래그 한 위치 기억
							start: function(event, ui) {
								startdrag = $(event.target).parent()
							},

						})
						// 인벤토리에 붙이기
						img.hide()
						// 사라졌다가 나타나는 애니메이션
						$(".scheduleinven").append(img.fadeIn())
						// 옮긴 img 스케줄 테이블에서 제거

					}


				}
				// 리사이즈 적용 후 해당 칸들 드랍 묶기
				for (var i = startresize; i <= startresize + $(this).width() / 90 - 1; i++) {
					$(".scheduleTable").children().eq(i).droppable("disable")
				}


			},
			// 리사이즈 시작했을때
			start: function(event, ui) {
				// 고스트 옵션을 주면 화면에 조금 나와있는 상태에서 리사이즈하면 오류발행
				$(this).css("opacity", 0.7)
				$(this).css("z-index", 1)
				startresize = $(this).parent().index()

				// 리사이즈 시작했을때 차지하고 있던 칸들 드랍되게 풀기
				for (var i = startresize; i <= startresize + $(this).width() / 90 - 1; i++) {
					$(".scheduleTable").children().eq(i).droppable("enable")
				}

			}
		})

		// 리사이즈 적용 후 드래그 적용
		td.children().draggable({
			axis: 'x',
			opacity: 0.7,
			revert: true,
			revertDuration: 0,
			containment: '.scheduleTable',
			// 드래그 시작했을떄
			start: function(event, ui) {
				startdrag = $(event.target).parent()
				startdragsize = $(event.target).width()
				startindex = $(event.target).parent().index()


				// 드래그 시작했을때 드롭할 수 없었던 td들 드랍 풀기
				for (var i = startindex; i <= startindex + $(event.target).width() / 90 - 1; i++) {
					$(".scheduleTable").children().eq(i).droppable("enable")
				}



			},

			// 드래그 멈췄을때
			stop: function(event, ui) {
				// 드래그를 시작하고 제자리에서 멈췄을때
				// 그자리에 다시 드랍 묶기
				if (startdrag.index() === $(event.target).parent().index()) {
					for (var i = startindex; i <= startindex + $(event.target).width() / 90 - 1; i++) {
						$(".scheduleTable").children().eq(i).droppable("disable")
					}
				}

			}
		})

		// 모달창으로 만들었을때 해당 td태그 드랍 묶기
		td.droppable("disable");
		td.next().droppable("disable");

	})

	/*var summaryAdd = function(){
		
		ㅁㄴㅇ
	}  
	  */


	// 인벤토리에 있는 사진을 드래그 했을때의 사진이 가진 이벤트
	$(".scheduleinven").find('img').draggable({
		// 어디 축으로만 움직일건지
		axis: 'x, y',
		// 그래그중에 투명도를 어느정도 할지
		opacity: 0.7,
		containment: '.schedulecontent',
		// 드래그를 하고 드랍했을때 제자리로 돌아간다. 값으로 함수도 가능
		revert: true,
		// 제자리로 돌아가는 ms
		revertDuration: 0,
		cancel: ".ui-wrapper",
		// 어디에서만 움직일 수 있게 할지
		// 드래그 한 위치 기억
		start: function(event, ui) {
			startdrag = $(event.target).parent()

		},
		drag: function(event, ui) {

		},
		stop: function(event, ui) {
		}

	})

});

