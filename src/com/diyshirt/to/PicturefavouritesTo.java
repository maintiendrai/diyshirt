package com.diyshirt.to;
import java.util.Date;

public class PicturefavouritesTo {
	private int Pic_FavID;
	private int PicID;
	private String UserID;
	private Date Pic_Fav_Time;
	
	public void setPic_FavID(int Pic_FavID){
		this.Pic_FavID = Pic_FavID;
	}
	public int getPic_FavID(){
		return this.Pic_FavID;
	}
	
	public void setPicID(int PicID){
		this.PicID = PicID;
	}
	public int getPicID(){
		return this.PicID;
	}
	
	public void setUserID(String UserID){
		this.UserID = UserID;
	}
	public String getUserID(){
		return this.UserID;
	}
	
	public void setPic_Fav_Time(Date Pic_Fav_Time){
		this.Pic_Fav_Time = Pic_Fav_Time;
	}
	public Date getPic_Fav_Time(){
		return this.Pic_Fav_Time;
	}
}
