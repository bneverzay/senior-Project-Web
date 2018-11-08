package com.mfu.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.mfu.entity.AccommodationEntity;
import com.mfu.entity.MemberEntity;

import javax.persistence.Query;

public class AccommodationDao {
	private static final EntityManagerFactory emfInstance = Persistence
			.createEntityManagerFactory("transactions-optional");
	private EntityManager em = null;

	public AccommodationDao() {
		em = emfInstance.createEntityManager();
	}

	public List<AccommodationEntity> getAllAccommodationEntitys() {
		List<AccommodationEntity> AccommodationEntitys = null;
		try {
			Query query = em.createQuery("select p from AccommodationEntity p");
			AccommodationEntitys = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return AccommodationEntitys;
	}

	public AccommodationEntity findAccommodationEntityByKey(String accommodationID) {
		AccommodationEntity AccommodationEntity = null;
		try {
			Query query = em
					.createQuery("select p from AccommodationEntity p where p.accommodationID =:accommodationID");
			query.setParameter("accommodationID", accommodationID);
			List<AccommodationEntity> accommodationentitys = query.getResultList();
			AccommodationEntity = accommodationentitys.get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return AccommodationEntity;
	}

	public void saveAccommodationEntity(AccommodationEntity AccommodationEntity) {
		try {
			em.persist(AccommodationEntity);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateAccommodationEntity(AccommodationEntity AccommodationEntity) {
		try {
			em.merge(AccommodationEntity);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteAccommodationEntity(String accommodationID) {
		AccommodationEntity prod = this.findAccommodationEntityByKey(accommodationID);
		if (prod != null)
			em.remove(prod);
	}

	public void closeEntityManager() {
		if (em != null)
			em.close();
	}
}
