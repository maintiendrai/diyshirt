package com.diyshirt.model.command.user;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.UserManager;
import com.diyshirt.util.Logger;
import com.diyshirt.to.MemberinfoTo;

public class UserloginCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		CommandResult result = new CommandResult();
		String resultPage = null;
		UserManager memberuser = UserManager.getInstance();
		
		String UserID = request.getParameter("UserID");
		String Password = request.getParameter("Password");
		
		if (memberuser.isUserExist(UserID) && memberuser.valid(UserID,Password)){
			HttpSession session = request.getSession();
			session.setAttribute("UserID", UserID);
			MemberinfoTo user = memberuser.findUserByID(UserID);
			session.setAttribute("User", user);
			resultPage = ApplicationResources.USER_USERINDEX;
		}else
			resultPage = ApplicationResources.ERROR_PAGE;

		request.setAttribute("UserID", UserID);

		result.setResultPage(resultPage);
		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);
		return result;
	}
	
	public String getName() {
		return CommandFactory.USERLOGIN;
	}
}
