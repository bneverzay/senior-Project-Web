package com.mfu.dao;

import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.google.appengine.labs.repackaged.org.json.JSONObject;
import com.mfu.entity.RentalInvoiceEntity;

public class RentalInvoiceDao {
	private static final EntityManagerFactory emfInstance = Persistence
			.createEntityManagerFactory("transactions-optional");
	private EntityManager em = null;

	public final static String AUTH_KEY_FCM = "AAAA0VY6Qvg:APA91bFRSiT0BrB1REqbbEnP4V0_Wp0cT97JAEEDVm6Raozs7OdehjwoSeVMNdMGtvbu7ZPhKZuiyEySGb7kItgUqwv8qFn93Kh8oJ7SsWv5Hz3xCLlQ9okYmRDCdFWbnsXVgFgZ9Xt3";
	public final static String API_URL_FCM = "https://fcm.googleapis.com/fcm/send";

	public RentalInvoiceDao() {
		em = emfInstance.createEntityManager();
	}

	public List<RentalInvoiceEntity> getAllRentalInvoiceEntitys() {
		List<RentalInvoiceEntity> RentalInvoiceEntitys = null;
		try {
			Query query = em.createQuery("select p from RentalInvoiceEntity p");
			RentalInvoiceEntitys = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return RentalInvoiceEntitys;
	}

	public RentalInvoiceEntity findRentalInvoiceEntityByKey(String rentalinvoiceID) {
		RentalInvoiceEntity RentalInvoiceEntity = null;
		try {
			Query query = em
					.createQuery("select p from RentalInvoiceEntity p where p.rentalinvoiceID =:rentalinvoiceID");
			query.setParameter("rentalinvoiceID", rentalinvoiceID);
			List<RentalInvoiceEntity> RentalInvoiceEntitys = query.getResultList();
			RentalInvoiceEntity = RentalInvoiceEntitys.get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return RentalInvoiceEntity;
	}

	public void saveRentalInvoiceEntity(RentalInvoiceEntity RentalInvoiceEntity) {
		try {
			em.persist(RentalInvoiceEntity);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateRentalInvoiceEntity(RentalInvoiceEntity RentalInvoiceEntity) {
		try {
			em.merge(RentalInvoiceEntity);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteRentalInvoiceEntity(String rentalinvoiceID) {
		RentalInvoiceEntity prod = this.findRentalInvoiceEntityByKey(rentalinvoiceID);
		if (prod != null)
			em.remove(prod);
	}

	public static void pushFCMNotification(String userDeviceIdKey) throws Exception {

		String authKey = AUTH_KEY_FCM; // You FCM AUTH key
		String FMCurl = API_URL_FCM;

		URL url = new URL(FMCurl);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		conn.setUseCaches(false);
		conn.setDoInput(true);
		conn.setDoOutput(true);

		conn.setRequestMethod("POST");
		conn.setRequestProperty("Authorization", "key=" + authKey);
		conn.setRequestProperty("Content-Type", "application/json");

		JSONObject json = new JSONObject();
		json.put("to", userDeviceIdKey.trim());
		JSONObject info = new JSONObject();
		info.put("title", "Notificatoin Title"); // Notification title
		info.put("body", "Hello Test notification"); // Notification body
		json.put("notification", info);

		OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
		wr.write(json.toString());
		wr.flush();
		conn.getInputStream();
	}

	public void closeEntityManager() {
		if (em != null)
			em.close();
	}
}
