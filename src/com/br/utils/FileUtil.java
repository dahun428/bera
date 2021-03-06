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


public class FileUtil {

	
	static {

		

	}
	/**
	 * 파일 delete 기능
	 * directory에 있는fileName에 해당하는 파일을 삭제한다.
	 * @param fileName
	 * @param directory
	 */
	public static void fileDeleteExecute(String fileName, String directory) {
		
		String uploadFileName = (directory + "/" + fileName);
		
		File uploadFile = new File(uploadFileName);
		if(uploadFile.exists() && uploadFile.isFile()) {
			uploadFile.delete();
		}
		System.out.println(uploadFileName + "삭제");
		
	}
	/**
	 * 파일 업로드기능
	 * 파일 한개를 업로드 가능하다.
	 * multi/part form의 name과value 값을 Map의 key와 value로 저장한다.
	 * 파일 저장시 한개의 파일만 dirctory에 저장가능하다.
	 * 저장된 파일의 이름은 fileRealName 의 key 값으로 value를 받아올 수 있다.
	 * 사용시 form tag에 enctype = multi/part 명시 필수
	 * @param request HttpServletRequest 객체를 받는다.
	 * @param directory 저장될 directory의 이름
	 * @return
	 */
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
						System.out.println("form tag Name : " + name);
						System.out.println("form tag value : " + value);
						
					} else {
						String filename = new File(item.getName()).getName();
						
						if (!filename.isEmpty()) {
							String fileRealName = getUUIDFileName(filename);
							File storeFile = new File(directory + "/" +fileRealName);
							fileNameMap.put("fileName", filename);
							fileNameMap.put("fileRealName", fileRealName);
							item.write(storeFile);
							System.out.println("파일 이름 : " + filename);
							System.out.println("저장소에 저장된 실제 파일 이름 : " + fileRealName);
							
						}
					}
				}

			}
			return fileNameMap;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("파일 업로드 실패하였습니다.");
		}
		return null;
	}
	/**
	 * 파일 업로드 기능
	 * 파일 여러개응 업로드 가능하다.
	 * multi/part form의 name과value 값을 Map의 key와 value로 저장한다.
	 * 파일 저장시 한개의 파일만 dirctory에 저장가능하다.
	 * 저장된 파일의 이름은 fileRealName 의 key 값으로 value를 받아올 수 있다.
	 * 사용시 form tag에 enctype = multi/part 명시 필수
	 * @param request HttpServletRequest 객체를 받는다.
	 * @param directory 저장될 directory의 이름
	 * @return
	 */
	public static Map<String, String> MultifileUploadExecute(HttpServletRequest request, String directory) {


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
						System.out.println("form tag Name : " + name);
						System.out.println("form tag value : " + value);
						
					} else {
						String filename = new File(item.getName()).getName();
						
						
						if (!filename.isEmpty()) {
							String fileRealName = getUUIDFileName(filename);
							File storeFile = new File(directory + "/" +fileRealName);
							fileNameMap.put("fileName"+name, filename);
							fileNameMap.put("fileRealName"+name, fileRealName);
							item.write(storeFile);
							
							System.out.println("filename : " + filename);
							System.out.println("fileRealName : " + fileRealName);
						}
					}
				}

			}

			return fileNameMap;

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("파일 업로드가 실패하였습니다.");
		}

		return null;
	}
	/**
	 * 파일 다운로드 기능
	 * directory에 있는 fileName을 입력하여 해당 파일을 다운로드 가능하다.
	 * @param request
	 * @param response
	 * @param fileName
	 * @param directory
	 * @throws Exception
	 */
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
