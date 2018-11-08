<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.mfu.dao.*"%>
<%@ page import="com.mfu.entity.*"%>
<%@ page import="javax.persistence.*"%>
<%@ page import="java.util.List"%>
<%
	String administratorID = request.getParameter("administratorID");

	String lessorID = request.getParameter("lessorID");
	LessorDao lessordao = new LessorDao();

	lessordao.deleteLessorEntity(lessorID);
	lessordao.closeEntityManager();

	response.sendRedirect("administrator-manage-lessor.jsp?administratorID=" + administratorID);
%>