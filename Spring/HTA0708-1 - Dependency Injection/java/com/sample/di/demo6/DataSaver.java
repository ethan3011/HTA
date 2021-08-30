package com.sample.di.demo6;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class DataSaver {
	
	@Autowired
	private DataWriter dataWriter;
	public void setDataWriter(DataWriter dataWriter) {
		this.dataWriter = dataWriter;
	}
	
	public void saver (String content) {
		dataWriter.writer(content);
	} 
}
