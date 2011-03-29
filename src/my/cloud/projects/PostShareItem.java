package my.cloud.projects;


import java.io.IOException;
import java.util.Date;

import javax.jdo.PersistenceManager;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

public class PostShareItem extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		UserService userService = UserServiceFactory.getUserService();
		String nickName=userService.getCurrentUser().getNickname();
		MyUser myUser = MyUser.getMyUserByNickName(nickName);

		String url = req.getParameter("url");
		String tag = req.getParameter("tag");
		String shortInfo = req.getParameter("shortInfo");
		
		ShareItem shareItem = new ShareItem(url, tag, shortInfo, new Date());
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
				myUser.getItems().add(shareItem);
		} finally {
			pm.close();
		}

		resp.sendRedirect("/checkShareItem.jsp");
	}
}
