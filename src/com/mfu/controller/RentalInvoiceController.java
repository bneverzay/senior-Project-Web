package com.mfu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mfu.dao.RentalInvoiceDao;
import com.mfu.entity.RentalInvoiceEntity;

@Controller
public class RentalInvoiceController {
	
	@RequestMapping("/findRentalInvoice")
	public @ResponseBody RentalInvoiceEntity findRentalInvoice(HttpServletRequest request) {
		RentalInvoiceDao rentalinvoicedao = new RentalInvoiceDao();
		RentalInvoiceEntity rentalinvoiceentity = null;
		try {
			rentalinvoiceentity = rentalinvoicedao.findRentalInvoiceEntityByKey(request.getParameter("rentalinvoiceID"));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rentalinvoicedao.closeEntityManager();
		}
		return rentalinvoiceentity;
	}
	
	@RequestMapping("/updateRentalInvoice")
	public @ResponseBody ResponseEntity<String> updateRentalInvoice(@RequestBody RentalInvoiceEntity getRentalinvoice) {
		RentalInvoiceDao rentalinvoicedao = new RentalInvoiceDao();
		try {
			RentalInvoiceEntity rentalinvoiceentity  = rentalinvoicedao.findRentalInvoiceEntityByKey(getRentalinvoice.getKeyStringRentalInvoiceEntity());
			rentalinvoiceentity.setName(getRentalinvoice.getName());
			rentalinvoiceentity.setAmountmoney(getRentalinvoice.getAmountmoney());
			rentalinvoiceentity.setDatepaymentrent(getRentalinvoice.getDatepaymentrent());
			rentalinvoiceentity.setTimepaymentrent(getRentalinvoice.getTimepaymentrent());
			rentalinvoiceentity.setStatuspayment(getRentalinvoice.getStatuspayment());
			rentalinvoicedao.updateRentalInvoiceEntity(rentalinvoiceentity);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rentalinvoicedao.closeEntityManager();
		}
		return new ResponseEntity<String>(HttpStatus.OK);
	}

	@RequestMapping("/rentalinvoiceList")
	public @ResponseBody List<RentalInvoiceEntity> rentalinvoiceList(HttpServletRequest request) {
		RentalInvoiceDao rentalinvoicedao = new RentalInvoiceDao();
		List<RentalInvoiceEntity> rentalinvoiceentity = null;
		try {
			rentalinvoiceentity = rentalinvoicedao.getAllRentalInvoiceEntitys();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rentalinvoicedao.closeEntityManager();
		}
		return rentalinvoiceentity;
	}

}
