$(() => {
	if(locationList === "") alert("비어있습니다.")
	
	let [startDate, startTime] = aiInformation.startDate.split(' ')
	
	console.log(locationList)
	console.log(aiInformation)
	// 받아온 장소리스트의 순서는 뒤죽박죽이여서 유저가 설정한 대분류 태그의 순서로 맞춰줘야한다.
	// 대분류순으로 정리할 장소리스트를 선언
	
	// 유저가 선택한 대분류 카테고리의에서 추천알고리즘으로 뽑아낸 장소의 태그들을 비교하면서 맞으면 새로운 리스트에 넣고 기존의 리스트에서 제거
	
	/*
	* aiInformation.categoryList  =  ["가","다" ,"나"]
	* locationList = [{lc:"나"}, {lc:"가"}, {lc:"다"}]
	* sortedCat = [{category : "가", idx : 0},{category : "나", idx : 2} ,{category : "다", idx : 1}]
	  locationList = [ {lc:"가"}, {lc:"나"}, {lc:"다"}]
	  locationListForCategories = [{location: {lc:"가"}, idx:0}, {location: {lc:"다"}, idx:1}, {location: {lc:"나"}, idx:2}]
	*/
	const sortedCat = aiInformation.categoryList
		.map((cat, idx)=>({category:cat, idx}))
		.sort((a,b) => a.cat - b.cat);
	
	locationList.sort((a,b) => a.largeCategory - b.largeCategory);
	
	const locationListForCategories = sortedCat
		.map(({idx:catIdx}, idx) => ({location:locationList[idx], idx:catIdx}))
		.sort((a, b) => a.idx - b.idx);	
	
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
	
	console.log(locationListForCategories)
	let totalMinute = hourToMinute(startTime)
	let startTd = $('.scheduleTable').find('td').eq(totalMinute/30)
	
	// 장소 개수만큼 이미지 생성 후 updatefortimeline함수 호출
	locationListForCategories.forEach((loc, idx)=>{
		// 처음 스케줄은 시작시간에 넣어야해서 따로 분배
		if(idx == 0) {
			startTd.append(createImage(loc.location))
			updateToImageForTimeline(startTd.children())
		} else {
			let index = Number($($('.scheduleTable').find('img')[idx-1]).parents('td').index()) + Number(locationListForCategories[idx-1].location.averageTime)/30
			console.log($('.scheduleTable').find('img'))
			console.log(index)
			let scheduletd = $('.scheduleTable').find('td').eq(index+1)
			scheduletd.append(createImage(loc.location))
			updateToImageForTimeline(scheduletd.children())
		}
		
	})
	
	changemap()
	
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
	image.attr('name', (`${loc.locationLatitude},${loc.locationLongitude}, ${loc.locationPlace}`))
	image.attr('src', `/images/location/${loc.locationName}.jpg`)
	image.css("width", Number(loc.averageTime)/30*90)
	
	return image
}