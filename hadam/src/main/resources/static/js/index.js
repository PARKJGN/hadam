document.addEventListener('DOMContentLoaded', function() {    
	
	
    $('#courseContainer').on('click', '.highlightable', function () {
        // Toggle the 'highlight' class on the clicked label
        $(this).toggleClass('highlight');
    });

    
//아이콘 눌렀을 때 추가되는것
//아이콘을 추가하면 문구가 사라짐
// 매우중요 나중에 주가되는 라벨에 카테고리 넘버를 넣어서 알고리즘돌릴때 사용할것 //
var iconCounter = 1;

document.getElementById('iconOptions').addEventListener('click', function(e) {
  if (e.target.tagName === 'I') {
    // 현재 생성된 label의 갯수를 확인
    var currentLabelCount = document.getElementById('headerDiv').querySelectorAll('label').length;

    // 현재 생성된 label이 5개 미만인 경우에만 새로운 label 생성
    if (currentLabelCount < 5) {
      // 클릭한 아이콘의 data-icon 속성 값을 가져와서 입력란에 추가
      var selectedIcon = e.target.getAttribute('data-icon');
      var selectedIconName="";
      switch (selectedIcon) {
		  case "fa-icons":
		    selectedIconName="놀기";
		    break;
		  case "fa-shoe-prints":
		    selectedIconName="걷기";
		    break;
		  case "fa-ticket":
		    selectedIconName="보기";
		    break;
		  case "fa-bowl-food":
		    selectedIconName="먹기";
		    break;
		case "fa-wine-glass":
		    selectedIconName="마시기";
		    break;
		}
    
      // 새로운 label 요소 생성
      var newLabel = document.createElement('label');

      // 새로운 i 요소 생성
      var newIcon = document.createElement('i');
      newIcon.classList.add('fas', selectedIcon); // 클래스에 가져온 data-icon 값을 추가
      newIcon.setAttribute('data-icon', selectedIconName); // name 에 가져온 data-icon의 대분류 이름을 넣어주기
      newIcon.style.fontSize = '28px';

      // i 요소를 label에 추가
      newLabel.appendChild(newIcon);

      // 일련번호 추가
      var newNumber = document.createElement('span');
      newNumber.textContent = iconCounter++;
      newNumber.classList.add('icon-number');
      newNumber.setAttribute('name', selectedIconName);
      newLabel.appendChild(newNumber);

      // 생성한 label을 헤더에 추가
      var lastInput = document.querySelector('#headerDiv input');
      if (lastInput) {
        lastInput.remove();
      }
      document.getElementById('headerDiv').appendChild(newLabel);
    } else {
      alert("최대 5개의 아이콘만 선택 가능합니다.");
    }
  }
});

//클릭시 반짝거리는 css 추가했다가 지우기
document.getElementById('courseContainer').addEventListener('click', function(e) {
  if (e.target.tagName === 'I') {
    // 클릭한 아이콘에 blink 클래스 추가
    e.target.classList.add('blink');

    // 1초 뒤에 blink 클래스 제거
    setTimeout(function() {
      e.target.classList.remove('blink');
    }, 1000);


  }
});

// 코스 삭제
document.getElementById('headerDiv').addEventListener('click', function(e) {
  if (e.target.tagName === 'I') {
    // 클릭한 아이콘의 부모인 label을 찾아서 제거
    var label = e.target.parentElement;
    label.remove();

    // 남은 아이콘이 없으면 placeholder 추가
    if (document.getElementById('headerDiv').childElementCount === 0) {
      addInputPlaceholder();
    }
  }
});


  // 새로운 input 요소 생성해주는 함수
function addInputPlaceholder() {
  // 새로운 input 요소 생성
  var newInput = document.createElement('input');
  newInput.type = 'text';
  newInput.value = '스케줄을 추가해주세요!';
  newInput.readOnly = true;
  
  // input 요소를 헤더에 추가
  document.getElementById('headerDiv').appendChild(newInput);
}


//+ 버튼 눌렀을 때 추가되는 코스선택 박스
$('#courseContainer').on('click', '.quantity-up', function () {
    // Clone the last course div set
    var lastCourseDiv = $('#courseContainer .all-item:last');
    var newCourseDiv = lastCourseDiv.clone();

    // Increment the course number for the new course
    var lastCourseNumber = lastCourseDiv.find('.cours-number').text().trim();
    var newCourseNumber = parseInt(lastCourseNumber) + 1;

    // Update the cloned div with the new course number
    newCourseDiv.find('.cours-number').text(newCourseNumber + '번째 코스추가');

    // Clear input value in the cloned div
    newCourseDiv.find('input').val('');

    // Increment the icon numbers
  

    // Append the cloned div to the container
    $('#courseContainer').append(newCourseDiv);
});
    
// -버튼 클릭시 발생하는 이벤트
// 코스선택박스 삭제.
$('#courseContainer').on('click', '.quantity-down', function () {
        // Check if there's more than one course div set before removing
        if ($('#courseContainer .all-item').length > 1) {
            // Remove the last course div set
            $('#courseContainer .all-item:last').remove();
        }
    });
});


$(".icon-container").on("click", function () {
    $(this).closest(".qty-dropdown").find(".qty-dropdown-content").slideToggle(400);
});


/*카카오맵 마커 표시*/

$(document).ready(function () {
    var markers = [];
    var mapContainer = $('#map')[0];
    var mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567),
        level: 3
    };

    var map = new kakao.maps.Map(mapContainer, mapOption);
    var ps = new kakao.maps.services.Places();
    var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });

     $('#searchForm').submit(function () {
            searchPlaces();
            return false; // 폼의 기본 동작 방지
        });

    function searchPlaces() {
        var keyword = $('#keyword').val();
		console.log(keyword);
        if (!keyword.replace(/^\s+|\s+$/g, '')) {
            alert('키워드를 입력해주세요!');
            return false;
        }

        ps.keywordSearch(keyword, placesSearchCB);
    }

    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {
            displayPlaces(data);
            displayPagination(pagination);
        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
            alert('검색 결과가 존재하지 않습니다.');
            return;
        } else if (status === kakao.maps.services.Status.ERROR) {
            alert('검색 결과 중 오류가 발생했습니다.');
            return;
        }
    }

    function displayPlaces(places) {
        var listEl = $('#placesList');
        var menuEl = $('#menu_wrap');
        var bounds = new kakao.maps.LatLngBounds();

        removeAllChildNods(listEl);
        removeMarker();

        $.each(places, function (i, place) {
            var placePosition = new kakao.maps.LatLng(place.y, place.x);
            var marker = addMarker(placePosition, i, place.place_name);
            var itemEl = getListItem(i, place);

            bounds.extend(placePosition);

            markerEventListeners(marker, place.place_name);
            itemEventListeners(itemEl, marker, place.place_name);

            listEl.append(itemEl);
        });

        map.setBounds(bounds);
    }



	function getListItem(index, places) {
	    var el = $('<li>');
	    var itemStr = '<span class="markerbg marker_' + (index + 1) + '"></span>' +
	        '<div class="markerinfo">' +
	        '   <h5>' + places.place_name + '</h5>';
	
	    if (places.road_address_name) {
	        itemStr += '    <span>' + places.road_address_name + '</span>' +
	            '   <span class="jibun gray">' + places.address_name + '</span>';
	    } else {
	        itemStr += '    <span>' + places.address_name + '</span>';
	    }
	
	    itemStr += '  <span class="tel">' + places.phone + '</span>' +
	        '</div>';
	
	    el.html(itemStr);
	    el.addClass('item');
	
	    return el;
	}
	
    function addMarker(position, idx, title) {
        var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png';
        var imageSize = new kakao.maps.Size(36, 37);
        var imgOptions = {
            spriteSize: new kakao.maps.Size(36, 691),
            spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10),
            offset: new kakao.maps.Point(13, 37)
        };
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions);
        var marker = new kakao.maps.Marker({
            position: position,
            image: markerImage
        });

        marker.setMap(map);
        markers.push(marker);

        return marker;
    }

    function removeMarker() {
        $.each(markers, function (i, marker) {
            marker.setMap(null);
        });

        markers = [];
    }

    function displayPagination(pagination) {
        var paginationEl = $('#pagination');

        paginationEl.empty();

        for (var i = 1; i <= pagination.last; i++) {
            var el = $('<a>', {
                href: '#',
                html: i,
                click: (function (i) {
                    return function () {
                        pagination.gotoPage(i);
                    };
                })(i)
            });

            if (i === pagination.current) {
                el.addClass('on');
            }

            paginationEl.append(el);
        }
    }

    function markerEventListeners(marker, title) {
        kakao.maps.event.addListener(marker, 'mouseover', function () {
            displayInfowindow(marker, title);
        });

        kakao.maps.event.addListener(marker, 'mouseout', function () {
            infowindow.close();
        });
    }

    function itemEventListeners(itemEl, marker, title) {
        itemEl.mouseover(function () {
            displayInfowindow(marker, title);
        });

        itemEl.mouseout(function () {
            infowindow.close();
        });
    }

    function displayInfowindow(marker, title) {
        var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
        infowindow.setContent(content);
        infowindow.open(map, marker);
    }

    function removeAllChildNods(el) {
        el.empty();
    }
    
        document.getElementById('autocomplete-container').addEventListener('click', function () {
          document.getElementById('myModal').classList.add('show');
    document.getElementById('modalOverlay').style.display = 'block';
        map.relayout();
    });

    document.getElementById('closeModalBtn').addEventListener('click', function () {
    document.getElementById('myModal').classList.remove('show');
        document.getElementById('modalOverlay').style.display = 'none';
    });
    
	$(document).on('click', '.markerinfo', function () {
	    var text = $(this).find('h5').next().text();
	    console.log('Clicked span text:', text);
    document.getElementById('myModal').classList.remove('show');
        document.getElementById('modalOverlay').style.display = 'none';
        $('#autocompleteid1').val(text);
	    // 여기서 가져온 text를 활용하여 원하는 작업을 수행할 수 있습니다.
	});
});






 

/*카카오맵 마커 표시*/


/*카카오맵2 마커 표시2*/

$(document).ready(function () {
    var markers = [];
    var mapContainer = $('#map2')[0];
    var mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567),
        level: 3
    };

    var map = new kakao.maps.Map(mapContainer, mapOption);
    var ps = new kakao.maps.services.Places();
    var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });

     $('#searchForm2').submit(function () {
            searchPlaces();
            return false; // 폼의 기본 동작 방지
        });

    function searchPlaces() {
        var keyword = $('#keyword2').val();
		console.log(keyword);
        if (!keyword.replace(/^\s+|\s+$/g, '')) {
            alert('키워드를 입력해주세요!');
            return false;
        }

        ps.keywordSearch(keyword, placesSearchCB);
    }

    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {
            displayPlaces(data);
            displayPagination(pagination);
        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
            alert('검색 결과가 존재하지 않습니다.');
            return;
        } else if (status === kakao.maps.services.Status.ERROR) {
            alert('검색 결과 중 오류가 발생했습니다.');
            return;
        }
    }

    function displayPlaces(places) {
        var listEl = $('#placesList2');
        var menuEl = $('#menu_wrap2');
        var bounds = new kakao.maps.LatLngBounds();

        removeAllChildNods(listEl);
        removeMarker();

        $.each(places, function (i, place) {
            var placePosition = new kakao.maps.LatLng(place.y, place.x);
            var marker = addMarker(placePosition, i, place.place_name);
            var itemEl = getListItem(i, place);

            bounds.extend(placePosition);

            markerEventListeners(marker, place.place_name);
            itemEventListeners(itemEl, marker, place.place_name);

            listEl.append(itemEl);
        });

        map.setBounds(bounds);
    }



	function getListItem(index, places) {
	    var el = $('<li>');
	    var itemStr = '<span class="markerbg marker_' + (index + 1) + '"></span>' +
	        '<div class="markerinfo2">' +
	        '   <h5>' + places.place_name + '</h5>';
	
	    if (places.road_address_name) {
	        itemStr += '    <span>' + places.road_address_name + '</span>' +
	            '   <span class="jibun gray">' + places.address_name + '</span>';
	    } else {
	        itemStr += '    <span>' + places.address_name + '</span>';
	    }
	
	    itemStr += '  <span class="tel">' + places.phone + '</span>' +
	        '</div>';
	
	    el.html(itemStr);
	    el.addClass('item');
	
	    return el;
	}
	
    function addMarker(position, idx, title) {
        var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png';
        var imageSize = new kakao.maps.Size(36, 37);
        var imgOptions = {
            spriteSize: new kakao.maps.Size(36, 691),
            spriteOrigin: new kakao.maps.Point(0, (idx * 46) + 10),
            offset: new kakao.maps.Point(13, 37)
        };
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions);
        var marker = new kakao.maps.Marker({
            position: position,
            image: markerImage
        });

        marker.setMap(map);
        markers.push(marker);

        return marker;
    }

    function removeMarker() {
        $.each(markers, function (i, marker) {
            marker.setMap(null);
        });

        markers = [];
    }

    function displayPagination(pagination) {
        var paginationEl = $('#pagination2');

        paginationEl.empty();

        for (var i = 1; i <= pagination.last; i++) {
            var el = $('<a>', {
                href: '#',
                html: i,
                click: (function (i) {
                    return function () {
                        pagination.gotoPage(i);
                    };
                })(i)
            });

            if (i === pagination.current) {
                el.addClass('on');
            }

            paginationEl.append(el);
        }
    }

    function markerEventListeners(marker, title) {
        kakao.maps.event.addListener(marker, 'mouseover', function () {
            displayInfowindow(marker, title);
        });

        kakao.maps.event.addListener(marker, 'mouseout', function () {
            infowindow.close();
        });
    }

    function itemEventListeners(itemEl, marker, title) {
        itemEl.mouseover(function () {
            displayInfowindow(marker, title);
        });

        itemEl.mouseout(function () {
            infowindow.close();
        });
    }

    function displayInfowindow(marker, title) {
        var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
        infowindow.setContent(content);
        infowindow.open(map, marker);
    }

    function removeAllChildNods(el) {
        el.empty();
    }
    
    document.getElementById('closeModalBtn2').addEventListener('click', function () {
    document.getElementById('myModal2').classList.remove('show');
        document.getElementById('modalOverlay2').style.display = 'none';
    });
    
	$(document).on('click', '.markerinfo2', function () {
	    var text = $(this).find('h5').next().text();
	    console.log('Clicked span text:', text);
    document.getElementById('myModal2').classList.remove('show');
        document.getElementById('modalOverlay2').style.display = 'none';
        $('#autocompleteid2').val(text);
	    // 여기서 가져온 text를 활용하여 원하는 작업을 수행할 수 있습니다.
	});
});

/*카카오맵2 마커 표시2*/



/*날짜 등록 입력했을 때 달력나오게 하기*/
    $('input[name="main-input-search77"]').daterangepicker({
	  autoUpdateInput: false,
	  singleDatePicker: true,
	    timePicker: true, // 시간 선택기 활성화
    timePicker24Hour: true, // 24시간 형식 사용 여부
    timePickerIncrement: 30, // 분 간격 (예: 30분 단위)
    parentEl: $(".date-parent"),
    locale: {
        cancelLabel: 'Clear'
    },
    minDate: moment() // 현재 날짜부터 선택 가능하도록 설정
    
    
});

    /*인풋필드에 선택한 날짜의 범위를 입력해주는 부분*/
    $('input[name="main-input-search77"]').on('apply.daterangepicker', function (ev, picker) {
	let [aa,bb] = picker.startDate.format('YYYY-MM-DD HH:mm').split(':')
	let minute = Number(bb) < 30? "00" : "30"
    $(this).val(`${aa}:${minute}`);
    });
    
    /*캔슬이 발생하면 인풋 필드를 비워주는 함수*/
    $('input[name="main-input-search77"]').on('cancel.daterangepicker', function (ev, picker) {
        $(this).val('');
    });
    
    


/*날짜 등록 입력했을 때 달력나오게 하기*/





/*메인페이지 장소추천 가게정보 글자수 제한*/
$(document).ready(function() {
    $('.geodir-category-content p').each(function() {
        var content = $(this).text();  /* 각 <p> 요소의 텍스트 내용을 가져옵니다. */
        var maxLength = 63;  /* 최대 글자 수를 40으로 설정합니다. */

        if (content.length > maxLength) {
            var truncatedContent = content.substring(0, maxLength) + '...';
            $(this).text(truncatedContent);  /* 텍스트를 40자로 자르고 "..."을 추가한 내용으로 설정합니다. */
        }
    });
});