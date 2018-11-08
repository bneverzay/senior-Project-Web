<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.mfu.dao.*"%>
<%@ page import="com.mfu.entity.*"%>
<%@ page import="com.mfu.util.SecurityUtil"%>
<%@ page import="javax.persistence.*"%>
<%@ page import="java.util.List"%>
<%
	AdministratorDao administratordao = new AdministratorDao();
	AdministratorEntity administratorentity = new AdministratorEntity();
	List<AdministratorEntity> checkadministrator = administratordao.getAllAdministratorEntitys();

	String username = "Administrator";
	String password = "administrator";

	SecurityUtil securityService = new SecurityUtil();
	password = securityService.passwordToMD5(password);

	Boolean check = false;

	try {
		if (checkadministrator.isEmpty()) {
			check = true;
		} else {
			for (AdministratorEntity checkadministratorduplicate : checkadministrator) {
				if (username.equals(checkadministratorduplicate.getUsername())) {
					check = false;
					break;
				} else {
					check = true;
				}
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
	}

	if (check == true) {
		administratorentity.setUsername(username);
		administratorentity.setPassword(password);
		administratorentity.setPosition("administrator");
		
		administratordao.saveAdministratorEntity(administratorentity);
		administratordao.closeEntityManager();
	}
%>