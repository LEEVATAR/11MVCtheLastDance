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
	<title>��ǰ���</title>
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	
	<!-- ����11������ �ּ�  script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>-->
	
	<script type="text/javascript" src="../javascript/calendar.js"></script>
 	
 	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>


<!-- �����ڵ� 07��webapp/product���� -->
	<script type="text/javascript">
	$( function() {
	    $( "#datepicker" ).datepicker();
	});	
	function fncAddProduct(){
		//Form ��ȿ�� ����
	 	
		var prodName=$("input[name='prodName']").val();
		var detail=$("input[name='prodDetail']").val();
		var manuDate=$("input[name='manuDate']").val();
		var price=$("input[name='price']").val();
		
		if(prodName == null || prodName.length<1){
			alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(detail == null || detail.length<1){
			alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if(manuDate == null || manuDate.length<1){
			alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if(price == null || price.length<1){
			alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		
		$("form").attr("method" , "POST").attr("action" , "/product/addProduct").submit();
	}
				
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
			 $( "button.btn.btn-primary" ).on("click" , function() {
				//alert(  $( "td.ct_btn01:contains('���')" ).html() );
				//console.log(prodName, detail, price, manuDate);
				fncAddProduct();
			 });
		});
		
		$(function() {
			 $("a[href='##']").on("click" , function() {
				//Debug..
				//alert(  $( ".Depth03:contains('ȸ��������ȸ')" ) ); ?? �³��̰� ���������̼��ε�?
			 	//$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?menu=manage");
				self.location = "/product/listProduct?menu=manage"
			 });
		});	
	
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
			 $("a[href='#']").on("click" , function() {
					//Debug..
					//alert(  $( "td.ct_btn01:contains('���')" ).html() );
					$("form")[0].reset();
			});
		});	
	</script>
	
</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">
		<!-- ������ ����κ�  -->
		<div class="page-header text-info"><h3>��ǰ��� ������</h3></div>
		
		<!-- form start���� -->
		<form class="form-horizontal">
		 
		<div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" placeholder="��ǰ��">
		    </div>
		</div>

		<div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="��ǰ������">
		    <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">��ǰƯ¡�� �ڼ��� �����ּ���.</strong>
		     </span>
		    </div>
		</div>
		
		<div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    <div class="col-sm-4">
		      <input type="date" class="form-control" id="datepicker" name="manuDate" placeholder="��������">
		    </div>
		</div>
		
		<div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" placeholder="����">
		    </div>
		</div>
		
		<div class="form-group">
		    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="fileName" name="fileName" placeholder="��ǰ�̹���">
		    </div>
		</div>
	
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" ><i class="glyphicon glyphicon-check"></i>&nbsp;��ǰ���</button>
		      <button type="button" class="btn btn-primary" ><i class="glyphicon glyphicon-pencil"></i> &nbsp;�ٽþ���</button>
		      <button type="button" class="btn btn-primary" ><i class="glyphicon glyphicon-repeat"></i> &nbsp;���ư���</button>
			  <!-- <a class="btn btn-primary btn" href="#" role="button"><i class="glyphicon glyphicon-flash"></i>�ٽþ���</a>
			  <a class="btn btn-primary btn" href="##" role="button"><i class="glyphicon glyphicon-flash"></i>���ư���</a> -->
		    </div>
		  </div>
		</form>
		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	
</body>

</html>