package com.shop.po;


public class Article {
	private Integer id; 
	private Integer uid;
	
	public String nickname;
 
	private String title;
	 
	private String content;
	
	private String pubdate;
	
	private String fujian;
	
	private Integer likecount;
	
	public Integer getLikecount() {
		return likecount;
	}

	public void setLikecount(Integer likecount) {
		this.likecount = likecount;
	}
	
	public String getFujian(){
		return fujian;
		
	}
 
	public void setFujian(String fujian){
		this.fujian=fujian;
	}
	
	
	public String getPubdate(){
		return pubdate;
		
	}
 
	public void setPubdate(String pubdate){
		this.pubdate=pubdate;
	}
	
	
	public String getContent(){
		return content;
		
	}
 
	public void setContent(String content){
		this.content=content;
	}
	
	
	
	
	public String getTitle(){
		return title;
		
	}
 
	public void setTitle(String title){
		this.title=title;
	}
	
	
	
	public String getNickname(){
		return nickname;
		
	}
 
	public void setNickname(String nickname){
		this.nickname=nickname;
		
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
	
	  
	

	
	
 
}