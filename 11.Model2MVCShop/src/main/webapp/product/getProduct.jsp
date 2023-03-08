<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
	<meta charset="EUC-KR">
	<title>상품상세조회</title>
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">	

 	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">

function fncGetProduct(currentPage, menu){
	$("#currentPage").val(currentPage)
	$("#menu").val(menu)
	$("form").attr("method" , "POST").attr("action" , "/user/listUser").submit();	
}
$(function() {
	
	 $( "td.ct_btn01:contains('이전')" ).on("click" , function() {
		//Debug..
		//alert(  $( "td.ct_btn01:contains('확인')" ).html() );
			history.go(-1);
	});
	 $( "td.ct_btn01:contains('확인')" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('확인')" ).html() );
			self.location = "/product/listProduct?menu=manage"
		});
	 $( "td.ct_btn01:contains('구매')" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('수정')" ).html() );
			self.location = "/purchase/addPurchaseView?prod_no=${product.prodNo}";
		});
});
	</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"	width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">상품상세조회</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif"  width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품번호 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<%-- <td class="ct_write01"><%= product.getProdNo() %></td>--%>
		<td class="ct_write01">${ product.prodNo }</td>
	</tr>	
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품명 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<%-- <td width="105"><%= product.getProdName() %></td>--%>
					<td width="105">${ product.prodName }</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품이미지 <img 	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<%-- <img src = <%= product.getFileName() %>/> --%>
			<img src = ${ product.fileName} />
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품상세정보 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<%-- <td class="ct_write01"><%= product.getProdDetail() %></td>--%>
		<td class="ct_write01">${product.prodDetail}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">제조일자</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<%-- <td class="ct_write01"><%= product.getManuDate() %></td>--%>
		<td class="ct_write01">${product.manuDate}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">가격</td>
		<td bgcolor="D6D6D6" width="1"></td>
		 <%-- <td class="ct_write01"><%= product.getPrice() %></td>--%>
		<td class="ct_write01">${product.price}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">등록일자</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<%-- <td class="ct_write01"><%= product.getRegDate() %></td>--%>
		<td class="ct_write01">${product.regDate}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">

		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
<%--
	if(menu.equals("manage")) { 
--%>
	<c:if test = "${param.menu == 'manage' }" >

				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
					<!-- <a href="/product/listProduct?menu=manage">확인</a> -->
					확인
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23">
				</td>
</c:if>
<%--
	}else if(menu.equals("search")){
--%>
<c:if test = "${param.menu == 'search' }" >
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
					<%--<a href="/addPurchaseView.do?prod_no=<%= product.getProdNo() %>">구매</a> --%>
					<!-- <a href="/product/addPurchaseView?prod_no=${product.prodNo}">구매</a> -->
					구매
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23">
				</td>
				<td width="30"></td>
		
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
					<!-- <a href="javascript:history.go(-1)">이전</a> -->
					이전
				</td>
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23">
				</td>
</c:if>
<%--
	}
--%>
			</tr>
		</table>

		</td>
	</tr>
</table>
</form>

</body>
</html>