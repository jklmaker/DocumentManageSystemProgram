package dao;

/**
 * ���ڱ�ʾ����״̬�Ĳ�����
 *
 */
public class apply {

	private String recommendedPerson;	//������
	private String recommender;			//�Ƽ���
	private String applyReason;			//��������
	private String recommendReason;		//�Ƽ�ԭ��
	
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
