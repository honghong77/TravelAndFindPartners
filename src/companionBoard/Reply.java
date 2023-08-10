package companionBoard;

public class Reply {
	private int no;
	private String id;
	private String content;
	
	public Reply(int no, String id, String content) {
		super();
		this.no = no;
		this.id = id;
		this.content = content;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
