document.addEventListener('DOMContentLoaded', function() {    
	
	
    $('#courseContainer').on('click', '.highlightable', function () {
        // Toggle the 'highlight' class on the clicked label
        $(this).toggleClass('highlight');
    });

    
//아이콘 눌렀을 때 추가되는것
//아이콘을 추가하면 문구가 사라짐
// 매우중요 나중에 주가되는 라벨에 카테고리 넘버를 넣어서 알고리즘돌릴때 사용할것 //
//@!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!@@@@@@@@@@@@@@@@@@@@@@@@@@@//
var iconCounter = 1;

document.getElementById('iconOptions').addEventListener('click', function(e) {
  if (e.target.tagName === 'I') {
    // 현재 생성된 label의 갯수를 확인
    var currentLabelCount = document.getElementById('headerDiv').querySelectorAll('label').length;

    // 현재 생성된 label이 5개 미만인 경우에만 새로운 label 생성
    if (currentLabelCount < 5) {
      // 클릭한 아이콘의 data-icon 속성 값을 가져와서 입력란에 추가
      var selectedIcon = e.target.getAttribute('data-icon');
    
      // 새로운 label 요소 생성
      var newLabel = document.createElement('label');

      // 새로운 i 요소 생성
      var newIcon = document.createElement('i');
      newIcon.classList.add('fas', selectedIcon); // 클래스에 가져온 data-icon 값을 추가
      newIcon.setAttribute('data-icon', selectedIcon);
      newIcon.style.fontSize = '28px';

      // i 요소를 label에 추가
      newLabel.appendChild(newIcon);

      // 일련번호 추가
      var newNumber = document.createElement('span');
      newNumber.textContent = iconCounter++;
      newNumber.classList.add('icon-number');
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




// 카카오 주소 입력 api 
$("#autocomplete-container").on("click", function () {
    sample4_execDaumPostcode();
});
// 카카오 주소 입력 api 
$("#autocomplete-container2").on("click", function () {
    sample4_execDaumPostcode();
});

var script = document.createElement('script');
script.src = '//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js';
script.async = true;
function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
document.head.appendChild(script);
// 카카오 주소 입력 api 


