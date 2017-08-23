package dao;

import java.util.List;

import entity.proposal;

public class currentProposal {

	private int size;
	private List<proposal> list;
	
	

	public List<proposal> getList() {
		return list;
	}

	public void setList(List<proposal> list) {
		this.list = list;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public currentProposal(int size,List<proposal> list) {
		this.size = size;
		this.list = list;
	}
	
	public currentProposal() {
		
	}
}
