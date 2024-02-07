$(() => {
	// 타임테이블의 thead의 th생성
	// 30분 단위로 끊으려고 colspan2
	for (i = 0; i < 24; i++) {
		$('.bg-light-gray').append(`<th colspan = "2" >${i}:30</th>`)
	}

	// 타임테이블의 tbody의 td생성
	for (i = 0; i < 47; i++) {
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
			// 드랍한 td칸에 자식이 없을때
			if (!$(event.target).children().length) {
				// 드랍한 td의 index
				invendrop = $(event.target).index()
				// 인벤토리에 있는 이미지를 드랍했들때
				if ($(startdrag[0]).hasClass("inventory")) {
					// 인벤토리에서 옮길때 드랍한 td next에 자식이 있으면 추가하지 못하게 한다
					// 또한 스케줄테이블에 추가된 스케줄이 이미 5개라면 추가 안되게 만들기
					if ($(event.target).next().children().length == 1 ||
						$('.scheduleTable').find('img').length == 5) return false

					// 해당 이미지의 그래그 속성 제거하고 드랍한 td에 append하고
					$(ui.draggable[0]).draggable("destroy");
					$(event.target).append($(ui.draggable[0]))

					// 인벤토리에서 해당 이미지를 감싸고 있던 기본 정보 div들 제거
					$(startdrag).parents('.listItem').remove()

					// 드래그 속성과 리사이즈 속성 다시 추가
					updateToImageForTimeline($(ui.draggable[0]))

					// td 칸에 잘 들어올 수 있게 잔처리
					$(ui.draggable[0]).parent().css("left", 0)
					$(ui.draggable[0]).parent().css("top", 0)

					// 드랍한 칸 드롭 묶기
					$(".scheduleTable").children().eq(invendrop).droppable("disable")
					$(".scheduleTable").children().eq(invendrop + 1).droppable("disable")

					//해당 칸에 자식이 없으면서 인벤토리가 아닌 스케줄표에 있는거 드랍했을때
				} else {
					// 스케줄의 길이가 12시가 넘어가지않게
					if (invendrop + (startdragsize / 90 - 1) >= 48) {
						return false
					}
					// 드랍했을때 드랍한 img의 길이 안에 다른 img가 있을때 그 이미지 인벤토리로 보내기
					// 자기 img면 안되게 만들어야함
					for (var i = invendrop; i <= invendrop + startdragsize / 90 - 1; i++) {
						// 자기 img가 아니고 드랍칸에 자식이 있을때
						if (i !== startindex && $(".scheduleTable").children().eq(i).children().length) {
							// 다른 이미지가 있으면 해당 이미지 인벤토리에 보내면서 그 이미지가 차지하고 있던 칸의 드랍 풀기
							for (var j = i; j <= i + $(".scheduleTable").children().eq(i).children().width() / 90 - 1; j++) {
								$(".scheduleTable").children().eq(j).droppable("enable")
							}
							let img = $(".scheduleTable").children().eq(i).find("img")

							// 라사이즈 속성 초기화
							img.resizable("destroy")

							// 인벤토리 속성 적용 함수
							updateToImageForInventory(img);
						}
					}

					$(event.target).append($(ui.draggable[0]))

					// 드랍한 img의 길이만큼 칸 드랍 묶기
					for (var i = invendrop; i <= invendrop + startdragsize / 90 - 1; i++) {
						$(".scheduleTable").children().eq(i).droppable("disable")
					}
				}
			}
			changeMap()
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

		//해당 td에 자식이 없고 next td에도 자식이 없으면 모달창을 띄워준다
		if (!td.children().length && !td.next().children().length == 1) {

			// 만약 스케줄이 5개라면 5개까지밖에 안된다고 알려준다.
			if (td.parent().find('img').length == 5) {
				alert("스케줄은 5개까지 추가 가능합니다.")
				return false
			}
			$('#schedulemodal').modal("show");
		}
		// 리사이즈시에 마우스가 자신 안에서 끝날때 클릭이 되는걸 방지하는 변수
		else if (clickprevent == 1) {
			return false
		}
		// 자식이 있으면 모달창에 해당 내용을 지울지 물어본다
		else if (td.children().length) {
			if (confirm("해당 장소를 일정에서 삭제 하시겠습니까?")) {
				// 삭제 후 스케줄 크기만큼 드랍 풀기
				for (var i = td.index(); i <= td.index() + td.children().width() / 90 - 1; i++) {
					$(".scheduleTable").children().eq(i).droppable("enable")
				}
				td.empty()
				changeMap()
			}
		}
	})

	// 모달창의 선택하기 눌렀을때 스케줄표에 사진 추가하는 이벤트
	$(document).on("click", '.scheduleadd', function(e) {

		// 추가한 가게의 정보들
		let modalimg = $(this).parents(".dashboard-listing-table-text").prev().find('img').attr("src")
		let modallocationname = $(this).parents(".dashboard-listing-table-text").find('.modallocationname').text()
		let locationLatitude = $(this).parents(".dashboard-listing-table-text").find('.locationLatitude').val()
		let locationLongitude = $(this).parents(".dashboard-listing-table-text").find('.locationLongitude').val()
		let locationPlace = $(this).parents(".dashboard-listing-table-text").find('.locationPlace').val()
		let locationId = $(this).parents(".dashboard-listing-table-text").find('.locationId').val()
		let smallCategory = $(this).parent().text().replace('선택하기', '').trim()

		// 이미 스케줄표에 있는 장소를 추가하려고하면 alter창 띄워주고 return
		if ($('.scheduleTable').find('img').length > 0) {
			for (i = 0; i < $('.scheduleTable').find('img').length; i++) {
				if ($($('.scheduleTable').find('img')[i]).attr('id') == locationId) {
					alert('이미 존재하는 장소입니다.')
					return false
				}
			}
			
		} // 인벤토리에 있을때도 마찬가지
		if ($('.scheduleinven').find('img').length > 0) {
			for (i = 0; i < $('.scheduleinven').find('img').length; i++) {
				if ($($('.scheduleinven').find('img')[i]).attr('id') == locationId) {
					alert('스케줄 인벤토리에 존재하는 장소입니다.')
					return false
				}
			}
		}
		$('#schedulemodal').modal("hide");

		td.append(`<img style=width : 180px src= "${modalimg}" alt= '${modallocationname}'
					id = ${locationId} name = "${locationLatitude},${locationLongitude},${locationPlace},${smallCategory}">`)

		// 드래그 속성과 리사이즈 속성 다시 추가
		updateToImageForTimeline(td.children())

		// 모달창으로 만들었을때 해당 td태그 드랍 묶기
		td.droppable("disable");
		td.next().droppable("disable");

		// 요약이랑 맵 바꾸기 (요약함수가 맵바꾸는 함수안에 존재)
		changeMap()
	})
});

// 스케줄에 변동이 있을때 스케줄 요약표 바꿔주는 함수
let changeSummary = (totalTimelist) => {
	// 스케줄의 이미지들의 개수를 알아낸다.
	let imgcount = $(".scheduleTable").find('img')
	let timeindex = 0;

	let totcontent = '';
	// 이미지의 개수만큼 for문을 돌려서 요약표에 개수만큼 넣기
	$.each(imgcount, function(idx, element) {
		// &nbsp은 공백 표현
		let src = $(element).attr('src')
		let index = $(element).parents('td').index()
		let locname = $(element).attr('alt')
		let locid = $(element).attr('id')
		let smallCategory = $(element).attr('name').split(',')[3]

		// 이미지가 들어가있는 td의 인덱스로 시작시간과 끝나는 시간 구하기
		let starttime = index % 2 == 0 ? `${index / 2}:00` : `${Math.floor(index / 2)}:30`
		let endtime = (index + $(element).width() / 90) % 2 == 0 ? `${(index + $(element).width() / 90) / 2}:00` : `${Math.floor((index + $(element).width() / 90) / 2)}:30`
		let content = (`<div class="listing-item listItem summarySchedule">
							<article class="geodir-category-listing fl-wrap">
								<div class="geodir-category-img">
									<a target="_blank" href="/location/locationDetail?locationId=${locid}">
									<img src="${src}" alt=""></a>
									<input type="hidden" class = "locid" value="${locid}" />
									<div class="geodir-category-opt"></div>
								</div>
								<div class="geodir-category-content fl-wrap title-sin_item">
									<div class="fl-wrap">
										<div class="geodir-category-content-title-item">
											<h3 class="scheduletime title-sin_map">${starttime} ~ ${endtime}</h3>
											<div class="geodir-category-location fl-wrap">
											<span class = "summarycont">
											<a class="map-item">
											<i class="fas fa-map-marker-alt"></i>${locname}
											</a>
											</span>
											<span class = "summarycont">
											<a style = "margin-top : 10px" class="map-item">${smallCategory}
											</a>
											</span>
										</div>
									</div>
								</div>
							</div>
						</article>
					</div>`)

		totcontent += content

		// 장소와 장소사이 이동시간
		if (idx < (imgcount.length - 1)) {
			totcontent += (`<div class="arrowBox">
								<div class="arrow2"></div>
							</div>
							<div class="timeTaken">
								<span>대중교통</span>
								<p>${totalTimelist[timeindex]}분</p>
								<span>자차</span>
								<p>몇분</p>
							</div>`)
			timeindex += 1
		}
	})

	$(".listing-item-container").html(totcontent)
	$(".loader-wrap").fadeOut(300)

}

// 인벤토리에 사진들어갈때 드래그 속성 적용
const updateToImageForInventory = (img) => {
	let src = img.attr('src')
	let locname = img.attr('alt')
	let locid = img.attr('id')
	let smallCategory = img.attr('name').split(',')[3]

	// css 초기화
	img.removeAttr("style")

	let content = (`<div class="listItem">
						<article class="geodir-category-listing fl-wrap">
						<div class = "inventory ${locid}">
						</div>
						<div class="geodir-category-content fl-wrap title-sin_item">
							<div class="fl-wrap">
								<div class="geodir-category-content-title-item">
									<h3 class="title-sin_map">${locname}</h3>
									<div class="geodir-category-location fl-wrap">
										<a class="map-item">${smallCategory}</a>
									</div>
								</div>
							</div>
						</div>
						</article>
					</div>`)
	$(".scheduleinven").append(content)

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
	$(`.${locid}`).append(img.fadeIn())
}

// 타임테이블에 사진들어갈때 드래그, 리사이즈 속성 적용
const updateToImageForTimeline = (scheduleImage) => {
	scheduleImage.resizable({
		handles: "e",
		grid: 90,
		containment: ".scheduleTable",
		maxHeight: 150,
		minWidth: 180,
		
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
					// 라사이즈 속성 초기화
					img.resizable("destroy")

					// 인벤토리 속성 적용 함수
					updateToImageForInventory(img);
				}
			}
			// 리사이즈 적용 후 해당 칸들 드랍 묶기
			for (var i = startresize; i <= startresize + $(this).width() / 90 - 1; i++) {
				$(".scheduleTable").children().eq(i).droppable("disable")
			}
			changeMap()
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
	scheduleImage.parent().draggable({
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
}
