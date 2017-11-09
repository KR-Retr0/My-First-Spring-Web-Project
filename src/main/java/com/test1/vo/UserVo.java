package com.test1.vo;

public class UserVo {
	String id;
	String pw;
	String name;
	String gender;
	String hobby;
	String joinfrom;
	String sns;

	public String getSns() {
		return sns;
	}

	public void setSns(String sns) {
		this.sns = sns;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String getJoinfrom() {
		return joinfrom;
	}

	public void setJoinfrom(String joinfrom) {
		this.joinfrom = joinfrom;
	}
	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	@Override
	public String toString() {
		return "UserVo [id=" + id + ", pw=" + pw + ", name=" + name + ", gender=" + gender + ", hobby=" + hobby
				+ ", joinfrom=" + joinfrom + ", sns=" + sns + "]";
	}
	public UserVo(String id, String pw, String name, String gender, String hobby, String joinfrom, String sns) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.gender = gender;
		this.hobby = hobby;
		this.joinfrom = joinfrom;
		this.sns = sns;
	}
}
