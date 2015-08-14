package com.diyshirt.model.command.Picture;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.PictureManager;
import com.diyshirt.model.MessageManager;
import com.diyshirt.to.Page;
import com.diyshirt.util.Logger;

public class PictureListCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.PICTURELIST;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		HttpSession session = request.getSession();
		
		String UserID = (String)session.getAttribute("UserID");
		Page mypage=PictureManager.getInstance().findPictureByPage(pageNum,12,UserID);
		request.setAttribute("mypage", mypage);
		
		resultPage = ApplicationResources.PICTURE_PICTURELIST;
		
		 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}
}