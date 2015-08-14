package com.diyshirt.model.command.diyshirt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.diyshirt.ApplicationResources;
import com.diyshirt.model.Command;
import com.diyshirt.model.CommandFactory;
import com.diyshirt.model.CommandResult;
import com.diyshirt.model.ShirtManager;
import com.diyshirt.to.T_ShirtCustomTo;
import com.diyshirt.util.Logger;

public class shirtCustomAddCommand extends Command{
	
	static org.apache.log4j.Logger logger = Logger.getLogger();
	
	public String getName() {
		return CommandFactory.DIYSHIRTADD;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		HttpSession session = request.getSession();
		String UserID = (String)session.getAttribute("UserID");
		
		String PosPic = request.getParameter("PosPic");
		String NegPic = request.getParameter("NegPic");
		String PosLoc_1 = request.getParameter("PosLoc_1");
		String NegLoc_1 = request.getParameter("NegLoc_1");
		int T_ShirtID = Integer.parseInt(request.getParameter("T_ShirtID"));
		String PosLoc_2 = request.getParameter("PosLoc_2");
		String NegLoc_2 = request.getParameter("NegLoc_2");
		
		T_ShirtCustomTo to = new T_ShirtCustomTo();
		to.setPosPic(PosPic);
		to.setNegPic(NegPic);
		to.setPosLoc_1(Integer.parseInt(PosLoc_1));
		to.setNegLoc_1(Integer.parseInt(NegLoc_1));
		to.setT_ShirtID(T_ShirtID);
		to.setPosLoc_2(Integer.parseInt(PosLoc_2));
		to.setNegLoc_2(Integer.parseInt(NegLoc_2));
		to.setUserID(UserID);
		
		boolean flag=ShirtManager.getInstance().addShirt(to);
		
		if(flag==true){
			resultPage = ApplicationResources.DIYSHIRT_DIYADD;
		}else{
			throw new Exception("ŒƒªØ…¿ÃÌº” ß∞‹£°");
		}
 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}
}
