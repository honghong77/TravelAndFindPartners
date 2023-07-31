package kr.co.greenart;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JSONmapper {
	private final ObjectMapper mapper;

	public JSONmapper() {
		super();
		this.mapper = new ObjectMapper();
	}
	
	public String writeJson(Object o) throws JsonProcessingException {
		return mapper.writeValueAsString(o);
	}
}