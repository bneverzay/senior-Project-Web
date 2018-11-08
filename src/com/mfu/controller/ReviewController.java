package com.mfu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mfu.dao.ReviewDao;
import com.mfu.entity.ReviewEntity;

@Controller
public class ReviewController {

	@RequestMapping("/reviewList")
	public @ResponseBody List<ReviewEntity> reviewList(HttpServletRequest request) {
		ReviewDao reviewdao = new ReviewDao();
		List<ReviewEntity> reviewentity = null;
		try {
			reviewentity = reviewdao.getAllReviewEntitys();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			reviewdao.closeEntityManager();
		}
		return reviewentity;
	}

	@RequestMapping("/saveReview")
	public @ResponseBody String saveReview(@RequestBody ReviewEntity getReview) {
		ReviewDao reviewdao = new ReviewDao();
		try {
			if (getReview.getReviewID() == null) {
				reviewdao.saveReviewEntity(getReview);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			reviewdao.closeEntityManager();
		}
		return "1";
	}

	@RequestMapping("/deleteReview")
	public @ResponseBody String deleteReview(HttpServletRequest request) {
		ReviewDao reviewdao = new ReviewDao();
		try {
			reviewdao.deleteReviewEntity(request.getParameter("reviewID"));
			return "1";
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			reviewdao.closeEntityManager();
		}
		return "-1";
	}

}
