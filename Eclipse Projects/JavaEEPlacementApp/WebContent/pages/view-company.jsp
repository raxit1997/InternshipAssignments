<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>View Company Details</title>
<c:set var="req" value="<%=request.getContextPath() %>" />
<base href="${req}/" />
<link rel="stylesheet" href="css/admin-navbar.css">
<link rel="stylesheet" href="css/view-details.css">
</head>
<body>
	<%@ page import="java.util.ArrayList, com.ztech.beans.CompanyDetails, com.ztech.dao.*" %>
	<div class="navbar">
		<a href="pages/admin.jsp">HOME</a> 
		<a href="pages/insert-student.jsp">Insert Student</a>
		<a href="pages/view-student.jsp">View Student</a>
		<a href="pages/insert-company.jsp">Insert Company</a>
		<a href="pages/view-company.jsp">View Company</a>
		<a href="index.jsp">Exit</a>
	</div>
	<table>
		<thead>
			<tr>
				<th>Company ID</th>
				<th>Name</th>
				<th>Arrear Criteria</th>
				<th>CGPA Criteria</th>
			</tr>
		</thead>
		<tbody>
	<%
	ArrayList<CompanyDetails> companyArrayList = new ArrayList<CompanyDetails>();
	AdminDAO adminDAO = new AdminDAOImpl();
	CompanyDetails companyDetails;
	companyArrayList = adminDAO.displayCompanyDetails();
	for(int i = 0;i < companyArrayList.size(); i++) {
	%>
			<tr>
				<td><%=companyArrayList.get(i).getCompanyid() %></td>
				<td><%=companyArrayList.get(i).getName() %></td>
				<td><%=companyArrayList.get(i).getArrearCriteria() %></td>
				<td><%=companyArrayList.get(i).getCgpaCriteria() %></td>
			</tr>
	<%
	}
	%>
		</tbody>
	</table>
</body>
</html>