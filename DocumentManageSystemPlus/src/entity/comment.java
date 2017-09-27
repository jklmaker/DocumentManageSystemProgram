package entity;

public class comment {
	int commentProposalId;			//�����۵��᰸ID
	String commentProposalTitle;		//�����۵��᰸����
	String commentReviewerName;		//�����ߵ��û���
	String commentContent;			//���۵�����
	String commentTimeStamp;			//���۵�ʱ��(yyyy-MM-dd hh:mm:ss)
	int commentType;					//���۵����(0-Ĭ�� 1-���� 2-����)
	
	public comment() {
		
	}

	public comment(int commentProposalId, String commentProposalTitle,
			String commentReviewerName, String commentContent,
			String commentTimeStamp, int commentType) {
		super();
		this.commentProposalId = commentProposalId;
		this.commentProposalTitle = commentProposalTitle;
		this.commentReviewerName = commentReviewerName;
		this.commentContent = commentContent;
		this.commentTimeStamp = commentTimeStamp;
		this.commentType = commentType;
	}



	public int getCommentProposalId() {
		return commentProposalId;
	}

	public void setCommentProposalId(int commentProposalId) {
		this.commentProposalId = commentProposalId;
	}

	public String getCommentProposalTitle() {
		return commentProposalTitle;
	}

	public void setCommentProposalTitle(String commentProposalTitle) {
		this.commentProposalTitle = commentProposalTitle;
	}

	public String getCommentReviewerName() {
		return commentReviewerName;
	}

	public void setCommentReviewerName(String commentReviewerName) {
		this.commentReviewerName = commentReviewerName;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getCommentTimeStamp() {
		return commentTimeStamp;
	}

	public void setCommentTimeStamp(String commentTimeStamp) {
		this.commentTimeStamp = commentTimeStamp;
	}

	public int getCommentType() {
		return commentType;
	}

	public void setCommentType(int commentType) {
		this.commentType = commentType;
	}
	
	
}
