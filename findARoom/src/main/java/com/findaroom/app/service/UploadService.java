package com.findaroom.app.service;

import org.springframework.web.multipart.MultipartFile;

public interface UploadService {

	public boolean uploadImage(final String dir, MultipartFile image);
}
