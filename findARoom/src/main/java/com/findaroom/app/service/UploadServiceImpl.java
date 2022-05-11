package com.findaroom.app.service;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.findaroom.app.exceptions.FileStorageException;

@Service
public class UploadServiceImpl implements UploadService{
	
	@Value("${app.upload.dir:${user.home}}")
    public String uploadDir;
 // this will use a users home folder as a app's image upload directory
	
	@Override
	public boolean uploadImage(String dir, MultipartFile file) {
		boolean uploaded = false;
		
			 try {
		            Path copyLocation = Paths
		                .get(uploadDir + File.separator
		                		+ dir + File.separator 
		                		+ StringUtils.cleanPath(file.getOriginalFilename()));
		            Files.copy(file.getInputStream(), copyLocation, StandardCopyOption.REPLACE_EXISTING);
		        } catch (Exception e) {
		            e.printStackTrace();
		            throw new FileStorageException("Could not store file " + file.getOriginalFilename()
		                + ". Please try again!");
		        }
		
		return uploaded;
	}

	
}
