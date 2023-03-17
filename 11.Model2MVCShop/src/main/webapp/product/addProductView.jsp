<%@ page contentType="text/html; charset=euc-kr"  %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<title>상품등록</title>
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<!-- 리팩11번으로 주석  script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>-->
	
	<script type="text/javascript" src="../javascript/calendar.js"></script>
 	
 	<style>
       body {
            padding-top : 50px;
            
        }
    </style>


<!-- 기존코드 07번webapp/product참조 -->
	<script type="text/javascript">
	$( function() {
	    $( "#datepicker" ).datepicker();
	});	
	function fncAddProduct(){
		//Form 유효성 검증
	 	
		var prodName=$("input[name='prodName']").val();
		var detail=$("input[name='prodDetail']").val();
		var manuDate=$("input[name='manuDate']").val();
		var price=$("input[name='price']").val();
		
		if(prodName == null || prodName.length<1){
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if(detail == null || detail.length<1){
			alert("상품상세정보는 반드시 입력하여야 합니다.");
			return;
		}
		if(manuDate == null || manuDate.length<1){
			alert("제조일자는 반드시 입력하셔야 합니다.");
			return;
		}
		if(price == null || price.length<1){
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}
		
		$("form").attr("method" , "POST").attr("action" , "/product/addProduct").attr("enctype", "multipart/form-data").submit();
	}
				
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
			 $( "button.btn.btn-primary:contains('상품등록')" ).on("click" , function() {
				//alert(  $( "td.ct_btn01:contains('등록')" ).html() );
				//console.log(prodName, detail, price, manuDate);
				fncAddProduct();
			 });
		});
		
		$(function() {
			 $("button.btn.btn-primary:contains('목록으로')").on("click" , function() {
				//Debug..
			 	//$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?menu=manage");
				self.location = "/product/listProduct?menu=manage"
			 });
		});	
	
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
			 $("button.btn.btn-primary:contains('다시쓰기')").on("click" , function() {
					//Debug..
					//alert(  $( "td.ct_btn01:contains('취소')" ).html() );
					$("form")[0].reset();
			});
		});	
	</script>
	
</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">
		<!-- 맨위의 제목부분  -->
		<div class="page-header text-info"><h3>제품등록 페이지</h3></div>
		
		<!-- form start시작 -->
		<form class="form-horizontal">
		 
		<div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" placeholder="상품명">
		    </div>
		</div>

		<div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="상품상세정보">
		    <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">제품특징은 자세히 적어주세요.</strong>
		     </span>
		    </div>
		</div>
		
		<div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      <input type="date" class="form-control" id="datepicker" name="manuDate" placeholder="제조일자">
		    </div>
		</div>
		
		<div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">상품가</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" placeholder="가격">
		    </div>
		</div>
		
		<div class="form-group">
		    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control" id="fileName" name="imageName" placeholder="상품이미지">
		    </div>
		</div>
	
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" ><i class="glyphicon glyphicon-check"></i>&nbsp;상품등록</button>
		      <button type="button" class="btn btn-primary" ><i class="glyphicon glyphicon-pencil"></i> &nbsp;다시쓰기</button>
		      <button type="button" class="btn btn-primary" ><i class="glyphicon glyphicon-repeat"></i> &nbsp;목록으로</button>
			  <!-- <a class="btn btn-primary btn" href="#" role="button"><i class="glyphicon glyphicon-flash"></i>다시쓰기</a>
			  <a class="btn btn-primary btn" href="##" role="button"><i class="glyphicon glyphicon-flash"></i>돌아가기</a> -->
		    </div>
		  </div>
		</form>
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>