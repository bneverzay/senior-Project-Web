package com.mfu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mfu.dao.MemberDao;
import com.mfu.entity.MemberEntity;
import com.mfu.util.SecurityUtil;

@Controller
public class MemberController {

	@RequestMapping("/memberList")
	public @ResponseBody List<MemberEntity> memberList(HttpServletRequest request) {
		MemberDao memberdao = new MemberDao();
		List<MemberEntity> memberentity = null;
		try {
			memberentity = memberdao.getAllMemberEntitys();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			memberdao.closeEntityManager();
		}
		return memberentity;
	}

	@RequestMapping("/loginMember")
	public @ResponseBody MemberEntity loginMember(@RequestBody MemberEntity getLoginMember) {
		MemberDao memberdao = new MemberDao();
		MemberEntity memberentity = null;
		try {
			memberentity = memberdao.authenticate(getLoginMember.getUsername(), getLoginMember.getPassword());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			memberdao.closeEntityManager();
		}
		return memberentity;
	}

	@RequestMapping("/findMember")
	public @ResponseBody MemberEntity findMember(HttpServletRequest request) {
		MemberDao memberdao = new MemberDao();
		MemberEntity memberentity = null;
		try {
			memberentity = memberdao.findMemberEntityByKey(request.getParameter("memberID"));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			memberdao.closeEntityManager();
		}
		return memberentity;
	}

	@RequestMapping("/updateMember")
	public @ResponseBody ResponseEntity<String> updateMember(@RequestBody MemberEntity getUpdateMember) {
		MemberDao memberdao = new MemberDao();
		try {
			SecurityUtil securityService = new SecurityUtil();

			MemberEntity memberentity = memberdao.findMemberEntityByKey(getUpdateMember.getKeyStringMemberEntity());

			if (getUpdateMember.getUsername() == null || getUpdateMember.getUsername() == "") {

			} else {
				memberentity.setUsername(getUpdateMember.getUsername());
			}

			if (getUpdateMember.getPassword() == null || getUpdateMember.getPassword() == "") {

			} else {
				String passwordMD5 = securityService.passwordToMD5(getUpdateMember.getPassword());
				memberentity.setPassword(passwordMD5);
			}

			if (getUpdateMember.getFirstname() == null || getUpdateMember.getFirstname() == "") {

			} else {
				memberentity.setFirstname(getUpdateMember.getFirstname());
			}

			if (getUpdateMember.getLastname() == null || getUpdateMember.getLastname() == "") {

			} else {
				memberentity.setLastname(getUpdateMember.getLastname());
			}

			if (getUpdateMember.getBirthdate() == null || getUpdateMember.getBirthdate() == "") {

			} else {
				memberentity.setBirthdate(getUpdateMember.getBirthdate());
			}

			if (getUpdateMember.getGender() == null || getUpdateMember.getGender() == "") {

			} else {
				memberentity.setGender(getUpdateMember.getGender());
			}

			if (getUpdateMember.getAddress() == null || getUpdateMember.getAddress() == "") {

			} else {
				memberentity.setAddress(getUpdateMember.getAddress());
			}

			if (getUpdateMember.getOccupation() == null || getUpdateMember.getOccupation() == "") {

			} else {
				memberentity.setOccupation(getUpdateMember.getOccupation());
			}

			if (getUpdateMember.getTelephone() == null || getUpdateMember.getTelephone() == "") {

			} else {
				memberentity.setTelephone(getUpdateMember.getTelephone());
			}

			if (getUpdateMember.getEmail() == null || getUpdateMember.getEmail() == "") {

			} else {
				memberentity.setEmail(getUpdateMember.getEmail());
			}

			memberdao.updateMemberEntity(memberentity);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			memberdao.closeEntityManager();
		}
		return new ResponseEntity<String>(HttpStatus.OK);
	}

	@RequestMapping("/saveMember")
	public @ResponseBody String saveMember(@RequestBody MemberEntity getRegisterMember) {
		MemberDao memberdao = new MemberDao();
		List<MemberEntity> memberentity = memberdao.getAllMemberEntitys();
		Boolean check = false;
		try {
			if (memberentity.isEmpty()) {
				check = true;
			} else {
				for (MemberEntity member : memberentity) {
					if (getRegisterMember.getUsername().equals(member.getUsername())) {
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
			memberdao.saveMemberEntity(getRegisterMember);
			memberdao.closeEntityManager();

			return "1";
		} else {
			memberdao.closeEntityManager();

			return "-1";
		}

	}
}
