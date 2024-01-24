<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.css">
             <link type="text/css" rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
<meta charset="UTF-8">
<title>Modal</title>
</head>
<body>

<!-- modal 배경 클릭시 안닫힘 시작-->
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
  정적 백드롭
</button>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
 	<!-- 중앙배치 -->
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
           <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">
  정적 백드롭
</button>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
 	<!-- 중앙배치 -->
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
           <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop2">
  정적 백드롭
</button>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>
    </div>
  </div>
</div>

<!-- modal 배경 클릭시 안닫힘 끝 -->

<!-- modal 배경 클릭시 닫힘 시작-->
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  모달창
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
<!--  	스크롤생성 -->
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        안녕하세요
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<!-- modal 배경 클릭시 닫힘 끝 -->

<!-- 툴팁과 팝오버 시작-->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
	툴팁과 팝오버
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
<!--  	스크롤생성 -->
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       <h2 class="fs-5">Popover in a modal</h2>
  <p>This <button href="#" role="button" class="btn btn-secondary" data-bs-toggle="popover" title="Popover title" data-bs-content="Popover body content is set in this attribute.">button</button> triggers a popover on click.</p>
  <hr>
  <h2 class="fs-5">Tooltips in a modal</h2>
  <p><a href="#" data-bs-toggle="tooltip" title="Tooltip">This link</a> and <a href="#" data-bs-toggle="tooltip" title="Tooltip">that link</a> have tooltips on hover.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade " id="staticBackdrop" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-fullscreen modal-dialog-centered">
		<div class="modal-content asdf">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="staticBackdropLabel">내 스케줄</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">


				
		
					<div class="list-main-wrap-opt fl-wrap" id="modalpadding">
						<div class="list-main-wrap-title fl-wrap col-title"
							id="modalScheduleTitle">
							<h2>
								Schedule : <span> ${scheduleTableList.scheduleTableName }
								</span>
							</h2>
						</div>

						<div class="geodir-category-content fl-wrap title-sin_item">

							<div class="geodir-category-content-title-item">
								<h3 class="title-sin_map" id="modalScheduleTime">
									
								</h3>
							</div>
				
							<button type="button"
								class="btn btn-primary btn-sm scheduleSelectBtn"
								id="scheduleSelect${loop.index}"
								data-schedule-id="${scheduleTableList.scheduleTableId}"
								data-bs-dismiss="modal">선택</button>

						</div>
					</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">닫기</button>

			</div>
		</div>
	</div>
</div>
<!-- 툴팁과 팝오버 끝-->
   
   <script type="text/javascript" src="/js/bootstrap/bootstrap.js"></script>
</body>
</html>