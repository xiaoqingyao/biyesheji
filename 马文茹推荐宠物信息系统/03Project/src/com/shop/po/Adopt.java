package com.shop.po;


public class Adopt {
	private Integer id; 
	private Integer mid; 
	
	private Integer uid;
	
	public String nickname;
	
	public String qq;
	
	private String phone;
	
	
	public String address;
	private String message;

	private String messagedate; 
	private Integer fromuid;
	
	
	public Integer getFromuid(){
		return fromuid;
		
	}
 
	public void setFromuid(int fromuid){
		this.fromuid=fromuid;
		
	}
	
	public String getNickname(){
		return nickname;
		
	}
 
	public void setNickname(String nickname){
		this.nickname=nickname;
		
	}
	
	public String getPhone(){
		return phone;
		
	}
 
	public void setPhone(String phone){
		this.phone=phone;
		
	}
	
	public String getAddress(){
		return address;
		
	}
 
	public void setAddress(String address){
		this.address=address;
		
	}
	
	
	
	public String getQq(){
		return qq;
		
	}
 
	public void setQq(String qq){
		this.qq=qq;
		
	}
	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}


	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getMessagedate() {
		return messagedate;
	}

	public void setMessagedate(String messagedate) {
		this.messagedate = messagedate;
	}
	

	
	
 
}