package entity;

public class build {

	int buildProposalId;		//���������᰸ID
	String buildReviewerName;	//��������Ա�û���
	String buildTimeStamp;		//������ʱ��(yyyy-MM-dd hh:mm:ss)
	String buildTitle;			//�����ı���(Ĭ��Ϊ�᰸����)
	String buildContent;		//����������(Ĭ��Ϊ�᰸����)
	
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
