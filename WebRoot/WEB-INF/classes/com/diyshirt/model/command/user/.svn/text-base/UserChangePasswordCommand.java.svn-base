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

public class UserChangePasswordCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		CommandResult result = new CommandResult();
		String resultPage = null;
		UserManager memberuser = UserManager.getInstance();
		
		HttpSession session = request.getSession();
		String UserID = (String)session.getAttribute("UserID");
		String Password = request.getParameter("pwd1");
		
		if (memberuser.changPassword(UserID, Password)){
			resultPage = ApplicationResources.USER_USERCONTROL;
		}else
			resultPage = ApplicationResources.ERROR_PAGE;

		result.setResultPage(resultPage);
		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);
		return result;
	}
	
	public String getName() {
		return CommandFactory.USERCHANGEPASSWORD;
	}
}
