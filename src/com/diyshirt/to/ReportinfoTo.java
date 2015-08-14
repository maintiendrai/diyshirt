package com.diyshirt.to;
import java.util.Date;

public class ReportinfoTo {
	private int ReportID;
	private int PicID;
	private String UserID;
	private Date ReportTime;
	private short Status;
	
	public void setReportID(int ReportID){
		this.ReportID =ReportID;
	}
	public int getReportID(){
		return this.ReportID;
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
	
	public void setReportTime(Date ReportTime){
		this.ReportTime = ReportTime;
	}
	public Date getReportTime(){
		return this.ReportTime;
	}
	
	public void setStatus(short Status){
		this.Status = Status;
	}
	public short getStatus(){
		return this.Status;
	}
}
