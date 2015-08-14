package com.diyshirt.model.command.Picture;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.*;
import com.diyshirt.to.*;
import com.diyshirt.util.Logger;

public class PicRCsuccCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();
	
	public String getName() {
		return CommandFactory.RECOMMENDED;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		CommandResult result = new CommandResult();
		String resultPage = null;
		PictureManager picture = PictureManager.getInstance();
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String act = request.getParameter("act");
		Page page=PictureManager.getInstance().findPictureByPage(pageNum,9);
		request.setAttribute("page", page);
		PicturerecommendedTo to = new PicturerecommendedTo();
		int Pic_RCid = picture.PicNum();
		boolean f = false;
		String PicID = request.getParameter("picid");

		if(act.equals("recommended")){
			to.setPicID(Integer.parseInt(PicID));
			to.setPic_RM_Order(Pic_RCid+1);
			f = picture.recommanded(to);
		}
		if(act.equals("canclerecommended")){
			f = picture.canclerecommanded(Integer.parseInt(PicID));
		}
		
		if(f){
			resultPage = ApplicationResources.PICTURE_RCLIST;
		}else 
			resultPage = ApplicationResources.ERROR_PAGE;
		
		result.setResultPage(resultPage);
		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);
		
		return result;
	}
}
