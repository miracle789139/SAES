package edu.usst.utils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class WebFileUtils {
	
	
	
	/**
	 * 检测与创建一级、二级文件夹、文件名 这里我通过传入的两个字符串来做一级文件夹和二级文件夹名称
	 * 通过此种办法我们可以做到根据用户的选择保存到相应的文件夹下
	 */
	public static File creatFolder(String typeName, String brandName,
			String fileName) {
		File file = null;
		typeName = typeName.replaceAll("/", ""); // 去掉"/"
		typeName = typeName.replaceAll(" ", ""); // 替换半角空格
		typeName = typeName.replaceAll(" ", ""); // 替换全角空格

		brandName = brandName.replaceAll("/", ""); // 去掉"/"
		brandName = brandName.replaceAll(" ", ""); // 替换半角空格
		brandName = brandName.replaceAll(" ", ""); // 替换全角空格

		File firstFolder = new File("c:/" + typeName); // 一级文件夹
		if (firstFolder.exists()) { // 如果一级文件夹存在，则检测二级文件夹
			File secondFolder = new File(firstFolder, brandName);
			if (secondFolder.exists()) { // 如果二级文件夹也存在，则创建文件
				file = new File(secondFolder, fileName);
			} else { // 如果二级文件夹不存在，则创建二级文件夹
				secondFolder.mkdir();
				file = new File(secondFolder, fileName); // 创建完二级文件夹后，再合建文件
			}
		} else { // 如果一级不存在，则创建一级文件夹
			firstFolder.mkdir();
			File secondFolder = new File(firstFolder, brandName);
			if (secondFolder.exists()) { // 如果二级文件夹也存在，则创建文件
				file = new File(secondFolder, fileName);
			} else { // 如果二级文件夹不存在，则创建二级文件夹
				secondFolder.mkdir();
				file = new File(secondFolder, fileName);
			}
		}
		return file;
	}

	/**
	 * 通过传入页面读取到的文件，处理后保存到本地磁盘，并返回一个已经创建好的File
	 * 
	 * @param imgFile
	 *            从页面中读取到的文件
	 * @param path
	 *            目录绝对路径
	 * @param newFileName
	 *            文件名称（保存的名称）
	 * @param fileType
	 *            文件类型  0-文本  1-图片  2-声音  3-视频  4-其它（其中4还代表“不检测类型，直接按照源文件上传”）
	 * @return
	 */
	public static File saveFileToPath(File webFile, String path,
			String newFileName, int fileType) {
		List<String> fileTypes=getFileTypesListByType(fileType);
		String fileName = webFile.getName();
		// 获取上传文件类型的扩展名,先得到.的位置，再截取从.的下一个位置到文件的最后，最后得到扩展名
		String ext = fileName.substring(fileName.lastIndexOf(".") + 1,
				fileName.length());
		// 对扩展名进行小写转换
		ext = ext.toLowerCase();

		File folder = null;
		File newFile = null;
		if (fileType==4||fileTypes.contains(ext)) { // 如果扩展名属于允许上传的类型，则创建文件
			folder = new File(path);
			if (!folder.exists()) {
				folder.mkdirs();
			}
			newFile = new File(folder, newFileName+"."+ext);

			try {
				FileUtils.copyFile(webFile, newFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} 
		}
		return newFile;
	}

	/**
	 * 获取文件允许的类型
	 * @param fileType
	 *       文件类型  0-文本  1-图片  2-声音  3-视频 
	 * @return
	 */
	public static List<String> getFileTypesListByType(int fileType) {
		 //定义一个数组，用于保存可上传的图片文件类型  
        List<String> fileTypes = new ArrayList<String>();
        if(fileType==0){		//  0-文本
	        fileTypes.add("txt");  
	        fileTypes.add("doc");  
	        fileTypes.add("pdf");  
	        fileTypes.add("dot");
	        fileTypes.add("wps");
	        fileTypes.add("xls");
	        fileTypes.add("ppt");
	        fileTypes.add("rtf");
        }else if(fileType==1){//  1-图片
        	fileTypes.add("jpg");  
	        fileTypes.add("jpeg");  
	        fileTypes.add("bmp");  
	        fileTypes.add("gif");
	        fileTypes.add("png");
        }else if(fileType==2){//  2-声音     
        	fileTypes.add("mp3");  
	        fileTypes.add("mid");  
	        fileTypes.add("wav");  
	        fileTypes.add("ape");
	        fileTypes.add("flac");
        }else if(fileType==3){//  3-视频
        	fileTypes.add("AVI");
        	fileTypes.add("avi");
	        fileTypes.add("wma");  
	        fileTypes.add("rmvb");  
	        fileTypes.add("rm");
	        fileTypes.add("flash");
	        fileTypes.add("mp4");
	        fileTypes.add("mid");
	        fileTypes.add("3GP");
        }else{
        	
        }
        return fileTypes;
	}
}
