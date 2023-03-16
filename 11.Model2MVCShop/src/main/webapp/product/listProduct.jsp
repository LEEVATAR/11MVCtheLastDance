<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>��ǰ �����ȸ</title>

<meta charset="EUC-KR">
	
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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
<script type="text/javascript">

	function fncGetUserList(currentPage, menu){
		
	   	$("#currentPage").val(currentPage)
	    $("#param.menu").val(menu)
	   	
	   	$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
	}
	//==> �߰��Ⱥκ� : "�˻�" ,  prodNo link  Event ���� �� ó��
			$(function() {		 
			//$( "td.ct_btn01:contains('�˻�')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('�˻�')" ).html() );
				//fncGetUserList(1);
			});
			
			//==> userId LINK Event ����ó��
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 3 �� 1 ��� ���� : $(".className tagName:filter�Լ�") �����.
			
			$(function() {
		
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(2)" ).on("click" , function() {
				prodNo = $(this).children('input:hidden').val();
				
				alert(prodNo);

				if(($('#menu').attr('name')) == "manage"){
					//alert(selflocation);
					self.location ="/product/updateProduct?prodNo="+prodNo+"&menu="+$('#menu').attr('name');
				}
				
				if(($('#menu').attr('name')) == "search"){
					//alert(selflocation);
					self.location ="/product/getProduct?prodNo="+$(this).children('input:hidden').val();
				}
				
			});
						
			//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
			$( "td:nth-child(2)" ).css("color" , "red");
			
		});	
			
			$(function() {
				$( "td:nth-child(5) > i" ).on("click" , function() {
						//td 5��°�� �ڽ� i�� Ŭ�������� ����Ǵ� ���
						var prodNo = $(this).children('input:hidden').val();
						
						alert(prodNo);
						
						$.ajax( 
								{
									url : "/product/json/getProduct/"+prodNo+"&menu=search",
									//url : "/product/json/getProduct/"+prodNo+"&menu="+$('#menu').attr('name');,
									method : "GET" ,
									dataType : "json" ,
									headers : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									success : function(JSONData , status) {
										//Debug...
										//alert(status);
										//Debug...
										//alert("JSONData : \n"+JSONData);	
										var displayValue = "<h3>"
																	+"��ǰ��ȣ : "+JSONData.prodNo+"<br/>"
																	+"��ǰ�� : "+JSONData.prodName+"<br/>"
																	+"��ǰ�̹��� : "+JSONData.fileName+"<br/>"
																	+"��ǰ������ : "+JSONData.prodDetail+"<br/>"
																	+"�������� : "+JSONData.manuDate+"<br/>"
																	+"��  �� : "+JSONData.price+"<br/>"
																	+"����� : "+JSONData.regDateString+"<br/>"
																	+"</h3>";
										//Debug...									
										//alert(displayValue);
										$("h6").remove();
										$( "#"+prodNo+"" ).html(displayValue);
									}
							});
					
					/*
					if(($('#menu').attr('name')) == "search"){
						//alert(selflocation);
						self.location ="/product/getProduct?prodNo="+$(this).children('input:hidden').val()+"&menu="+$('#menu').attr('name');
					}
					*/
			});
				$('#autoComplete').autocomplete({
					
					
					source : function(request, response) { //source: �Է½� ���� ���
						
						$.ajax({
					           url : "/product/autocomplete"   
					         , type : "POST"
					         , dataType: "JSON"
					         , data : {value: request.term}	// �˻� Ű����
					         , success : function(data){ 	// �����ϸ� ���������� �� 
					             response(
					                 $.map(data.resultList, function(item) {
					                     return {
					                    	     label : item.PROD_NAME  // ��Ͽ� ǥ�õǴ� ��
					                           , value : item.PROD_NAME  // ���� �� inputâ�� ǥ�õǴ� ��
					                           , idx : item.PROD_NAME // index
					                    };//end of return
					                	 })//end of map
					             );//end of response
					         }//end of success
					         ,error : function(){ //����
					             alert("������ �߻��߽��ϴ�.");
					         }//end of error
					     });//end of ajax
					}//End of source
					,focus : function(event, ui) { // ����Ű�� �ڵ��ϼ��ܾ� ���� �����ϰ� �������	
							return false;
					}
					,minLength: 1// �ּ� ���ڼ�
					,autoFocus : true // true == ù ��° �׸� �ڵ����� ������ ������
					,delay: 100	//autocomplete ������ �ð�(ms)
					,select : function(evt, ui) { 
				      	// ������ ���ý� ���� ui.item �� ���õ� �׸��� ��Ÿ���� ��ü, lavel/value/idx�� ����
							console.log(ui.item.label);
							console.log(ui.item.idx);
					 }//end of select function
				});//end of autocomplete function
				
			//==> UI ���� �߰��κ�  :  prodNo LINK Event End User ���� ���ϼ� �ֵ��� 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			
			//==> �Ʒ��� ���� ������ ������ ?? 10�� ������������		
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");			
		});	
	</script>		
	
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
			<div class="page-header text-info">
					<c:choose>
						<c:when test = "${param.menu eq 'manage'}">
						<h3>��ǰ ���� </h3>
						</c:when>		
						<c:when test = "${param.menu eq 'search'}">
						<h3>��ǰ �����ȸ</h3> 
						</c:when>						
					</c:choose>
			</div>		
	
	<div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    		
		    	</p>
	   </div>

	<div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0" ${! empty search.searchCondition.equals("0") ? "selected" : "" }>��ǰ��ȣ</option>
						<option value="1" ${! empty search.searchCondition.equals("1") ? "selected" : ""}>��ǰ��</option>
						<option value="2" ${! empty search.searchCondition.equals("2") ? "selected" : ""}>��ǰ����</option>
					</select>
				  </div>
				<div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="autoComplete" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				</div>
				
				 <button type="button" class="btn btn-default">�˻�</button>
				 <!-- for PN -->
				 <input type="hidden" id="currentPage" nam00 e="currentPage" value=""/>
				</form>
	    	</div>
	    	
		</div>
					
	<table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >��ǰ��</th>
            <th align="left">����</th>
            <th align="left">�����</th>
            <th align="left">��������</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left"  title="Click : ��ǰ���� Ȯ��">			 
				<c:choose>	
					<c:when test = "${param.menu eq 'manage'}">
					<input type="hidden" id="menu" name="manage" value="${product.prodNo}">				
					</c:when>
				</c:choose>
					<input type="hidden" id="menu" name="search"  value="${product.prodNo }"/>
				${product.prodName}
			  </td>
			  <td align="left">${product.price}</td>
			  <td align="left">${product.regDate}</td>
			  <td align="left">
			  	<i class="glyphicon glyphicon-ok" id= "${product.prodNo}"></i>
			  	<input type="hidden" value="${product.prodNo}">
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>
