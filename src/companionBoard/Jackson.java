package companionBoard;

import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;

public class Jackson {
	public String convertListToJson(List<Companion2> list) {
        ObjectMapper objectMapper = new ObjectMapper();
        try {
        	String json = objectMapper.writeValueAsString(list);
            return json;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
	
	public String convertReplyListToJson(List<BoardReply> list) {
        ObjectMapper objectMapper = new ObjectMapper();
        try {
        	String json = objectMapper.writeValueAsString(list);
            return json;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
	
	public String convertSchListToJson(List<Travel> list) {
        ObjectMapper objectMapper = new ObjectMapper();
        try {
        	String json = objectMapper.writeValueAsString(list);
            return json;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
	
}
