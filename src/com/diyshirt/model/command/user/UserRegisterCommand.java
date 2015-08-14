package com.diyshirt.model.command.user;
import com.diyshirt.model.*;

import javax.servlet.http.*;

import com.diyshirt.ApplicationResources;
import com.diyshirt.util.*;
import com.diyshirt.to.*;
public class UserRegisterCommand  extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.USERREGEDIT;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		String UserID = request.getParameter("UserID"); 
		String Password = request.getParameter("Password");

		String NickName = request.getParameter("NickName"); 
		String Age = request.getParameter("Age"); 
		String Sex = request.getParameter("Sex");
		String Telephone = request.getParameter("Telephone"); 
		String Mobilephone = request.getParameter("Mobilephone"); 
		String Address = request.getParameter("Address"); 
		String Post = request.getParameter("Post"); 
		String QQ = request.getParameter("QQ");
		
		int Feedback = 10;
		int Integral = 50;
		
		MemberinfoTo user = new MemberinfoTo();
		user.setStatus(UserManager.USER_STATUS_AVAILABLE);
		user.setUserID(UserID);
		user.setPassword(Password);
		user.setNickName(NickName);
		if(Age.equals("")){
			user.setAge(0);
		}
		else user.setAge(Integer.parseInt(Age));
		user.setSex((short)Integer.parseInt(Sex));
		user.setTelephone(Telephone);
		user.setMobilephone(Mobilephone);
		user.setAddress(Address);
		user.setPost(Post);
		user.setQQ(QQ);
		
		FeedbackTo feedback = new FeedbackTo();
		feedback.setFeedback(Feedback);
		feedback.setIntegral(Integral);
		feedback.setUserID(UserID);
		
		
		boolean flag=UserManager.getInstance().userRegister(user);
			
		if(flag==true){
			boolean flag1 = FeedbackManager.getInstance().insert(feedback);
			if(flag1==true){
			resultPage = ApplicationResources.USER_USERLOGIN;
			}
		}else{
			throw new Exception("ÓÃ»§×¢²áÊ§°Ü£¡");
		}
		
 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}
}
