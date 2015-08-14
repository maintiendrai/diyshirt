package com.diyshirt.model;

import java.text.*;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.diyshirt.model.DAOFactory;
import com.diyshirt.model.dao.OrdersDAO;
import com.diyshirt.to.Page;
import com.diyshirt.to.OrdersTo;
import com.diyshirt.util.Logger;

public class OrdersManager {
    private static OrdersManager instance = null;
    
	static org.apache.log4j.Logger logger = Logger.getLogger();
	
	private OrdersManager() {

	}

	public static OrdersManager getInstance() {
		if (instance == null) {
			instance = new OrdersManager();
		}
		return instance;
	}
	
	public boolean insert(OrdersTo to) {
		OrdersDAO dao = DAOFactory.getInstance().getOrdersDAO();
		int c = dao.insert(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean delete(int OrderID){
		OrdersDAO dao = DAOFactory.getInstance().getOrdersDAO();
		int c = dao.delete(OrderID);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean update(OrdersTo to) {
		OrdersDAO dao = DAOFactory.getInstance().getOrdersDAO();
		int c = dao.update(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean updateMF_Name(String MF_Name,OrdersTo to) {
		OrdersDAO dao = DAOFactory.getInstance().getOrdersDAO();
		int c = dao.updateMF_Name(MF_Name,to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean Overtime(String BookTime){
		
		try {
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date1 = format.parse(BookTime);
			long Time = (date1.getTime()/1000)+60*30*16;   
			date1.setTime(Time*1000);
			Date date2 = new Date();
			boolean b = date2.after(date1);
			if(b==true){
				return true;
			}else{
				return false;
			}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		return true;

	}
	public OrdersTo findOderByID(int OrderID) {
		OrdersDAO dao = DAOFactory.getInstance().getOrdersDAO();
		OrdersTo to = dao.findOderByID(OrderID);
		dao.destroy();
		return to;
	}
	
	public Page findOderByPage(int pagenum, int pagelen) {
		OrdersDAO dao = DAOFactory.getInstance().getOrdersDAO();
		Page page = dao.findOderByPage(pagenum, pagelen);
		dao.destroy();
		return page;
		
	}
	
	public Page findUserOderByPage(int pagenum, int pagelen,String UserID) {
		OrdersDAO dao = DAOFactory.getInstance().getOrdersDAO();
		Page page = dao.findUserOderByPage(pagenum, pagelen,UserID);
		dao.destroy();
		return page;
		
	}

}
