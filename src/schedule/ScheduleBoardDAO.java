package schedule;

import java.util.List;

public interface ScheduleBoardDAO {
	
	int countAll();
	List<ScheduleBoard> select();
	List<ScheduleBoard> insert();
	List<ScheduleBoard> update();
	List<ScheduleBoard> delete();
	

}
