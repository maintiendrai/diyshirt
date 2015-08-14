package com.diyshirt.model;

import java.util.List;

import com.diyshirt.model.DAOFactory;
import com.diyshirt.model.dao.MessageDAO;
import com.diyshirt.to.Page;
import com.diyshirt.to.MessageTo;
import com.diyshirt.util.Logger;


public class MessageManager {
        
	private static MessageManager instance = null;
    
	static org.apache.log4j.Logger logger = Logger.getLogger();
	
	private MessageManager() {

	}

	public static MessageManager getInstance() {
		if (instance == null) {
			instance = new MessageManager();
		}
		return instance;
	}
	
	public boolean insert(MessageTo to) {
		MessageDAO dao = DAOFactory.getInstance().getMessageDAO();
		int c = dao.insert(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean delete(int MesID){
		MessageDAO dao = DAOFactory.getInstance().getMessageDAO();
		int c = dao.delete(MesID);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean update(MessageTo to) {
		MessageDAO dao = DAOFactory.getInstance().getMessageDAO();
		int c = dao.update(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public MessageTo findMesByID(int MesID) {
		MessageDAO dao = DAOFactory.getInstance().getMessageDAO();
		MessageTo to = dao.findMesByID(MesID);
		dao.destroy();
		return to;
	}
	
	public Page findMesByPage(int pagenum, int pagelen) {
		MessageDAO dao = DAOFactory.getInstance().getMessageDAO();
		Page page = dao.findMesByPage(pagenum, pagelen);
		dao.destroy();
	    return page;
	}

	public Page findMesByPage(int pagenum, int pagelen,int Authority) {
		MessageDAO dao = DAOFactory.getInstance().getMessageDAO();
		Page page = dao.findMesByPage(pagenum, pagelen, Authority);
		dao.destroy();
	    return page;
	}
	
	public List findMessageByputdate(int n,String Authority) {
		MessageDAO dao = DAOFactory.getInstance().getMessageDAO();
		List list = dao.findMessageByputdate(n, Authority);
		dao.destroy();
	    return list;
		
	}
}
