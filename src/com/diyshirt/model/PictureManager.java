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
		//�ж��û��Ƿ����ղع���ͼƬ
		PictureDAO picturedao = DAOFactory.getInstance().getPictureDAO();
		boolean c = picturedao.isBingPicfav(UserID,PicID);
		picturedao.destroy();
		picturedao = null;
		return c;
	}
	
	public boolean isrecommended(int PicID){
		//�鿴ͼƬ�Ƿ����Ƽ�
		PictureDAO picturedao = DAOFactory.getInstance().getPictureDAO();
		boolean c = picturedao.isrecommended(PicID);
		picturedao.destroy();
		picturedao = null;
		return c;
	}
	
	public boolean canclerecommanded(int PicID){
		//ȡ���Ƽ�
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
		//ɾ���ٱ���Ϣ
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
		//�鿴����ͼƬ
		PictureDAO dao = DAOFactory.getInstance().getPictureDAO();
		Page page = dao.findPictureBypage(pagenum, pagelen);
		dao.destroy();
		dao = null;
		return page;
	}
	
	public Page findPicRCBypage(int pagenum,int pagelen){
		//��ѯ�Ƽ�ͼƬ
		PictureDAO dao = DAOFactory.getInstance().getPictureDAO();
		Page page = dao.findPicRCBypage(pagenum,pagelen);
		dao.destroy();
		dao = null;
		return page;
	}
	
	public Page findPicfav(int pagenum, int pagelen, String UserID){
		//�鿴�û��ղ�ͼƬ
		PictureDAO dao = DAOFactory.getInstance().getPictureDAO();
		Page page = dao.findPicfav(pagenum, pagelen, UserID);
		dao.destroy();
		dao = null;
		return page;
	}
	
	public Page PicreportList(int pagenum,int pagelen){
		//��ѯ�ٱ�ͼƬ
		PictureDAO dao = DAOFactory.getInstance().getPictureDAO();
		Page page = dao.PicreportList(pagenum, pagelen);
		dao.destroy();
		dao = null;
		return page;
	}
	
	public Page findPictureByPage(int pagenum, int pagelen, String UserID) {
		//�鿴ָ���û��ϴ�ͼƬ
		PictureDAO dao = DAOFactory.getInstance().getPictureDAO();
		Page page = dao.findPictureByPage(pagenum, pagelen, UserID);
		dao.destroy();
	    return page;
	}
	
	public boolean favouritesPicture(PicturefavouritesTo Picture){
		//�ղ�ͼƬ
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
		//�Ļ�������
		PictureDAO dao = DAOFactory.getInstance().getPictureDAO();
		Page page = dao.findPicture(pagenum, pagelen, PicName, PicCate);
		dao.destroy();
		return page;
	}
	
	public int PicNum(){
		//��ȡ��ǰ�Ƽ�ͼƬID
		PictureDAO dao = DAOFactory.getInstance().getPictureDAO();
		return dao.PicNum();
	}
	
	public boolean changerStatus(int PicID,short Status){
		//�޸�ͼƬ״̬
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
		//ͨ��ͼƬID�鿴ͼƬ��Ϣ
		PictureDAO picturedao = DAOFactory.getInstance().getPictureDAO();
		PictureTo to = picturedao.pictureintro(PicID);
		picturedao.destroy();
		picturedao = null;
		return to;
	}
}
