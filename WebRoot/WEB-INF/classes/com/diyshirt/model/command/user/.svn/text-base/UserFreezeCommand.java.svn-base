package com.diyshirt.model.command.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.UserManager;
import com.diyshirt.to.MemberinfoTo;
import com.diyshirt.util.Logger;

public class UserFreezeCommand extends Command {
	
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.USERFREEZE;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		String UserID = request.getParameter("UserID");
		short Status = Short.parseShort(request.getParameter("Status"));
		
		MemberinfoTo to = new MemberinfoTo();
		to.setUserID(UserID);
		to.setStatus(Status);
		
		boolean flag = UserManager.getInstance().updateUserStatus(to);
		
		if (flag == true) {
			resultPage = ApplicationResources.USER_RETURN;
		} else {
			throw new Exception("×´Ì¬ÐÞ¸ÄÊ§°Ü£¡");
		}

		result.setResultPage(resultPage);

		logger.debug(this.getName() + "'s result will be sent to "
				+ resultPage);

		
		return result;
	}

}
