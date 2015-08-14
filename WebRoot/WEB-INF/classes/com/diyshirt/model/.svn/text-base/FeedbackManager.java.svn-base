package com.diyshirt.model;

import com.diyshirt.model.DAOFactory;
import com.diyshirt.model.dao.FeedbackDAO;
import com.diyshirt.to.Page;
import com.diyshirt.to.FeedbackTo;
import com.diyshirt.util.Logger;


public class FeedbackManager {

	  private static FeedbackManager instance = null;
	    
		static org.apache.log4j.Logger logger = Logger.getLogger();
		
		private FeedbackManager() {

		}

		public static FeedbackManager getInstance() {
			if (instance == null) {
				instance = new FeedbackManager();
			}
			return instance;
		}
		
		public boolean insert(FeedbackTo to) {
			FeedbackDAO dao = DAOFactory.getInstance().getFeedbackDAO();
			int c = dao.insert(to);
			dao.destroy();
			dao = null;
			if (c == 1) {
				return true;
			} else {
				return false;
			}
		}
	
		public boolean delete(String UserID){
			FeedbackDAO dao = DAOFactory.getInstance().getFeedbackDAO();
			int c = dao.delete(UserID);
			dao.destroy();
			dao = null;
			if (c == 1) {
				return true;
			} else {
				return false;
			}
		}
		
		public boolean update(FeedbackTo to) {
			FeedbackDAO dao = DAOFactory.getInstance().getFeedbackDAO();
			int c = dao.update(to);
			dao.destroy();
			dao = null;
			if (c == 1) {
				return true;
			} else {
				return false;
			}
		}
		
		public FeedbackTo findFeeByID(String UserID) {
			FeedbackDAO dao = DAOFactory.getInstance().getFeedbackDAO();
			FeedbackTo to = dao.findFeedbackByID(UserID);
			dao.destroy();
			return to;
		}
		
		public Page findFeeByPage(int pagenum, int pagelen) {
			FeedbackDAO dao = DAOFactory.getInstance().getFeedbackDAO();
		    Page page =  dao.findFeedbackByPage(pagenum, pagelen);
		    dao.destroy();
		    return page;
		}

}
