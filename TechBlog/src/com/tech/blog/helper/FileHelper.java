package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class FileHelper {
	public static boolean deleteFile(String path) {
		boolean f=false;
			try {
				File file=new File(path);
				f=file.delete();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		return f;
	}
	
	public static boolean saveFile(InputStream is,String path) {
		boolean f=false;
		try {
			
			//byte array created 
			byte[] b=new byte[is.available()];
			
			//data read krke b me rkge.
			is.read(b);
			
			//write in file logic
			FileOutputStream fos=new FileOutputStream(path);
			//path ke waha write kiye
			fos.write(b);
			fos.flush();
			fos.close();
			f=true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}
}
