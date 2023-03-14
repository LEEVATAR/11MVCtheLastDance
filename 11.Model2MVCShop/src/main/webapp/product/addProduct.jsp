<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%-- EL/JSTL 적용으로 주석 
<%@ page import="com.model2.mvc.service.domain.*" %>

<%
	Product product = (Product)session.getAttribute("product");
%>
--%>
<!DOCTYPE html>

<html lang="ko">
<html>
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<title>상품등록완료!</title>

	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	<script type="text/javascript" src="../javascript/calendar.js"></script>
	<style>
    body > div.container{
     	 border: 3px solid #65EB05;
         margin-top: 10px;
     }
    </style>
    <script type="text/javascript">
    
	$(function() {
		 $("button.btn.btn-primary:contains('확인')").on("click" , function() {
			//Debug..
			//alert(  $( ".Depth03:contains('회원정보조회')" ) ); ?? 맞나이게 셀프로케이션인듯?
		 	//$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?menu=manage");
			self.location = "/product/listProduct?menu=manage"
		 });
		
		 $("button.btn.btn-primary:contains('추가등록')").on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('취소')" ).html() );
			self.location = "../product/addProductView.jsp;"
		 });
	});	
</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
	<div class="page-header">
	       <h3 class=" text-info">상품등록 완료!</h3>
	       <h5 class="text-muted">상품정보를 <strong class="text-danger"> 최신정보로 관리</strong>해 주세요.</h5>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품상세정보</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>제조일자</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>가격</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}	</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품이미지</strong></div>
			<div class="col-xs-8 col-md-4">${product.fileName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>등록일자</strong></div>
			<div class="col-xs-8 col-md-4">${product.regDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">확인</button>
	  		</div>
		</div>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">추가등록</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>
