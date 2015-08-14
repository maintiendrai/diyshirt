package com.diyshirt.model;

import com.diyshirt.model.dao.PictureDAO;
import com.diyshirt.model.dao.ShirtDAO;
import com.diyshirt.to.*;
import com.diyshirt.util.Logger;
import java.util.List;

public class ShirtManager {

	private static ShirtManager instance = null;
	
	static org.apache.log4j.Logger logger = Logger.getLogger();
	
	private ShirtManager(){
		
	}
	
	public static ShirtManager getInstance() {
		if (instance == null) {
			instance = new ShirtManager();
		}
		return instance;
	}
	
	public boolean addshirt(T_shirtTo to){
		//增加文化衫
		logger.debug("addshirt...");
		ShirtDAO shirtdao = DAOFactory.getInstance().getShirtDAO();
		int c = shirtdao.insertshirt(to);
		shirtdao.destroy();
		shirtdao = null;
		if (c == 1){
			return true;
		}else{
			logger.debug("addshirt failed...");
			return false;
		}
	}
	
	public T_shirtTo shirtinfo(int T_ShirtID){
		//通过文化衫ID查看文化衫信息
		ShirtDAO shirtdao = DAOFactory.getInstance().getShirtDAO();
		T_shirtTo to = shirtdao.shirtinfo(T_ShirtID);
		shirtdao.destroy();
		shirtdao = null;
		return to;
	}
	
	public T_ShirtCustomTo diyshirtinfo(int CustomID){
		//通过定制ID查询定制文化衫详细信息
		ShirtDAO shirtdao = DAOFactory.getInstance().getShirtDAO();
		T_ShirtCustomTo to = shirtdao.diyshirtinfo(CustomID);
		shirtdao.destroy();
		shirtdao = null;
		return to;
	}
	
	public boolean deleteshirt(int T_shirtID){
		//删除文化衫
		ShirtDAO shirtdao = DAOFactory.getInstance().getShirtDAO();
		int c = shirtdao.delete(T_shirtID);
		shirtdao.destroy();
		shirtdao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean updateshirt(T_shirtTo to){
		//修改文化衫信息
		ShirtDAO shirtdao = DAOFactory.getInstance().getShirtDAO();
		int c = shirtdao.updateshirt(to);
		shirtdao.destroy();
		shirtdao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean addShirt(T_ShirtCustomTo Shirt){
		//定制文化衫
		logger.debug("addshirtcustom...");
		ShirtDAO shirtdao = DAOFactory.getInstance().getShirtDAO();
		int c = shirtdao.insertCustom(Shirt);
		shirtdao.destroy();
		shirtdao = null;
		if (c == 1) {
			return true;
		} else {
			logger.debug("addshirtcustom failed...");
			return false;
		}
	}
	
	public boolean updateShirt(T_ShirtCustomTo Shirt){
		//修改定制文化衫
		ShirtDAO shirtdao = DAOFactory.getInstance().getShirtDAO();
		int c = shirtdao.update(Shirt);
		shirtdao.destroy();
		shirtdao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean deleteShirt(int T_ShirtID){
		//删除定制文化衫
		ShirtDAO shirtdao = DAOFactory.getInstance().getShirtDAO();
		int c = shirtdao.delete(T_ShirtID);
		shirtdao.destroy();
		shirtdao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean favouritesShirt(T_shirtfavouritesTo Shirt){
		//收藏文化衫
		ShirtDAO shirtdao = DAOFactory.getInstance().getShirtDAO();
		int c = shirtdao.favourites(Shirt);
		shirtdao.destroy();
		shirtdao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public Page findShirtByPage(int pagenum,int pagelen){
		//查看所有文化衫
		ShirtDAO dao = DAOFactory.getInstance().getShirtDAO();
		Page page = dao.findShirtBypage(pagenum, pagelen);
		dao.destroy();
		dao = null;
		return page;
	}
	
	public Page findShirtRCByPage(int pagenum,int pagelen){
		//查看推荐文化衫
		ShirtDAO dao = DAOFactory.getInstance().getShirtDAO();
		Page page = dao.findShirtRCByPage(pagenum, pagelen);
		dao.destroy();
		dao = null;
		return page;
	}
	
	public Page findShirtCustomBypage(int pagenum,int pagelen){
		//查看所有定制文化衫
		ShirtDAO dao = DAOFactory.getInstance().getShirtDAO();
		Page page = dao.findShirtCustomBypage(pagenum, pagelen);
		dao.destroy();
		dao = null;
		return page;
	}
	
	public Page findShirtUserCustomBypage(int pagenum,int pagelen,String UserID){
		//查看用户定制文化衫
		ShirtDAO dao = DAOFactory.getInstance().getShirtDAO();
		Page page = dao.findUserShirtCustomBypage(pagenum, pagelen,UserID);
		dao.destroy();
		dao = null;
		return page;
	}
	
	public Page findShirt(int pagenum,int pagelen,String ShirtName,int CateID){
		//文化衫搜索
		ShirtDAO dao = DAOFactory.getInstance().getShirtDAO();
		Page page = dao.findShirt(pagenum, pagelen, ShirtName, CateID);
		dao.destroy();
		dao = null;
		return page;
	}
	
	public boolean ShirtRecommended(T_shirtrecommendedTo to){
		//文化衫推荐
		ShirtDAO shirtdao = DAOFactory.getInstance().getShirtDAO();
		int c = shirtdao.ShirtRecommended(to);
		shirtdao.destroy();
		shirtdao = null;
		if(c==1)
			return true;
		else
			return false;
	}
	
	public boolean cancelrecommended(int T_ShirtID){
		//取消推荐
		ShirtDAO shirtdao = DAOFactory.getInstance().getShirtDAO();
		int c = shirtdao.cancelrecommended(T_ShirtID);
		shirtdao.destroy();
		shirtdao = null;
		if(c==1)
			return true;
		else
			return false;
	}
	
	public int ShirtNum(){
		//获取当前文化衫ID
		ShirtDAO shirtdao = DAOFactory.getInstance().getShirtDAO();
		int c = shirtdao.ShirtNum();
		shirtdao.destroy();
		shirtdao = null;
		return c;
	}
	
	public boolean changerStatus(int T_ShirtID,short Status){
		//修改文化衫状态
		ShirtDAO shirtdao = DAOFactory.getInstance().getShirtDAO();
		int c = shirtdao.changerStatus(T_ShirtID, Status);
		shirtdao.destroy();
		shirtdao = null;
		if(c==1)
			return true;
		else
			return false;
	}
	
	public Page findshirtfav(int pagenum, int pagelen, String UserID){
		//查看用户收藏文化衫
		ShirtDAO dao = DAOFactory.getInstance().getShirtDAO();
		Page page = dao.findshirtfav(pagenum, pagelen, UserID);
		dao.destroy();
		dao = null;
		return page;
	}
	
	public boolean isRecommended(int T_ShirtID){
		ShirtDAO dao = DAOFactory.getInstance().getShirtDAO();
		boolean f = dao.isRecommended(T_ShirtID);
		dao.destroy();
		dao = null;
		return f;
	}
	
	//public T_ShirtTo latest(Date UpTime){
		//最新入库
	//}
}
