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
		//�����Ļ���
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
		//ͨ���Ļ���ID�鿴�Ļ�����Ϣ
		ShirtDAO shirtdao = DAOFactory.getInstance().getShirtDAO();
		T_shirtTo to = shirtdao.shirtinfo(T_ShirtID);
		shirtdao.destroy();
		shirtdao = null;
		return to;
	}
	
	public T_ShirtCustomTo diyshirtinfo(int CustomID){
		//ͨ������ID��ѯ�����Ļ�����ϸ��Ϣ
		ShirtDAO shirtdao = DAOFactory.getInstance().getShirtDAO();
		T_ShirtCustomTo to = shirtdao.diyshirtinfo(CustomID);
		shirtdao.destroy();
		shirtdao = null;
		return to;
	}
	
	public boolean deleteshirt(int T_shirtID){
		//ɾ���Ļ���
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
		//�޸��Ļ�����Ϣ
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
		//�����Ļ���
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
		//�޸Ķ����Ļ���
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
		//ɾ�������Ļ���
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
		//�ղ��Ļ���
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
		//�鿴�����Ļ���
		ShirtDAO dao = DAOFactory.getInstance().getShirtDAO();
		Page page = dao.findShirtBypage(pagenum, pagelen);
		dao.destroy();
		dao = null;
		return page;
	}
	
	public Page findShirtRCByPage(int pagenum,int pagelen){
		//�鿴�Ƽ��Ļ���
		ShirtDAO dao = DAOFactory.getInstance().getShirtDAO();
		Page page = dao.findShirtRCByPage(pagenum, pagelen);
		dao.destroy();
		dao = null;
		return page;
	}
	
	public Page findShirtCustomBypage(int pagenum,int pagelen){
		//�鿴���ж����Ļ���
		ShirtDAO dao = DAOFactory.getInstance().getShirtDAO();
		Page page = dao.findShirtCustomBypage(pagenum, pagelen);
		dao.destroy();
		dao = null;
		return page;
	}
	
	public Page findShirtUserCustomBypage(int pagenum,int pagelen,String UserID){
		//�鿴�û������Ļ���
		ShirtDAO dao = DAOFactory.getInstance().getShirtDAO();
		Page page = dao.findUserShirtCustomBypage(pagenum, pagelen,UserID);
		dao.destroy();
		dao = null;
		return page;
	}
	
	public Page findShirt(int pagenum,int pagelen,String ShirtName,int CateID){
		//�Ļ�������
		ShirtDAO dao = DAOFactory.getInstance().getShirtDAO();
		Page page = dao.findShirt(pagenum, pagelen, ShirtName, CateID);
		dao.destroy();
		dao = null;
		return page;
	}
	
	public boolean ShirtRecommended(T_shirtrecommendedTo to){
		//�Ļ����Ƽ�
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
		//ȡ���Ƽ�
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
		//��ȡ��ǰ�Ļ���ID
		ShirtDAO shirtdao = DAOFactory.getInstance().getShirtDAO();
		int c = shirtdao.ShirtNum();
		shirtdao.destroy();
		shirtdao = null;
		return c;
	}
	
	public boolean changerStatus(int T_ShirtID,short Status){
		//�޸��Ļ���״̬
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
		//�鿴�û��ղ��Ļ���
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
		//�������
	//}
}
