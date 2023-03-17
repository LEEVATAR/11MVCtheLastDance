<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
Product vo=(Product)request.getAttribute("prod");
--%>
<!DOCTYPE html>


<html>
<head>
	<meta charset="EUC-KR">
	<title>��ǰ���� ����</title>
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>
	<script type="text/javascript">
	//$( function() {
	//    $( "#datepicker" ).datepicker();
	//});	
	$(function() {
				$( "button.btn.btn-primary:contains('�����Ϸ�')" ).on("click" , function() {	
				//alert(  $( "td.ct_btn01:contains('����')" ).html() );
					fncUpdateProduct();
				});		
			});	
	
	$(function() {			
				$( "button.btn.btn-primary:contains('���ư���')" ).on("click" , function() {
					history.go(-1);
				});
			});	
	
	function fncUpdateProduct(){
		//Form ��ȿ�� ����
	 	//var prodName = document.detailForm.prodName.value;
		//var detail = document.detailForm.prodDetail.value;
		//var manuDate = document.detailForm.manuDate.value;
		//var price = document.detailForm.price.value;
		var prodName = $("input[name='prodName']").val();
		var prodDetail = $("input[name='prodDetail']").val();
		var manuDate = $("input[name='manuDate']").val();
		var price = $("input[name='price']").val();
		var fileName = $("input[name='imageName']").val();
		//alert(prodName+prodDetail+manuDate+price+fileName);
		/*
		alert(prodName);
		if(prodName == null || name.length<1){
			alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		alert(prodDetail);
		if(prodDetail == null || prodDetail.length<1){
			alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		alert(manuDate);
		if(manuDate == null || manuDate.length<1){
			alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		alert(price);
		if(price == null || price.length<1){
			alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		*/
		$("form").attr("method" , "POST").attr("action" , "/product/updateProduct").attr("enctype", "multipart/form-data").submit();
		}
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
			
			
	</script>
 </head>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container" >
	
		<div class="page-header text-center">
	       <h3 class=" text-info">��ǰ��������</h3>
	       
	    </div>   

		 <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		 
		<div class="form-group">
			<input type="hidden" name="prodNo" value="${product.prodNo}"/>
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName }">
		    </div>
		</div>

		<div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail}">
		    <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">��ǰƯ¡�� �ڼ��� �����ּ���.</strong>
		     </span>
		    </div>
		</div>
		
		<div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    <div class="col-sm-4">
		      <input type="date" class="form-control" id="datepicker" name="manuDate" value="${product.manuDate }">
		    </div>
		</div>
		
		<div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" value="${product.price }">
		    </div>
		</div>
		
		<div class="form-group">
		    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control" id="fileName" name="imageName" width="175px" value="${product.fileName }">
		    </div>
		</div>
	
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" ><i class="glyphicon glyphicon-check"></i>&nbsp;�����Ϸ�</button>
		      <button type="button" class="btn btn-primary" ><i class="glyphicon glyphicon-repeat"></i> &nbsp;���ư���</button>
		    </div>
		  </div>
		</form>
		
 	</div>
</body>

</html>
