package com.mfu.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.mfu.entity.LessorEntity;

public class LessorDao {
	private static final EntityManagerFactory emfInstance = Persistence
			.createEntityManagerFactory("transactions-optional");
	private EntityManager em = null;

	public LessorDao() {
		em = emfInstance.createEntityManager();
	}

	public List<LessorEntity> getAllLessorEntitys() {
		List<LessorEntity> LessorEntitys = null;
		try {
			Query query = em.createQuery("select p from LessorEntity p");
			LessorEntitys = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return LessorEntitys;
	}

	public LessorEntity findLessorEntityByKey(String lessorID) {
		LessorEntity LessorEntity = null;
		try {
			Query query = em.createQuery("select p from LessorEntity p where p.lessorID =:lessorID");
			query.setParameter("lessorID", lessorID);
			List<LessorEntity> LessorEntitys = query.getResultList();
			LessorEntity = LessorEntitys.get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return LessorEntity;
	}

	public void saveLessorEntity(LessorEntity LessorEntity) {
		try {
			em.persist(LessorEntity);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateLessorEntity(LessorEntity LessorEntity) {
		try {

			em.merge(LessorEntity);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteLessorEntity(String lessorID) {
		LessorEntity prod = this.findLessorEntityByKey(lessorID);
		if (prod != null)
			em.remove(prod);
	}

	public void closeEntityManager() {
		if (em != null)
			em.close();
	}
}
