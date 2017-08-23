package entity;

public class proposal {

	int proposalId;		//�᰸ID
	String title;		//�᰸����
	String author;		//�᰸����
	String deadline;	//�᰸��ֹ����
	int state;			//�᰸״̬(0Ϊ����������ڣ�1Ϊ�Խ���)
	int agree;			//������
	int disagree;		//������
	String content;		//�᰸����
	
	public proposal() {
		state = 0;
		agree = 0;
		disagree = 0;
		deadline = "����";
	}
	
	public proposal(int proposalId, String title, String author, String content) {
		this.proposalId = proposalId;
		this.title = title;
		this.author = author;
		this.content = content;
		state = 0;
		agree = 0;
		disagree = 0;
		deadline = "����";
	}



	public int getProposalId() {
		return proposalId;
	}
	public void setProposalId(int proposalId) {
		this.proposalId = proposalId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getAgree() {
		return agree;
	}
	public void setAgree(int agree) {
		this.agree = agree;
	}
	public int getDisagree() {
		return disagree;
	}
	public void setDisagree(int disagree) {
		this.disagree = disagree;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
