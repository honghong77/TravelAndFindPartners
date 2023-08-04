package schedule;

import java.util.Arrays;

public class ScheduleBoard {
    private int no;
    private String startwhen;
    private String endwhen;
    private String location;
    private String memo;
    private Integer number;
    private byte[] image;
    private Float gyeongdo;
    private Float wido;
    
	public ScheduleBoard(int no, String startwhen, String endwhen, String location, String memo, Integer number,
			byte[] image, Float gyeongdo, Float wido) {
		super();
		this.no = no;
		this.startwhen = startwhen;
		this.endwhen = endwhen;
		this.location = location;
		this.memo = memo;
		this.number = number;
		this.image = image;
		this.gyeongdo = gyeongdo;
		this.wido = wido;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getStartwhen() {
		return startwhen;
	}

	public void setStartwhen(String startwhen) {
		this.startwhen = startwhen;
	}

	public String getEndwhen() {
		return endwhen;
	}

	public void setEndwhen(String endwhen) {
		this.endwhen = endwhen;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public Float getGyeongdo() {
		return gyeongdo;
	}

	public void setGyeongdo(Float gyeongdo) {
		this.gyeongdo = gyeongdo;
	}

	public Float getWido() {
		return wido;
	}

	public void setWido(Float wido) {
		this.wido = wido;
	}

	@Override
	public String toString() {
		return "ScheduleBoard [no=" + no + ", startwhen=" + startwhen + ", endwhen=" + endwhen + ", location="
				+ location + ", memo=" + memo + ", number=" + number + ", image=" + Arrays.toString(image)
				+ ", gyeongdo=" + gyeongdo + ", wido=" + wido + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((endwhen == null) ? 0 : endwhen.hashCode());
		result = prime * result + ((gyeongdo == null) ? 0 : gyeongdo.hashCode());
		result = prime * result + Arrays.hashCode(image);
		result = prime * result + ((location == null) ? 0 : location.hashCode());
		result = prime * result + ((memo == null) ? 0 : memo.hashCode());
		result = prime * result + no;
		result = prime * result + ((number == null) ? 0 : number.hashCode());
		result = prime * result + ((startwhen == null) ? 0 : startwhen.hashCode());
		result = prime * result + ((wido == null) ? 0 : wido.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ScheduleBoard other = (ScheduleBoard) obj;
		if (endwhen == null) {
			if (other.endwhen != null)
				return false;
		} else if (!endwhen.equals(other.endwhen))
			return false;
		if (gyeongdo == null) {
			if (other.gyeongdo != null)
				return false;
		} else if (!gyeongdo.equals(other.gyeongdo))
			return false;
		if (!Arrays.equals(image, other.image))
			return false;
		if (location == null) {
			if (other.location != null)
				return false;
		} else if (!location.equals(other.location))
			return false;
		if (memo == null) {
			if (other.memo != null)
				return false;
		} else if (!memo.equals(other.memo))
			return false;
		if (no != other.no)
			return false;
		if (number == null) {
			if (other.number != null)
				return false;
		} else if (!number.equals(other.number))
			return false;
		if (startwhen == null) {
			if (other.startwhen != null)
				return false;
		} else if (!startwhen.equals(other.startwhen))
			return false;
		if (wido == null) {
			if (other.wido != null)
				return false;
		} else if (!wido.equals(other.wido))
			return false;
		return true;
	}

	
    
}

