package shaobin;

import my.cloud.projects.*;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.jdo.PersistenceManager;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.cloud.projects.ShareItem;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

public class inputDataServlet extends HttpServlet {
	private static final Logger log = Logger.getLogger(inputDataServlet.class
			.getName());

	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();

		String url = req.getParameter("url");
		String tag = req.getParameter("tag");
		String shortInfo = req.getParameter("shortInfo");
		Date date = new Date();
		ShareItem shareItem = new ShareItem(url, tag, shortInfo, date);
		PersistenceManager pm = PMF.get().getPersistenceManager();
		String query = "select from " + MyUser.class.getName();
		List<MyUser> users = (List<MyUser>) pm.newQuery(query).execute();
		if (users.isEmpty()) {
			resp.sendRedirect("/index.jsp");
		} else {
			try {
				for (MyUser urs : users) {

					List<ShareItem> items = urs.getItems();
					items.add(shareItem);
					pm.makePersistent(urs);
				}
			} finally {
				pm.close();
			}

		}

		resp.sendRedirect("/index.jsp");
	}
}
