package com.mfu.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.mfu.entity.RentalEntity;

public class RentalDao {
	private static final EntityManagerFactory emfInstance = Persistence
			.createEntityManagerFactory("transactions-optional");
	private EntityManager em = null;

	public RentalDao() {
		em = emfInstance.createEntityManager();
	}

	public List<RentalEntity> getAllRentalEntitys() {
		List<RentalEntity> RentalEntitys = null;
		try {
			Query query = em.createQuery("select p from RentalEntity p");
			RentalEntitys = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return RentalEntitys;
	}

	public RentalEntity findRentalEntityByKey(String rentalID) {
		RentalEntity RentalEntity = null;
		try {
			Query query = em.createQuery("select p from RentalEntity p where p.rentalID =:rentalID");
			query.setParameter("rentalID", rentalID);
			List<RentalEntity> RentalEntitys = query.getResultList();
			RentalEntity = RentalEntitys.get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return RentalEntity;
	}

	public void saveRentalEntity(RentalEntity RentalEntity) {
		try {
			em.persist(RentalEntity);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateRentalEntity(RentalEntity RentalEntity) {
		try {
			em.merge(RentalEntity);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteRentalEntity(String rentalID) {
		RentalEntity prod = this.findRentalEntityByKey(rentalID);
		if (prod != null)
			em.remove(prod);
	}

	public void closeEntityManager() {
		if (em != null)
			em.close();
	}
}
