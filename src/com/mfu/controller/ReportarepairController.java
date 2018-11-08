package com.mfu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mfu.dao.ReportarepairDao;
import com.mfu.entity.ReportarepairEntity;

@Controller
public class ReportarepairController {

	@RequestMapping("/reportarepairList")
	public @ResponseBody List<ReportarepairEntity> reportarepairList(HttpServletRequest request) {
		ReportarepairDao reportarepairdao = new ReportarepairDao();
		List<ReportarepairEntity> reportarepairentity = null;
		try {
			reportarepairentity = reportarepairdao.getAllReportarepairEntitys();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			reportarepairdao.closeEntityManager();
		}
		return reportarepairentity;
	}

	@RequestMapping("/saveReportarepair")
	public @ResponseBody String saveReportarepair(@RequestBody ReportarepairEntity getReportarepair) {
		ReportarepairDao reportarepairdao = new ReportarepairDao();
		try {
			if (getReportarepair.getReportarepairID() == null) {
				reportarepairdao.saveReportarepairEntity(getReportarepair);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			reportarepairdao.closeEntityManager();
		}
		return "1";
	}

}
