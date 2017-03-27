package edu.usst.model;

public class Title {
	private String Title_ID;
	private String Title_Name;
	public Title(String title_ID, String title_Name) {
		super();
		Title_ID = title_ID;
		Title_Name = title_Name;
	}
	
	public Title() {
		// TODO Auto-generated constructor stub
	}

	public String getTitle_ID() {
		return Title_ID;
	}

	public void setTitle_ID(String title_ID) {
		Title_ID = title_ID;
	}

	public String getTitle_Name() {
		return Title_Name;
	}

	public void setTitle_Name(String title_Name) {
		Title_Name = title_Name;
	}

	@Override
	public String toString() {
		return "Title [Title_ID=" + Title_ID + ", Title_Name=" + Title_Name
				+ "]";
	}
	
	

}
