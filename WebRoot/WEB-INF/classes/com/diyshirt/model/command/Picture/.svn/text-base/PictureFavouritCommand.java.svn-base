package com.diyshirt.model.command.Picture;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.PictureManager;
import com.diyshirt.to.PicturefavouritesTo;
import com.diyshirt.util.Logger;

public class PictureFavouritCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.PICTUREFAVOURIT;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		int PicID = Integer.parseInt(request.getParameter("picid"));
		HttpSession session = request.getSession();
		String UserID = (String)session.getAttribute("UserID");

		PictureManager picture = PictureManager.getInstance();
		if(!picture.isBingPicfav(UserID, PicID)){
			PicturefavouritesTo to = new PicturefavouritesTo();
			to.setPicID(PicID);
			to.setUserID(UserID);
	
			
			boolean flag=picture.addFavourites(to);
			
			if(flag==true){
				resultPage = ApplicationResources.PICTUREFAVSUC;
			}else{
				resultPage = ApplicationResources.ERROR_PAGE;
			}
		}else resultPage = ApplicationResources.PICTUREFAVSUC;
		
 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}
}
