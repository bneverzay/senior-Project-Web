package com.mfu.entity;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@Entity
@JsonIgnoreProperties(ignoreUnknown = true)
public class AccommodationEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Key accommodationID;

	private String lessorID;
	private String pictureaccommodation;
	private String typeofaccommodation;
	private String accommodationname;
	private String typeofapartment;
	private String address;
	private String district;
	private String province;
	private String telephone;
	private String email;
	private String rentrates;
	private String depositrates;
	private String fan;
	private String airconditioner;
	private String waterheater;
	private String refrigerator;
	private String television;
	private String furniture;
	private String carpark;
	private String closedcircuitcamera;
	private String elevator;
	private String washingmachine;
	private String drinkingwaterdispenser;
	private String swimmingpool;
	private String fitness;
	private String keycard;
	private String bank;
	private String accountname;
	private String accountno;
	private double electricityunit;
	private double waterunit;
	private double servicefees;

	public Key getAccommodationID() {
		return accommodationID;
	}

	public void setAccommodationID(Key accommodationID) {
		this.accommodationID = accommodationID;
	}

	public String getKeyStringAccommodationEntity() {
		return KeyFactory.keyToString(accommodationID);
	}

	public void setKeyStringAccommodationEntity(String keyStringAccommodationEntity) {
		accommodationID = KeyFactory.stringToKey(keyStringAccommodationEntity);
	}

	public String getLessorID() {
		return lessorID;
	}

	public void setLessorID(String lessorID) {
		this.lessorID = lessorID;
	}

	public String getPictureaccommodation() {
		return pictureaccommodation;
	}

	public void setPictureaccommodation(String pictureaccommodation) {
		this.pictureaccommodation = pictureaccommodation;
	}

	public String getTypeofaccommodation() {
		return typeofaccommodation;
	}

	public void setTypeofaccommodation(String typeofaccommodation) {
		this.typeofaccommodation = typeofaccommodation;
	}

	public String getAccommodationname() {
		return accommodationname;
	}

	public void setAccommodationname(String accommodationname) {
		this.accommodationname = accommodationname;
	}

	public String getTypeofapartment() {
		return typeofapartment;
	}

	public void setTypeofapartment(String typeofapartment) {
		this.typeofapartment = typeofapartment;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
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

	public String getRentrates() {
		return rentrates;
	}

	public void setRentrates(String rentrates) {
		this.rentrates = rentrates;
	}

	public String getDepositrates() {
		return depositrates;
	}

	public void setDepositrates(String depositrates) {
		this.depositrates = depositrates;
	}

	public String getFan() {
		return fan;
	}

	public void setFan(String fan) {
		this.fan = fan;
	}

	public String getAirconditioner() {
		return airconditioner;
	}

	public void setAirconditioner(String airconditioner) {
		this.airconditioner = airconditioner;
	}

	public String getWaterheater() {
		return waterheater;
	}

	public void setWaterheater(String waterheater) {
		this.waterheater = waterheater;
	}

	public String getRefrigerator() {
		return refrigerator;
	}

	public void setRefrigerator(String refrigerator) {
		this.refrigerator = refrigerator;
	}

	public String getTelevision() {
		return television;
	}

	public void setTelevision(String television) {
		this.television = television;
	}

	public String getFurniture() {
		return furniture;
	}

	public void setFurniture(String furniture) {
		this.furniture = furniture;
	}

	public String getCarpark() {
		return carpark;
	}

	public void setCarpark(String carpark) {
		this.carpark = carpark;
	}

	public String getClosedcircuitcamera() {
		return closedcircuitcamera;
	}

	public void setClosedcircuitcamera(String closedcircuitcamera) {
		this.closedcircuitcamera = closedcircuitcamera;
	}

	public String getElevator() {
		return elevator;
	}

	public void setElevator(String elevator) {
		this.elevator = elevator;
	}

	public String getWashingmachine() {
		return washingmachine;
	}

	public void setWashingmachine(String washingmachine) {
		this.washingmachine = washingmachine;
	}

	public String getDrinkingwaterdispenser() {
		return drinkingwaterdispenser;
	}

	public void setDrinkingwaterdispenser(String drinkingwaterdispenser) {
		this.drinkingwaterdispenser = drinkingwaterdispenser;
	}

	public String getSwimmingpool() {
		return swimmingpool;
	}

	public void setSwimmingpool(String swimmingpool) {
		this.swimmingpool = swimmingpool;
	}

	public String getFitness() {
		return fitness;
	}

	public void setFitness(String fitness) {
		this.fitness = fitness;
	}

	public String getKeycard() {
		return keycard;
	}

	public void setKeycard(String keycard) {
		this.keycard = keycard;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getAccountname() {
		return accountname;
	}

	public void setAccountname(String accountname) {
		this.accountname = accountname;
	}

	public String getAccountno() {
		return accountno;
	}

	public void setAccountno(String accountno) {
		this.accountno = accountno;
	}

	public double getElectricityunit() {
		return electricityunit;
	}

	public void setElectricityunit(double electricityunit) {
		this.electricityunit = electricityunit;
	}

	public double getWaterunit() {
		return waterunit;
	}

	public void setWaterunit(double waterunit) {
		this.waterunit = waterunit;
	}

	public double getServicefees() {
		return servicefees;
	}

	public void setServicefees(double servicefees) {
		this.servicefees = servicefees;
	}

}
