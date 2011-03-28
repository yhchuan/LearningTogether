package my.cloud.projects;


import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;


@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class MyUser {
	@PrimaryKey
	@Persistent
	private String myNickName;

	@Persistent
	private List<MyUser> friends;

	@Persistent
	private List<ShareItem> items;
	
	public MyUser(String myNickName, List<MyUser> friends, List<ShareItem> items){
		this.setMyNickName(myNickName);
		this.setFriends(friends);
		this.setItems(items);
	}

	public void setFriends(List<MyUser> friends) {
		this.friends = friends;
	}

	public List<MyUser> getFriends() {
		return friends;
	}

	public void setItems(List<ShareItem> items) {
		this.items = items;
	}

	public List<ShareItem> getItems() {
		return items;
	}
	
	//extend
	public static MyUser getMyUserByNickName(String nickName) {
		PersistenceManager pm=PMF.get().getPersistenceManager();
		return pm.getObjectById(MyUser.class, nickName);
	}

	private void setMyNickName(String myNickName) {
		this.myNickName = myNickName;
	}

	public String getMyNickName() {
		return myNickName;
	}
	
}
