package profile;


public class Profile {
	private String id;
	private byte[] img;
	
	public Profile() {}

	public Profile(String id, byte[] img) {
		super();
		this.id = id;
		this.img = img;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public byte[] getImg() {
		return img;
	}

	public void setImg(byte[] img) {
		this.img = img;
	}
	
			
}
