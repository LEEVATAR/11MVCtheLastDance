<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>상품 목록조회</title>

<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
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
	//==> 추가된부분 : "검색" ,  prodNo link  Event 연결 및 처리
			$(function() {		 
			//$( "td.ct_btn01:contains('검색')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('검색')" ).html() );
				//fncGetUserList(1);
			});
			
			//==> userId LINK Event 연결처리
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 3 과 1 방법 조합 : $(".className tagName:filter함수") 사용함.
			
			$(function() {
		
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
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
						
			//==> userId LINK Event End User 에게 보일수 있도록 
			$( "td:nth-child(2)" ).css("color" , "red");
			
		});	
			
			$(function() {
				$( "td:nth-child(5) > i" ).on("click" , function() {
						//td 5번째의 자식 i를 클릭했을때 실행되는 펑션
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
																	+"상품번호 : "+JSONData.prodNo+"<br/>"
																	+"상품명 : "+JSONData.prodName+"<br/>"
																	+"상품이미지 : "+JSONData.fileName+"<br/>"
																	+"상품상세정보 : "+JSONData.prodDetail+"<br/>"
																	+"제조일자 : "+JSONData.manuDate+"<br/>"
																	+"가  격 : "+JSONData.price+"<br/>"
																	+"등록일 : "+JSONData.regDateString+"<br/>"
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
					
					
					source : function(request, response) { //source: 입력시 보일 목록
						
						$.ajax({
					           url : "/product/autocomplete"   
					         , type : "POST"
					         , dataType: "JSON"
					         , data : {value: request.term}	// 검색 키워드
					         , success : function(data){ 	// 성공하면 매퍼쪽으로 감 
					             response(
					                 $.map(data.resultList, function(item) {
					                     return {
					                    	     label : item.PROD_NAME  // 목록에 표시되는 값
					                           , value : item.PROD_NAME  // 선택 시 input창에 표시되는 값
					                           , idx : item.PROD_NAME // index
					                    };//end of return
					                	 })//end of map
					             );//end of response
					         }//end of success
					         ,error : function(){ //실패
					             alert("오류가 발생했습니다.");
					         }//end of error
					     });//end of ajax
					}//End of source
					,focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
							return false;
					}
					,minLength: 1// 최소 글자수
					,autoFocus : true // true == 첫 번째 항목에 자동으로 초점이 맞춰짐
					,delay: 100	//autocomplete 딜레이 시간(ms)
					,select : function(evt, ui) { 
				      	// 아이템 선택시 실행 ui.item 이 선택된 항목을 나타내는 객체, lavel/value/idx를 가짐
							console.log(ui.item.label);
							console.log(ui.item.idx);
					 }//end of select function
				});//end of autocomplete function
				
			//==> UI 수정 추가부분  :  prodNo LINK Event End User 에게 보일수 있도록 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			
			//==> 아래와 같이 정의한 이유는 ?? 10번 동명파일참조		
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");			
		});	
	</script>		
	
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
			<div class="page-header text-info">
					<c:choose>
						<c:when test = "${param.menu eq 'manage'}">
						<h3>상품 관리 </h3>
						</c:when>		
						<c:when test = "${param.menu eq 'search'}">
						<h3>상품 목록조회</h3> 
						</c:when>						
					</c:choose>
			</div>		
	
	<div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    		
		    	</p>
	   </div>

	<div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0" ${! empty search.searchCondition.equals("0") ? "selected" : "" }>상품번호</option>
						<option value="1" ${! empty search.searchCondition.equals("1") ? "selected" : ""}>상품명</option>
						<option value="2" ${! empty search.searchCondition.equals("2") ? "selected" : ""}>상품가격</option>
					</select>
				  </div>
				<div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="autoComplete" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				</div>
				
				 <button type="button" class="btn btn-default">검색</button>
				 <!-- for PN -->
				 <input type="hidden" id="currentPage" nam00 e="currentPage" value=""/>
				</form>
	    	</div>
	    	
		</div>
					
	<table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >상품명</th>
            <th align="left">가격</th>
            <th align="left">등록일</th>
            <th align="left">간략정보</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left"  title="Click : 상품정보 확인">			 
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
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>
