package companionBoard;

public class BoardReply {
	private int pk;
	private String id;
	private String nickname;
	private String content;
	private String profile;
	private String time;
	
	public BoardReply(int pk, String id, String nickname, String content, String profile, String time) {
		super();
		this.pk = pk;
		this.id = id;
		this.nickname = nickname;
		this.content = content;
		this.profile = profile;
		this.time = time;
	}

	public int getPk() {
		return pk;
	}

	public void setPk(int pk) {
		this.pk = pk;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
}