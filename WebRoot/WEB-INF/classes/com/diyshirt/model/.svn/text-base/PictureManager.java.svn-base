package com.diyshirt.model;

import com.diyshirt.model.dao.PictureDAO;
import com.diyshirt.model.dao.ShirtDAO;
import com.diyshirt.to.*;
import com.diyshirt.util.Logger;
import java.util.List;

public class PictureManager {
	private static PictureManager instance = null;
	
	static org.apache.log4j.Logger logger = Logger.getLogger();
	
	private PictureManager(){
		
	}
	
	public static PictureManager getInstance() {
		if (instance == null) {
			instance = new PictureManager();
		}
		return instance;
	}
	
	public boolean addPicture(PictureTo Picture){
		logger.debug("addpicture...");
		PictureDAO picturedao = DAOFactory.getInstance().getPictureDAO();
		int c = picturedao.insert(Picture);
		picturedao.destroy();
		picturedao = null;
		if (c == 1) {
			return true;
		} else {
			logger.debug("addpicture failed...");
			return false;
		}
	}
	
	public boolean isBingPicfav(String UserID,int PicID){
		//判断用户是否已收藏过该图片
		PictureDAO picturedao = DAOFactory.getInstance().getPictureDAO();
		boolean c = picturedao.isBingPicfav(UserID,PicID);
		picturedao.destroy();
		picturedao = null;
		return c;
	}
	
	public boolean isrecommended(int PicID){
		//查看图片是否已推荐
		PictureDAO picturedao = DAOFactory.getInstance().getPictureDAO();
		boolean c = picturedao.isrecommended(PicID);
		picturedao.destroy();
		picturedao = null;
		return c;
	}
	
	public boolean canclerecommanded(int PicID){
		//取消推荐
		PictureDAO picturedao = DAOFactory.getInstance().getPictureDAO();
		int c = picturedao.canclerecommanded(PicID);
		picturedao.destroy();
		picturedao = null;
		if (c == 1) 
			return true;
		else 
			return false;
	}
	
	public boolean addReport(ReportinfoTo to){
		logger.debug("addreport...");
		PictureDAO picturedao = DAOFactory.getInstance().getPictureDAO();
		int c = picturedao.addreport(to);
		picturedao.destroy();
		picturedao = null;
		if(c == 1){
			return true;
		}else {
			logger.debug("addreport failed...");
			return false;
		}
	}
	
	public boolean addFavourites(PicturefavouritesTo to){
		logger.debug("addPictureFavourites...");
		PictureDAO picturefavouritesdao = DAOFactory.getInstance().getPictureDAO();
		int c = picturefavouritesdao.favourites(to);
		picturefavouritesdao.destroy();
		picturefavouritesdao = null;
		if(c == 1){
			return true;
		}else{
			logger.debug("addPictureFavourites failed...");
			return false;
		}
	}
	
	public boolean recommanded(PicturerecommendedTo to){
		logger.debug("recommanded...");
		PictureDAO picturerecommandeddao = DAOFactory.getInstance().getPictureDAO();
		int c = picturerecommandeddao.recommanded(to);
		picturerecommandeddao.destroy();
		picturerecommandeddao = null;
		if(c == 1){
			return true;
		}else{
			logger.debug("recommanded failed...");
			return false;
		}
	}
	
	public boolean updatePicture(PictureTo Picture){
		PictureDAO picturedao = DAOFactory.getInstance().getPictureDAO();
		int c = picturedao.update(Picture);
		picturedao.destroy();
		picturedao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean deletePicture(String PicName){
		PictureDAO picturedao = DAOFactory.getInstance().getPictureDAO();
		int c = picturedao.delete(PicName);
		picturedao.destroy();
		picturedao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean deletereport(int PicID){
		//删除举报信息
		PictureDAO picturedao = DAOFactory.getInstance().getPictureDAO();
		int c = picturedao.deletereport(PicID);
		picturedao.destroy();
		picturedao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public Page findPictureByPage(int pagenum,int pagelen){
		//查看所有图片
		PictureDAO dao = DAOFactory.getInstance().getPictureDAO();
		Page page = dao.findPictureBypage(pagenum, pagelen);
		dao.destroy();
		dao = null;
		return page;
	}
	
	public Page findPicRCBypage(int pagenum,int pagelen){
		//查询推荐图片
		PictureDAO dao = DAOFactory.getInstance().getPictureDAO();
		Page page = dao.findPicRCBypage(pagenum,pagelen);
		dao.destroy();
		dao = null;
		return page;
	}
	
	public Page findPicfav(int pagenum, int pagelen, String UserID){
		//查看用户收藏图片
		PictureDAO dao = DAOFactory.getInstance().getPictureDAO();
		Page page = dao.findPicfav(pagenum, pagelen, UserID);
		dao.destroy();
		dao = null;
		return page;
	}
	
	public Page PicreportList(int pagenum,int pagelen){
		//查询举报图片
		PictureDAO dao = DAOFactory.getInstance().getPictureDAO();
		Page page = dao.PicreportList(pagenum, pagelen);
		dao.destroy();
		dao = null;
		return page;
	}
	
	public Page findPictureByPage(int pagenum, int pagelen, String UserID) {
		//查看指定用户上传图片
		PictureDAO dao = DAOFactory.getInstance().getPictureDAO();
		Page page = dao.findPictureByPage(pagenum, pagelen, UserID);
		dao.destroy();
	    return page;
	}
	
	public boolean favouritesPicture(PicturefavouritesTo Picture){
		//收藏图片
		PictureDAO picturedao = DAOFactory.getInstance().getPictureDAO();
		int c = picturedao.favourites(Picture);
		picturedao.destroy();
		picturedao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public Page findPicture(int pagenum,int pagelen,String PicName,int PicCate){
		//文化衫搜索
		PictureDAO dao = DAOFactory.getInstance().getPictureDAO();
		Page page = dao.findPicture(pagenum, pagelen, PicName, PicCate);
		dao.destroy();
		return page;
	}
	
	public int PicNum(){
		//获取当前推荐图片ID
		PictureDAO dao = DAOFactory.getInstance().getPictureDAO();
		return dao.PicNum();
	}
	
	public boolean changerStatus(int PicID,short Status){
		//修改图片状态
		PictureDAO picturedao = DAOFactory.getInstance().getPictureDAO();
		int c = picturedao.changerStatus(PicID, Status);
		picturedao.destroy();
		picturedao = null;
		if(c==1)
			return true;
		else
			return false;
	}
	
	public PictureTo pictureintro(int PicID){
		//通过图片ID查看图片信息
		PictureDAO picturedao = DAOFactory.getInstance().getPictureDAO();
		PictureTo to = picturedao.pictureintro(PicID);
		picturedao.destroy();
		picturedao = null;
		return to;
	}
}
