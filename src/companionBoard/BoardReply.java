package companionBoard;

public class BoardReply {
	private String id;
	private String content;
	private String image;
	private String time;
	
	public BoardReply(String id, String content, String image, String time) {
		super();
		this.id = id;
		this.content = content;
		this.image = image;
		this.time = time;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
}