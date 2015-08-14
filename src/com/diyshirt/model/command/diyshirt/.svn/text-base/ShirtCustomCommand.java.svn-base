package com.diyshirt.model.command.diyshirt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.*;
import com.diyshirt.to.*;
import com.diyshirt.util.Logger;

public class ShirtCustomCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.SHIRTCUSTOMSUCCESS;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		ShirtManager shirt = ShirtManager.getInstance();

		String PosPic = request.getParameter("PosPic");
		String NegPic = request.getParameter("NegPic");
		String PosLoc_1 = request.getParameter("PosLoc_1");
		String NegLoc_1 = request.getParameter("NegLoc_1");
		HttpSession session = request.getSession();
		String UserID = (String) session.getAttribute("UserID");
		String T_ShirtID = request.getParameter("T_ShirtID");
		String PosLoc_2 = request.getParameter("PosLoc_2");
		String NegLoc_2 = request.getParameter("NegLoc_2");
		String PosSize = request.getParameter("PosSize");
		String NegSize = request.getParameter("NegSize");
		String T_ShirtName = new String(request.getParameter("T_ShirtName")
				.getBytes("ISO8859_1"), "gbk");

		T_ShirtCustomTo to = new T_ShirtCustomTo();
		to.setPosPic(PosPic);
		to.setNegPic(NegPic);
		if (PosPic.equals("undefined")) {
			to.setPosLoc_1(0);
			to.setPosLoc_2(0);
		} else {
			to.setPosLoc_1(Integer.parseInt(PosLoc_1));
			to.setPosLoc_2(Integer.parseInt(PosLoc_2));
		}
		if (NegPic.equals("undefined")) {
			to.setNegLoc_1(0);
			to.setNegLoc_2(0);
		} else {
			to.setNegLoc_1(Integer.parseInt(NegLoc_1));
			to.setNegLoc_2(Integer.parseInt(NegLoc_2));
		}
		if (null == UserID) {
			to.setUserID("anonymous");
		} else {
			to.setUserID(UserID);
		}
		to.setT_ShirtID(Integer.parseInt(T_ShirtID));
		to.setPosSize(Integer.parseInt(PosSize));
		to.setNegSize(Integer.parseInt(NegSize));
		to.setT_ShirtName(T_ShirtName);

		if (shirt.addShirt(to)) {
			resultPage = ApplicationResources.DIYSHIRT_DIYCUSTOMSUCCESS;
		} else
			resultPage = ApplicationResources.ERROR_PAGE;

		result.setResultPage(resultPage);
		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}
}
