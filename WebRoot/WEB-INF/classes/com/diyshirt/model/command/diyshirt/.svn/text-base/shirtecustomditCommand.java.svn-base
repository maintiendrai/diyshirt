package com.diyshirt.model.command.diyshirt;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.diyshirt.ApplicationResources;
import com.diyshirt.to.*;
import com.diyshirt.model.*;
import com.diyshirt.util.Logger;

public class shirtecustomditCommand extends Command{
	
	static org.apache.log4j.Logger logger = Logger.getLogger();
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		String UserID = (String) session.getAttribute(USERID);

		if (UserID == null) {
			throw new Exception("请先登录！");
		}
		CommandResult result = new CommandResult();

		String resultPage = null;
		
		T_ShirtCustomTo shirt = new T_ShirtCustomTo();
		
		String action = request.getParameter("action");
		if (action == null)
			action = "";
		
		ShirtManager sm = ShirtManager.getInstance();
		if(action.equalsIgnoreCase("update")){
			int T_ShirtID = Integer.parseInt(request.getParameter("T_ShirtID"));
			String PosPic = request.getParameter("PosPic");
			String NegPic = request.getParameter("NegPic");
			String PosLoc_1 = request.getParameter("PosLoc_1");
			String NegLoc_1 = request.getParameter("NegLoc_1");
			String PosLoc_2 = request.getParameter("PosLoc_2");
			String NegLoc_2 = request.getParameter("NegLoc_2");
			
			shirt.setT_ShirtID(T_ShirtID);
			shirt.setPosPic(PosPic);
			shirt.setNegPic(NegPic);
			shirt.setPosLoc_1(Integer.parseInt(PosLoc_1));
			shirt.setNegLoc_1(Integer.parseInt(NegLoc_1));
			shirt.setPosLoc_2(Integer.parseInt(PosLoc_2));
			shirt.setNegLoc_2(Integer.parseInt(NegLoc_2));
			
			boolean f = sm.updateShirt(shirt);
			if(f) {
				resultPage = ApplicationResources.SUCCESS_PAGE+"?info=修改成功";
			}else {
				resultPage = ApplicationResources.ERROR_PAGE+"?info=修改失败";
			}
		}
		
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}
	
	public String getName() {
		return CommandFactory.SHIRTEDIT;
	}

}