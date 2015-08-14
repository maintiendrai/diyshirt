package com.diyshirt.model;

import com.diyshirt.model.DAOFactory;
import com.diyshirt.model.dao.FeedbackDAO;
import com.diyshirt.model.dao.ManufacturersinfoDAO;
import com.diyshirt.to.Page;
import com.diyshirt.to.ManufacturersinfoTo;
import com.diyshirt.util.Logger;

public class ManufacturersinfoManager {
	 private static ManufacturersinfoManager instance = null;
	    
		static org.apache.log4j.Logger logger = Logger.getLogger();
		
		private ManufacturersinfoManager() {

		}

		public static ManufacturersinfoManager getInstance() {
			if (instance == null) {
				instance = new ManufacturersinfoManager();
			}
			return instance;
		}
		
		public boolean insert(ManufacturersinfoTo to) {
			ManufacturersinfoDAO dao = DAOFactory.getInstance().getManufacturersinfoDAO();
			int c = dao.insert(to);
			dao.destroy();
			dao = null;
			if (c == 1) {
				return true;
			} else {
				return false;
			}
		}
		
		public boolean delete(int MF_ID){
			ManufacturersinfoDAO dao = DAOFactory.getInstance().getManufacturersinfoDAO();
			int c = dao.delete(MF_ID);
			dao.destroy();
			dao = null;
			if (c == 1) {
				return true;
			} else {
				return false;
			}
		}
		
		public boolean update(ManufacturersinfoTo to) {
			ManufacturersinfoDAO dao = DAOFactory.getInstance().getManufacturersinfoDAO();
			int c = dao.update(to);
			dao.destroy();
			dao = null;
			if (c == 1) {
				return true;
			} else {
				return false;
			}
		}
		
		public Page findMFByPage(int pagenum, int pagelen) {
			ManufacturersinfoDAO dao = DAOFactory.getInstance().getManufacturersinfoDAO();
			Page page = dao.findMFByPage(pagenum, pagelen);
			dao.destroy();
			return page;
		}

		public ManufacturersinfoTo findMFByID(int MF_ID) {
			ManufacturersinfoDAO dao = DAOFactory.getInstance().getManufacturersinfoDAO();
			ManufacturersinfoTo to = dao.findMFByID(MF_ID);
			dao.destroy();
			return to;
		}
}
