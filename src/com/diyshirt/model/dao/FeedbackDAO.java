package com.diyshirt.model.dao;

import java.sql.*;
import java.util.*;
import com.diyshirt.to.*;
import com.diyshirt.model.DAOObject;

public class FeedbackDAO extends DAOObject {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.diyshirt.util.Logger.appender);

	public FeedbackDAO() {
		super();
	}

	public FeedbackTo findFeedbackByID(String UserID) {
		Statement stmt = null;
		ResultSet rs = null;
		FeedbackTo to = null;
		try {

			stmt = conn.createStatement();
			String sql = "select * from Feedback where UserID='" + UserID + "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				to = new FeedbackTo();
				to.setUserID(UserID);
				to.setFeedback(rs.getInt("Feedback"));
				to.setIntegral(rs.getInt("Integral"));
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

	public Page findFeedbackByPage(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from Feedback";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				FeedbackTo to = new FeedbackTo();
				to.setUserID(rs.getString("UserID"));
				to.setFeedback(rs.getInt("Feedback"));
				to.setIntegral(rs.getInt("Integral"));

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

	public int delete(String UserID) {
		String sql = "delete from Feedback where UserID='" + UserID + "'";
		return this.executeUpdate(sql);
	}

	public int insert(FeedbackTo to) {
		StringBuffer sb = new StringBuffer(
				"insert into Feedback(UserID,Feedback,Integral) values('");

		sb.append(to.getUserID());
		sb.append("','");
		sb.append(to.getFeedback());
		sb.append("','");
		sb.append(to.getIntegral());
		sb.append("');");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

	public int update(FeedbackTo to) {
		StringBuffer sb = new StringBuffer("update Feedback set Feedback='");
		sb.append(to.getFeedback());
		sb.append("',Integral='");
		sb.append(to.getIntegral());

		sb.append("' where UserID='" + to.getUserID() + "';");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}

}
