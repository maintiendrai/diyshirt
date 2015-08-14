package com.diyshirt.model.command.user;
import com.diyshirt.model.*;

import javax.servlet.http.*;

import com.diyshirt.util.*;
import com.diyshirt.to.*;
import com.diyshirt.*;
public class UserEditCommand  extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.USEREDIT;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String UserID = (String) session.getAttribute(USERID);

		if (UserID == null) {
			throw new Exception("请先登录！");
		}
		CommandResult result = new CommandResult();

		String resultPage = null;

		MemberinfoTo user = new MemberinfoTo();
		String action = request.getParameter("action");
		if (action == null)
			action = "";
		

		UserManager um =  UserManager.getInstance();

		if (action.equalsIgnoreCase("useredit")) {
			
			String userid = request.getParameter("UserID"); 
			String NickName = request.getParameter("NickName"); 
			String Age = request.getParameter("Age"); 
			String Sex = request.getParameter("Sex");  
			String Telephone = request.getParameter("Telephone"); 
			String Mobilephone = request.getParameter("Mobilephone"); 
			String Address = request.getParameter("Address"); 
			String Post = request.getParameter("Post"); 
			String QQ = request.getParameter("QQ"); 
			
			user.setUserID(userid);
			user.setNickName(NickName);
			user.setAge(Integer.parseInt(Age));
			user.setSex((short)Integer.parseInt(Sex));
			user.setTelephone(Telephone);
			user.setMobilephone(Mobilephone);
			user.setAddress(Address);
			user.setPost(Post);
			user.setQQ(QQ);
			
				boolean f=um.updateUser(user);
				if(f) {
					resultPage = ApplicationResources.SUCCESS_PAGE+"?info=修改成功";
					session.setAttribute("User", user);
				}else {
					resultPage = ApplicationResources.ERROR_PAGE+"?info=修改失败";
				}

		} else if(action.equalsIgnoreCase("updateStatus")){
			
			String userID = request.getParameter("userID"); 
			String status = request.getParameter("status"); 			
				user.setUserID(userID);
				user.setStatus((short)Integer.parseInt(status));
			um.updateUserStatus(user);
		}/*else if(action.equalsIgnoreCase("resetbbs")) { 
		//	String userID = request.getParameter("userID");
		//	logger.debug("reset "+userID+"'s bbs");
		//	if( intUsertype==  ADMIN_ROOT||intUsertype== ADMIN_MANAGER){
				
		//		user = UserManager.getInstance().findUserByID(userID) ;
				 
			}else{
				throw new Exception("权限不足！");
			}
			
			
			
		}*/else {
			
			um.userRegister(user);
		}
		
		
 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}
}
