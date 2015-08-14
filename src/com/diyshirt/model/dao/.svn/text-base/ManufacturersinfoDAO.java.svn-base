package com.diyshirt.model.dao;

import java.sql.*;
import java.util.*;

import com.diyshirt.to.*;
import com.diyshirt.model.DAOObject;

public class ManufacturersinfoDAO extends DAOObject {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
	.getLogger(com.diyshirt.util.Logger.appender);
	public ManufacturersinfoDAO() {
		super();
	}
	public Page findMFByPage(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from Manufacturersinfo";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				ManufacturersinfoTo to = new ManufacturersinfoTo();
				to.setMF_ID(rs.getInt("MF_ID"));
				to.setMF_Name(rs.getString("MF_Name"));
				to.setMF_Tel(rs.getString("MF_Tel"));
				to.setMF_Add(rs.getString("MF_Add"));
				to.setMF_Post(rs.getString("MF_Post"));
				
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
	
	public ManufacturersinfoTo findMFByID(int MF_ID) {
		Statement stmt = null;
		ResultSet rs = null;
		ManufacturersinfoTo to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from Manufacturersinfo where MF_ID='" + MF_ID + "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new ManufacturersinfoTo();
				to.setMF_ID(rs.getInt("MF_ID"));
				to.setMF_Name(rs.getString("MF_Name"));
				to.setMF_Tel(rs.getString("MF_Tel"));
				to.setMF_Add(rs.getString("MF_Add"));
				to.setMF_Post(rs.getString("MF_Post"));
				
			}
		} catch (SQLException e) {
			logger.debug(e.toString());
		}finally {
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
	
	public int insert(ManufacturersinfoTo to) {
		StringBuffer sb = new StringBuffer(
				"insert into Manufacturersinfo(MF_Name,MF_Tel,MF_Add,MF_Post) values('");

		sb.append(to.getMF_Name());
		sb.append("','");
		sb.append(to.getMF_Tel());
		sb.append("','");
		sb.append(to.getMF_Add());
		sb.append("','");
		sb.append(to.getMF_Post());
		sb.append("');");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int delete(int MF_ID){
		String sql = "delete from Manufacturersinfo where MF_ID='"+MF_ID+"'";
		return this.executeUpdate(sql);
	}
	
	public int update(ManufacturersinfoTo to) {
		StringBuffer sb = new StringBuffer(
				"update Manufacturersinfo set MF_Name='");
		 
		sb.append(to.getMF_Name());
		sb.append("',MF_Tel='");
		sb.append(to.getMF_Tel());
		sb.append("',MF_Add='");
		sb.append(to.getMF_Add());
		sb.append("',MF_Post='"); 
		sb.append(to.getMF_Post());
		sb.append("' where MF_ID='"+to.getMF_ID()+"'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
}
