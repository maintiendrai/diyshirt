package com.diyshirt.model.command.Picture;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.PictureManager;
import com.diyshirt.to.Page;
import com.diyshirt.util.Logger;

public class PicAddListCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.PICADDLIST;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		Page page=PictureManager.getInstance().findPictureByPage(pageNum,10);
		request.setAttribute("page", page);
		
		resultPage = ApplicationResources.PICTURE_PICTUREALLADMIN;
		
		 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}

}
