package com.br.service;

import java.sql.SQLException;
import java.util.List;

import com.br.dao.EventDao;
import com.br.dto.EventDto;

public class EventService {

	EventDao eventDao = new EventDao();
	
	public void insertEvent(EventDto event) throws SQLException{
		
		int eventNo = 0;
		
		if(event != null) {
			eventNo = eventDao.insertEvent(event);
		}
		if(eventNo == 0) {
			return;
		}
		if(event.getContentImagePath() != null) {
			eventDao.insertEventImagePath(eventNo, event.getContentImagePath(), "0");
		}
		if(event.getThumbnailImagePath() != null) {
			eventDao.insertEventImagePath(eventNo, event.getThumbnailImagePath(), "1");
		}
		if(event.getBannerImagePath() != null) {
			eventDao.insertEventImagePath(eventNo, event.getBannerImagePath(), "2");
		}
		
	}
	public EventDto getEventImageByNo(int eventNo, String eventType) {
		
		EventDto event = null;
		
		if("content".equals(eventType)) {
			event = eventDao.getEventContentByNo(eventNo);
		} else if ("thumbnail".equals(eventType)) {
			event = eventDao.getEventThumbnailByNo(eventNo);
		} else if ("banner".equals(eventType)) {
			event = eventDao.getEventBannerByNo(eventNo);
		}
		
		return event;
	}
	
	public List<EventDto> getAllEventThumbnail(){
		return eventDao.getAllEventThumbnail();
	}
	public EventDto getEventContentByNo(int eventNo) {
		return eventDao.getEventContentByNo(eventNo);
	}
	public void deleteEventImage(int eventNo, String imagePath) {
		eventDao.deleteEventImage(eventNo, imagePath);
	}
	public EventDto getEventByNo(int eventNo) {
		List<EventDto> events = eventDao.getEventByNo(eventNo);
		
		String contentImagePath = null;
		String thumbnailImagePath = null;
		String bannerImagePath = null;
		
		EventDto event = null;
		for(EventDto e : events) {
			event = new EventDto();
			event.setNo(e.getNo());
			event.setTitle(e.getTitle());
			event.setContent(e.getContent());
			event.setStartDate(e.getStartDate());
			event.setEndDate(e.getEndDate());
			event.setEnded(e.isEnded());
			event.setBanner(e.isBanner());
			if("0".equals(e.getEventType())){
				contentImagePath = e.getImagePath();
			} else if ("1".equals(e.getEventType())){
				thumbnailImagePath = e.getImagePath();
			} else if ("2".equals(e.getEventType())) {
				bannerImagePath = e.getImagePath();
			}
		}
		event.setContentImagePath(contentImagePath);
		event.setThumbnailImagePath(thumbnailImagePath);
		event.setBannerImagePath(bannerImagePath);
		System.out.println(event);
		return event;
	}
	
	
	
}
