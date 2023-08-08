package category;

public class Category {
	private int index;
	private String name;
	private int type;
	private String img;
	
	public Category() {
		super();
	}
	
	public Category(int index, String name, int type, String img) {
		super();
		this.index = index;
		this.name = name;
		this.type = type;
		this.img = img;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	
}
