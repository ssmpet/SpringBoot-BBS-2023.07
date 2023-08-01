package com.ys.sbbs.utility;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class JsonUtil {

	public String listToJson(List<String> list) {
		
		String jsonStr = null;
		
		JSONObject jObj = new JSONObject();
		jObj.put("list", list);

		return jObj.toString();
	}
	
	public List<String> jsonToList(String jStr) {
		
		if (jStr == null) return null;
		
		List<String> list = new ArrayList<String>();
		
		JSONParser parser = new JSONParser();
		try {

			JSONObject jObj = (JSONObject) parser.parse(jStr);
			JSONArray jArr = (JSONArray) jObj.get("list");
			list = (List<String>) jArr;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
}
