package entity;

public class record {

	private int recordProposalId;		//所备案的提案ID
	private String recordReviewerName;	//备案管理员用户名
	private String recordTimeStamp;		//备案的时间(yyyy-MM-dd hh:mm:ss)
	private String recordTitle;		//备案的标题(默认为提案标题)
	private String recordContent;		//备案的内容(默认为提案内容)
	
	public record() {
		
	}

	public record(int recordProposalId, String recordReviewerName,
			String recordTimeStamp, String recordTitle, String recordContent) {
		super();
		this.recordProposalId = recordProposalId;
		this.recordReviewerName = recordReviewerName;
		this.recordTimeStamp = recordTimeStamp;
		this.recordTitle = recordTitle;
		this.recordContent = recordContent;
	}

	public int getRecordProposalId() {
		return recordProposalId;
	}

	public void setRecordProposalId(int recordProposalId) {
		this.recordProposalId = recordProposalId;
	}

	public String getRecordReviewerName() {
		return recordReviewerName;
	}

	public void setRecordReviewerName(String recordReviewerName) {
		this.recordReviewerName = recordReviewerName;
	}

	public String getRecordTimeStamp() {
		return recordTimeStamp;
	}

	public void setRecordTimeStamp(String recordTimeStamp) {
		this.recordTimeStamp = recordTimeStamp;
	}

	public String getRecordTitle() {
		return recordTitle;
	}

	public void setRecordTitle(String recordTitle) {
		this.recordTitle = recordTitle;
	}

	public String getRecordContent() {
		return recordContent;
	}

	public void setRecordContent(String recordContent) {
		this.recordContent = recordContent;
	}
	
	
}
