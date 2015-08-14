package com.diyshirt.model.command.Picture;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.PictureManager;
import com.diyshirt.to.Page;
import com.diyshirt.util.Logger;

public class PicFavListCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.PICFAVLIST;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		HttpSession session = request.getSession();
		String UserID = (String)session.getAttribute("UserID");
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		Page page=PictureManager.getInstance().findPicfav(pageNum,10,UserID);
		request.setAttribute("page", page);
		
		resultPage = ApplicationResources.PICTURE_PICTUREFAVLIST;
		
		 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}

}
