package com.mfu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mfu.dao.AccommodationDao;
import com.mfu.entity.AccommodationEntity;

@Controller
public class AccommodationController {

	@RequestMapping("/searchAccommodation")
	public @ResponseBody ResponseEntity<List<AccommodationEntity>> searchAccommodation() {
		AccommodationDao accommodationdao = new AccommodationDao();
		List<AccommodationEntity> accommodationentity = accommodationdao.getAllAccommodationEntitys();
		accommodationdao.closeEntityManager();
		return new ResponseEntity<List<AccommodationEntity>>(accommodationentity, HttpStatus.OK);
	}

	@RequestMapping("/findAccommodation")
	public @ResponseBody AccommodationEntity findAccommodation(HttpServletRequest request) {
		AccommodationDao accommodationdao = new AccommodationDao();
		AccommodationEntity accommodationentity = null;
		try {
			accommodationentity = accommodationdao
					.findAccommodationEntityByKey(request.getParameter("accommodationID"));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			accommodationdao.closeEntityManager();
		}
		return accommodationentity;
	}

	@RequestMapping("/accommodationList")
	public @ResponseBody List<AccommodationEntity> accommodationList(HttpServletRequest request) {
		AccommodationDao accommodationdao = new AccommodationDao();
		List<AccommodationEntity> accommodationlist = null;
		try {
			accommodationlist = accommodationdao.getAllAccommodationEntitys();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			accommodationdao.closeEntityManager();
		}
		return accommodationlist;
	}

}
