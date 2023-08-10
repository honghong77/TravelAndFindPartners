package dbutil;

public class ScheduleItem {
    private String location;
    private double latitude;
    private double longitude;
    private String memo;
    private String startWhen;
    private String endWhen;

    // 기본 생성자
    public ScheduleItem() {
    }

    // 모든 필드를 매개변수로 받는 생성자
    public ScheduleItem(String location, double latitude, double longitude, String memo, String startWhen, String endWhen) {
        this.location = location;
        this.latitude = latitude;
        this.longitude = longitude;
        this.memo = memo;
        this.startWhen = startWhen;
        this.endWhen = endWhen;
    }

    // 각 필드에 대한 getter와 setter
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public String getStartWhen() {
        return startWhen;
    }

    public void setStartWhen(String startWhen) {
        this.startWhen = startWhen;
    }

    public String getEndWhen() {
        return endWhen;
    }

    public void setEndWhen(String endWhen) {
        this.endWhen = endWhen;
    }
}
