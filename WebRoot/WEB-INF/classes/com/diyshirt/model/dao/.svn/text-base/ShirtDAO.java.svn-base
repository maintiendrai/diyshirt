package com.diyshirt.model.dao;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.diyshirt.util.*;
//import java.util.Date;

import com.diyshirt.model.DAOObject;
import com.diyshirt.to.Page;
import com.diyshirt.to.T_ShirtCustomTo;
import com.diyshirt.util.ConnectionFactory;
import com.diyshirt.to.*;

public class ShirtDAO extends DAOObject{
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
	.getLogger(com.diyshirt.util.Logger.appender);
	
	public ShirtDAO(){
		super();
	}
	
	public boolean isvalid(String UserID,int T_ShirtID){
		//判断指定文化衫是否为指定用户名所上传
		Statement stmt = null;
		ResultSet rs = null;
		String sql ="select * from t_shirt where T_ShirtID = '" + T_ShirtID + "' and UserID = '" + UserID + "'";
		boolean flag = false;
		try{
			 stmt = conn.createStatement();
			 rs = stmt.executeQuery(sql);
			if(rs.next()) flag = true;
		}catch(SQLException e){
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
		return flag;
	}
	
	public int insertshirt(T_shirtTo to){
		//增加文化衫
		StringBuffer sb = new StringBuffer("insert into t_shirt(CateID,Price,Intro,Sex,T_ShirtPath_1,T_ShirtPath_2,ShirtName,Status) values('" + to.getCateID() + "','" + to.getPrice() + "','" + to.getIntro() + "','" + to.getSex() + "','" + to.getT_ShirtPath_1() + "','" + to.getT_ShirtPath_2() + "','" + to.getShirtName() + "','0')");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public int deleteshirt(int T_ShirtID){
		//删除文化衫
		String sql = "delete from t_shirt where T_ShirtID = '" + T_ShirtID + "'";
		return this.executeUpdate(sql);
	}
	
	public int updateshirt(T_shirtTo to){
		//修改文化衫信息
		StringBuffer sb = new StringBuffer("update t_shirt set CateID = '"+ to.getCateID() + "',Price = '" + to.getPrice() + "',Intro = '" + to.getIntro() + "',Sex = '" + to.getSex() + "',ShirtName = '" + to.getShirtName() + "' where T_ShirtID = '" + to.getT_ShirtID() + "'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public T_shirtTo shirtinfo(int T_ShirtID){
		//通过文化衫ID查看文化衫信息
		Statement stmt = null;
		ResultSet rs = null;
		T_shirtTo to = new T_shirtTo();
		String sql = "select * from t_shirt where T_ShirtID = '" + T_ShirtID + "'";
		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				to.setCateID(rs.getInt("CateID"));
				to.setPrice(rs.getFloat("Price"));
				to.setIntro(rs.getString("Intro"));
				to.setSex(rs.getShort("Sex"));
				to.setT_ShirtPath_1(rs.getString("T_ShirtPath_1"));
				to.setT_ShirtPath_2(rs.getString("T_ShirtPath_2"));
				to.setT_ShirtID(Integer.parseInt(rs.getString("T_ShirtID")));
				to.setShirtName(rs.getString("ShirtName"));
			}
		}catch(SQLException e){
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
	
	public T_ShirtCustomTo diyshirtinfo(int CustomID){
		//通过定制ID查询定制文化衫详细信息
		Statement stmt = null;
		ResultSet rs = null;
		T_ShirtCustomTo to = new T_ShirtCustomTo();
		String sql = "select * from t_shirtcustom where CustomID="+CustomID;
		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				to.setCustomID(rs.getInt("CustomID"));
				to.setPosPic(rs.getString("PosPic"));
				to.setNegPic(rs.getString("NegPic"));
				to.setPosLoc_1(Integer.parseInt(rs.getString("PosLoc_1")));
				to.setNegLoc_1(Integer.parseInt(rs.getString("NegLoc_1")));
				to.setUserID(rs.getString("UserID"));
				to.setT_ShirtID(rs.getInt("T_ShirtID"));
				to.setPosLoc_2(Integer.parseInt(rs.getString("PosLoc_2")));
				to.setNegLoc_2(Integer.parseInt(rs.getString("NegLoc_2")));
				to.setPosSize(rs.getInt("PosSize"));
				to.setNegSize(rs.getInt("NegSize"));
				to.setT_ShirtName(rs.getString("T_ShirtName"));
			}
		}catch(SQLException e){
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
		
	
	public int insertCustom(T_ShirtCustomTo to){
		//定制文化衫
		StringBuffer sb = new StringBuffer("insert into t_shirtcustom(PosPic,NegPic,PosLoc_1,NegLoc_1,CustomTime,UserID,T_ShirtID,PosLoc_2,NegLoc_2,PosSize,NegSize,T_ShirtName) values('"
							+ to.getPosPic() + "','" + to.getNegPic() + "','" + to.getPosLoc_1() + "','" + to.getNegLoc_1() + "',now(),'" + to.getUserID() + "','" + to.getT_ShirtID() + "','" + to.getPosLoc_2() + "','" + to.getNegLoc_2() + "','" + to.getPosSize() + "','" + to.getNegSize() + "','" + to.getT_ShirtName() + "')");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public int favourites(T_shirtfavouritesTo to){
		//收藏文化衫
		StringBuffer sb = new StringBuffer("insert into t-shirtfavourites(T_ShirtID,UserID,T_Fav_Time) values('" + to.getT_ShirtID() + "','" + to.getUserID() + "','" + to.getT_Fav_Time() + "')");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public int update(T_ShirtCustomTo to){
		//修改定制文化衫
		StringBuffer sb = new StringBuffer("update t_shirtcustom set PosPic = '" + to.getPosPic() + "',NegPic = '" + to.getNegPic() + "',PosLoc_1 = '" + to.getPosLoc_1() + "',NegLoc_1 = '" +to.getNegLoc_1() + "',CustomTime = '" + to.getCustomTime() + "',UserID = '" + to.getUserID() + ",T_ShirtID = '" + to.getT_ShirtID() + ",PosLoc_2 = '" + to.getPosLoc_2() + ",NegLoc_2 = '" + to.getNegLoc_2()  + "'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public int delete(int CustomID){
		//删除定制文化衫
		String sql = "delete from t_shirtcustom where CustomID = '" + CustomID + "'";
		return this.executeUpdate(sql);
	}
	
	public Page findShirtBypage(int pagenum,int pagelen){
		//查询全部文化衫
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);
		
		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from t_shirt";
		try{
			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);
			
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				T_shirtTo to = new T_shirtTo();
				to.setCateID(rs.getInt("CateID"));
				to.setPrice(rs.getFloat("Price"));
				to.setIntro(rs.getString("Intro"));
				to.setSex(rs.getShort("Sex"));
				to.setT_ShirtPath_1(rs.getString("T_ShirtPath_1"));
				to.setT_ShirtPath_2(rs.getString("T_ShirtPath_2"));
				to.setT_ShirtID(Integer.parseInt(rs.getString("T_ShirtID")));
				to.setShirtName(rs.getString("ShirtName"));
				to.setStatus(rs.getShort("Status"));
				list.add(to);
			}
		}catch(SQLException e){
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
		
		page.setData(list);

		if (list.size() < pagelen) {
			page.setRecordNum((pagenum - 1) * pagelen + list.size());
		} else {
			page.setRecordNum(this.countResultSizeSimple(sql));
		}
		return page;
	}
	
	public Page findShirtRCByPage(int pagenum,int pagelen){
		//查看推荐文化衫
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);
		
		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from t_shirtrecommended";
		try{
			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);
			
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				T_shirtrecommendedTo to = new T_shirtrecommendedTo();
				to.setT_RM_ID(rs.getInt("T_RM_ID"));
				to.setT_ShirtID(rs.getInt("T_ShirtID"));
				to.setT_RM_Order(rs.getInt("T_RM_Order"));
				list.add(to);
			}
		}catch(SQLException e){
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
		
		page.setData(list);

		if (list.size() < pagelen) {
			page.setRecordNum((pagenum - 1) * pagelen + list.size());
		} else {
			page.setRecordNum(this.countResultSizeSimple(sql));
		}
		return page;
	}
	
	public Page findShirtCustomBypage(int pagenum,int pagelen){
		//查看所有定制文化衫
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);
		
		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from t_shirtcustom";
		try{
			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);
			
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				T_ShirtCustomTo to = new T_ShirtCustomTo();
				to.setPosPic(rs.getString("PosPic"));
				to.setNegPic(rs.getString("NegPic"));
				to.setPosLoc_1(Integer.parseInt(rs.getString("PosLoc_1")));
				to.setNegLoc_1(Integer.parseInt(rs.getString("NegLoc_1")));
				to.setUserID(rs.getString("UserID"));
				to.setT_ShirtID(rs.getInt("T_ShirtID"));
				to.setPosLoc_2(Integer.parseInt(rs.getString("PosLoc_2")));
				to.setNegLoc_2(Integer.parseInt(rs.getString("NegLoc_2")));
				to.setPosSize(rs.getInt("PosSize"));
				to.setNegSize(rs.getInt("NegSize"));
				to.setT_ShirtName(rs.getString("T_ShirtName"));
				to.setCustomID(rs.getInt("CustomID"));
				list.add(to);
			}
		}catch(SQLException e){
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
		
		page.setData(list);

		if (list.size() < pagelen) {
			page.setRecordNum((pagenum - 1) * pagelen + list.size());
		} else {
			page.setRecordNum(this.countResultSizeSimple(sql));
		}
		return page;
	}
	
	public Page findUserShirtCustomBypage(int pagenum,int pagelen,String UserID){
		//查看所有定制文化衫
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);
		
		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from t_shirtcustom where UserID = '" + UserID + "'";
		try{
			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);
			
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				T_ShirtCustomTo to = new T_ShirtCustomTo();
				to.setPosPic(rs.getString("PosPic"));
				to.setNegPic(rs.getString("NegPic"));
				to.setPosLoc_1(Integer.parseInt(rs.getString("PosLoc_1")));
				to.setNegLoc_1(Integer.parseInt(rs.getString("NegLoc_1")));
				to.setUserID(UserID);
				to.setT_ShirtID(rs.getInt("T_ShirtID"));
				to.setPosLoc_2(Integer.parseInt(rs.getString("PosLoc_2")));
				to.setNegLoc_2(Integer.parseInt(rs.getString("NegLoc_2")));
				to.setPosSize(rs.getInt("PosSize"));
				to.setNegSize(rs.getInt("NegSize"));
				to.setT_ShirtName(rs.getString("T_ShirtName"));
				to.setCustomID(rs.getInt("CustomID"));
				list.add(to);
			}
		}catch(SQLException e){
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
		
		page.setData(list);

		if (list.size() < pagelen) {
			page.setRecordNum((pagenum - 1) * pagelen + list.size());
		} else {
			page.setRecordNum(this.countResultSizeSimple(sql));
		}
		return page;
	}
	
	public Page findShirt(int pagenum,int pagelen,String ShirtName,int CateID){
		//文化衫搜索
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from t_shirt where ";
		
		if(ShirtName!=""&&CateID!=5)
			sql += "ShirtName like '%" + ShirtName + "%' and CateID='" + CateID + "'";
		if(ShirtName!=""&&CateID==5)
			sql += "ShirtName like '%" + ShirtName + "%'";
		if(ShirtName==""&&CateID!=5)
			sql += "CateID = '" + CateID + "'";
		
		try {

			stmt = conn.createStatement();
			sql=this.genMySQLPagesql(pagenum, pagelen, sql);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				T_shirtTo to = new T_shirtTo();
			    to.setCateID(rs.getInt("CateID"));
			    to.setPrice(rs.getFloat("Price"));
			    to.setIntro(rs.getString("Intro"));
			    to.setSex(rs.getShort("Sex"));
			    to.setT_ShirtPath_1(rs.getString("T_ShirtPath_1"));
			    to.setT_ShirtPath_2(rs.getString("T_ShirtPath_2"));
			    to.setShirtName(rs.getString("ShirtName"));
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
	
	public int ShirtRecommended(T_shirtrecommendedTo to){
		//文化衫推荐
		StringBuffer sb = new StringBuffer("insert into t_shirtrecommended(T_ShirtID,T_RM_Order) value('" + to.getT_ShirtID() + "','" + to.getT_RM_Order() + "')");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public int cancelrecommended(int T_ShirtID){
		//取消推荐
		StringBuffer sb = new StringBuffer("delete from t_shirtrecommended where T_ShirtID = '" + T_ShirtID + "'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public boolean isRecommended(int T_ShirtID){
		//查询此文化衫是否已推荐
		Statement stmt = null;
		ResultSet rs = null;
		boolean f = false;
		String sql = "select * from t_shirtrecommended where T_ShirtID = '" + T_ShirtID + "'";
		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) f = true;
		}catch (SQLException e) {
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
		return f;
	}
	
	public int ShirtNum(){
		//获取当前文化衫ID
		Statement stmt = null;
		ResultSet rs = null;
		int T_ShirtID=-1;
		String sql = "select * from t_shirt";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				T_ShirtID = rs.getInt("T_ShirtID");
			}
		}catch (SQLException e) {
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
		return T_ShirtID;
	}
	
	public int changerStatus(int T_ShirtID,short Status){
		//修改文化衫状态
		StringBuffer sb = new StringBuffer("update t_shirt set Status='" + Status + "' where T_ShirtID = '" + T_ShirtID + "'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public Page findshirtfav(int pagenum, int pagelen, String UserID){
		//查看用户收藏文化衫
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);
		
		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from t_shirtfavourites where UserID = '" + UserID + "'";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()){
				T_shirtfavouritesTo to = new T_shirtfavouritesTo();
				to.setT_FavID(Integer.parseInt(rs.getString("T_FavID")));
				to.setT_ShirtID(rs.getInt("T_ShirtID"));
				to.setUserID(rs.getString("UserID"));
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
	
	/*public T_ShirtTo latest(Date UpTime){
		//最新入库
	}*/
}
