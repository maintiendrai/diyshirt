package com.diyshirt.model.dao;
import com.diyshirt.model.DAOObject;
import com.diyshirt.to.ReportinfoTo;

//¾Ù±¨Í¼Æ¬
public class ReportInfoDAO extends DAOObject{
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
		.getLogger(com.diyshirt.util.Logger.appender);
	
	public ReportInfoDAO(){
		super();
	}
	
	public int insert(ReportinfoTo to){
		StringBuffer sb = new StringBuffer("insert into reportinfo(PicID,UserID,ReportTime,Status) values('" + to.getPicID() + "','" + to.getUserID() + "," + to.getReportTime() + ",1')");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public int delete(int ReportID){
		String sql ="delete from reportinto where ReportID = '" + ReportID + "'";
		return this.executeUpdate(sql);
	}
}
