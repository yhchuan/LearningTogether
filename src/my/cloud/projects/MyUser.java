package my.cloud.projects;


import java.util.Collections;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;


@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class MyUser {
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Key id;
    
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

	private void setMyNickName(String myNickName) {
		this.myNickName = myNickName;
	}

	public String getMyNickName() {
		return myNickName;
	}
	
	//extend
	public static MyUser getMyUserByNickName(String nickName) {
		PersistenceManager pm=PMF.get().getPersistenceManager();
		MyUser myUser;
		Query query=pm.newQuery("select from my.cloud.projects.MyUser where myNickName==nickName "
					+"parameters String nickName");
		List<MyUser> list=(List<MyUser>)query.execute(nickName);
		if (list.size()!=0)
		{
			try{
				myUser=list.get(0);
			}
			finally{
				query.closeAll();
			}
		}
		else
		{
			myUser=new MyUser(nickName, Collections.EMPTY_LIST, Collections.EMPTY_LIST);
			try {
				pm.makePersistent(myUser);
			} 
			finally {
				pm.close();
			}
		}
		return myUser;
	}

}
