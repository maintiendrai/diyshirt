package com.diyshirt.to;

public class T_shirtTo {
	private int T_ShirtID;
	private int CateID;
	private float Price;
	private String Intro;
	private short Sex;
	private String T_ShirtPath_1;
	private String T_ShirtPath_2;
	private String ShirtName;
	private short Status;
	
	public void setT_ShirtID(int T_ShirtID){
		this.T_ShirtID = T_ShirtID;
	}
	public int getT_ShirtID(){
		return this.T_ShirtID;
	}
	
	public void setCateID(int CateID){
		this.CateID = CateID;
	}
	public int getCateID(){
		return this.CateID;
	}
	
	public void setPrice(float Price){
		this.Price = Price;
	}
	public float getPrice(){
		return this.Price;
	}
	
	public void setIntro(String Intro){
		this.Intro = Intro;
	}
	public String getIntro(){
		return this.Intro;
	}
	
	public void setSex(short Sex){
		this.Sex = Sex;
	}
	public short getSex(){
		return this.Sex;
	}
	
	public void setT_ShirtPath_1(String T_ShirtPath_1){
		this.T_ShirtPath_1 = T_ShirtPath_1;
	}
	public String getT_ShirtPath_1(){
		return this.T_ShirtPath_1;
	}
	
	public void setT_ShirtPath_2(String T_ShirtPath_2){
		this.T_ShirtPath_2 = T_ShirtPath_2;
	}
	public String getT_ShirtPath_2(){
		return this.T_ShirtPath_2;
	}
	
	public void setShirtName(String ShirtName){
		this.ShirtName = ShirtName;
	}
	public String getShirtName(){
		return this.ShirtName;
	}
	
	public void setStatus(short Status){
		this.Status = Status;
	}
	public short getStatus(){
		return this.Status;
	}
	
}
