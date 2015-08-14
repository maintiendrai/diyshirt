package com.diyshirt.model;

import com.diyshirt.util.*;
import com.diyshirt.to.*;
import com.diyshirt.model.dao.*;


public class UserManager {
	
	public static final short USER_STATUS_AVAILABLE = 0;//����
	public static final short USER_STATUS_FREEZE = 1;//����

	private static UserManager instance = null;

	static org.apache.log4j.Logger logger = Logger.getLogger();

	private UserManager() {

	}

	public static UserManager getInstance() {
		if (instance == null) {
			instance = new UserManager();
		}
		return instance;
	}

	public static String getStatus(short type) {
		String temp = "δ֪";
		switch (type) {
		case USER_STATUS_AVAILABLE:
			temp = "����";
			break;
		case USER_STATUS_FREEZE:
			temp = "����";
			break;
		}
		return temp;
	}

	public MemberinfoTo UserLogin(String UserID, String Password) throws Exception {
		MemberinfoDAO dao = DAOFactory.getInstance().getMemberinfoDAO();
		MemberinfoTo to = dao.findUserbyID(UserID);

		try {
			if (to != null) {
				if (to.getStatus() != USER_STATUS_AVAILABLE) {
					throw new Exception("�ʺ���ʱ�����ã������ĵȴ�����Ա��ˡ�");
				}
				if (Password.equals(to.getPassword())) {
					//dao.updateUserLoginIncrease(UserID);
					return to;
				} else {
					throw new Exception("�������");
				}
			} else {
				throw new Exception("�ʺŲ�����");
			}
		} finally {
			dao.destroy();
			dao = null;
		}
	}

	public boolean userRegister(MemberinfoTo User) {
		logger.debug("userRegister...");
		MemberinfoDAO memberdao = DAOFactory.getInstance().getMemberinfoDAO();
		boolean flag=memberdao.isUserExist(User.getUserID());
		if(flag) {
			return false;
		}
		
		MemberinfoDAO dao = DAOFactory.getInstance().getMemberinfoDAO();
		int c = dao.insert(User);
		dao.destroy();
		dao = null;
			if (c == 1) {
				return true;
			} else {
				logger.debug("userRegister failed...");
				return false;
			}
	}
 
 
 

	public boolean updateUser(MemberinfoTo User) {
		MemberinfoDAO dao = DAOFactory.getInstance().getMemberinfoDAO();
		int c = dao.update(User);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean updateUserStatus(MemberinfoTo User) {
		MemberinfoDAO dao = DAOFactory.getInstance().getMemberinfoDAO();
		int c = dao.updateStatus(User.getUserID(), User.getStatus());
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean deleteUser(String userID) {
		MemberinfoDAO dao = DAOFactory.getInstance().getMemberinfoDAO();
		int c = dao.delete(userID);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean changPassword(String UserID,String Password){
		//�޸��û�����
		MemberinfoDAO dao = DAOFactory.getInstance().getMemberinfoDAO();
		int c = dao.changPassword(UserID, Password);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

 

	public MemberinfoTo userLogin(String id, String pw) throws Exception {
		MemberinfoDAO dao = DAOFactory.getInstance().getMemberinfoDAO();
		MemberinfoTo to = dao.findUserbyID(id);
		dao.destroy();
		dao = null;
			if (to != null) {
				if (to.getStatus() != 1) {
					throw new Exception("�ʺ���ͣ��");
				}
				if (pw.equals(to.getPassword())) {
					return to;
				} else {
					throw new Exception("�������");
				}
			} else {
				throw new Exception("�ʺŲ�����");
			}
	}

	public MemberinfoTo findUserByID(String userID) {
		MemberinfoDAO dao = DAOFactory.getInstance().getMemberinfoDAO();
		MemberinfoTo user = dao.findUserbyID(userID);
		dao.destroy();
		dao = null;
		return user;
	}
	public boolean isExist(String id) {
		if(isUserExist(id)) {
			return true;
		}else {
			return false;
		}
	}

	public boolean isUserExist(String userID) {
		MemberinfoDAO dao = DAOFactory.getInstance().getMemberinfoDAO();
		boolean f = dao.isUserExist(userID);
		dao.destroy();
		dao = null;
		return f;
		 
	}
	
	public boolean valid(String UserID,String Password){
		MemberinfoDAO dao = DAOFactory.getInstance().getMemberinfoDAO();
		boolean f = dao.valid(UserID,Password);
		dao.destroy();
		dao = null;
		return f;
	}

	public Page findUserByPage(int pageNum,int pageLength) {
		MemberinfoDAO dao = DAOFactory.getInstance().getMemberinfoDAO();
		Page page = dao.findUserbyPage(pageNum, pageLength);
		dao.destroy();
		dao = null;
		return page;
	}
}
