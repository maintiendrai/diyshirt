/**
 * 本例程演示了通过Web上传文件过程中的进度显示。您可以对本例程进行任何修改和使用。
 * 如果需要转载本例程，请您注明作者。
 *
 * 作者： 刘作晨
 * EMail:liuzuochen@gmail.com
 */

package com.diyshirt.model.command.diyshirt;

import java.util.*;

public class ShirtUploadStatus {
    //上传用户地址
    private String uploadAddr;
    //上传总量
    private long uploadTotalSize = 0;
    //读取上传总量
    private long readTotalSize = 0;
    //当前上传文件号
    private int currentUploadFileNum = 0;
    //成功读取上传文件数
    private int successUploadFileCount = 0;
    //状态
    private String status = "";
    //处理起始时间
    private long processStartTime = 0l;
    //处理终止时间
    private long processEndTime = 0l;
    //处理执行时间
    private long processRunningTime = 0l;
    //上传文件URL列表
    private List uploadFileUrlList = new ArrayList();
    //取消上传
    private boolean cancel = false;
    //上传base目录
    private String baseDir = "";
    private int Price;
    private int CateID;
    private short Sex;
    private String Intro;

    public ShirtUploadStatus() {

    }
    
    public int getPrice(){
    	return this.Price;
    }
    
    public void setPrice(int Price){
    	this.Price = Price;
    }
    
    public int getCateID(){
    	return this.CateID;
    }
    
    public void setCateID(int CateID){
    	this.CateID = CateID;
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
	public Short getSex(){
		return this.Sex;
	}

    public String getBaseDir() {
        return baseDir;
    }

    public void setBaseDir(String baseDir) {
        this.baseDir = baseDir;
    }

    public boolean getCancel() {
        return cancel;
    }

    public void setCancel(boolean cancel) {
        this.cancel = cancel;
    }

    public List getUploadFileUrlList() {
        return uploadFileUrlList;
    }

    public void setUploadFileUrlList(List uploadFileUrlList) {
        this.uploadFileUrlList = uploadFileUrlList;
    }

    public long getProcessRunningTime() {
        return processRunningTime;
    }

    public void setProcessRunningTime(long processRunningTime) {
        this.processRunningTime = processRunningTime;
    }

    public long getProcessEndTime() {
        return processEndTime;
    }

    public void setProcessEndTime(long processEndTime) {
        this.processEndTime = processEndTime;
    }

    public long getProcessStartTime() {
        return processStartTime;
    }

    public void setProcessStartTime(long processStartTime) {
        this.processStartTime = processStartTime;
    }

    public long getReadTotalSize() {
        return readTotalSize;
    }

    public void setReadTotalSize(long readTotalSize) {
        this.readTotalSize = readTotalSize;
    }

    public int getSuccessUploadFileCount() {
        return successUploadFileCount;
    }

    public void setSuccessUploadFileCount(int successUploadFileCount) {
        this.successUploadFileCount = successUploadFileCount;
    }

    public int getCurrentUploadFileNum() {
        return currentUploadFileNum;
    }

    public void setCurrentUploadFileNum(int currentUploadFileNum) {
        this.currentUploadFileNum = currentUploadFileNum;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public long getUploadTotalSize() {
        return uploadTotalSize;
    }

    public String getUploadAddr() {
        return uploadAddr;
    }

    public void setUploadTotalSize(long uploadTotalSize) {
        this.uploadTotalSize = uploadTotalSize;
    }

    public void setUploadAddr(String uploadAddr) {
        this.uploadAddr = uploadAddr;
    }

    public String toJSon() {
        StringBuffer strJSon = new StringBuffer();
        strJSon.append("{UploadTotalSize:").append(getUploadTotalSize()).append(
                ",")
                .append("ReadTotalSize:").append(getReadTotalSize()).append(",")
                .append("CurrentUploadFileNum:").append(getCurrentUploadFileNum()).
                append(",")
                .append("SuccessUploadFileCount:").append(
                        getSuccessUploadFileCount()).append(",")
                .append("Status:'").append(getStatus()).append("',")
                .append("ProcessStartTime:").append(getProcessStartTime()).
                append(",")
                .append("ProcessEndTime:").append(getProcessEndTime()).append(
                        ",")
                .append("ProcessRunningTime:").append(getProcessRunningTime()).
                append(",")
                .append("Cancel:").append(getCancel()).append("}");
        return strJSon.toString();

    }


}
