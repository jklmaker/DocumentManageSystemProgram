package dao;

/**
 * 用于表示申请状态的操作类
 *
 */
public class apply {

	private String recommendedPerson;	//申请人
	private String recommender;			//推荐人
	private String applyReason;			//申请理由
	private String recommendReason;		//推荐原因
	
	public apply() {
		
	}
	
	public apply(String recommendedPerson, String recommender,
			String applyReason, String recommendReason) {
		super();
		this.recommendedPerson = recommendedPerson;
		this.recommender = recommender;
		this.applyReason = applyReason;
		this.recommendReason = recommendReason;
	}
	public String getRecommendedPerson() {
		return recommendedPerson;
	}
	public void setRecommendedPerson(String recommendedPerson) {
		this.recommendedPerson = recommendedPerson;
	}
	public String getRecommender() {
		return recommender;
	}
	public void setRecommender(String recommender) {
		this.recommender = recommender;
	}
	public String getApplyReason() {
		return applyReason;
	}
	public void setApplyReason(String applyReason) {
		this.applyReason = applyReason;
	}
	public String getRecommendReason() {
		return recommendReason;
	}
	public void setRecommendReason(String recommendReason) {
		this.recommendReason = recommendReason;
	}
	
	
}
