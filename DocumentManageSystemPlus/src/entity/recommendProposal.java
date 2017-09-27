package entity;

public class recommendProposal {

	int recommendProposalId;
	String recommendProposalTitle;
	String recommendReviewerName;
	String recommendReason;
	String recommendTimeStamp;
	
	public recommendProposal() {
		
	}
	
	public recommendProposal(int recommendProposalId,
			String recommendProposalTitle, String recommendReviewerName,
			String recommendReason, String recommendTimeStamp) {
		super();
		this.recommendProposalId = recommendProposalId;
		this.recommendProposalTitle = recommendProposalTitle;
		this.recommendReviewerName = recommendReviewerName;
		this.recommendReason = recommendReason;
		this.recommendTimeStamp = recommendTimeStamp;
	}

	public int getRecommendProposalId() {
		return recommendProposalId;
	}

	public void setRecommendProposalId(int recommendProposalId) {
		this.recommendProposalId = recommendProposalId;
	}

	public String getRecommendProposalTitle() {
		return recommendProposalTitle;
	}

	public void setRecommendProposalTitle(String recommendProposalTitle) {
		this.recommendProposalTitle = recommendProposalTitle;
	}

	public String getRecommendReviewerName() {
		return recommendReviewerName;
	}

	public void setRecommendReviewerName(String recommendReviewerName) {
		this.recommendReviewerName = recommendReviewerName;
	}

	public String getRecommendReason() {
		return recommendReason;
	}

	public void setRecommendReason(String recommendReason) {
		this.recommendReason = recommendReason;
	}

	public String getRecommendTimeStamp() {
		return recommendTimeStamp;
	}

	public void setRecommendTimeStamp(String recommendTimeStamp) {
		this.recommendTimeStamp = recommendTimeStamp;
	}
	
	
	
}
