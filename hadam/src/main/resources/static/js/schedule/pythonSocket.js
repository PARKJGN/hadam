$(() => {
	const socket = new WebSocket("ws://localhost:8765/socket");
	
	//카테고리리스트
	let categoryList = []
	
	 // 버튼 클릭 이벤트 처리
    $(".aisubmit").click(function() {
		// 로그인이 되어있지 않다면 로그인 후 가능합니다.
		if(!$(".header-user-name").length) {
			alert('로그인 후 가능합니다.')
			return false
		}
		
		const data = []
		// 시작 위치
		const startAddr = $("#autocompleteid1").val()
		// 시작 시간  $('#aistarttime').val()
		
		// 카테고리
		const categories = $('.icon-number')
		
		// 유저 인덱스(내부js에서 세션값을 가져와서 외부 js에서 불러오기)
		const memberIndex = member
		
		$.each(categories, function(idx,element){
			categoryList.push($(element).attr('name'))
			console.log($(element).attr('name'))
			data.push($(element).attr('name'))
		})
		
		data.push(startAddr)
		data.push(memberIndex)
        // 버튼 클릭 이벤트가 발생하면 서버로 데이터 전송
        socket.send(data);
        
       
        
    });

    // 서버로부터 메시지 수신
    socket.onmessage = function(event) {
        const receivedData = event.data;
        
        switch(receivedData){
			case '1': alert('주소를 찾을 수 없습니다. 새로고침 후 다른 주소를 입력해주세요')
					location.reload();
					break
					
			case '2': alert('해당 장소에서 추천 장소가 없습니다.')
					location.reload();
					break
		}
        
        console.log("Received message from server: " + receivedData);
        
        const memberIndexList = JSON.parse(receivedData)
        
        let lng = memberIndexList.pop()
        let lat = memberIndexList.pop()
        
        console.log(memberIndexList)
        
        const startDate = '2024-01-24 13:00'
        
        const form = $('<form></form>')

		form.attr("method", "post")

		form.attr("action", "/schedule/createaischeduletable")
		
		let memberInput = $('<input type="hidden"/>')
			memberInput.attr("name", 'memberIndexList')
			memberInput.attr("value", memberIndexList)
		
		let latInput = $('<input type="hidden"/>')
			latInput.attr("name", 'lat')
			latInput.attr("value", lat)
			
		let lngInput = $('<input type="hidden"/>')
			lngInput.attr("name", 'lng')
			lngInput.attr("value", lng)
			
		let categoryListInput = $('<input type="hidden"/>')
			categoryListInput.attr("name", 'categoryList')
			categoryListInput.attr("value", categoryList)
			
		let startDateListInput = $('<input type="hidden"/>')
			startDateListInput.attr("name", 'startDate')
			startDateListInput.attr("value", startDate)
			
		form.append(memberInput)
		form.append(latInput)
		form.append(lngInput)
		form.append(categoryListInput)
		form.append(startDateListInput)
		form.appendTo('body')
		
		form.submit()
        
        
        
    };

    // 에러 핸들링
    socket.onerror = function(error) {
        console.error("WebSocket Error: " + error);
    };

    // 연결이 종료될 때의 처리
    socket.onclose = function(event) {
        if (event.wasClean) {
            console.log(`Closed cleanly, code=${event.code}, reason=${event.reason}`);
        } else {
            console.error(`Connection died`);
        }
    };

    // 연결이 성공적으로 이루어졌을 때
    socket.onopen = function() {
        console.log("WebSocket connection opened");
    };

})