<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	<title>��ǰ��ϿϷ�!</title>

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
		 $("button.btn.btn-primary:contains('Ȯ��')").on("click" , function() {
			//Debug..
		 	//$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?menu=manage");
			self.location = "/product/listProduct?menu=manage"
		 });
		
		 $("button.btn.btn-primary:contains('�߰����')").on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('���')" ).html() );
			self.location = "../product/addProductView.jsp;"
		 });
	});	
</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
	<div class="page-header">
	       <h3 class=" text-info">��ǰ��� �Ϸ�!</h3>
	       <h5 class="text-muted">��ǰ������ <strong class="text-danger"> �ֽ������� ����</strong>�� �ּ���.</h5>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ������</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>����</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}	</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ�̹���</strong></div>
			<div class="col-xs-8 col-md-4" ><img src="../../images/uploadFiles/${product.fileName}"/></div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�������</strong></div>
			<div class="col-xs-8 col-md-4">${product.regDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">Ȯ��</button>
	  		</div>
		</div>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">�߰����</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>
