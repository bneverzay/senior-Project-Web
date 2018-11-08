package com.mfu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mfu.dao.RoomPhotoDao;
import com.mfu.entity.RoomPhotoEntity;

@Controller
public class RoomPhotoController {
	
	@RequestMapping("/photoList")
	public @ResponseBody List<RoomPhotoEntity> photoList(HttpServletRequest request) {
		RoomPhotoDao roomphotodao = new RoomPhotoDao();
		List<RoomPhotoEntity> roomphotoentity = null;
		try {
			roomphotoentity = roomphotodao.getAllRoomPhotoEntitys();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			roomphotodao.closeEntityManager();
		}
		return roomphotoentity;
	}

}
