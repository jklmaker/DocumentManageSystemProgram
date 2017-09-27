package entity;

public class record {

	private int recordProposalId;		//���������᰸ID
	private String recordReviewerName;	//��������Ա�û���
	private String recordTimeStamp;		//������ʱ��(yyyy-MM-dd hh:mm:ss)
	private String recordTitle;		//�����ı���(Ĭ��Ϊ�᰸����)
	private String recordContent;		//����������(Ĭ��Ϊ�᰸����)
	
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
