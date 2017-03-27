package edu.usst.action;

import java.awt.Image;
import java.awt.image.RenderedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;


import com.opensymphony.xwork2.ActionSupport;

import edu.usst.utils.PicUtils;
import edu.usst.utils.UtilCommon;

public class UploadUtilAction extends ActionSupport implements
		ServletResponseAware {

	private File fileupload; // 和JSP中input标记name同名
	private String imageUrl;
	private String attachmentUrl;
	private String fileRealName;
	private HttpServletResponse response;
	// Struts2拦截器获得的文件名,命名规则，File的名字+FileName
	// 如此处为 'fileupload' + 'FileName' = 'fileuploadFileName'
	private String fileuploadFileName; // 上传来的文件的名字
	public String uploadFile() {
		System.out.println("444444444");
		String extName = ""; 
		String newFileName = ""; 
		String nowTimeStr = ""; 
		PrintWriter out = null;
		SimpleDateFormat sDateFormat;
		Random r = new Random();
		String savePath = ServletActionContext.getServletContext().getRealPath(
				""); 
		savePath = savePath + "/file/photo/";
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk"); 
		int rannum = (int) (r.nextDouble() * (99999 - 10000 + 1)) + 10000;
		sDateFormat = new SimpleDateFormat("yyyyMMddHHmmss"); 
		nowTimeStr = sDateFormat.format(new Date()); 
		
		if (fileuploadFileName.lastIndexOf(".") >= 0) {
			extName = fileuploadFileName.substring(fileuploadFileName
					.lastIndexOf("."));
		}
		
		try {
			out = response.getWriter();
			newFileName = nowTimeStr + rannum + extName; 
			String filePath = savePath + newFileName;
			filePath = filePath.replace("\\", "/");
			
			
			
			if (UtilCommon.checkIsImage(extName)) {
				FileUtils.copyFile(fileupload, new File(filePath));
				out.print("<font color='red'>" 
						+ "头像上传成功!</font>#" + filePath+"#"+getImage_s(filePath));
				
						

			} else {
				System.out.println(filePath);
				out.print("<font color='red'>请上传jpg,jpeg,png格式的图片!</font>");
			}
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
			out.print("上传失败!");
		}
		return null;
	}
	public String uploadFilepaper() {
		System.out.println("55555");
		String extName = ""; 
		String newFileName = ""; 
		String nowTimeStr = ""; 
		PrintWriter out = null;
		SimpleDateFormat sDateFormat;
		Random r = new Random();
		String savePath = ServletActionContext.getServletContext().getRealPath(
				""); 
		savePath = savePath + "/file/paper/";
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk"); 
		int rannum = (int) (r.nextDouble() * (99999 - 10000 + 1)) + 10000;
		sDateFormat = new SimpleDateFormat("yyyyMMddHHmmss"); 
		nowTimeStr = sDateFormat.format(new Date()); 
		
		if (fileuploadFileName.lastIndexOf(".") >= 0) {
			extName = fileuploadFileName.substring(fileuploadFileName
					.lastIndexOf("."));
		}
		
		try {
			out = response.getWriter();
			newFileName = nowTimeStr + rannum + extName; 
			String filePath = savePath + newFileName;
			filePath = filePath.replace("\\", "/");
			
			
			System.out.println(UtilCommon.checkIsFile(extName));
			if (UtilCommon.checkIsFile(extName)) {
				System.out.println(filePath);
				FileUtils.copyFile(fileupload, new File(filePath));
				System.out.println("00000");
				filePath="/file/paper"+filePath.substring(filePath.lastIndexOf("/"));
				out.print("<font color='red'>" 
						+ "文件上传成功!</font>#" + filePath);
				
						

			} else {
				System.out.println(filePath);
				System.out.println("111111");
				out.print("<font color='red'>请上传txt,doc,docx,rar格式的图片!</font>");
				}
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("222222");
			out.print("上传失败!");
			}
		return null;
	}
	public String showImage() throws Exception {
		
		PicUtils picUtils=new PicUtils(imageUrl);
		picUtils.resize(200, 300);
	    System.out.println("111111");
	    String imageUrl_s=getImage_s(imageUrl);
		File file = new File(imageUrl_s);
		InputStream is = new FileInputStream(file);
		Image image = ImageIO.read(is);
		String imageType = imageUrl.substring(imageUrl.lastIndexOf(".") + 1);
		RenderedImage img = (RenderedImage) image;
		OutputStream out = response.getOutputStream();
		ImageIO.write(img, imageType, out);
		out.flush();
		out.close();
		return null;
	}

	private String getImage_s(String imageUrl2) {
		int index=imageUrl2.lastIndexOf(".");
		String ext=imageUrl2.substring(index);
		String prefix=imageUrl2.substring(0, index);
		return prefix+"_s"+ext;
	}

	public File getFileupload() {
		return fileupload;
	}

	public void setFileupload(File fileupload) {
		this.fileupload = fileupload;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getAttachmentUrl() {
		return attachmentUrl;
	}

	public void setAttachmentUrl(String attachmentUrl) {
		this.attachmentUrl = attachmentUrl;
	}

	public String getFileRealName() {
		return fileRealName;
	}

	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	public String getFileuploadFileName() {
		return fileuploadFileName;
	}

	public void setFileuploadFileName(String fileuploadFileName) {
		this.fileuploadFileName = fileuploadFileName;
	}
    
}