package entity;

public class proposal {

	int proposalId;		//提案ID
	String title;		//提案名称
	String author;		//提案作者
	String deadline;	//提案截止日期
	int state;			//提案状态(0为在意见征集期，1为以结束)
	int agree;			//附议数
	int disagree;		//反对数
	String content;		//提案内容
	
	public proposal() {
		state = 0;
		agree = 0;
		disagree = 0;
		deadline = "暂无";
	}
	
	public proposal(int proposalId, String title, String author, String content) {
		this.proposalId = proposalId;
		this.title = title;
		this.author = author;
		this.content = content;
		state = 0;
		agree = 0;
		disagree = 0;
		deadline = "暂无";
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
