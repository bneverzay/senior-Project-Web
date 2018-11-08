<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.mfu.dao.*"%>
<%@ page import="com.mfu.entity.*"%>
<%@ page import="javax.persistence.*"%>
<%
	String administratorID = request.getParameter("administratorID");

	String lessorID = request.getParameter("lessorID");
	LessorDao lessordao = new LessorDao();
	LessorEntity lessorentity = lessordao.findLessorEntityByKey(lessorID);

	lessorentity.setStatuslessor("approve");

	lessordao.updateLessorEntity(lessorentity);
	lessordao.closeEntityManager();

	response.sendRedirect("administrator-manage-lessor.jsp?administratorID=" + administratorID);
%>