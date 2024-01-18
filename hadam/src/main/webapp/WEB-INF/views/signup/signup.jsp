<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!--
 	파일명 	signup.jsp 
	페이지명	회원가입 페이지 
	용도		화면구성	
	작성자 	최성익  
-->

<!--=============== 개인 css  ===============-->
<link type="text/css" rel="stylesheet" href="/css/sign/signup.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">





<!-- header-->
<jsp:include page="/WEB-INF/layout/header.jsp"></jsp:include>
<!--  header end -->

<!--  wrapper  -->
<div id="wrapper">
	<!-- content-->
	<div class="content">
		<div class="breadcrumbs-fs fl-wrap">
			<div class="container">
				<div class="breadcrumbs fl-wrap">
					<a href="#">Home</a><a href="#">Pages</a><span>Booking Page</span>
				</div>
			</div>
		</div>
		<section class="middle-padding gre y-blue-bg">
			<div class="container">
				<div class="list-main-wrap-title single-main-wrap-title fl-wrap">
					<h2>
						당신의 하루를 담다 : <span>Hadam</span>
					</h2>
				</div>
				<div class="row">
					<div class="col-md-8">
						<div class="bookiing-form-wrap">
							<ul id="progressbar">
								<li class="active"><span>01.</span>이용약관동의</li>
								<li><span>02.</span>회원정보입력</li>
								<li><span>03.</span>취향설정</li>
								<li><span>04.</span>완료</li>
							</ul>
							<!--   list-single-main-item -->
							<div class="list-single-main-item fl-wrap hidden-section tr-sec">
								<div class="profile-edit-container">
									<div class="custom-form">
										<form>
											<!-- 이용동의 약관 시작 -->
											<fieldset class="fl-wrap book_mdf" id="dd">
												<div class="list-single-main-item-title fl-wrap">
													<h3>Hadam 이용약관 동의 안내</h3>
												</div>
												<div class="row">
													<div class="col-sm-6 hadam_rule">
														<label>제1조 (목적)</label>
														<p>이 약관은 하루를 담다(hadam)(이하 "당사"라 합니다)가 제공하는 사업관련 서비스(이하
															서비스)의 이용조건 및 절차, 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
														<label>제2조 (약관의 효력 및 변경)</label>
														<p>이 약관은 그 내용을 서비스 화면에 게시하고 이용자가 서비스 화면에서 동의 의사표시를
															함으로써 효력을 발생합니다. 당사는 합리적인 사유가 발생할 경우에는 이 약관을 변경할 수 있으며,
															약관이 변경된 경우에는 적용일자 및 개정 사유를 명시하여 현행 약관과 함께 서비스 초기화면에 공지하며,
															제1항과 같은 방법으로 효력을 발생시킵니다. 단, 구 약관에 동의한 이용자가 약관 개정 적용일 이후에도
															계속 당사의 서비스를 이용하면 개정 약관에 대해 동의한 것으로 간주합니다. 이용자는 개정된 약관에
															동의하지 않을 경우 서비스 이용을 중단하고 회원 탈퇴를 할 수 있습니다.</p>
														<label>제3조 (약관외 준칙)</label>
														<p>이 약관에 명시되지 않은 사항은 관계 법령에 규정되어 있을 경우 그 규정에 따르며, 그렇지
															않은 경우에는 정부가 제정한 전자거래소비자보호지침 및 관계법령 또는 일반적인 관례에 따릅니다.</p>
														<label>제4조 (용어의 정의)</label>
														<p>이 약관에서 사용하는 용어의 정의는 다음과 같습니다. 서비스 : 당사 홈페이지 접속하여 본
															약관에 따라 당사가 제공하는 정보등을 이용하는 것을 말합니다. 이용자 : 당사가 제공하는 서비스를
															받는자를 통칭하며, 이용자는 비회원, 회원으로 구성됩니다. 비회원 : 비회원이라 함은 회원에 가입하지
															않고 당사가 제공하는 서비스를 이용하는 자를 말합니다. 회원 : 개인 정보를 제공하고 서비스 회원으로
															등록한 자로서, 당사와 관련된 개인의 정보를 제공받을 수 있습니다.</p>
														<label>제5조 (이용 계약의 성립)</label>
														<p>이용계약은 이용자의 이용 신청에 대한 회사의 이용 승낙과 이용자의 약관 내용에 대한 동의로
															성립됩니다. 회원에 가입하여 서비스를 이용하고자 하는 개인은 당사에서 요청하는 정보를 제공해야 합니다.
														</p>
														<label>제6조 (회원정보 사용에 대한 동의)</label>
														<p>당사는 이용자의 개인정보를 소중하게 여기고 관리하고 있습니다. 개인정보보호에 대해서는
															개인정보 처리방침을 통해 확인하실 수 있습니다. 개인정보의 수집목적 및 이용목적 : 당사에서 제공하는
															서비스 가입시 기재를 요구하는 이용자의 개인정보는 본 이용계약의 이행과 본 이용계약상의 서비스제공을
															위한 목적으로 수집, 이용합니다. 개인정보의 열람 및 정정 : 이용자는 회원정보 수정을 통해 언제든지
															개인 정보에 대한 열람 및 수정을 할 수 있습니다. 이는 전적으로 이용자에 의해 ID와 비밀번호가
															관리되고 있습니다. 따라서 타인에게 ID와 비밀번호를 알려주어서는 안되며, 작업 종료시에는 반드시
															로그아웃 하고, 웹 브라우저의 창을 닫아야 합니다.(이는 타인과 컴퓨터를 공유하는 인터넷 카페나 도서관
															같은 공공장소에서 컴퓨터를 사용하는 경우에 정보보호를 위하여 필요한 사항입니다) 개인정보의 수집에 대한
															동의 : 이용자가 이용신청서에 이용자 정보를 기재하고, 당사의 약관에 따라 이용신청을 하는 것은 당사가
															본 약관에 따라 이용신청서에 기재된 이용자정보를 수집, 이용 및 제공하는 것에 동의하는 것으로
															간주됩니다. 개인정보의 보유기간 및 이용기간 : 이용자로으로 부터 개인정보를 수집하는 경우, 그
															보유기간 및 이용기간은 이용자가 직접 가입을 신청한 시점부터 해지하겠다는 의사 표시를 하여 해지가 처리
															된 후 최대 1년까지로 합니다. 이용자가 당사에 회원탈퇴 요청시 지체없이 개인정보를 파기합니다. 다만,
															수집목적 또는 제공받은 목적이 달성된 경우에도 상법 등 법령의 구정에 의하여 보존할 필요성이 있는
															경우에는 이용자의 개인정보를 보유할 수 있습니다.</p>
														<label>제7조 (서비스 이용 및 제한)</label>
														<p>서비스 이용은 당사의 업무상 또는 기술상 특별한 지장이 없는 한 연중 무휴, 1일 24시간을
															원칙으로 합니다. 제1항의 규정에도 불구하고 시스템 정기점검 등 당사가 필요한 경우, 예외적으로 서비스
															이용을 제한할 수 있습니다.</p>
														<label>제8조 (당사의 의무)</label>
														<p>당사는 지속적이고 안정적인 서비스 제공을 위해 적합한 설비를 유지하여야 하며 서비스용 설비에
															장애가 발생하거나 또는 그 설비가 못쓰게 된 경우 그 설비를 수리하거나 복구합니다. 당사는 서비스
															제공과 관련해서 알고 있는 이용자의 신상정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않는 것으로
															합니다. 단, 이용자가 부주의로 신정정보를 누설한 경우, 당사는 책임을 지지 않습니다. 제2항에
															불구하고 관계법령의 규정에 의하여 국가기관의 요구가 있는 경우나, 수사상의 목적으로 법관이 발부한
															영장의 제시가 있는 경우에는 그러하지 않습니다. 당사는 서비스 약관의 변경 또는 추가사항이 있는 경우
															그 사항을 서비스 화면에 공지합니다.</p>
														<label>제9조 (이용자의 의무)</label>
														<p>이용자는 서비스를 이용할 때 다음 각 호의 행위를 하지 않아야 합니다. 가. 다른 이용자의
															정보를 부정하게 사용하는 행위 나. 서비스를 이용하여 얻은 정보를 당사의 사전 승낙 없이 복제하거나
															이를 출판, 방송 등에 사용하거나 제3자에게 제공하는 행위 다. 다른 이용자 또는 제3자를 비방하거나
															중상모략으로 명예를 손상하는 행위 라. 공공질서 및 미풍양속에 위배되는 내용의 정보, 문장, 도형 등을
															타인에게 유포하는 행위 마. 반국가적, 반사회적, 범죄적 행위와 결부된다고 판단되는 행위 바. 다른
															이용자 또는 제3자의 저작권 등 기타 권리를 침해하는 행위 사. 광고성 정보를 지속적으로 전송하거나
															서비스의 안정적 운영에 지장을 초래하는 행위나 게시물 등록, 기타 건전한 서비스 이용에 반하는 행위
															아. 기타 관계 법령에 위배되는 행위 이용자는 이 약관에서 규정하는 사항과 서비스 이용안내 또는
															주의사항을 준수하여야 합니다. 이용자가 설치하는 단말기 등은 전기통신설비의 기술기준에 관한 규칙이
															정하는 기준에 적합하여야 하며, 서비스에 장애를 주지 않아야 합니다.</p>
														<label>제10조 (서비스 이용책임)</label>
														<p>이용자 아이디 및 비밀번호에 대한 모든 관리책임은 이용자에게 있습니다. 명백한 사유가 있는
															경우를 제외하고는 이용자가 아이디 공유, 양도 또는 변경할 수 없습니다. 이용자에게 부여된 아이디에
															의하여 발생되는 서비스 이용상의 과실 또는 제3자에 의한 부정사용 등에 대한 모든 책임은 이용자에게
															있습니다. 이용자는 회원가입시 작성한 회원 정보는 언제든지 수정이 가능하지만, 이름과 아이디,
															사업자등록번호 등 고유의 정보는 변경이 불가능합니다.</p>
														<label>제11조 (서비스 제공의 제한 및 중지)</label>
														<p>당사는 다음 각 호에 해당하는 경우 서비스 제공을 중지할 수 있습니다. 가. 서비스용 설비의
															보수 또는 공사로 인한 부득이한 경우 나. 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를
															중지했을 때 전시, 사변, 천재지변 또는 이에 준하는 국가 비상사태가 발생하거나 발생할 우려가 있는
															경우와 전기통신사업법에 의한 기간통신사업자가 전기통신 서비스를 중지하는 등 기타 부득이한 사유가 있는
															경우에는 서비스의 전부 또는 일부를 제한하거나 중지할 수 있습니다.</p>
														<label>제12조 (이용자 게시물의 삭제 및 서비스 이용 제한)</label>
														<p>당사는 서비스용 설비의 용량에 여유가 없다고 판단되는 경우 필요에 따라 이용자가 게재 또는
															등록한 내용물을 삭제할 수 있습니다. 당사는 서비스용 설비의 용량에 여유가 없다고 판단되는 경우
															이용자의 서비스 이용을 부분적으로 제한할 수 있습니다. 당사는 이용자가 게재 또는 등록하는 서비스내의
															내용물이 다음 각 호에 해당한다고 판단되는 경우에 이용자에게 사전 통지 없이 삭제할 수 있습니다. 가.
															타인의 이용자 아이디를 부정하게 사용하는 경우 나. 다른 이용자 또는 제 3자를 비방하거나 중상모략으로
															명예를 손상시키는 경우 다. 공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형 등을 유포 하는
															경우 라. 반국가적, 반사회적, 범죄적 행위와 결부된다고 판단되는 경우 마. 다른 이용자 또는 제3자의
															저작권 등 기타 권리를 침해하는 경우 바. 게시 기간이 규정된 기간을 초과한 경우 사. 기타 관계
															법령에 위배된다고 판단되는 경우</p>
														<label>제13조 (서비스 이용계약의 제한 및 해지)</label>
														<p>이용자가 서비스 이용계약을 해지하고자 하는 때에는 탈퇴요청을 하여야 합니다. 당사는 이용자가
															다음 각 호에 해당하는 경우 사전 통지 없이 이용계약을 해지하거나 1개월 이내의 기간을 정하여 서비스
															제공을 중지할 수 있습니다. 가. 타인의 이용자 아이디를 사용한 경우 나. 서비스의 운영을 고의로
															방해한 경우 다. 공공질서 및 미풍양속에 저해되는 내용을 고의로 유포시킨 경우 라. 타인의 명예를
															손상시키거나 불이익을 주는 행위를 한 경우 마. 기타 서비스의 이용자로서 부적당하다고 판단한 경우</p>
														<label>제14조 (게재된 자료에 대한 권리)</label>
														<p>서비스에 게재된 자료에 대한 권리는 다음 각 호와 같습니다. 게시물에 대한 권리와 책임은
															게시자에게 있으며, 당사는 게시자의 동의 없이는 이를 영리적 목적으로 사용할 수 없습니다. 단,
															비영리적 목적인 경우 당사는 게시자의 동의 없이도 이를 사용할 수 있으며 서비스내의 게재권을 갖습니다.
															게시자의 사전 동의가 없이는 이용자는 서비스를 이용하여 얻은 정보를 가공, 판매하는 행위 등 서비스에
															게재된 자료를 상업적 목적으로 이용할 수 없습니다.</p>
														<label>※ (시행일) 이 약관은 2024년 01월 09일부터 시행합니다.</label>
													</div>

												</div>
												<div class="log-separator fl-wrap"></div>

												<div class="filter-tags hadam_rule_check">
													<input id="check-a" type="checkbox" name="check"> <label
														for="check-a">Hadam 이용약관 동의(필수) <a href="#"
														target="_blank"></a></label>
												</div>
												<span class="fw-separator"></span> <a id="rule_agree"
													href="#"
													class="next-form disa action-button btn no-shdow-btn color-bg">회원정보입력
													<i class="fal fa-angle-right"></i>
												</a>
											</fieldset>
											<!-- 이용동의 약관 끝 -->
											<!-- 개인정보 입력 시작 -->
											<fieldset class="fl-wrap book_mdf">
												<div class="list-single-main-item-title fl-wrap">
													<h3>회원정보를 입력해주세요</h3>
												</div>

												<div class="row">
													<div class="col-sm-6">

														<label>아이디<span class="confirm_id_comment"></span>
															<i class="far fa-user"></i>
														</label> <input type="text" id="member_id" placeholder="Your Id"
															value="" class="check_input" /> <input type="button"
															id="member_id_check" class="check_button" value="중복확인" />

													</div>
													<div class="col-sm-6">
														<label>전화번호<span class="phone_comment"></span> <i
															class="far fa-phone"></i></label> <input type="number"
															id="member_phone" placeholder="Only Number" value=""
															class="check_input" /> <input type="button"
															id="member_phone_check" class="check_button" value="인증하기" />
														<!-- oninput="this.value = 
														this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" -->




													</div>
												</div>

												<div class="row">
													<div class="col-sm-6">
														<label>비밀번호<i class="fal fa-key"></i><span
															class="password_comment"></span>
														</label> <input type="password" id="member_password"
															placeholder="Password" value="" />

													</div>
													<div class="col-sm-6">
														<label>닉네임 <i class="far fa-user"></i><span
															class="nickname_comment"></span></label> <input type="text"
															id="member_nickname" placeholder="Your NickName" value=""
															class="check_input" /> <input type="button"
															id="member_nickname_check" class="check_button"
															value="중복확인" />
													</div>
												</div>
												<div class="row">
													<div class="col-sm-6">
														<label>비밀번호 확인 <i class="fal fa-key"></i><span
															class="confirm_password_comment"></span>
														</label> <input type="password" id="confirm_member_password"
															placeholder="Confirm Password" class="confirm_password"
															value="" />
													</div>

													<div class="col-sm-6">
														<label>생년월일/성별<i class="fal fa-calendar"></i></label> <input
															type="number" id="member_birth" maxlength='8'
															placeholder="YYYYMMDD" />
														<!-- oninput="this.value = 
																this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" -->
														<div class="select">
															<input type="radio" name="member_sex" value="남자"
																id="select1"> <label for="select1">남자</label> <input
																type="radio" name="member_sex" value="여자" id="select2">
															<label for="select2">여자</label>
														</div>
													</div>
												</div>


												<div class="filter-tags"></div>
												<span class="fw-separator"></span> <a href="#"
													class="previous-form action-button back-form   color-bg"><i
													class="fal fa-angle-left"></i> 뒤로</a> <a href="#"
													id="signup_basicform"
													class="next-form back-form action-button btn no-shdow-btn color-bg">취향
													설정<i class="fal fa-angle-right"></i>
												</a> <a href="#" id="hide_signup_basicform"
													class="action-button btn no-shdow-btn color-bg">취향 설정<i
													class="fal fa-angle-right"></i>
												</a>
											</fieldset>



											<!-- 개인정보 입력 끝 -->
											<!-- 카테고리 설정 시작 -->
											<fieldset class="fl-wrap book_mdf">
												<div class="list-single-main-item-title fl-wrap">
													<h3>당신의 취향을 선택해주세요</h3>
												</div>
												<div class="row">
													<div class="col-sm-6 hadam_category eating">
														<label class='midlelabel'>먹기</label>
														<ul class="ks-cboxtags">
															<li><input type="checkbox" class="middle" id="한식" /><label
																for="한식">한식</label></li>
															<li><input type="checkbox" class="middle" id="중식" /><label
																for="중식">중식</label></li>
															<li><input type="checkbox" class="middle" id="양식" /><label
																for="양식">양식</label></li>
															<li><input type="checkbox" class="middle" id="일식" /><label
															
																for="일식">일식</label></li>
															<li><input type="checkbox" class="middle"
																id="패스트푸드" /><label for="패스트푸드">패스트푸드</label></li>
															<li><input type="checkbox" class="middle" id="세계음식" /><label
																for="세계음식">세계음식</label></li>
														</ul>
													</div>
													<div class="col-sm-6 hadam_category eating small 한식">
													<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;한식</label>
														<ul class="ks-cboxtags">
															<li><input type="checkbox" class="small" id="족발,보쌈"><label
																for="족발,보쌈">족발,보쌈</label></li>
															<li><input type="checkbox" class="small" id="칼국수,만두"><label
																for="칼국수,만두">칼국수,만두</label></li>
															<li><input type="checkbox" class="small" id="국밥"><label
																for="국밥">국밥</label></li>
															<li><input type="checkbox" class="small"
																id="육류,고기요리"><label for="육류,고기요리">육류,고기요리</label></li>
															<li><input type="checkbox" class="small" id="낙지요리"><label
																for="낙지요리">낙지요리</label></li>
															<li><input type="checkbox" class="small" id="닭요리"><label
																for="닭요리">닭요리</label></li>
															<li><input type="checkbox" class="small" id="국수" /><label
																for="국수">국수</label></li>
															<li><input type="checkbox" class="small" id="두부요리"><label
																for="두부요리">두부요리</label></li>
															<li><input type="checkbox" class="small" id="한정식"><label
																for="한정식">한정식</label></li>
															<li><input type="checkbox" class="small"
																id="곱창,막창,양"><label for="곱창,막창,양">곱창,막창,양</label></li>
															<li><input type="checkbox" class="small" id="복어요리"><label
																for="복어요리">복어요리</label></li>
															<li><input type="checkbox" class="small" id="생선회"><label
																for="생선회">생선회</label></li>
															<li><input type="checkbox" class="small" id="찌개,전골"><label
																for="찌개,전골">찌개,전골</label></li>
															<li><input type="checkbox" class="small" id="전,빈대떡"><label
																for="전,빈대떡">전,빈대떡</label></li>
															<li><input type="checkbox" class="small"
																id="해물,생선요리"><label for="해물,생선요리">해물,생선요리</label></li>
														</ul>
													</div>
													<div class="col-sm-6 hadam_category eating small 중식">
													<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;중식</label>
														<ul class="ks-cboxtags">
															<li><input type="checkbox" class="small" id="중식당" /><label
																for="중식당">중식당</label></li>
															<li><input type="checkbox" class="small" id="양꼬치" /><label
																for="양꼬치">양꼬치</label></li>
															<li><input type="checkbox" class="small" id="마라탕" /><label
																for="마라탕">마라탕</label></li>
															<li><input type="checkbox" class="small" id="딤섬" /><label
																for="딤섬">딤섬</label></li>
														</ul>
													</div>
													<div class="col-sm-6 hadam_category eating small 양식">
													<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;양식</label>
														<ul class="ks-cboxtags">
															<li><input type="checkbox" class="small"
																id="스파게티,파스타전문" /><label for="스파게티,파스타전문">스파게티,파스타전문</label></li>
															<li><input type="checkbox" class="small" id="이탈리아음식" /><label
																for="이탈리아음식">이탈리아음식</label></li>
															<li><input type="checkbox" class="small" id="스테이크,립" /><label
																for="스테이크,립">스테이크,립</label></li>
															<li><input type="checkbox" class="small" id="프랑스음식" /><label
																for="프랑스음식">프랑스음식</label></li>
															<li><input type="checkbox" class="small" id="샌드위치" /><label
																for="샌드위치">샌드위치</label></li>
														</ul>
													</div>
													<div class="col-sm-6 hadam_category eating small 일식">
													<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일식</label>
														<ul class="ks-cboxtags">
															<li><input type="checkbox" class="small" id="일식당" /><label
																for="일식당">일식당</label></li>
															<li><input type="checkbox" class="small" id="돈가스" /><label
																for="돈가스">돈가스</label></li>
															<li><input type="checkbox" class="small" id="이자카야" /><label
																for="이자카야">이자카야</label></li>
															<li><input type="checkbox" class="small" id="초밥,롤" /><label
																for="초밥,롤">초밥,롤</label></li>
															<li><input type="checkbox" class="small" id="우동,소바" /><label
																for="우동,소바">우동,소바</label></li>
															<li><input type="checkbox" class="small" id="일본식라면" /><label
																for="일본식라면">일본식라면</label></li>
															<li><input type="checkbox" class="small" id="카레" /><label
																for="카레">카레</label></li>
														</ul>
													</div>
													<div class="col-sm-6 hadam_category eating small 패스트푸드">
													<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;패스트푸드</label>
														<ul class="ks-cboxtags">
															<li><input type="checkbox" class="small" id="햄버거" /><label
																for="햄버거">햄버거</label></li>
															<li><input type="checkbox" class="small" id="피자" /><label
																for="피자">피자</label></li>
															<li><input type="checkbox" class="small" id="치킨" /><label
																for="치킨">치킨</label></li>
														</ul>
													</div>
													<div class="col-sm-6 hadam_category eating small 세계음식">
													<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;세계음식</label>
														<ul class="ks-cboxtags">
															<li><input type="checkbox" class="small" id="베트남음식" /><label
																for="베트남음식">베트남음식</label></li>
															<li><input type="checkbox" class="small" id="아시아음식" /><label
																for="아시아음식">아시아음식</label></li>
															<li><input type="checkbox" class="small" id="태국음식" /><label
																for="태국음식">태국음식</label></li>
															<li><input type="checkbox" class="small" id="인도음식" /><label
																for="인도음식">인도음식</label></li>
															<li><input type="checkbox" class="small"
																id="멕시코,남미음식" /><label for="멕시코,남미음식">멕시코,남미음식</label></li>
														</ul>
													</div>
													<div class="col-sm-6 hadam_category drinking">
														<label class='midlelabel'>마시기</label>
														<ul class="ks-cboxtags">
															<li><input type="checkbox" class="middle small" id="카페" /><label
																for="카페">카페</label></li>
															<li><input type="checkbox" class="middle" id="주류" /><label
																for="주류">주류</label></li>
														</ul>
													</div>
													<div class="col-sm-6 hadam_category drinking small 주류">
													<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주류</label>
														<ul class="ks-cboxtags">
															<li><input type="checkbox" class="small"
																id="포장마차,요리주점" /><label for="포장마차,요리주점">포장마차,요리주점</label></li>
															<li><input type="checkbox" class="small" id="맥주,호프" /><label
																for="맥주,호프">맥주,호프</label></li>
															<li><input type="checkbox" class="small" id="와인" /><label
																for="태국음식">와인</label></li>
															<li><input type="checkbox" class="small" id="칵테일" /><label
																for="칵테일">칵테일</label></li>
														</ul>
													</div>
													<div class="col-sm-6 hadam_category playing">
														<label class='midlelabel'>놀기</label>
														<ul class="ks-cboxtags">
															<li><input type="checkbox" class="middle" id="이색" /><label
																for="이색">이색</label></li>
															<li><input type="checkbox" class="middle" id="실내활동" /><label
																for="실내활동">실내활동</label></li>
															<li><input type="checkbox" class="middle" id="실외활동" /><label
																for="실외활동">실외활동</label></li>
														</ul>
													</div>
													<div class="col-sm-6 hadam_category playing small 이색">
													<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이색</label>
														<ul class="ks-cboxtags">
															<li><input type="checkbox" class="small" id="테마카페" /><label
																for="테마카페">테마카페</label></li>
															<li><input type="checkbox" class="small"
																id="방탈출,vr카페" /><label for="방탈출,vr카페">방탈출,vr카페</label></li>
															<li><input type="checkbox" class="small" id="사주카페" /><label
																for="사주카페">사주카페</label></li>
															<li><input type="checkbox" class="small" id="보드카페" /><label
																for="보드카페">보드카페</label></li>
															<li><input type="checkbox" class="small"
																id="플레이스스테이션방" /><label for="플레이스스테이션방">플레이스스테이션방</label></li>
															<li><input type="checkbox" class="small" id="플라워카페" /><label
																for="플라워카페">플라워카페</label></li>
															<li><input type="checkbox" class="small" id="공방" /><label
																for="공방">공방</label></li>
															<li><input type="checkbox" class="small" id="암벽등반" /><label
																for="암벽등반">암벽등반</label></li>
															<li><input type="checkbox" class="small" id="힐링카페" /><label
																for="힐링카페">힐링카페</label></li>
															<li><input type="checkbox" class="small" id="애견카페" /><label
																for="애견카페">애견카페</label></li>
														</ul>
													</div>
													<div class="col-sm-6 hadam_category playing small 실내활동">
													<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;실내활동</label>
														<ul class="ks-cboxtags">
															<li><input type="checkbox" class="small" id="스케이트장" /><label
																for="스케이트장">스케이트장</label></li>
															<li><input type="checkbox" class="small" id="노래방" /><label
																for="노래방">노래방</label></li>
															<li><input type="checkbox" class="small" id="당구장" /><label
																for="사주카페">당구장</label></li>
															<li><input type="checkbox" class="small" id="볼링장" /><label
																for="볼링장">볼링장</label></li>
															<li><input type="checkbox" class="small" id="스크린야구장" /><label
																for="스크린야구장">스크린야구장</label></li>
															<li><input type="checkbox" class="small" id="수영장" /><label
																for="수영장">수영장</label></li>
														</ul>
													</div>
													<div class="col-sm-6 hadam_category playing small 실외활동">
													<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;실외활동</label>
														<ul class="ks-cboxtags">
															<li><input type="checkbox" class="small"
																id="수상,해양레저" /><label for="수상,해양레저">수상,해양레저</label></li>
															<li><input type="checkbox" class="small" id="스키장" /><label
																for="스키장">스키장</label></li>
															<li><input type="checkbox" class="small" id="낚시터" /><label
																for="낚시터">낚시터</label></li>
															<li><input type="checkbox" class="small"
																id="해수욕장,해변" /><label for="해수욕장,해변">해수욕장,해변</label></li>
															<li><input type="checkbox" class="small" id="테마파크" /><label
																for="테마파크">테마파크</label></li>
															<li><input type="checkbox" class="small" id="워터파크" /><label
																for="워터파크">워터파크</label></li>
														</ul>
													</div>
													<div class="col-sm-6 hadam_category watching">
														<label class='midlelabel'>보기</label>
														<ul class="ks-cboxtags">
															<li><input type="checkbox" class="middle" id="영화" /><label
																for="영화">영화</label></li>
															<li><input type="checkbox" class="middle" id="전시" /><label
																for="전시">전시</label></li>
															<li><input type="checkbox" class="middle" id="공연" /><label
																for="공연">공연</label></li>
															<li><input type="checkbox" class="middle" id="책방" /><label
																for="책방">책방</label></li>
														</ul>
													</div>
													<div class="col-sm-6 hadam_category watching small 영화">
													<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;영화</label>
														<ul class="ks-cboxtags">
															<li><input type="checkbox" class="small" id="영화관" /><label
																for="영화관">영화관</label></li>
															<li><input type="checkbox" class="small" id="DVD" /><label
																for="DVD">DVD</label></li>
														</ul>
													</div>
													<div class="col-sm-6 hadam_category watching small 전시">
													<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전시</label>
														<ul class="ks-cboxtags">
															<li><input type="checkbox" class="small" id="전시회" /><label
																for="전시회">전시회</label></li>
															<li><input type="checkbox" class="small" id="박물관" /><label
																for="박물관">박물관</label></li>
														</ul>
													</div>
													<div class="col-sm-6 hadam_category watching small 공연">
													<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공연</label>
														<ul class="ks-cboxtags">
															<li><input type="checkbox" class="small" id="뮤지컬극장" /><label
																for="뮤지컬극장">뮤지컬극장</label></li>
															<li><input type="checkbox" class="small" id="연극" /><label
																for="연극">연극</label></li>
														</ul>
													</div>
													<div class="col-sm-6 hadam_category watching small 책방">
														<ul class="ks-cboxtags">
															<li><input type="checkbox" class="small" id="서점" /><label
																for="서점">서점</label></li>
															<li><input type="checkbox" class="small" id="만화카페" /><label
																for="만화카페">만화카페</label></li>
														</ul>
													</div>
													<div class="col-sm-6 hadam_category walking">
														<label class='midlelabel'>걷기</label>
														<ul class="ks-cboxtags">
															<li><input type="checkbox" class="middle small" id="시장" /><label
																for="시장">시장</label></li>
															<li><input type="checkbox" class="middle small" id="공원" /><label
																for="공원">공원</label></li>
															<li><input type="checkbox" class="middle" id="산책" /><label
																for="산책">산책</label></li>
															<li><input type="checkbox" class="middle small" id="문화재" /><label
																for="문화재">문화재</label></li>
														</ul>
													</div>
													<div class="col-sm-6 hadam_category walking small 산책">
													<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;산책</label>
														<ul class="ks-cboxtags">
															<li><input type="checkbox" class="small" id="도보코스" /><label
																for="도보코스">도보코스</label></li>
															<li><input type="checkbox" class="small" id="산책로" /><label
																for="산책로">산책로</label></li>
														</ul>
													</div>
												</div>


												<span class="fw-separator"></span> <a href="#"
													class="previous-form  back-form action-button    color-bg"><i
													class="fal fa-angle-left"></i> Back</a> <a href="#"
													id="hide_signup_completion"
													class="action-button btn color2-bg no-shdow-btn">눌러야
													완료!<i class="fal fa-angle-right"></i>
												</a> <a href="#" id="signup_completion"
													class="next-form  action-button btn color2-bg no-shdow-btn">눌러야
													완료!<i class="fal fa-angle-right"></i>
												</a>

											</fieldset>
											<fieldset class="fl-wrap book_mdf">
												<div class="list-single-main-item-title fl-wrap">
													<h3>가입을 감사드립니다</h3>
												</div>
												<div class="success-table-container">
													<div class="success-table-header fl-wrap">
														<i class="fal fa-check-circle decsth"></i>
														<h4>회원가입이 완료되었습니다</h4>
														<div class="clearfix"></div>
														<p>Hadam은 당신의 하루가 궁금합니다 Hadam에서 행복한 하루를 만드세요</p>
														<a href="/" target="_blank" class="color-bg">메인
															페이지로 이동</a>
													</div>
												</div>
												<!-- <span class="fw-separator"></span> <a href="#"
													class="previous-form action-button  back-form   color-bg"><i
													class="fal fa-angle-left"></i> Back</a> -->
											</fieldset>
										</form>
									</div>
								</div>
							</div>
							<!--   list-single-main-item end -->
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- section end -->
	</div>
	<!-- content end-->
</div>
<!--wrapper end -->

<!--footer -->
<jsp:include page="/WEB-INF/layout/footer.jsp"></jsp:include>
<!--footer end -->

<!-- 인증번호 받는 모달 -->
<div class="main-register-wrap reg-modal">
	<!-- main-register-wrap -->
	<div class="reg-overlay2"></div>
	<div class="main-register-holder">
		<div class="main-register fl-wrap auth">
			<!--tabs -->
			<div id="tabs-container">
				<div class="tab">
					<!--tab -->
					<div id="tab-1" class="tab-content">
						<h3 id="check_phone_coment">인증번호를 입력해주세요</h3>
						<div class="custom-form">
							<span id="check_phone_count"></span> <input type="text"
								id="input_check_phone"> <input type="button"
								id="btn_check_phone" value="확인" /> <input type="button"
								id="btn_cancel_check_phone" value="취소" />
						</div>
					</div>
				</div>
				<!--tabs end -->
				<div class="log-separator fl-wrap">
					<!-- <span>or</span> -->
				</div>

			</div>
		</div>
	</div>
</div>
<!--=============== 개인 js  ===============-->
<script type="text/javascript" src="/js/sign/signup.js"></script>
