package com.diyshirt.to;
    
public class FeedbackTo {
	private String UserID = "";
	private int Feedback = 0;
	private int Integral = 0;
	
	public void setUserID(String UserID){
		this.UserID = UserID;
	}
	public String getUserID(){
		return this.UserID;
	}
	
	public void setFeedback(int Feedback){
		this.Feedback = Feedback;
	}
	public int getFeedback(){
		return this.Feedback;
	}
	
	public void setIntegral(int Integral){
		this.Integral = Integral;
	}
	public int getIntegral(){
		return this.Integral;
	}
}
