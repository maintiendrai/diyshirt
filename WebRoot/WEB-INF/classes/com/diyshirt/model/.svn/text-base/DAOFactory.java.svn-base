package com.diyshirt.model;

import com.diyshirt.model.dao.*;

public class DAOFactory {
	private static DAOFactory instance = null;

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.diyshirt.util.Logger.appender);

	private DAOFactory() {

	}

	public static DAOFactory getInstance() {
		if (instance == null) {
			instance = new DAOFactory();
		}
		return instance;
	}

	public MemberinfoDAO getMemberinfoDAO() {
		logger.debug("getMemberinfoDAO...");
		return new MemberinfoDAO();
	}

	public AdministratorinfoDAO getAdministratorinfoDAO() {
		logger.debug("getAdministratorinfoDAO...");
		return new AdministratorinfoDAO();
	}

	public MessageDAO getMessageDAO() {
		logger.debug("getMessageDAO...");
		return new MessageDAO();
	}
	
	public OrdersDAO getOrdersDAO()  {
		logger.debug("getOrdersDAO...");
		return new OrdersDAO();   
	}
	
	public FeedbackDAO getFeedbackDAO()  {
		logger.debug("getFeedbackDAO...");
		return new FeedbackDAO();   
	}
	
	public ManufacturersinfoDAO getManufacturersinfoDAO()  {
		logger.debug("getManufacturersinfoDAO...");
		return new ManufacturersinfoDAO();   
	}
	
	public ReportInfoDAO getReportInfoDAO()  {
		logger.debug("getReportInfoDAO...");
		return new ReportInfoDAO();   
	}
	
	public ShirtDAO getShirtDAO()  {
		logger.debug("getPictureDAO...");
		return new ShirtDAO();   
	}
	
	public PictureDAO getPictureDAO()  {
		logger.debug("getPictureDAO...");
		return new PictureDAO();   
	}
}