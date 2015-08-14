package com.diyshirt.model;

import com.diyshirt.util.*;
import java.security.Security;
import java.util.*;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class MailManager {
	class MailThread extends Thread {
		String receiverMail, subject, content;

		MailThread(String receiverMail, String subject, String content) {
			this.receiverMail = receiverMail;
			this.subject = subject;
			this.content = content;
		}

		public void run() {
			try {
				gmailSender(receiverMail, subject, content);
			} catch (Exception e) {
				logger.error("send mail to " + receiverMail + " failed: "
						+ e.toString());
			}
		}
	}

	class MutiMailThread extends Thread {
		List receiverMails;

		String subject, content;

		MutiMailThread(List receiverMails, String subject, String content) {
			this.receiverMails = receiverMails;
			this.subject = subject;
			this.content = content;
		}

		public void run() {

			Iterator it = receiverMails.iterator();
			while (it.hasNext()) {
				String receiverMail = (String) it.next();
				try {
					gmailSender(receiverMail, subject, content);
				} catch (Exception e) {
					logger.error("send mail to " + receiverMail + " failed: "
							+ e.toString());
				}
			}

		}
	}

	private static MailManager instance = null;

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.diyshirt.util.Logger.appender);

	public static String javamail_address = "qunyingnet@gmail.com";

	public static String javamail_password = "";

	public static boolean useProxy = false;

	public static String proxy_ip = "192.168.10.45";

	public static String proxy_port = "1080";

	private MailManager() {

	}

	public void startSendMail(String receiverMail, String subject,
			String content) {
		Thread t = new MailThread(receiverMail, subject, content);
		t.start();
	}

	public void startSendMail(List receiverMails, String subject, String content) {
		Thread t = new MutiMailThread(receiverMails, subject, content);
		t.start();

	}

	public static MailManager getInstance() {
		if (instance == null) {
			instance = new MailManager();
			String javamail_proxy = ConfigManager
					.getPropValue("javamail_proxy");
			if (javamail_proxy != null) {
				if (javamail_proxy.equalsIgnoreCase("true")) {
					useProxy = true;
				}
			} else {
				useProxy = false;
			}
			proxy_ip = ConfigManager.getPropValue("javamail_proxy_ip");
			proxy_port = ConfigManager.getPropValue("javamail_proxy_port");
			javamail_address = ConfigManager.getPropValue("javamail_address");
			javamail_password = ConfigManager.getPropValue("javamail_password");
		}
		return instance;
	}

	private void gmailSender(String receiverMail) throws AddressException,
			MessagingException {
		logger.debug("try gmailSender to " + receiverMail);
		System.out.println("try gmailSender to " + receiverMail);

		Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		// Get a Properties object
		Properties props = System.getProperties();
		props.setProperty("mail.smtp.host", "smtp.gmail.com");
		props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
		props.setProperty("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.port", "465");
		props.setProperty("mail.smtp.socketFactory.port", "465");

		// ����socks��������������ʼ�
		// props.setProperty("proxySet", "true");
		// props.setProperty("socksProxyHost", "192.168.10.45");// socks����
		// props.setProperty("socksProxyPort", "1080"); // socks����

		props.put("mail.smtp.auth", "true");
		final String username = "qunyingnet@gmail.com";// "[�����ʺ�]";
		final String password = "";// "[��������]";
		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		// -- Create a new message --
		Message msg = new MimeMessage(session);

		// -- Set the FROM and TO fields --
		msg.setFrom(new InternetAddress(username));
		// msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(
		// "[�ռ��˵�ַ]", false));
		msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(
				receiverMail, false));
		msg.setSubject("Hello");
		// msg.setText("<html><h1>Welcome to JavaMail</h1></html>");
		msg.setSentDate(new Date());

		MimeMultipart mm = new MimeMultipart();
		MimeBodyPart mbp = new MimeBodyPart();
		mbp.setContent("<html><h1>Welcome to JavaMail</h1></html>",
				"text/html;charset=GBK");
		mm.addBodyPart(mbp);

		msg.setContent(mm);

		msg.saveChanges(); // 

		Transport.send(msg);
		System.out.println("Message sent.");
		logger.debug("Message sent.");

	}

	private void gmailSender(String receiverMail, String subject, String content)
			throws AddressException, MessagingException {
		logger.debug("try gmailSender to " + receiverMail);
		Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		// Get a Properties object
		Properties props = System.getProperties();
		props.setProperty("mail.smtp.host", "smtp.gmail.com");
		props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
		props.setProperty("mail.smtp.socketFactory.fallback", "false");
		props.setProperty("mail.smtp.port", "465");
		props.setProperty("mail.smtp.socketFactory.port", "465");

		// ����socks��������������ʼ�
		if (useProxy) {
			props.setProperty("proxySet", "true");
			props.setProperty("socksProxyHost", proxy_ip);// socks����
			props.setProperty("socksProxyPort", proxy_port); // socks����
		}
		props.put("mail.smtp.auth", "true");
		final String username = javamail_address;// "[�����ʺ�]";
		final String password = javamail_password;// "[��������]";
		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		// -- Create a new message --
		Message msg = new MimeMessage(session);

		// -- Set the FROM and TO fields --
		msg.setFrom(new InternetAddress(username));
		// msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(
		// "[�ռ��˵�ַ]", false));
		msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(
				receiverMail, false));
		msg.setSubject(subject);
		// msg.setText(content);
		msg.setSentDate(new Date());

		MimeMultipart mm = new MimeMultipart();
		MimeBodyPart mbp = new MimeBodyPart();
		mbp.setContent(content, "text/html;charset=GBK");
		mm.addBodyPart(mbp);

		msg.setContent(mm);

		msg.saveChanges(); // 

		Transport.send(msg);
		logger.debug("Message sent.");

	}

	public static void main(String[] args) {
		MailManager m = MailManager.getInstance();
		try {
			m.gmailSender("wangch@ffcs.cn");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
}
