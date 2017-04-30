package bean.Objects;

import java.sql.Date;

public class Customer extends Parent {
	
public	int cust_id,pincode;
public String password;
public	String username,
    f_name="inayat hussain",
	l_name,
	gender,
	fathers_name,
	email_id,
	first_address,
	second_address,
	city,
	dist,
	state,
	country,
	qualification,
	aadhar_number,
	work,
	facebook,
	twitter,
	linkedin,
	feedback,
	status,
	profilepic,
	secretkey;
Date dob;
@Override
public int getCust_id() {
	return cust_id;
}
@Override
public void setCust_id(int cust_id) {
	this.cust_id = cust_id;
}
@Override
public int getPincode() {
	return pincode;
}
@Override
public void setPincode(int pincode) {
	this.pincode = pincode;
}
@Override
public String getUsername() {
	return username;
}
@Override
public void setUsername(String username) {
	this.username = username;
}
@Override
public String getF_name() {
	return f_name;
}
@Override
public void setF_name(String f_name) {
	this.f_name = f_name;
}
@Override
public String getL_name() {
	return l_name;
}
@Override
public void setL_name(String l_name) {
	this.l_name = l_name;
}
@Override
public String getGender() {
	return gender;
}
@Override
public void setGender(String gender) {
	this.gender = gender;
}
@Override
public Date getDob() {
	return dob;
}
@Override
public void setDob(Date date) {
	this.dob = date;
}
@Override
public String getFathers_name() {
	return fathers_name;
}
@Override
public void setFathers_name(String fathers_name) {
	this.fathers_name = fathers_name;
}
@Override
public String getEmail_id() {
	return email_id;
}
@Override
public void setEmail_id(String email_id) {
	this.email_id = email_id;
}
@Override
public String getFirst_address() {
	return first_address;
}
@Override
public void setFirst_address(String first_address) {
	this.first_address = first_address;
}
@Override
public String getSecond_address() {
	return second_address;
}
@Override
public void setSecond_address(String second_address) {
	this.second_address = second_address;
}
@Override
public String getCity() {
	return city;
}
@Override
public void setCity(String city) {
	this.city = city;
}
@Override
public String getDist() {
	return dist;
}
@Override
public void setDist(String dist) {
	this.dist = dist;
}
@Override
public String getState() {
	return state;
}
@Override
public void setState(String state) {
	this.state = state;
}
@Override
public String getCountry() {
	return country;
}
@Override
public void setCountry(String country) {
	this.country = country;
}
@Override
public String getQualification() {
	return qualification;
}
@Override
public void setQualification(String qualification) {
	
	this.qualification = qualification;
}
@Override
public String getAadhar_number() {
	return aadhar_number;
}
@Override
public void setAadhar_number(String aadhar_number) {
	this.aadhar_number = aadhar_number;
}
@Override
public String getWork() {
	return work;
}
public void setWork(String work) {
	this.work = work;
}
@Override
public String getFacebook() {
	return facebook;
}
@Override
public void setFacebook(String facebook) {
	this.facebook = facebook;
}
@Override
public String getTwitter() {
	return twitter;
}
@Override
public void setTwitter(String twitter) {
	this.twitter = twitter;
}
@Override
public String getLinkedin() {
	return linkedin;
}
@Override
public void setLinkedin(String linkedin) {
	this.linkedin = linkedin;
}
@Override
public String getFeedback() {
	return feedback;
}
@Override
public void setFeedback(String feedback) {
	this.feedback = feedback;
}
@Override
public String getStatus() {
	return status;
}
@Override
public void setStatus(String status) {
	this.status = status;
}
@Override
public String getProfilepic() {
	return profilepic;
}
@Override
public void setProfilepic(String profilepic) {
	this.profilepic = profilepic;
}
@Override
public String getSecretkey() {
	return secretkey;
}
@Override
public void setSecretkey(String secretkey) {
	this.secretkey = secretkey;
}
@Override
public void setPassword(String password) {
	this.password = password;
}
public String getPassword() {
	return password;
}


}
