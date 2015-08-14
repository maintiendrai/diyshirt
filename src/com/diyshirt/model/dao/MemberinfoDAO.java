package com.diyshirt.model.dao;
import com.diyshirt.to.*;

import java.util.*;
import java.util.Date;
import java.sql.*;

import com.diyshirt.model.*;

public class MemberinfoDAO extends DAOObject{
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
		.getLogger(com.diyshirt.util.Logger.appender);
	
	boolean sign = false;
	Statement stmt = null;
	ResultSet rs = null;
	
	public MemberinfoDAO(){
		super();
	}
	
	public int delete(String UserID){
		//删除用户
		String sql = "delete from memberinfo where UserID ='" + UserID + "'";
		return this.executeUpdate(sql);
	}
	
	public int insert(MemberinfoTo to){
		//增加用户
		StringBuffer sb = new StringBuffer("insert into memberinfo(UserID,Password,NickName,Age,Sex,Telephone,Mobilephone,Status,Address,Post,QQ,RegeditTime) values('");
		sb.append(to.getUserID() + "','" + to.getPassword() + "','" + to.getNickName() + "','" + to.getAge() + "','" + to.getSex() + "','" + to.getTelephone() + "','" + to.getMobilephone() + "','" + to.getStatus() + "','" + to.getAddress() + "','" + to.getPost() + "','" + to.getQQ() + "',now())");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public int update(MemberinfoTo to){
		//修改用户信息
		StringBuffer sb = new StringBuffer("update memberinfo set UserID = '");
		sb.append(to.getUserID() + "',NickName = '" + to.getNickName() + "',Age = '" + to.getAge() + "',Sex = '" + to.getSex() + "',Telephone = '" + to.getTelephone() + "',Mobilephone = '" + to.getMobilephone() + "',Address = '" + to.getAddress() + "',Post = '" + to.getPost() + "',QQ = '" + to.getQQ() +"' where UserID = '" + to.getUserID() + "';");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public boolean isUserExist(String UserID){
		//判断用户名是否存在
		Statement stmt = null;
		boolean flag = false;
		ResultSet rs = null;
		try{
			stmt = conn.createStatement();
			String sql = "select * from memberinfo where UserID = '" + UserID + "'";
			rs = stmt.executeQuery(sql);
			if(rs.next()) flag = true;
		}catch(SQLException e){
			logger.error(e.toString());
		}finally{
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
		return flag;
	}
	
	public int changPassword(String UserID,String Password){
		//修改用户密码
		StringBuffer sb = new StringBuffer("update Memberinfo set Password = '" + Password + "'where UserID = '" + UserID + "'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public boolean valid(String UserID,String Password){
		//判断用户名与密码是否一致
		String sql = "select * from memberinfo where UserID = '" + UserID + "' and Password = '" + Password + "'";
		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) return true;
			else return false;
		}catch(Exception e){
			return false;
		}finally{
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
	}
	
	public  MemberinfoTo findUserbyID(String UserID){
		//通过ID获取用户普通信息
		MemberinfoTo to = null;
		try{
			stmt = conn.createStatement();
			String sql = "select * from memberinfo where UserID = '" + UserID + "'";
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				to = new MemberinfoTo();
				to.setUserID(UserID);
				to.setNickName(rs.getString("NickName"));
				to.setAge(rs.getInt("Age"));
				to.setSex(rs.getShort("Sex"));
				to.setTelephone(rs.getString("Telephone"));
				to.setMobilephone(rs.getString("Mobilephone"));
				to.setStatus(rs.getShort("Status"));
				to.setAddress(rs.getString("Address"));
				to.setPost(rs.getString("Post"));
				to.setQQ(rs.getString("QQ"));
				to.setRegeditTime(rs.getDate("RegeditTime"));
			}
		}catch(SQLException e){
			logger.debug(e.toString());
		}finally{
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
	
	public String findPwbyID(String UserID){
		//通过ID获取用户密码
		MemberinfoTo to = null;
		try{
			stmt = conn.createStatement();
			String sql = "select Password from memberinfo where UserID = '" + UserID + "'";
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				to = new MemberinfoTo();
				to.setPassword(rs.getString("Password"));
				return to.getPassword();
			}else return null;
		}catch(SQLException e){
			logger.debug(e.toString());
		}finally{
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
		return null;
	}
	
	public Page findUserbypage(int pageNum,int pageLength){
		Page page = new Page();
		page.setPageNum(pageNum);
		page.setPageLength(pageLength);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from memberinfo";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pageNum, pageLength, sql);
			
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				MemberinfoTo to = new MemberinfoTo();
				to.setUserID("UserID");
				to.setNickName(rs.getString("NickName"));
				to.setAge(rs.getInt("Age"));
				to.setSex(rs.getShort("Sex"));
				to.setTelephone(rs.getString("Telephone"));
				to.setMobilephone(rs.getString("Mobilephone"));
				to.setStatus(rs.getShort("Status"));
				to.setAddress(rs.getString("Address"));
				to.setPost(rs.getString("Post"));
				to.setQQ(rs.getString("QQ"));
				to.setRegeditTime(rs.getDate("RegeditTime"));
			
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

		if (list.size() < pageLength) {
			page.setRecordNum((pageNum - 1) * pageLength + list.size());
		} else {
			page.setRecordNum(this.countResultSizeSimple(sql));
		}
		return page;
	}
	
	public Page findUserbyPage(int pageNum,int pageLength){
		Page page = new Page();
		page.setPageNum(pageNum);
		page.setPageLength(pageLength);
		ArrayList list = new ArrayList();
		String sql = "select * from memberinfo";
		try{
			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pageNum, pageLength, sql);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				MemberinfoTo to = new MemberinfoTo();
				to.setUserID(rs.getString("UserID"));
				to.setNickName(rs.getString("NickName"));
				to.setAge(rs.getInt("Age"));
				to.setSex(rs.getShort("Sex"));
				to.setTelephone(rs.getString("Telephone"));
				to.setMobilephone(rs.getString("Mobilephone"));
				to.setStatus(rs.getShort("Status"));
				to.setAddress(rs.getString("Address"));
				to.setPost(rs.getString("Post"));
				to.setQQ(rs.getString("QQ"));
				to.setRegeditTime(rs.getDate("RegeditTime"));
				list.add(to);
			}
		}catch(SQLException e){
			logger.debug(e.toString());
		}finally{
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

			if (list.size() < pageLength) {
				page.setRecordNum((pageNum - 1) * pageLength + list.size());
			} else {
				page.setRecordNum(this.countResultSizeSimple(sql));
			}
			return page;
		
	}
	
	public int updateStatus(String UserID,short Status){
		StringBuffer sb = new StringBuffer("update memberinfo set Status = '" + Status + "' where UserID = '" + UserID + "'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
}
