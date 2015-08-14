package com.diyshirt.model.dao;

import java.sql.*;
import java.util.*;
import com.diyshirt.to.*;
import com.diyshirt.model.DAOObject;

public class AdministratorinfoDAO extends DAOObject {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
	.getLogger(com.diyshirt.util.Logger.appender);
	public AdministratorinfoDAO() {
		super();
	}
	
	public String getAdminPassword(String AdminAccount){ 
		 
		Statement stmt = null;
		ResultSet rs = null;  
		String pw=null;
		try {

			stmt = conn.createStatement();
			String sql = "select Password from Administratorinfo where AdminAccount='" + AdminAccount
					+ "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				pw=rs.getString(1);
			}
		} catch (SQLException e) {
			logger.debug(e.toString());
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
		}
		return pw;
	}

	public boolean isAdminrExist(String AdminAccount){
		Statement stmt = null;
		ResultSet rs = null;
		try{
			stmt = conn.createStatement();
			String sql = "select * from Administratorinfo where UserID = '" + AdminAccount + "'";
			rs = stmt.executeQuery(sql);
			if(rs.next()) return true;
		}catch(SQLException e){
			logger.error(e.toString());
		}
		finally{
			try {
				rs.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
		}
		return false;
	}
	
	public Page findAdminByPage(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from Administratorinfo where Authority=0";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				AdministratorinfoTo to = new AdministratorinfoTo();
				to.setAdminID(rs.getInt("AdminID"));
				to.setAdminAccount(rs.getString("AdminAccount"));
				
				list.add(to);
			}
		} catch (SQLException e) {
			logger.debug(e.toString());
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
		}

		page.setData(list);

		if (list.size() < pagelen) {
			page.setRecordNum((pagenum - 1) * pagelen + list.size());
		} else {
			page.setRecordNum(this.countResultSizeSimple(sql));
		}
		return page;
	}
	
	public int delete(int Adminid){
		String sql = "delete from Administratorinfo where AdminID='"+Adminid+"'";
		return this.executeUpdate(sql);
	}
	
	public int insert(AdministratorinfoTo to) {
		StringBuffer sb = new StringBuffer(
				"insert into Administratorinfo(AdminAccount,Password) values('");

		sb.append(to.getAdminAccount());
		sb.append("','");
		sb.append(to.getPassword());
		sb.append("');");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public AdministratorinfoTo findAdminByAcc(String AdminAccount) {
		Statement stmt = null;
		ResultSet rs = null;
		AdministratorinfoTo to = new AdministratorinfoTo(); 
		try {

			stmt = conn.createStatement();
			String sql = "select * from Administratorinfo where AdminAccount='" + AdminAccount
					+ "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new AdministratorinfoTo();
				
				to.setAdminID(rs.getInt("AdminID"));
				to.setAdminAccount(rs.getString("AdminAccount"));
				to.setPassword(rs.getString("Password"));
				to.setAuthority(rs.getInt("Authority"));
			}
		} catch (SQLException e) {
			logger.debug(e.toString());
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
		}
		return to;
	}
	
	public AdministratorinfoTo findAdminByID(int AdminID) {
		Statement stmt = null;
		ResultSet rs = null;
		AdministratorinfoTo to = new AdministratorinfoTo(); 
		try {

			stmt = conn.createStatement();
			String sql = "select * from Administratorinfo where AdminID='" + AdminID
					+ "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new AdministratorinfoTo();
				
				to.setAdminID(rs.getInt("AdminID"));
				to.setAdminAccount(rs.getString("AdminAccount"));
				to.setPassword(rs.getString("Password"));
				to.setAuthority(rs.getInt("Authority"));
			}
		} catch (SQLException e) {
			logger.debug(e.toString());
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
		}
		return to;
	}
	
	public int update(AdministratorinfoTo to) {
		StringBuffer sb = new StringBuffer(
				"update Administratorinfo set Password='"); 
		sb.append(to.getPassword());
		sb.append("' where AdminID='"+to.getAdminID()+"'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	
}
