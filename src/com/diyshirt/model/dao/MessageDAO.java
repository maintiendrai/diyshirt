package com.diyshirt.model.dao;

import java.sql.*;
import java.util.*;

import com.diyshirt.to.*;
import com.diyshirt.model.DAOObject;

public class MessageDAO extends DAOObject {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
	.getLogger(com.diyshirt.util.Logger.appender);
	public MessageDAO() {
		super();
	}
	
	public MessageTo findMesByID(int MesID) {
		Statement stmt = null;
		ResultSet rs = null;
		MessageTo to = new MessageTo();
		try {

			stmt = conn.createStatement();
			String sql = "select * from Message where MesID='" + MesID
					+ "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to.setMesID(rs.getInt("MesID"));
				to.setMesTitle(rs.getString("MesTitle"));
				to.setMesContent(rs.getString("MesContent"));
				String PubTime = rs.getTimestamp("PubTime").toString();
				PubTime = PubTime.substring(0, PubTime.length()-2);
				to.setPubTime(PubTime);
				to.setAdminID(rs.getInt("AdminID"));
				String FocTime = rs.getTimestamp("FocTime").toString();
				FocTime = FocTime.substring(0, FocTime.length()-11);
				to.setFocTime(FocTime);
				String FaiTime = rs.getTimestamp("FaiTime").toString();
				FaiTime = FaiTime.substring(0, FaiTime.length()-11);
				to.setFaiTime(FaiTime);
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
	
	public Page findMesByPage(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from Message order by Pubtime desc";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				MessageTo to = new MessageTo();
				to.setMesID(rs.getInt("MesID"));
				to.setMesTitle(rs.getString("MesTitle"));
				to.setMesContent(rs.getString("MesContent"));
				String PubTime = rs.getTimestamp("PubTime").toString();
				PubTime = PubTime.substring(0, PubTime.length()-2);
				to.setPubTime(PubTime);
				to.setAdminID(rs.getInt("AdminID"));
				String FocTime = rs.getTimestamp("FocTime").toString();
				FocTime = FocTime.substring(0, FocTime.length()-11);
				to.setFocTime(FocTime);
				String FaiTime = rs.getTimestamp("FaiTime").toString();
				FaiTime = FaiTime.substring(0, FaiTime.length()-11);
				to.setFaiTime(FaiTime);
				to.setAuthority(rs.getInt("Authority"));
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
	
	public Page findMesByPage(int pagenum, int pagelen,int Authority) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from Message where Authority<='"+Authority+"' and FaiTime>=now() order by Foctime desc";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				MessageTo to = new MessageTo();
				to.setMesID(rs.getInt("MesID"));
				to.setMesTitle(rs.getString("MesTitle"));
				to.setMesContent(rs.getString("MesContent"));
				String PubTime = rs.getTimestamp("PubTime").toString();
				PubTime = PubTime.substring(0, PubTime.length()-2);
				to.setPubTime(PubTime);
				to.setAdminID(rs.getInt("AdminID"));
				String FocTime = rs.getTimestamp("FocTime").toString();
				FocTime = FocTime.substring(0, FocTime.length()-11);
				to.setFocTime(FocTime);
				String FaiTime = rs.getTimestamp("FaiTime").toString();
				FaiTime = FaiTime.substring(0, FaiTime.length()-11);
				to.setFaiTime(FaiTime);
				to.setAuthority(rs.getInt("Authority"));
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
	
	public List findMessageByputdate(int n,String Authority) {
		Statement stmt = null;
		ResultSet rs = null;
	
		ArrayList list = new ArrayList();
		try {
           int i=0;
			stmt = conn.createStatement();
			String sql = "select * from Message where Authority='"+Authority+"' and FaiTime>=now() order by Foctime desc";
			rs = stmt.executeQuery(sql);
			while (rs.next()&&i<n) {
				MessageTo to = new MessageTo();
			
				to.setMesID(rs.getInt("MesID"));
				to.setMesTitle(rs.getString("MesTitle"));
				String FocTime = rs.getTimestamp("FocTime").toString();
				FocTime = FocTime.substring(0, FocTime.length()-11);
				to.setFocTime(FocTime);
				list.add(to);
				i++;
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
		return list;
	}
	
	public int delete(int MesID){
		String sql = "delete from Message where MesID='"+MesID+"'";
		return this.executeUpdate(sql);
	}
	
	public int insert(MessageTo to) {
		StringBuffer sb = new StringBuffer(
				"insert into Message(MesTitle,MesContent,PubTime,AdminID,FocTime,FaiTime,Authority) values('");

		sb.append(to.getMesTitle());
		sb.append("','");
		sb.append(to.getMesContent());
		sb.append("',now(),'");
		sb.append(to.getAdminID());
		sb.append("','");
		sb.append(to.getFocTime());
		sb.append("','");
		sb.append(to.getFaiTime());
		sb.append("','");
		sb.append(to.getAuthority());
		sb.append("');");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int update(MessageTo to) {
		StringBuffer sb = new StringBuffer(
				"update Message set MesTitle='");
		 
		sb.append(to.getMesTitle());
		sb.append("',MesContent='");
		sb.append(to.getMesContent());
		sb.append("',FocTime='"); 
		sb.append(to.getFocTime());
		sb.append("',FaiTime='"); 
		sb.append(to.getFaiTime());
		sb.append("',Authority='"); 
		sb.append(to.getAuthority());
		sb.append("' where MesID='"+to.getMesID()+"'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
}
