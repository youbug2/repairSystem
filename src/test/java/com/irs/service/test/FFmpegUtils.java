package com.irs.service.test;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

/**
 * 视频处理工具类
 * @author FSYang
 * @date 2018年8月3日 上午9:47:37 
 *
 */
public class FFmpegUtils {

	public static final String FFMPEG_PATH = "F:\\softaware\\M3U8Downloaderffmpeg\\Tools\\ffmpeg.exe";
	
	private static Process process;
	
	public static void main(String[] args) throws Exception {
		downloadM3u8("http://kemivideo.kemizhibo.com/doXvrQuuvgNsjQbOQaXrKLCCASpAJvaU_hd.m3u8?Expires=1533712583&OSSAccessKeyId=LTAI29ciatcNXACA&Signature=M87HJlCN9mUN8uqaKLZvJyn3qlg%3D&MtsHlsUriToken=a9a01931-455e-4ef3-ba39-fc7ab298805f", 
				"E:/m3u8/doXvrQuuvgNsjQbOQaXrKLCCASpAJvaU_hd.m3u8");
	}
	
	public void mp4ToM3u8(String mp4Source) {
		
	}
	
	
	/**
	 * 下载m3u8并解密
	 * @param fileUrl
	 * @param filePath
	 */
	public static void downloadM3u8(String fileUrl,String filePath) {
		//先将m3u8文件下载好存起来
		String host = fileUrl.substring(0, fileUrl.lastIndexOf("/")+1);
		try {
			if(fileUrl.indexOf("http")>-1) {
				//fileUrl = URLDecoder.decode(fileUrl,"utf-8");
				downloadFile(fileUrl, filePath);
			}
			File m3u8 = new File(filePath);
			String copyM3u8 = m3u8.getParent() +"/copy_" + m3u8.getName();
			BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(m3u8)));
			BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File(copyM3u8))));
			String len ;
			while((len = reader.readLine())!=null) {
				if(len.contains("#EXT-X-KEY:")) {
					int indexOfURI = len.indexOf("http");
					if(indexOfURI>-1) {
						//服务器生成秘钥加密方式
						String keyUrl = len.substring(indexOfURI,len.length()-1);
						String keyName = filePath+".key";
						downloadFile(keyUrl, keyName);
						len = len.replace(keyUrl, new File(keyName).getName());
					}
				}
				if(len.endsWith(".ts")) {
					//下载ts文件
					System.out.println("开始下载："+len);
					String tsUrl;
					if(len.indexOf("http")>-1) {
						//自己包含了host
						tsUrl = len;
					}else {
						tsUrl = host + len;
					}
					
					
					downloadFile(tsUrl, m3u8.getParent()+"/"+len);
				}
				writer.write(len);
				writer.newLine();
			}
			reader.close();
			writer.close();
			//执行转码命令
			System.out.println("开始转码...");
			//校验所需文件是否存在
				//校验m3u8文件
			
				//校验ts文件
			
				//
			
			String m3u8FilePath = copyM3u8;
			String mp4FilePath = m3u8.getParent() +"/" + m3u8.getName()+".mp4";
			//判断目的文件是否存在
			File outFile = new File(mp4FilePath);
			if(outFile.exists()) {
				outFile.delete();
			}
			List<String> commands = new ArrayList<String>();
			commands.add(FFMPEG_PATH);
			commands.add("-i");
			commands.add(m3u8FilePath);
			commands.add("-c");
			commands.add("copy");
			commands.add("-bsf:a");
		    commands.add("aac_adtstoasc");
			commands.add(mp4FilePath);
			ProcessBuilder builder = new ProcessBuilder();
			builder.command(commands);
			process = builder.start();
//			builder.command("y");
			//process.waitFor();//等待进程执行完毕  防止ffmpeg进程塞满缓存造成死锁
	        logErrorInputStream(process.getErrorStream(), "FFMPEG视频转换进程日志信息:");
	        logErrorInputStream(process.getInputStream(), "FFMPEG视频转换进程输出内容:");
	        
	        //删除其他无用视频
	        File[] listFiles = outFile.getParentFile().listFiles();
	        for (File file : listFiles) {
	        	String fileName = file.getName();
	        	if(
	        			fileName.endsWith(".m3u8")||
	        			fileName.endsWith(".key")||
	        			fileName.endsWith(".ts")
        			) {
	        		file.delete();
	        	}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static int tsCount = 0;
	public static void downloadFile(final String fileUrl,final String filePath) {
		ThreadManager.getInstance().execute(new Runnable() {
			@Override
			public void run() {
				try {
					URL url = new URL(fileUrl);
					InputStream in = url.openStream();
					File outFile = new File(filePath);
					File parent  = new File(outFile.getParent());
					if(!parent.exists()) {
						parent.mkdirs();
					}
					FileOutputStream out = new FileOutputStream(outFile);
					byte[] cache = new byte[4096];
					int len = -1;
					while((len = in.read(cache))!=-1) {
						out.write(cache, 0, len);
					}
					in.close();
					out.close();
					tsCount++;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
		
	}
	
	public static void logErrorInputStream(InputStream inputStream,String message) {
		  byte[] b = new byte[1024];
          int readbytes = -1;
		 try {
             while((readbytes = inputStream.read(b)) != -1){
                 System.out.println(message+new String(b,0,readbytes));
             }
         }catch (Exception e){
        	 e.printStackTrace();
         }finally {
        	 try {
				inputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
         }
	}
}
