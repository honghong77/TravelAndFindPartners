package tendency;

public class Tendency {
	private static String id;
	private static String triptendency1;
	private static String triptendency2;
	private static String triptendency3;
	private static String mytendency1;
	private static String mytendency2;
	private static String mytendency3;
	private static String mytendency4;
	private static String mytendency5;
	private static String mytendency6;
	private static String[] selectedTripTendencies;
    private static String[] selectedMyTendencies;
	
	public Tendency() {}

	public Tendency(String id, String triptendency1, String triptendency2, String triptendency3, String mytendency1,
			String mytendency2, String mytendency3, String mytendency4, String mytendency5, String mytendency6) {
		super();
		this.id = id;
		this.triptendency1 = triptendency1;
		this.triptendency2 = triptendency2;
		this.triptendency3 = triptendency3;
		this.mytendency1 = mytendency1;
		this.mytendency2 = mytendency2;
		this.mytendency3 = mytendency3;
		this.mytendency4 = mytendency4;
		this.mytendency5 = mytendency5;
		this.mytendency6 = mytendency6;
	}
	
	public Tendency(String triptendency1, String triptendency2, String triptendency3, String mytendency1,
			String mytendency2, String mytendency3, String mytendency4, String mytendency5, String mytendency6) {
		super();
		this.triptendency1 = triptendency1;
		this.triptendency2 = triptendency2;
		this.triptendency3 = triptendency3;
		this.mytendency1 = mytendency1;
		this.mytendency2 = mytendency2;
		this.mytendency3 = mytendency3;
		this.mytendency4 = mytendency4;
		this.mytendency5 = mytendency5;
		this.mytendency6 = mytendency6;
	}
	
	public static String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public static String getTriptendency1() {
		return triptendency1;
	}

	public void setTriptendency1(String triptendency1) {
		this.triptendency1 = triptendency1;
	}

	public static String getTriptendency2() {
		return triptendency2;
	}

	public void setTriptendency2(String triptendency2) {
		this.triptendency2 = triptendency2;
	}

	public static String getTriptendency3() {
		return triptendency3;
	}

	public void setTriptendency3(String triptendency3) {
		this.triptendency3 = triptendency3;
	}

	public static String getMytendency1() {
		return mytendency1;
	}

	public void setMytendency1(String mytendency1) {
		this.mytendency1 = mytendency1;
	}

	public static String getMytendency2() {
		return mytendency2;
	}

	public void setMytendency2(String mytendency2) {
		this.mytendency2 = mytendency2;
	}

	public static String getMytendency3() {
		return mytendency3;
	}

	public void setMytendency3(String mytendency3) {
		this.mytendency3 = mytendency3;
	}

	public static String getMytendency4() {
		return mytendency4;
	}

	public void setMytendency4(String mytendency4) {
		this.mytendency4 = mytendency4;
	}

	public static String getMytendency5() {
		return mytendency5;
	}

	public void setMytendency5(String mytendency5) {
		this.mytendency5 = mytendency5;
	}

	public static String getMytendency6() {
		return mytendency6;
	}

	public void setMytendency6(String mytendency6) {
		this.mytendency6 = mytendency6;
	}
	
	public static String[] getSelectedTripTendencies() {
        return selectedTripTendencies;
    }

    public void setSelectedTripTendencies(String[] selectedTripTendencies) {
        this.selectedTripTendencies = selectedTripTendencies;
    }

    public static String[] getSelectedMyTendencies() {
        return selectedMyTendencies;
    }

    public void setSelectedMyTendencies(String[] selectedMyTendencies) {
        this.selectedMyTendencies = selectedMyTendencies;
    }
}
