$(() => {
	// 내부스크립트에서 서버에서 modal로 넘긴 데이터를 변수에 담고 외부 스크립트에서 사용
	if(strLocationList=="") return false
	
	let locationList = JSON.parse(strLocationList)
	let aiInformation = JSON.parse(strAiInformation)
	let [startDay, startTime] = aiInformation.startDate.split(' ')
	
	$('.hasDatepicker').val(startDay)
	
	
	
	/*
	* aiInformation.categoryList  =  ["가","다" ,"나"]
	* locationList = [{lc:"나"}, {lc:"가"}, {lc:"다"}]
	* sortedCat = [{category : "가", idx : 0},{category : "나", idx : 2} ,{category : "다", idx : 1}]
	  locationList = [ {lc:"가"}, {lc:"나"}, {lc:"다"}]
	  locationListForCategories = [{location: {lc:"가"}, idx:0}, {location: {lc:"다"}, idx:1}, {location: {lc:"나"}, idx:2}]
	*/
	
	// 받아온 장소리스트의 순서는 뒤죽박죽이여서 유저가 설정한 대분류 태그의 순서로 맞춰줘야한다.
	// 유저가 설정한 대분류 태그에 인덱스를 부여하고 이름순으로 정렬을 한다.
	const sortedCat = aiInformation.categoryList
		.map((cat, idx)=>({category:cat, idx}))
		.sort((a,b) => a.cat - b.cat);
	// 받아온 장소리스트를 이름순으로 정렬한다.
	locationList.sort((a,b) => a.largeCategory - b.largeCategory);
	// 정렬한 대분류 태그에 정렬한 장소리스트를 대분류 태그로 매핑을 하고 인덱스 순으로 정렬한다.
	const locationListForCategories = sortedCat
		.map(({idx:catIdx}, idx) => ({location:locationList[idx], idx:catIdx}))
		.sort((a, b) => a.idx - b.idx);	
	
	
	
	// 대분류순으로 정리할 장소리스트를 선언
	// 유저가 선택한 대분류 카테고리의에서 추천알고리즘으로 뽑아낸 장소의 태그들을 비교하면서 맞으면 새로운 리스트에 넣고 기존의 리스트에서 제거
	/*aiInformation.categoryList.forEach((category,index) => {
		const selectedCategory = locationList.find(category);
		locationListForCategories.push(selectedCategory)
		locationList.splice(i,1)
		
		for(let i =0; i<locationList.length; i++){
			if(locationList[i].largeCategory==category){
				locationListForCategories.push(locationList[i])
				locationList.splice(i,1)
				return false
			}
		}
	})*/
	
	let totalMinute = hourToMinute(startTime)
	let startTd = $('.scheduleTable').find('td').eq(totalMinute/30)
	
	// 장소마다 평균시간이 달라서 2번째 스케줄이 넓이가 270이고 3번째 스케줄이 넓이가 180인데 2번째가 안들어갔는데 3번째가 들어가는 것을 방지하기 위한 변수
	let checkOverTimeline = 0
	// 장소 개수만큼 이미지 생성 후 updatefortimeline함수 호출
	for(var i = 0; i<locationListForCategories.length; i++){
		// 처음 스케줄은 시작시간에 넣어야해서 따로 분배
		if(i == 0) {
			startTd.append(createImage(locationListForCategories[i].location))
			updateToImageForTimeline(startTd.children())
			
		} else {
			// idx-1 에서 넣었던 이미지의 td index를 구하고
			// td 1칸당 30분
			// 각 장소의 평균시간을 가지고 해당 이미지가 몇칸을 차지하고 있는지를 알 수 있다. => 시작 td와 끝나는 td를 구하는 셈
			let tdIndex = Number($($('.scheduleTable').find('img')[i-1]).parents('td').index())
			let indexByImgWidth = Number(locationListForCategories[i-1].location.averageTime)/30
			
			// 전의 스케줄의 시작 td
			let startIndex = tdIndex + indexByImgWidth
			
			// 넣으려는 스케줄의 끝나는 td
			let endIndex = startIndex+1 + Number(locationListForCategories[i].location.averageTime)/30
			
			// 만약 넣으려는 스케줄이 타임테이블의 24시를 벗어나게 된다면 스케줄 인벤토리에 추가
			if(endIndex > 48 || checkOverTimeline == 1){
				checkOverTimeline = 1
				let invenImg = createImage(locationListForCategories[i].location)
				// 인벤토리에 들어가는 사진의 width는 주어지면 안되므로 초기화
				updateToImageForInventory(invenImg)
				
			} else{
			let scheduletd = $('.scheduleTable').find('td').eq(startIndex+1)
			scheduletd.append(createImage(locationListForCategories[i].location))
			updateToImageForTimeline(scheduletd.children())
			}
			
		}
	}
	
	changeMap()
	
})

// 시간을 분으로 바꿔주는 함수
const hourToMinute = (time)=>{
	const [hour, minute] = time.split(':').map(Number)
	
	return (hour*60 + minute)
}

// 타임테이블에 들어갈 이미지 만드는 함수
const createImage = (loc) => {
	let image = $('<img/>')
	image.attr('alt', loc.locationName)
	image.attr('id', loc.locationId)
	image.attr('name', (`${loc.locationLatitude},${loc.locationLongitude}, ${loc.locationPlace}, ${loc.smallCategory}`))
	image.attr('src', `/images/location/${loc.locationName}.jpg`)
	image.css("width", Number(loc.averageTime)/30*90)
	image.attr("onerror", "this.src='/images/gal/no_image2.jpg'")
	
	return image
}