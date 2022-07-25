package com.sada.task;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Bean;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

@Component
public class InitStopScheduler implements ApplicationListener<ContextRefreshedEvent>{
	
	@Autowired
	private FilterTask filterTask;

	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		filterTask.stopScheduledTask();
	}

	
	
}
