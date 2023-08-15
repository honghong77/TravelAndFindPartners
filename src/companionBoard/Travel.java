package companionBoard;

public class Travel {
	private int no;
	private String id;
	private String title;
	
	public Travel(int no, String id, String title) {
		super();
		this.no = no;
		this.id = id;
		this.title = title;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
}
