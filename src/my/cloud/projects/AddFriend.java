package my.cloud.projects;


import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

public class AddFriend extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		UserService userService = UserServiceFactory.getUserService();
		String nickName=userService.getCurrentUser().getNickname();
		MyUser myUser = MyUser.getMyUserByNickName(nickName);

		String name = req.getParameter("nickname");
		if(!name.isEmpty())
		{
			PersistenceManager pm=PMF.get().getPersistenceManager();
			Query query=pm.newQuery("select from my.cloud.projects.MyUser where myNickName==nickName "
						+"parameters String nickName");
			List<MyUser> list;
			try{
				list=(List<MyUser>)query.execute(name);
			}finally{
			query.closeAll();
			}
			
			try{
				for (MyUser friend : list) {
					myUser.getFriends().add(friend);
				}
			}finally{
				pm.close();
			}
		}

		resp.sendRedirect("/index.jsp");
	}
}

