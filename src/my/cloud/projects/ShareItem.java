package my.cloud.projects;


import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;


@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class ShareItem {
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private Long id;

    @Persistent
    private String url;

    @Persistent
    private String tag;

    @Persistent
    private String shortInfo;
    
    @Persistent
    private Date submitDate;
    
    public ShareItem(String url, String tag, String shortInfo, Date submitDate){
    	this.setUrl(url);
    	this.setTag(tag);
    	this.setShortInfo(shortInfo);
    	this.setSubmitDate(submitDate);
    }

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUrl() {
		return url;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getTag() {
		return tag;
	}

	public void setShortInfo(String shortInfo) {
		this.shortInfo = shortInfo;
	}

	public String getShortInfo() {
		return shortInfo;
	}

	public void setSubmitDate(Date submitDate) {
		this.submitDate = submitDate;
	}

	public Date getSubmitDate() {
		return submitDate;
	}
}
