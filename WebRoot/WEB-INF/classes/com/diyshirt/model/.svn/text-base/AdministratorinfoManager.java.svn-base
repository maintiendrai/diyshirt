package com.diyshirt.model;

import com.diyshirt.model.dao.AdministratorinfoDAO;
import com.diyshirt.to.AdministratorinfoTo;
import com.diyshirt.to.Page;
import com.diyshirt.util.Logger;

public class AdministratorinfoManager {

	private static AdministratorinfoManager instance = null;

	static org.apache.log4j.Logger logger = Logger.getLogger();

	private AdministratorinfoManager() {

	}

	public static AdministratorinfoManager getInstance() {
		if (instance == null) {
			instance = new AdministratorinfoManager();
		}
		return instance;
	}

	public boolean insert(AdministratorinfoTo to) {
		AdministratorinfoDAO dao = DAOFactory.getInstance().getAdministratorinfoDAO();
		int c = dao.insert(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean delete(int adminID) {
		AdministratorinfoDAO dao = DAOFactory.getInstance().getAdministratorinfoDAO();
		int c = dao.delete(adminID);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean update(AdministratorinfoTo to) {
		AdministratorinfoDAO dao = DAOFactory.getInstance().getAdministratorinfoDAO();
		int c = dao.update(to);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public AdministratorinfoTo findAdminByAcc(String AdminAccount) {
		AdministratorinfoDAO dao = DAOFactory.getInstance().getAdministratorinfoDAO();
		AdministratorinfoTo to = dao.findAdminByAcc(AdminAccount);
		dao.destroy();
		return to;
	}

	public AdministratorinfoTo findAdminByID(int AdminID) {
		AdministratorinfoDAO dao = DAOFactory.getInstance().getAdministratorinfoDAO();
		AdministratorinfoTo to = dao.findAdminByID(AdminID);
		dao.destroy();
		return to;
	}
	
	public Page findAdminByPage(int pagenum, int pagelen) {
		AdministratorinfoDAO dao = DAOFactory.getInstance().getAdministratorinfoDAO();
		Page page = dao.findAdminByPage(pagenum, pagelen);
		dao.destroy();
		return page;
	}
}
