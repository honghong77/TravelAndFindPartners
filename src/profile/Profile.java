package profile;

import java.awt.Image;

public class Profile {
	private String id;
	private Image img;
	
	public Profile() {}

	public Profile(String id, Image img) {
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

	public Image getImg() {
		return img;
	}

	public void setImg(Image img) {
		this.img = img;
	}
		
}
