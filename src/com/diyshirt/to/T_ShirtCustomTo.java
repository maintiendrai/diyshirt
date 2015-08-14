package com.diyshirt.to;
import java.util.Date;

public class T_ShirtCustomTo {
	private int CustomID;
	private int T_ShirtID;
	private String PosPic;
	private String NegPic;
	private int PosLoc_1;
	private int NegLoc_1;
	private Date CustomTime;
	private String UserID;
	private int PosLoc_2;
	private int NegLoc_2;
	private int PosSize;
	private int NegSize;
	private String T_ShirtName;
	
	public void setCustomID(int CustomID){
		this.CustomID = CustomID;
	}
	public int getCustomID(){
		return this.CustomID;
	}
	
	public void setT_ShirtID(int T_ShirtID){
		this.T_ShirtID = T_ShirtID;
	}
	public int getT_ShirtID(){
		return this.T_ShirtID;
	}
	
	public void setPosPic(String PosPic){
		this.PosPic = PosPic;
	}
	public String getPosPic(){
		return this.PosPic;
	}
	
	public void setNegPic(String NegPic){
		this.NegPic = NegPic;
	}
	public String getNegPic(){
		return this.NegPic;
	}
	
	public void setPosLoc_1(int PosLoc_1){
		this.PosLoc_1 = PosLoc_1;
	}
	public int getPosLoc_1(){
		return this.PosLoc_1;
	}
	
	public void setNegLoc_1(int NegLoc_1){
		this.NegLoc_1 = NegLoc_1;
	}
	public int getNegLoc_1(){
		return this.NegLoc_1;
	}

	public void setCustomTime(Date CustomTime){
		this.CustomTime = CustomTime;
	}
	public Date getCustomTime(){
		return this.CustomTime;
	}
	
	public void setUserID(String UserID){
		this.UserID = UserID;
	}
	public String getUserID(){
		return this.UserID;
	}
	
	public void setPosLoc_2(int PosLoc_2){
		this.PosLoc_2 = PosLoc_2;
	}
	public int getPosLoc_2(){
		return this.PosLoc_2;
	}
	
	public void setNegLoc_2(int NegLoc_2){
		this.NegLoc_2 = NegLoc_2;
	}
	public int getNegLoc_2(){
		return this.NegLoc_2;
	}
	
	public void setPosSize(int PosSize){
		this.PosSize = PosSize;
	}
	public int getPosSize(){
		return this.PosSize;
	}
	
	public void setNegSize(int NegSize){
		this.NegSize = NegSize;
	}
	public int getNegSize(){
		return this.NegSize;
	}
	
	public void setT_ShirtName(String T_ShirtName){
		this.T_ShirtName = T_ShirtName;
	}
	public String getT_ShirtName(){
		return this.T_ShirtName;
	}
}
