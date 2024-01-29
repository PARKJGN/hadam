$(() => {
	// 시작시간 고르는 캘린더
	$("#datepicker").daterangepicker({
		locale: {
			format: "YYYY-MM-DD",
			applyLabel: "확인",
			cancelLabel: "취소",
			daysOfWeek: ["일", "월", "화", "수", "목", "금", "토"],
			monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "12월"]
		},
		minDate: moment(),
		singleDatePicker: true,
		autoUpdateInput: false
	});

	$('.daterangepicker').css("width", "auto")

	//캘린더에서 날짜를 고르면 해당일이 인풋에 들어가는 이벤트
	$('#datepicker').on('apply.daterangepicker', function(ev, picker) {
		$(this).val(picker.startDate.format('YYYY-MM-DD'));
	});


	// 스케줄 추가하기 눌렀을때 db에 추가하고 메인페이지로 이동(나중에 마이페이지 내 스케줄로 이동)
	$('#scheduleTableInsert').click(function() {
		// 폼태그 동적생성
		let scheduleform = $('<form></form>')

		scheduleform.attr("method", "post")

		scheduleform.attr("action", "/schedule/insertscheduletable")

		// 스케줄의 개수
		let schedule = $('.listItem')

		// 스케줄이 1개 이하면 submit 안되게 하기
		if (schedule.length < 2) {
			alert("스케줄을 2개 이상 추가해주세요.")
			return false
		}

		// 스케줄테이블의 이름
		let scheduleTitle = $('.scheduletitle').val()

		if (!scheduleTitle) {
			alert("스케줄표의 이름을 적어주세요.")
			return false
		}

		let scheduleTableStartDate = $('#datepicker').val()
		if (!scheduleTableStartDate) {
			alert("게획시작일을 선택해주세요.")
			return false
		}

		// 스케줄의 개수만큼 input태그 생성
		$.each(schedule, function(idx, element) {

			// 해당 스케줄의 총 시간
			let scheduleTime = $(element).find('.scheduletime').text().split('~')
			// 해당 스케줄의 ID
			let scheduleId = $(element).find('.locid').val()

			// 시작시간
			let scheduleStartTimeInput = $('<input type="hidden"/>')
			scheduleStartTimeInput.attr("name", `scheduleList[${idx}].scheduleStartTime`)
			scheduleStartTimeInput.attr("value", `${scheduleTime[0].trim()}`)
			// 끝나는 시간
			let scheduleEndTimeInput = $('<input type="hidden"/>')
			scheduleEndTimeInput.attr("name", `scheduleList[${idx}].scheduleEndTime`)
			scheduleEndTimeInput.attr("value", `${scheduleTime[1].trim()}`)

			// 장소Id
			let locationIdInput = $('<input type="hidden"/>')
			locationIdInput.attr("name", `scheduleList[${idx}].locationId`)
			locationIdInput.attr("value", `${scheduleId}`)


			scheduleform.append(scheduleStartTimeInput)
			scheduleform.append(scheduleEndTimeInput)
			scheduleform.append(locationIdInput)
		})

		let scheduleTitleInput = $('<input type="hidden"/>')
		scheduleTitleInput.attr("name", 'scheduleTableName')
		scheduleTitleInput.attr("value", `${scheduleTitle}`)

		let scheduleTableStartDateInput = $('<input type="hidden"/>')
		scheduleTableStartDateInput.attr("name", 'scheduleTableStartDate')
		scheduleTableStartDateInput.attr("value", `${scheduleTableStartDate}`)


		scheduleform.append(scheduleTitleInput)
		scheduleform.append(scheduleTableStartDateInput)
		
		scheduleform.appendTo('body')
		
		
		scheduleform.submit();

	})




})