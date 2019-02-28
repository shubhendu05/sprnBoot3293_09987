package com.immuking.springboot;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "registration")
public class Alien {
	@Id
	public Long mnumber;
	public String fname;
	public String lname;
	public String email;
	public String gender;
	public String password;
	public String category;

	public Long getMnumber() {
		return mnumber;
	}

	public void setMnumber(Long mnumber) {
		this.mnumber = mnumber;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Alien [mnumber=" + mnumber + ", fname=" + fname + ", lname=" + lname + ", email=" + email + ", gender="
				+ gender + ", password=" + password + ", category=" + category + "]";
	}
}
