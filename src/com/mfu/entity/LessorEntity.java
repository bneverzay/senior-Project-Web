package com.mfu.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

@Entity
@JsonIgnoreProperties(ignoreUnknown = true)
public class LessorEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Key lessorID;

	private String pictureprofile;
	private String username;
	private String password;
	private String firstname;
	private String lastname;
	private String gender;
	private String birthdate;
	private String address;
	private String telephone;
	private String email;
	private String statuslessor;
	private String position;

	public Key getLessorID() {
		return lessorID;
	}

	public void setLessorID(Key lessorID) {
		this.lessorID = lessorID;
	}
	
	public String getKeyStringLessorEntity() {
		return KeyFactory.keyToString(lessorID);
	}

	public void setKeyStringLessorEntity(String keyStringLessorEntity) {
		lessorID = KeyFactory.stringToKey(keyStringLessorEntity);
	}

	public String getPictureprofile() {
		return pictureprofile;
	}

	public void setPictureprofile(String pictureprofile) {
		this.pictureprofile = pictureprofile;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStatuslessor() {
		return statuslessor;
	}

	public void setStatuslessor(String statuslessor) {
		this.statuslessor = statuslessor;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

}
