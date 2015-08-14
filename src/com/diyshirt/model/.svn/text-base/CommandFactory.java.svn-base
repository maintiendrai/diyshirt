package com.diyshirt.model;

import java.util.*;

import com.diyshirt.model.command.Administrator.*;
import com.diyshirt.model.command.Orders.*;
import com.diyshirt.model.command.Manufacturersinfo.*;
import com.diyshirt.model.command.Feedback.*;
import com.diyshirt.model.command.Message.*;
import com.diyshirt.model.command.user.*;
import com.diyshirt.model.command.Picture.*;
import com.diyshirt.model.command.diyshirt.*;
import com.diyshirt.util.Logger;

public class CommandFactory {
	private static HashMap commandTimes = new HashMap();

	private static HashMap commandUsedTime = new HashMap();

	public static final String REDIRECT = "redirect";

	public static final String LOGIN = "login";

	public static final String LOGOUT = "logout";

	public static final String SEARCH = "search";

	public static final String NOTICE_LIST = "noticelist";

	public static final String NOTICE_EDIT = "noticeedit";

	public static final String NOTICE_MANAGER_DETAIL = "noticemanagerdetail";

	public static final String NOTICE = "notice";

	public static final String NOTICE_DETAIL = "noticedetail";

	public static final String RECOMMEND = "recommend";

	public static final String EXPERT_DETAIL = "expertdetail";

	public static final String EXPERT_EDIT = "expertedit";

	public static final String EXPERT_INFO = "expertinfo";

	public static final String EXPERT_REGISTER = "expertregister";

	public static final String USER_REGISTER = "userregister";

	public static final String USER_DETAIL = "userdetail";

	public static final String USER_EDIT = "useredit";

	public static final String USER_LIST = "userlist";

	public static final String TRAINING_DETAIL = "trainingdetail";

	public static final String WORK_DETAIL = "workdetail";

	public static final String WANTED_ORDER = "wantedorder";

	public static final String WANTED_DETAIL = "wanteddetail";

	public static final String WANTED_EDIT = "wantededit";

	public static final String WANTED_LIST = "wantedlist";

	public static final String SEND_MESSAGE = "sendmessage";

	public static final String LIST_MESSAGE = "listmessage";

	public static final String MESSAGE_DETAIL = "messagedetail";

	public static final String TRAINING_ORDER = "trainingorder";

	public static final String TRAINING_EDIT = "trainingedit";

	public static final String TRAINING_LIST = "traininglist";

	public static final String WORK_ORDER = "workorder";

	public static final String WORK_EDIT = "workedit";

	public static final String WORK_LIST = "worklist";

	public static final String EXPERT_BASIC_MODIFY = "expertbasicmodify";

	public static final String EXPERT_FLEXIBLE_MODIFY = "expertflexiblemodify";

	public static final String EXPERT_LIST = "expertlist";

	public static final String EXPERT_LEVEL = "expertlevel";

	public static final String USER_LEVEL = "userlevel";

	public static final String CHANGE_PASSWORD = "changepassword";

	public static final String RESET_PASSWORD = "resetpassword";

	public static final String UPLOAD_EXPERT_IMAGE = "uploadimage";

	public static final String ORDER_LIST = "orderlist";

	public static final String ORDER_UNDOEN_LIST = "orderundonelist";

	public static final String ORDER_DETAIL = "orderdetail";

	public static final String ORDER_EDIT = "orderedit";

	public static final String ORDER_QUALITY = "orderquality";

	public static final String ORDER_QUALITY_LIST = "orderqualitylist";

	public static final String WANTED_APPLY = "wantedapply";

	public static final String INBILL_LIST = "inbilllist";

	public static final String OUTBILL_LIST = "outbilllist";

	public static final String INBILL_EDIT = "inbilledit";

	public static final String OUTBILL_EDIT = "outbilledit";

	public static final String EXPERT_MOD_LIST = "expertmodlist";

	public static final String EXPERT_MOD_DETAIL = "expertmoddetail";

	public static final String EXPERT_MOD_EDIT = "expertmodedit";

	public static final String RECOMMEND_LIST = "recommendlist";

	public static final String RECOMMEND_EDIT = "recommendedit";

	public static final String RECOMMEND_DETAIL = "recommenddetail";

	public static final String MANAGER_LIST = "managerlist";

	public static final String MANAGER_EDIT = "manageredit";

	public static final String MANAGER_DETAIL = "managerdetail";

	public static final String ADVERTISE_LIST = "advertiselist";

	public static final String ADVERTISE_EDIT = "advertiseedit";

	public static final String ADVERTISE_DETAIL = "advertisedetail";
	
	
	public static final String LINK_LIST = "linklist";

	public static final String LINK_EDIT = "linkedit";

	public static final String LINK_DETAIL = "linkdetail";
	public static final String LINK_APPLY = "linkapply";
	public static final String LINK_GO = "linkgo";

	public static final String VIPREQUEST_LIST = "viprequestlist";

	public static final String VIPREQUEST_EDIT = "viprequestedit";

	public static final String COMMENT_LIST = "commentlist";
	
	public static final String MESSAGE_ADD = "messageadd";          //公告新增
	
	public static final String MESSAGE_EDIT = "messageedit";        //公告修改
	
	public static final String MESSAGE_DELETE = "messagedelete";    //公告删除
	
	public static final String MESSAGE_LIST = "messagelist";        //公告列表
	 
	public static final String MESSAGE_QUERY = "messagequery";      //公告查看
	
	public static final String ORDERS_ADD = "ordersadd";            //订单新增
	
	public static final String ORDERS_EDIT = "ordersedit";          //订单修改
	
	public static final String ORDERS_DELETE = "ordersdelete";      //订单删除
	
	public static final String ORDERS_LIST = "orderslist";          //订单列表
	
	public static final String ORDERS_QUERY = "ordersquery";        //订单查看
	
	public static final String FEEDBACK_EDIT = "feedbackedit";      //积分修改

	public static final String FEEDBACK_LIST = "feedbacklist";      //积分列表
	
	public static final String FEEDBACK_QUERY = "feedbackquery";    //积分查看
	
	public static final String MANUFACTURERSINFO_ADD = "manufacturersinfoadd";        //厂商信息新增
	
	public static final String MANUFACTURERSINFO_EDIT = "manufacturersinfoedit";       //厂商信息修改
	
	public static final String MANUFACTURERSINFO_DELETE = "manufacturersinfodelete";   //厂商信息删除
	
	public static final String MANUFACTURERSINFO_LIST = "manufacturersinfolist";       //厂商信息列表
	
	public static final String MANUFACTURERSINFO_QUERY = "manufacturersinfoquery";       //厂商信息查看
	
	public static final String MANUFACTURERSINFO_CHANGE = "manufacturersinfochange";       //厂商选定
	
	public final static String USERREGEDIT = "userregedit";          //用户注册
	public final static String USERLOGIN = "userlogin";              //用户登录
	public final static String USERCHANGEPASSWORD = "changepwd";     //修改用户密码
	public final static String USEREDIT = "useredit";                //用户资料修改
	public final static String USERLIST = "userlist";                //用户列表
	public final static String USERQUERY = "userquery";              //用户查看
	public final static String USERFREEZE = "userfreeze";            //用户状态修改
	public final static String USERDEL = "userdel";               //用户删除
	
	public final static String PICTURELIST = "picturelist";          //指定用户上传图片列表
	public final static String PICLISTALL = "picturelistall";        //全部图片列表
	public final static String PICTUREFAVOURIT = "picturefavarit";   //收藏图片
	public final static String PICTUREREPORT = "picturereport";      //图片举报
	public final static String PICADDLIST = "picaddlist";            //管理员查看图片
	public final static String PICFAVLIST = "picfavlist";            //查看用户收藏图片
	public final static String PICTURERECOMMANDED = "picrecommended";//推荐图片
	public final static String PICTURESEARCH = "picturesearch";      //图片搜索
	public final static String RECOMMENDED="recommended";            //图片推荐成功
	public final static String PICREMOVELIST = "picremovelist";      //图片删除列表
	public final static String PICTUREREMOVE = "pictureremove";      //图片删除
	public final static String PICTUREREPORTLIST = "reportlist";     //图片举报列表
	public final static String PICTURETREAT = "picturetreat";        //图片举报处理
	public final static String PICTURERCSHOW="picturercshow";        //首頁图片推荐显示
	
	public final static String DIYSHIRTCUSTOM = "diyshirtcustom";    //文化衫定制
	public final static String DIYSHIRTADD = "diyshirtadd";          //增加文化衫
	public final static String DIYSHIRTLISTALL = "diyshirtlistall";  //查询全部文化衫
	public final static String SHIRTDEL = "shirtdel";                //删除文化衫
	public final static String SHIRTEDIT = "shirtedit";              //修改文化衫
	public final static String SHIRTRECOMMENDED = "shirtrecommended";  //文化衫推荐前表
	public final static String SHIRTCOMMENDED = "shirtcommended";  //文化衫推荐
	public final static String SHIRTCUSTOMSUCCESS = "shirtcustomsuccess";//文化衫定制成功
	public final static String DIYSHIRTCUSTOMLISTALL = "diyshirtcustomlistall";//查询全部定制文化衫
	public final static String SHIRTCOMMENDSHOW = "shirtcommendshow";//显示文化衫推荐
	public final static String DIYSEARCH = "diysearch";               //文化衫搜索
	public final static String DIYSHIRTEDIT ="shirteditalong";        //文化衫编辑
	public final static String DIYSHIRTSTATUS = "shirtstatus";        //文化衫状态修改
	public final static String DIYSHIRTFAVLIST = "shirtfavlist";      //查看用户收藏文化衫
	public final static String DIYSHIRTUSERCUSTOMLIST = "shirtusercustomlist";//查看用户定制文化衫
	  

	
	public final static String  ADMIN_LOGIN="adminlogin";  //管理员登录
	public final static String  ADMIN_LIST="adminlist";    //管理员列表
	public final static String  ADMIN_EDIT="adminedit";    //管理员修改
	public final static String  ADMIN_QUERY="adminquery";  //管理员查看
	public final static String  ADMIN_DELETE="admindelete";//管理员删除
	public final static String  ADMIN_ADD="adminadd";      //管理员添加


	  public final static String SHOWIT="showit";
	
	  public final static String EDITIT= "editit";
	  
	  public final static String DELIT= "delit";
	  
	  
	  public final static String  UPDATEIT="updateit";//修改信息
	  
	  public final static String  ITINFOUP= "itinfoup";//修改个人基本信息
	  

public final static String SHIRTUPLOAD="shirtupload";  //文化衫上传
	  
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.diyshirt.util.Logger.appender);

	private static CommandFactory instance = null;

	private HashMap commands = new HashMap();

	private CommandFactory() {

		//ChangePasswordCommand changePasswordCommand = new ChangePasswordCommand();
		//commands.put(changePasswordCommand.getName().toLowerCase(),
		//		changePasswordCommand);
 

		//UploadImageCommand uploadImageCommand = new UploadImageCommand();
		//commands.put(uploadImageCommand.getName().toLowerCase(),
		//		uploadImageCommand);


		UserEditCommand userEditCommand = new UserEditCommand();
		commands.put(userEditCommand.getName().toLowerCase(), userEditCommand);

		UserRegisterCommand userRegisterCommand = new UserRegisterCommand();
		commands.put(userRegisterCommand.getName().toLowerCase(),
				userRegisterCommand);
		
		UserLogoutCommand userLogoutCommand = new UserLogoutCommand();   //用户注销
		commands.put(userLogoutCommand.getName().toLowerCase(),
				userLogoutCommand);
        
		OrdersAddCommand OrdersAddCommand = new OrdersAddCommand();      //订单新增
		commands.put(OrdersAddCommand.getName().toLowerCase(),
				OrdersAddCommand);
		
		OrdersListCommand OrdersListCommand = new OrdersListCommand();   //订单列表
		commands.put(OrdersListCommand.getName().toLowerCase(),
				OrdersListCommand);
		
		OrdersEditCommand OrdersEditCommand = new OrdersEditCommand();   //订单修改
		commands.put(OrdersEditCommand.getName().toLowerCase(),
				OrdersEditCommand);
		
		OrdersDelCommand OrdersDelCommand = new OrdersDelCommand();      //订单删除
		commands.put(OrdersDelCommand.getName().toLowerCase(),
				OrdersDelCommand);
		
		OrdersQueryCommand OrdersQueryCommand=new OrdersQueryCommand();  //订单查看（user）
		commands.put(OrdersQueryCommand.getName().toLowerCase(),
				OrdersQueryCommand);
		
		MessageAddCommand MessageAddCommand = new MessageAddCommand();      //公告新增
		commands.put(MessageAddCommand.getName().toLowerCase(),
				MessageAddCommand);
		
		MessageListCommand MessageListCommand = new MessageListCommand();   //公告列表
		commands.put(MessageListCommand.getName().toLowerCase(),
				MessageListCommand);
		
		MessageEditCommand MessageEditCommand = new MessageEditCommand();   //公告修改
		commands.put(MessageEditCommand.getName().toLowerCase(),
				MessageEditCommand);
		
		MessageDelCommand MessageDelCommand = new MessageDelCommand();      //公告删除
		commands.put(MessageDelCommand.getName().toLowerCase(),
				MessageDelCommand);
		
		MessageQueryCommand MessageQueryCommand=new MessageQueryCommand();  //公告查看
		commands.put(MessageQueryCommand.getName().toLowerCase(),
				MessageQueryCommand);
		
		ManufacturersinfoAddCommand ManufacturersinfoAddCommand = new ManufacturersinfoAddCommand();      //厂商信息新增
		commands.put(ManufacturersinfoAddCommand.getName().toLowerCase(),
				ManufacturersinfoAddCommand);
		
		ManufacturersinfoListCommand ManufacturersinfoListCommand = new ManufacturersinfoListCommand();   //厂商信息列表
		commands.put(ManufacturersinfoListCommand.getName().toLowerCase(),
				ManufacturersinfoListCommand);
		
		ManufacturersinfoEditCommand ManufacturersinfoeditCommand = new ManufacturersinfoEditCommand();   //厂商信息修改
		commands.put(ManufacturersinfoeditCommand.getName().toLowerCase(),
				ManufacturersinfoeditCommand);
		
		ManufacturersinfoDelCommand ManufacturersinfoDelCommand = new ManufacturersinfoDelCommand();      //厂商信息删除
		commands.put(ManufacturersinfoDelCommand.getName().toLowerCase(),
				ManufacturersinfoDelCommand);
		
		ManufacturersinfoQueryCommand ManufacturersinfoQueryCommand = new ManufacturersinfoQueryCommand();      //厂商信息查看
		commands.put(ManufacturersinfoQueryCommand.getName().toLowerCase(),
				ManufacturersinfoQueryCommand);
		
		ManufacturersinfoChangeCommand ManufacturersinfoChangeCommand = new ManufacturersinfoChangeCommand();      //厂商信息查看
		commands.put(ManufacturersinfoChangeCommand.getName().toLowerCase(),
				ManufacturersinfoChangeCommand);
		
		FeedbackListCommand FeedbackListCommand = new FeedbackListCommand();   //积分列表
		commands.put(FeedbackListCommand.getName().toLowerCase(),
				FeedbackListCommand);
		
		FeedbackEditCommand FeedbackEditCommand = new FeedbackEditCommand();   //积分修改
		commands.put(FeedbackEditCommand.getName().toLowerCase(),
				FeedbackEditCommand);
		
		FeedbackQueryCommand FeedbackQueryCommand=new FeedbackQueryCommand();  //积分查看（user）
		commands.put(FeedbackQueryCommand.getName().toLowerCase(),
				FeedbackQueryCommand);
	    
		UserDelCommand userdelCommand=new UserDelCommand();//用户删除
		commands.put(userdelCommand.getName().toLowerCase(), userdelCommand);
		
		UserRegisterCommand userregeditCommand = new UserRegisterCommand();//用户注册
		commands.put(userregeditCommand.getName().toLowerCase(), userregeditCommand);
		
		UserloginCommand userloginCommand = new UserloginCommand();//用户登录
		commands.put(userloginCommand.getName().toLowerCase(),userloginCommand);
		
		UserEditCommand usereditCommand = new UserEditCommand();//用户资料修改
		commands.put(usereditCommand.getName().toLowerCase(), usereditCommand);
		
		UserFreezeCommand userfreezeCommand = new UserFreezeCommand();//用户状态修改
		commands.put(userfreezeCommand.getName().toLowerCase(), userfreezeCommand);
		
		UserChangePasswordCommand userchangepasswordCommand = new UserChangePasswordCommand();//用户密码修改
		commands.put(userchangepasswordCommand.getName().toLowerCase(), userchangepasswordCommand);
		
		UserListCommand userListCommand = new UserListCommand();//用户列表
		commands.put(userListCommand.getName().toLowerCase(), userListCommand);
		
		UserQueryCommand userQueryCommand = new UserQueryCommand();//用户查看
		commands.put(userQueryCommand.getName().toLowerCase(), userQueryCommand);
		
		AdminLoginCommand adminloginCommand = new AdminLoginCommand();//管理员登录
		commands.put(adminloginCommand.getName().toLowerCase(),adminloginCommand);
		
		AdminAddCommand adminaddCommand = new AdminAddCommand();//管理员添加
		commands.put(adminaddCommand.getName().toLowerCase(),adminaddCommand);
		
		AdminListCommand adminlistCommand = new AdminListCommand();//管理员列表
		commands.put(adminlistCommand.getName().toLowerCase(),adminlistCommand);
		
		AdminQueryCommand adminqueryCommand = new AdminQueryCommand();//管理员查看
		commands.put(adminqueryCommand.getName().toLowerCase(),adminqueryCommand);
		
		AdminEditCommand admineditCommand = new AdminEditCommand();//管理员修改
		commands.put(admineditCommand.getName().toLowerCase(),admineditCommand);
		
		AdminDeleteCommand admindeleteCommand = new AdminDeleteCommand();//管理员删除
		commands.put(admindeleteCommand.getName().toLowerCase(),admindeleteCommand);
		
		PictureListCommand picturelistCommand = new PictureListCommand();//查看指定用户上传图片列表
		commands.put(picturelistCommand.getName().toLowerCase(),picturelistCommand);
		
		PicListAllCommand piclistCommand = new PicListAllCommand();//查看所有图片
		commands.put(piclistCommand.getName().toLowerCase(),piclistCommand);
		
		PictureFavouritCommand picturefavouritCommand = new PictureFavouritCommand();//收藏图片
		commands.put(picturefavouritCommand.getName().toLowerCase(), picturefavouritCommand);
		
		PictureReportCommand picturereportCommand = new PictureReportCommand();//举报图片
		commands.put(picturereportCommand.getName().toLowerCase(), picturereportCommand);
		
		PicAddListCommand picaddlistCommand = new PicAddListCommand();//管理员查看图片
		commands.put(picaddlistCommand.getName().toLowerCase(),picaddlistCommand);
		
		PictureSearchCommand picturesearchCommand = new PictureSearchCommand();//图片搜索
		commands.put(picturesearchCommand.getName().toLowerCase(),picturesearchCommand);
		
		PictureRCCommand picturerccommand = new PictureRCCommand();//推荐图片
		commands.put(picturerccommand.getName().toLowerCase(),picturerccommand);
		
		PicRCsuccCommand picturercsuccCommand = new PicRCsuccCommand();//图片推荐成功
		commands.put(picturercsuccCommand.getName().toLowerCase(),picturercsuccCommand);
		
		PicCustomCommand piccustomCommand = new PicCustomCommand();//文化衫定制页面
		commands.put(piccustomCommand.getName().toLowerCase(),piccustomCommand);
		
		PicAdminRemoveListCommand picadminremovelistCommand = new PicAdminRemoveListCommand();//图片管理列表
		commands.put(picadminremovelistCommand.getName().toLowerCase(),picadminremovelistCommand);
		
		PicReportListCommand picreportlistCommand = new PicReportListCommand();//图片举报列表
		commands.put(picreportlistCommand.getName().toLowerCase(),picreportlistCommand);
		
		PicAdminRemoveCommand picadminremoveCommand = new PicAdminRemoveCommand();//图片删除
		commands.put(picadminremoveCommand.getName().toLowerCase(),picadminremoveCommand);
		
		PicturetreatCommand picturetreatCommand = new PicturetreatCommand();//图片举报处理
		commands.put(picturetreatCommand.getName().toLowerCase(),picturetreatCommand);
		
		PicFavListCommand picfavlistCommand = new PicFavListCommand();//查看用户收藏图片列表
		commands.put(picfavlistCommand.getName().toLowerCase(),picfavlistCommand);
		
		PictureRCShowCommand picturercshowCommand = new PictureRCShowCommand();//查看用户收藏图片列表
		commands.put(picturercshowCommand.getName().toLowerCase(),picturercshowCommand);
		
		ShirtListAllCommand shirtlistallCommand = new ShirtListAllCommand();//全部文化衫列表
		commands.put(shirtlistallCommand.getName().toLowerCase(), shirtlistallCommand);
		
		ShirtCustomCommand shirtcustomCommand = new ShirtCustomCommand();//文化衫定制成功
		commands.put(shirtcustomCommand.getName().toLowerCase(),shirtcustomCommand);
		
		ShirtCustomListCommand shirtcustomlistCommand = new ShirtCustomListCommand();//全部定制文化衫列表
		commands.put(shirtcustomlistCommand.getName().toLowerCase(),shirtcustomlistCommand);
		
		ShirtCommendedCommand shirtcommendedCommand = new ShirtCommendedCommand();//文化衫推荐
		commands.put(shirtcommendedCommand.getName().toLowerCase(),shirtcommendedCommand);

		ShirtSearchCommand shirtsearchCommand = new ShirtSearchCommand();//文化衫搜索
		commands.put(shirtsearchCommand.getName().toLowerCase(),shirtsearchCommand);
		
		ShirtRecommendedCommand shirtrecommendedCommand = new ShirtRecommendedCommand();//文化衫推荐成功
		commands.put(shirtrecommendedCommand.getName().toLowerCase(),shirtrecommendedCommand);
		
		ShirtCommendShowCommand shirtcommendshowCommand = new ShirtCommendShowCommand();//文化衫推荐页面显示
		commands.put(shirtcommendshowCommand.getName().toLowerCase(),shirtcommendshowCommand);
		
		ShirtEditCommand shirteditCommand = new ShirtEditCommand();//文化衫管理
		commands.put(shirteditCommand.getName().toLowerCase(),shirteditCommand);
		
		ShirtEditalongCommand shirteditalongCommand = new ShirtEditalongCommand();//文化衫编辑
		commands.put(shirteditalongCommand.getName().toLowerCase(),shirteditalongCommand);
		
		ShirtChangeStatusCommand shirtchangestatusCommand = new ShirtChangeStatusCommand();//文化衫状态修改
		commands.put(shirtchangestatusCommand.getName().toLowerCase(),shirtchangestatusCommand);
		
		ShirtFavListCommand shirtfavlistCommand = new ShirtFavListCommand();//查看用户收藏文化衫
		commands.put(shirtfavlistCommand.getName().toLowerCase(),shirtfavlistCommand);
		
		ShirtUserCustomListCommand shirtusercustomlistCommand = new ShirtUserCustomListCommand();//查看用户定制文化衫列表
		commands.put(shirtusercustomlistCommand.getName().toLowerCase(),shirtusercustomlistCommand);
		
		ShirtUploadCommand shirtuploadCommand = new ShirtUploadCommand();//文化衫上传
		commands.put(shirtuploadCommand.getName().toLowerCase(),shirtuploadCommand);
	}

	public static CommandFactory getInstance() {
		if (instance == null)
			instance = new CommandFactory();
		return instance;
	}

	public Command create(String cmdType) {
		// System.out.println("Command: "+cmdType);
		String commandName = cmdType.toLowerCase();

		Command cmd = (Command) commands.get(commandName);

		if (cmd != null) {
			if (commandTimes.containsKey(commandName)) {
				long t = ((Long) commandTimes.get(commandName)).longValue();
				commandTimes.put(commandName, new Long(t + 1));
				
			} else {
				commandTimes.put(commandName, new Long(1));
			}
		}
		return cmd;
	}

	public static void commandUsedTime(String commandName, long usedtime) {
		if (commandUsedTime.containsKey(commandName)) {
			long t = ((Long) commandUsedTime.get(commandName)).longValue();
			commandUsedTime.put(commandName, new Long(t + usedtime));
		} else {
			commandUsedTime.put(commandName, new Long(usedtime));
		}
	}

	public static void showCommandHistory() {
		logger.info("showCommandHistory...");
		logger.info("Commands invoked times: "+commandTimes.toString());
		logger.info("Commands cost time (ms): "+commandUsedTime.toString());
		logger.info("showCommandHistory end.");
	}

}
