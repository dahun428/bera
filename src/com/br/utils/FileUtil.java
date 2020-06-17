package com.br.utils;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.nio.channels.Channels;
import java.nio.channels.FileChannel;
import java.nio.channels.WritableByteChannel;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class FileUtil {

	
	static {

		

	}
//	
	public static void fileDeleteExecute(String fileName, String directory) {
		
		String uploadFileName = (directory + "/" + fileName);
		
		File uploadFile = new File(uploadFileName);
		if(uploadFile.exists() && uploadFile.isFile()) {
			uploadFile.delete();
		}
		System.out.println(uploadFileName + "삭제");
		
	}
	public static Map<String, String> fileUploadExecute(HttpServletRequest request, String directory) {


		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		String name = "";
		String value = "";
		
		try {
			Map<String, String> fileNameMap = new HashMap<String, String>();
			if(isMultipart) {
				DiskFileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				upload.setHeaderEncoding("utf-8");


				List<FileItem> items = upload.parseRequest(request);
				Iterator<FileItem> iter = items.iterator();
				while(iter.hasNext()) {
					FileItem item = iter.next();
					item.getString("utf-8");

					if(item.isFormField()) {

						name = item.getFieldName();
						value = new String((item.getString().getBytes("8859_1")),"utf-8");
						fileNameMap.put(name, value);
						System.out.println("isForm_name : " + name);
						System.out.println("isForm_value : " + value);
						
					} else {
						String filename = new File(item.getName()).getName();
						
						if (!filename.isEmpty()) {
							String pathName = getUUIDFileName(filename);
							File storeFile = new File(directory + "/" +pathName);
							fileNameMap.put("fileName", filename);
							fileNameMap.put("fileRealName", pathName);
							item.write(storeFile);
							System.out.println("value : " + filename);
							System.out.println("pathName : " + pathName);
							
						}
					}
				}

			}

			return fileNameMap;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	
	public static void fileDownloadExecute(HttpServletRequest request, HttpServletResponse response, String fileName, String directory) throws Exception{

		File file = new File(directory + "/" + fileName);
		
		String mimeType = request.getSession().getServletContext().getMimeType(file.toString());
		if(mimeType == null) {
			response.setContentType("application/octet-stream; charset=utf-8");
			response.setContentLength((int)file.length());
		}
		
		String userAgent = request.getHeader("User-Agent");
		boolean internetExplorer = userAgent.indexOf("MSIE") > 1;
        if( !internetExplorer ) {
            internetExplorer = userAgent.indexOf("Gecko") > -1;
        }
		
        String downloadFileName = null;

        FileInputStream fis = null;
		FileChannel inputChannel = null;
		WritableByteChannel outputChannel = null;
		try {
			
			downloadFileName = new String(fileName.getBytes(), "utf-8");
			
			if(internetExplorer) {
				downloadFileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
			} else {
				downloadFileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
			}
			response.setHeader("Content-Disposition", "attachment; filename=\"" + downloadFileName + "\";");
			response.setHeader("Content-Transfer-Encoding", "binary");
			
			
			fis = new FileInputStream(file);
			inputChannel = fis.getChannel();
			
			outputChannel = Channels.newChannel(response.getOutputStream());
			inputChannel.transferTo(0, fis.available(), outputChannel);
			
			
		} catch(Exception e) {
        	e.printStackTrace();
        } finally {
        	try {
                if (outputChannel.isOpen())
                    outputChannel.close();
            } catch (Exception e) {}
            try {
                if (inputChannel.isOpen())
                    inputChannel.close();
            } catch (Exception e) {}
            try {
                if (fis != null)
                	fis.close();
            } catch (Exception e) {}

        }
		
	}
	
	private static String getUUIDFileName(String originFileName) {
		UUID uuid = UUID.randomUUID();
		String savedName = uuid.toString()+"_"+originFileName;
		return savedName;
	}
}
