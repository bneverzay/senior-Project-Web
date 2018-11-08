package com.mfu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mfu.dao.RentalDao;
import com.mfu.entity.RentalEntity;

@Controller
public class RentalController {

	@RequestMapping("/checkRental")
	public @ResponseBody ResponseEntity<List<RentalEntity>> checkRental() {
		RentalDao rentaldao = new RentalDao();
		List<RentalEntity> rentalentity = rentaldao.getAllRentalEntitys();
		rentaldao.closeEntityManager();
		return new ResponseEntity<List<RentalEntity>>(rentalentity, HttpStatus.OK);
	}

	@RequestMapping("/findRental")
	public @ResponseBody RentalEntity findRental(HttpServletRequest request) {
		RentalDao rentaldao = new RentalDao();
		RentalEntity rentalentity = null;
		try {
			rentalentity = rentaldao.findRentalEntityByKey(request.getParameter("rentalID"));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rentaldao.closeEntityManager();
		}
		return rentalentity;
	}

	@RequestMapping("/rentalList")
	public @ResponseBody List<RentalEntity> rentalList(HttpServletRequest request) {
		RentalDao RentalDao = new RentalDao();
		List<RentalEntity> rentallist = null;
		try {
			rentallist = RentalDao.getAllRentalEntitys();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			RentalDao.closeEntityManager();
		}
		return rentallist;
	}

	@RequestMapping("/saveRental")
	public @ResponseBody ResponseEntity<String> saveRental(@RequestBody RentalEntity getRental) {
		RentalDao RentalDao = new RentalDao();
		try {
			if (getRental.getRentalID() == null) {
				RentalDao.saveRentalEntity(getRental);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			RentalDao.closeEntityManager();
		}
		return new ResponseEntity<String>(HttpStatus.OK);
	}

	@RequestMapping("/updateRental")
	public @ResponseBody ResponseEntity<String> updateRental(@RequestBody RentalEntity getRental) {
		RentalDao RentalDao = new RentalDao();
		try {
			RentalEntity rentalentity = RentalDao.findRentalEntityByKey(getRental.getKeyStringRentalEntity());
			rentalentity.setName(getRental.getName());
			rentalentity.setDatepayment(getRental.getDatepayment());
			rentalentity.setTimepayment(getRental.getTimepayment());
			rentalentity.setAmountmoney(getRental.getAmountmoney());
			rentalentity.setStatuspayment(getRental.getStatuspayment());
			RentalDao.updateRentalEntity(rentalentity);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			RentalDao.closeEntityManager();
		}
		return new ResponseEntity<String>(HttpStatus.OK);
	}

	@RequestMapping("/deleteRental")
	public @ResponseBody String deleteRental(HttpServletRequest request) {
		RentalDao RentalDao = new RentalDao();
		try {
			RentalDao.deleteRentalEntity(request.getParameter("rentalID"));
			return "1";
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			RentalDao.closeEntityManager();
		}
		return "-1";
	}
}
