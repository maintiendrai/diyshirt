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

public class PicListAllCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.PICLISTALL;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		int tag = Integer.parseInt(request.getParameter("tag"));
		Page page = PictureManager.getInstance().findPictureByPage(pageNum, 9);
		request.setAttribute("page", page);

		if (0 == tag) {
			resultPage = ApplicationResources.PICTURE_PICTURELISTALL;
		} else if (1 == tag) {
			String pic1=(String)request.getParameter("pic1");
			String pic2=(String)request.getParameter("pic2");
			String shirtid=(String)request.getParameter("shirtid");
			System.out.println(pic1);
			resultPage = "/diyshirt/DIYCustom.jsp?pic1="+pic1+"&pic2="+pic2+"&shirtid="+shirtid;
		}

		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}
}