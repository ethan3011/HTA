package com.sample.di.demo6;

import javax.annotation.Resource;
import org.springframework.stereotype.Component;

@Component
public class Databackup {
	
	
	@Resource(name = "fileDataWriter")
	DataWriter dataWriter;
	
	public void setDataWriter(DataWriter dataWriter) {
		this.dataWriter = dataWriter;
	}
	
	public void backUp(String content) {
		dataWriter.writer(content);
	}
}
