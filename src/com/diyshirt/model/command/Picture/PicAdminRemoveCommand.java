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
import com.diyshirt.to.T_shirtTo;
import com.diyshirt.util.Logger;

public class PicAdminRemoveCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.PICTUREREMOVE;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		PictureManager picture = PictureManager.getInstance();
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		int PicID = Integer.parseInt(request.getParameter("picid"));
		picture.changerStatus(PicID, (short)1);
		Page page=picture.findPictureByPage(pageNum,10);
		request.setAttribute("page", page);
		
		resultPage = "/ApplicationResources.picremove.do?operation=picremovelist&pageNum=1";
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}
}
