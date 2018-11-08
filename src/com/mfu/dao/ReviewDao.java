package com.mfu.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.mfu.entity.ReviewEntity;

public class ReviewDao {
	private static final EntityManagerFactory emfInstance = Persistence
			.createEntityManagerFactory("transactions-optional");
	private EntityManager em = null;

	public ReviewDao() {
		em = emfInstance.createEntityManager();
	}

	public List<ReviewEntity> getAllReviewEntitys() {
		List<ReviewEntity> ReviewEntitys = null;
		try {
			Query query = em.createQuery("select p from ReviewEntity p");
			ReviewEntitys = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ReviewEntitys;
	}

	public ReviewEntity findReviewEntityByKey(String reviewID) {
		ReviewEntity ReviewEntity = null;
		try {
			Query query = em.createQuery("select p from ReviewEntity p where p.reviewID =:reviewID");
			query.setParameter("reviewID", reviewID);
			List<ReviewEntity> ReviewEntitys = query.getResultList();
			ReviewEntity = ReviewEntitys.get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ReviewEntity;
	}

	public void saveReviewEntity(ReviewEntity ReviewEntity) {
		try {
			em.persist(ReviewEntity);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateReviewEntity(ReviewEntity ReviewEntity) {
		try {
			em.merge(ReviewEntity);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteReviewEntity(String reviewID) {
		ReviewEntity prod = this.findReviewEntityByKey(reviewID);
		if (prod != null)
			em.remove(prod);
	}

	public void closeEntityManager() {
		if (em != null)
			em.close();
	}
}
