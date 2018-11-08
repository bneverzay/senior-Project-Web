package com.mfu.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.mfu.entity.AdministratorEntity;

public class AdministratorDao {
	private static final EntityManagerFactory emfInstance = Persistence
			.createEntityManagerFactory("transactions-optional");
	private EntityManager em = null;

	public AdministratorDao() {
		em = emfInstance.createEntityManager();
	}

	public List<AdministratorEntity> getAllAdministratorEntitys() {
		List<AdministratorEntity> AdministratorEntitys = null;
		try {
			Query query = em.createQuery("select p from AdministratorEntity p");
			AdministratorEntitys = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return AdministratorEntitys;
	}

	public AdministratorEntity findAdministratorEntityByKey(String administratorID) {
		AdministratorEntity AdministratorEntity = null;
		try {
			Query query = em
					.createQuery("select p from AdministratorEntity p where p.administratorID =:administratorID");
			query.setParameter("administratorID", administratorID);
			List<AdministratorEntity> AdministratorEntitys = query.getResultList();
			AdministratorEntity = AdministratorEntitys.get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return AdministratorEntity;
	}

	public void saveAdministratorEntity(AdministratorEntity AdministratorEntity) {
		try {
			em.persist(AdministratorEntity);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateAdministratorEntity(AdministratorEntity AdministratorEntity) {
		try {
			em.merge(AdministratorEntity);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteAdministratorEntity(String administratorID) {
		AdministratorEntity prod = this.findAdministratorEntityByKey(administratorID);
		if (prod != null)
			em.remove(prod);
	}

	public void closeEntityManager() {
		if (em != null)
			em.close();
	}
}
