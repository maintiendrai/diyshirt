package com.diyshirt.model.dao;
import com.diyshirt.model.DAOObject;
import com.diyshirt.to.PictureTo;
import com.diyshirt.to.PicturefavouritesTo;
import com.diyshirt.to.ReportinfoTo;
import com.diyshirt.to.T_shirtTo;

import java.util.*;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.diyshirt.to.Page;
import com.diyshirt.to.PicturerecommendedTo;

public class PictureDAO extends DAOObject{
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
	.getLogger(com.diyshirt.util.Logger.appender);
	
	public PictureDAO(){
		super();
	}
	
	public int insert(PictureTo to){
		StringBuffer sb = new StringBuffer("insert picture(PicName,UserID,PicCate,PicPath,PicTime,Status) values('" + to.getPicName() + "','" + to.getUserID() + "','" + to.getPicCate() + "','" + to.getPicPath() + "',now(),0)");
		System.out.println(sb.toString());
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public int update(PictureTo to){
		StringBuffer sb = new StringBuffer("update picture set PicName = '" + to.getPicName() + "',UserID = '" + to.getUserID() + "',PicCate = '" + to.getPicCate() + "',PicPath = '" + to.getPicPath() + "',PicTime = '" + to.getPicTime() + "'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public int delete(String PicName){
		String sql = "delete from picture where PicName = '" + PicName + "'";
		return this.executeUpdate(sql);
	}
	
	public int deletereport(int PicID){
		String sql = "delete from reportinfo where PicID = '" + PicID + "'";
		return this.executeUpdate(sql);
	}
	
	public Page findPicRCBypage(int pagenum,int pagelen){
		//查询推荐图片
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);
		
		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from picturerecommended";
		try{
			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);
			
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				PicturerecommendedTo to = new PicturerecommendedTo();
				to.setPic_RM_ID(rs.getInt("Pic_RM_ID"));
				to.setPicID(rs.getInt("PicID"));
				to.setPic_RM_Order(rs.getInt("Pic_RM_Order"));
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
	
	public Page findPictureBypage(int pagenum,int pagelen){
		//查询全部图片
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);
		
		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from picture";
		try{
			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);
			
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				PictureTo to = new PictureTo();
				to.setPicID(rs.getInt("PicID"));
				to.setPicName(rs.getString("PicName"));
				to.setPicCate(rs.getShort("PicCate"));
				to.setPicPath(rs.getString("PicPath"));
				to.setUserID(rs.getString("UserID"));
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
	
	public Page findPictureByPage(int pagenum, int pagelen, String UserID){
		//查询用户上传的图片
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);
		
		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from picture where UserID = '" + UserID + "'";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()){
				PictureTo to = new PictureTo();
				to.setPicName(rs.getString("PicName"));
				to.setPicCate(rs.getShort("PicCate"));
				to.setPicPath(rs.getString("PicPath"));
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
	
	public boolean isBingPicfav(String UserID,int PicID){
		//判断用户是否已收藏过该图片
		Statement stmt = null;
		ResultSet rs = null;
		boolean c = false;
		
		String sql = "select * from picturefavourites where UserID = '" + UserID + "' and PicID = '" + PicID + "'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) c = true;
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
		return c;
	}
	
	public int favourites(PicturefavouritesTo to){
		//收藏图片
		StringBuffer sb = new StringBuffer("insert into picturefavourites(PicID,UserID,Pic_Fav_Time) values('" + to.getPicID()+ "','" + to.getUserID() + "',now())");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public Page findPicfav(int pagenum, int pagelen, String UserID){
		//查看用户收藏图片
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);
		
		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from picturefavourites where UserID = '" + UserID + "'";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);

			rs = stmt.executeQuery(sql);
			while (rs.next()){
				PicturefavouritesTo to = new PicturefavouritesTo();
				to.setPic_FavID(Integer.parseInt(rs.getString("Pic_FavID")));
				to.setPicID(rs.getInt("PicID"));
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
	
	public int addreport(ReportinfoTo to){
		//举报图片
		StringBuffer sb = new StringBuffer("insert into reportinfo(PicID,UserID,ReportTime) values('" + to.getPicID() + "','" + to.getUserID() + "',now()" + ")");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public int recommanded(PicturerecommendedTo to){
		//推荐图片
		StringBuffer sb = new StringBuffer("insert into picturerecommended(PicID,Pic_RM_Order) value('" + to.getPicID() + "','" + to.getPic_RM_Order() + "')");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public int canclerecommanded(int PicID){
		//取消推荐
		StringBuffer sb = new StringBuffer("delete from picturerecommended where PicID = '" + PicID + "'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public boolean isrecommended(int PicID){
		//查看图片是否已推荐
		Statement stmt = null;
		ResultSet rs = null;
		boolean f = false;
		String sql = "select * from picturerecommended where PicID = '" + PicID + "'";
		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) f = true;
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
		return f;
	}
	
	public boolean isvalid(String UserID,String PicName){
		//判断指定图片是否为指定用户名所上传
		Statement stmt=null;
		ResultSet rs=null;
		String sql ="select * from picture where PicName = '" + PicName + "' and UserID = '" + UserID + "'";
		boolean flag = false;
		try{
			 stmt = conn.createStatement();
			 rs = stmt.executeQuery(sql);
			if(rs.next()) flag = true;
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
		return flag;
	}
	
	public Page findPicture(int pagenum,int pagelen,String PicName,int PicCate){
		//文化衫搜索
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from picture where ";
		
		if(PicName!=""&&PicCate!=5)
			sql += "ShirtName like '%" + PicName + "%' and PicCate='" + PicCate + "'";
		if(PicName!=""&&PicCate==5)
			sql += "ShirtName like '%" + PicName + "%'";
		if(PicName==""&&PicCate!=5)
			sql += "PicCate = '" + PicCate + "'";
		
		try {

			stmt = conn.createStatement();
			sql=this.genMySQLPagesql(pagenum, pagelen, sql);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				PictureTo to = new PictureTo();
			    to.setPicCate(rs.getShort("PicCate"));
			    to.setUserID(rs.getString("UserID"));
			    to.setPicName(rs.getString("PicName"));
			    to.setPicPath(rs.getString("PicPath"));
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
	
	public int PicNum(){
		//获取当前推荐图片ID
		Statement stmt = null;
		ResultSet rs = null;
		int Pic_RM_ID=-1;
		String sql = "select * from picturerecommended";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Pic_RM_ID = rs.getInt("Pic_RM_ID");
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
		return Pic_RM_ID;
	}
	
	public int changerStatus(int PicID,short Status){
		//修改图片衫状态
		StringBuffer sb = new StringBuffer("update picture set Status='" + Status + "' where PicID = '" + PicID + "'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public Page PicreportList(int pagenum,int pagelen){
		//查询举报图片
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList list = new ArrayList();
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		String sql = "select * from reportinfo";
		try {
			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				ReportinfoTo to = new ReportinfoTo();
				to.setReportID(rs.getInt("ReportID"));
				to.setPicID(rs.getInt("PicID"));
				to.setUserID(rs.getString("UserID"));
				list.add(to);
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
		page.setData(list);

		if (list.size() < pagelen) {
			page.setRecordNum((pagenum - 1) * pagelen + list.size());
		} else {
			page.setRecordNum(this.countResultSizeSimple(sql));
		}
		return page;
	}
	
	public PictureTo pictureintro(int PicID){
		//通过图片ID查看图片信息
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from picture where PicID = '" + PicID +"'";
		PictureTo to = new PictureTo();
		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				to.setPicID(rs.getInt("PicID"));
				to.setPicName(rs.getString("PicName"));
				to.setUserID(rs.getString("UserID"));
				to.setPicCate(rs.getShort("PicCate"));
				to.setPicPath(rs.getString("PicPath"));
				to.setStatus(rs.getShort("Status"));
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
		return to;
	}
	
	/*public PictureTo Recommended(){
		//热门推荐
	}*/
}
