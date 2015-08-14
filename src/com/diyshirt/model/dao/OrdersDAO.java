package com.diyshirt.model.dao;

import java.sql.*;
import java.util.*;
import com.diyshirt.to.*;
import com.diyshirt.model.DAOObject;

public class OrdersDAO extends DAOObject {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
	.getLogger(com.diyshirt.util.Logger.appender);

	public OrdersDAO() {
		super();
	}

	public OrdersTo findOderByID(int OrderID) { 
		Statement stmt = null;
		ResultSet rs = null;
		OrdersTo to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from Orders where OrderID='" + OrderID + "'order by Booktime desc";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new OrdersTo();
				to.setOrderID(rs.getInt("OrderID"));
				to.setCustomID(rs.getInt("CustomID"));
				to.setNumber(rs.getInt("Number"));
				String BookTime = rs.getString("BookTime");
				BookTime = BookTime.substring(0, BookTime.length()-2);
				to.setBookTime(BookTime);
				to.setBookStatus(rs.getShort("BookStatus"));
				to.setUserID(rs.getString("UserID"));
				to.setAllPrice(rs.getFloat("AllPrice"));
				to.setMF_Name(rs.getString("MF_Name"));
				to.setSize(rs.getString("Size"));
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

	public Page findOderByPage(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from Orders order by Booktime desc";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				OrdersTo to = new OrdersTo();
				to.setOrderID(rs.getInt("OrderID"));
				to.setCustomID(rs.getInt("CustomID"));
				to.setNumber(rs.getInt("Number"));
				String BookTime = rs.getString("BookTime");
				BookTime = BookTime.substring(0, BookTime.length()-2);
				to.setBookTime(BookTime);
				to.setBookStatus(rs.getShort("BookStatus"));
				to.setUserID(rs.getString("UserID"));
				to.setAllPrice(rs.getFloat("AllPrice"));
				to.setMF_Name(rs.getString("MF_Name"));
				to.setSize(rs.getString("Size"));
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
	
	public Page findUserOderByPage(int pagenum, int pagelen,String UserID) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from Orders where UserID='"+UserID+"'order by Booktime desc";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				OrdersTo to = new OrdersTo();
				to.setOrderID(rs.getInt("OrderID"));
				to.setCustomID(rs.getInt("CustomID"));
				to.setNumber(rs.getInt("Number"));
				String BookTime = rs.getString("BookTime");
				BookTime = BookTime.substring(0, BookTime.length()-2);
				to.setBookTime(BookTime);
				to.setBookStatus(rs.getShort("BookStatus"));
				to.setUserID(rs.getString("UserID"));
				to.setAllPrice(rs.getFloat("AllPrice"));
				to.setMF_Name(rs.getString("MF_Name"));
				to.setSize(rs.getString("Size"));
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
	
	public int delete(int OrderID){
		String sql = "delete from Orders where OrderID='"+OrderID+"'";
		return this.executeUpdate(sql);
	}
	
	public int insert(OrdersTo to) {
		StringBuffer sb = new StringBuffer(
				"insert into Orders(CustomID,Number,BookTime,BookStatus,UserID,AllPrice,MF_Name,Size) values('");
		
		sb.append(to.getCustomID());
		sb.append("','");
		sb.append(to.getNumber());
		sb.append("',now(),'");
		sb.append(to.getBookStatus());
		sb.append("','");
		sb.append(to.getUserID());
		sb.append("','");
		sb.append(to.getAllPrice());
		sb.append("','");
		sb.append(to.getMF_Name());
		sb.append("','");
		sb.append(to.getSize());
		sb.append("');");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public int update(OrdersTo to) {
		StringBuffer sb = new StringBuffer(
				"update Orders set CustomID='");
		 
		sb.append(to.getCustomID());
		sb.append("',Number='");
		sb.append(to.getNumber());
		sb.append("',BookTime=now()");
		sb.append(",BookStatus='"); 
		sb.append(to.getBookStatus());
		sb.append("',UserID='");
		sb.append(to.getUserID());
		sb.append("',AllPrice='");
		sb.append(to.getAllPrice());
		sb.append("',Size='");
		sb.append(to.getSize());
		sb.append("' where OrderID='"+to.getOrderID()+"';");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public int updateMF_Name(String MF_Name,OrdersTo to) {
		StringBuffer sb = new StringBuffer(
				"update Orders set MF_Name='");
		sb.append(MF_Name);
		sb.append("',BookStatus='"); 
		sb.append(to.getBookStatus());
		sb.append("' where OrderID='"+to.getOrderID()+"';");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
}
