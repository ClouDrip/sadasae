package com.sada.task;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.BeanNameAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.annotation.ScheduledAnnotationBeanPostProcessor;
import org.springframework.stereotype.Component;

import com.sada.controller.AdminController;
import com.sada.model.ReplyDTO;
import com.sada.service.ReplyService;

import lombok.Data;

@Component
@Data
public class FilterTask implements ApplicationContextAware,BeanNameAware{
	
   @Autowired
   private ReplyService replyService;
   
   private ApplicationContext applicationContext;
   private String beanName;
   
   @Autowired
   private AdminController adminController;
   
   @Scheduled(fixedDelay = 1000l)
   public void executeJob() {
         System.out.println("나 실행되면 안돼");
         if(adminController.getOnOff().equals("scheduleOn")) {
        	AdminController adminController = new AdminController();
            List<ReplyDTO> reviewList =replyService.findByReviewOneMinute();
            if(reviewList.isEmpty()) {
               return;
            }
            ArrayList<JSONObject> jsonArrayList = new ArrayList<>();
            try {
               for (ReplyDTO review : reviewList) {
                  JSONObject jsonObject = new JSONObject();
                  jsonObject.put("document",review.getContent());
                  jsonObject.put("id",review.getReplyId());
                  jsonArrayList.add(jsonObject);
               }
            }catch(JSONException e) {
               e.printStackTrace();
            }
            JSONObject bellInJsonObject = new JSONObject();
            bellInJsonObject.put("bell_in", jsonArrayList);
            String result = null;
            try {
               System.out.println(bellInJsonObject);
               result=adminController.sendJSON(bellInJsonObject);
               System.out.println(result);
            } catch (IOException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
            org.json.JSONObject outputJObject = new org.json.JSONObject(result);
            JSONArray outputJArray = outputJObject.getJSONArray("bell_out");
            for(int i=0; i<outputJArray.length(); i++) {
               org.json.JSONObject obj = outputJArray.getJSONObject(i);
               int label= obj.getInt("label");
               int id = obj.getInt("id");
               replyService.updateFilterOn(id,label);
               }
         }
   }
   public void startScheduledTask() {
       ScheduledAnnotationBeanPostProcessor bean = applicationContext.getBean(ScheduledAnnotationBeanPostProcessor.class);
        bean.postProcessAfterInitialization(this, beanName);   
   }
   public void stopScheduledTask()
    {
        ScheduledAnnotationBeanPostProcessor bean = applicationContext.getBean(ScheduledAnnotationBeanPostProcessor.class);
        bean.postProcessBeforeDestruction(this, beanName);
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext)
    {
        this.applicationContext = applicationContext;
    }

    @Override
    public void setBeanName(String beanName)
    {
        this.beanName = beanName;
    }
    


   

}
