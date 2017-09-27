package entity;

public class build {

	int buildProposalId;		//所立案的提案ID
	String buildReviewerName;	//立案管理员用户名
	String buildTimeStamp;		//立案的时间(yyyy-MM-dd hh:mm:ss)
	String buildTitle;			//立案的标题(默认为提案标题)
	String buildContent;		//立案的内容(默认为提案内容)
	
	public build() {
		
	}

	public build(int buildProposalId, String buildReviewerName,
			String buildTimeStamp, String buildTitle, String buildContent) {
		super();
		this.buildProposalId = buildProposalId;
		this.buildReviewerName = buildReviewerName;
		this.buildTimeStamp = buildTimeStamp;
		this.buildTitle = buildTitle;
		this.buildContent = buildContent;
	}



	public int getBuildProposalId() {
		return buildProposalId;
	}

	public void setBuildProposalId(int buildProposalId) {
		this.buildProposalId = buildProposalId;
	}

	public String getBuildReviewerName() {
		return buildReviewerName;
	}

	public void setBuildReviewerName(String buildReviewerName) {
		this.buildReviewerName = buildReviewerName;
	}

	public String getBuildTimeStamp() {
		return buildTimeStamp;
	}

	public void setBuildTimeStamp(String buildTimeStamp) {
		this.buildTimeStamp = buildTimeStamp;
	}

	public String getBuildTitle() {
		return buildTitle;
	}

	public void setBuildTitle(String buildTitle) {
		this.buildTitle = buildTitle;
	}

	public String getBuildContent() {
		return buildContent;
	}

	public void setBuildContent(String buildContent) {
		this.buildContent = buildContent;
	}
	
	
}
