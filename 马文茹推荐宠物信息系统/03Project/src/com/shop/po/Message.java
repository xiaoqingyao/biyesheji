package com.shop.po;


public class Message {
	private Integer messageid; 

	private String message;

	private String messagedate; 
	
	private String phone;
	
	public String nickname;
	
	public String qq;
	
	public String address;
	
	private Integer uid;
	
	private String leibie;
		
	// 关联用户
	private User user;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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

	public Integer getMessageid() {
		return messageid;
	}

	public void setMessageid(Integer messageid) {
		this.messageid = messageid;
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
	
	public String getLeibie(){
		return leibie;
		
	}
 
	public void setLeibie(String leibie){
		this.leibie=leibie;
		
	}
 
}