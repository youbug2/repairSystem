package com.irs.util;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URI;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FSDataOutputStream;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.hdfs.DistributedFileSystem;
import org.apache.hadoop.hdfs.protocol.DatanodeInfo;
import org.apache.hadoop.io.IOUtils;
import org.apache.hadoop.util.Progressable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * hdfs文件系统操作类
 */
public class HdfsUtil {

	private static final Logger log = LoggerFactory.getLogger(HdfsUtil.class);
	// 初始化
	static Configuration conf = new Configuration();
	static FileSystem hdfs;
	static {
		try {
			conf.set("fs.defaultFS", "hdfs://192.168.202.128:9000");
			hdfs = FileSystem.get(conf);
		} catch (IOException e) {
			if (log.isDebugEnabled())
				log.debug("初始化hadoop配置失败", e);
		}
	}

	/**
	 * 创建文件夹
	 * 
	 * @param dir
	 * @throws IOException
	 */
	public static boolean mkDirs(String dir) {
		try {
			Path path = new Path(dir);
			return hdfs.mkdirs(path);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 本地文件上传到hdfs
	 * 
	 * @param localSrc
	 * @param hdfsDst
	 * @throws IOException
	 */
	public static void uploadFile(String localSrc, String hdfsDst) throws IOException {
		Path src = new Path(localSrc);
		Path dst = new Path(hdfsDst);
		hdfs.copyFromLocalFile(src, dst);

		FileStatus files[] = hdfs.listStatus(dst);
		System.out.println("Upload to \t" + conf.get("fs.default.name") + hdfsDst);
		for (FileStatus file : files) {
			System.out.println(file.getPath());
		}
	}

	/**
	 * 下载文件到本地
	 * 
	 * @param remotePath
	 *            hdfs文件目录
	 * @param localPath
	 *            本地文件目录
	 */
	public static void downLoadFile(String remotePath, String localPath) {

		Path _remotePath = new Path(remotePath);
		Path _localPath = new Path(localPath);

		try {
			hdfs.copyToLocalFile(false, _remotePath, _localPath);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			try {
				hdfs.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

	/**
	 * 创建文件
	 * 
	 * @param fileName
	 * @param fileContent
	 * @throws IOException
	 */
	public static void createFile(String fileName, String fileContent) {
		Path dst = new Path(fileName);
		byte[] bytes = fileContent.getBytes();
		FSDataOutputStream output;

		try {
			output = hdfs.create(dst);
			output.write(bytes);
		} catch (IOException e) {
			if (log.isDebugEnabled())
				log.debug("创建文件异常:" + fileName, e);
		}
		System.out.println("new file \t" + conf.get("fs.default.name") + fileName);
	}

	/**
	 * 获取文件内容
	 * 
	 * @param fileName
	 *            文件名
	 * @return
	 */
	public static String readFileContent(String fileName) {
		Path p = new Path(conf.get("fs.default.name") + fileName);
		FSDataInputStream in = null;
		String content = "";

		try {
			in = hdfs.open(p);
			BufferedReader buff = new BufferedReader(new InputStreamReader(in));
			content = buff.readLine();
			buff.close();
			in.close();
			hdfs.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			if (log.isDebugEnabled())
				log.debug("读取文件:" + fileName + "失败", e);
		}

		return content;
	}

	public void listFiles(String dirName) throws IOException {
		Path f = new Path(dirName);
		FileStatus[] status = hdfs.listStatus(f);
		System.out.println(dirName + " has all files:");
		for (int i = 0; i < status.length; i++) {
			System.out.println(status[i].getPath().toString());
		}
	}

	/**
	 * 删除文件
	 * 
	 * @param fileName
	 *            文件路径
	 * @throws IOException
	 */
	public static boolean deleteFile(String fileName) throws IOException {
		Path f = new Path(fileName);
		boolean isExists = hdfs.exists(f);
		if (isExists) {
			boolean isDel = hdfs.delete(f, true);
			return isDel;
		} else {
			return false;
		}
	}

	/**
	 * 获取集群上的所有节点名称
	 * 
	 * @throws IOException
	 */
	public static List<DatanodeInfo> getDateNodeHost() throws IOException {
		DistributedFileSystem _hdfs = (DistributedFileSystem) hdfs;
		DatanodeInfo[] dataNodeStats = _hdfs.getDataNodeStats();
		List<DatanodeInfo> dataNodeLst = Arrays.asList(dataNodeStats);
		return dataNodeLst;
	}

	/**
	 * 文件重命名
	 * 
	 * @param fileName
	 *            文件名
	 * @param newFileName
	 *            新文件名
	 * @throws IOException
	 */
	public static boolean renameFile(String fileName, String newFileName) {

		Path path = new Path(fileName);
		Path newPath = new Path(newFileName);
		boolean b = false;
		try {
			b = hdfs.rename(path, newPath);
		} catch (Exception e) {
			if (log.isDebugEnabled())
				log.debug("文件:[" + fileName + "]修改为:[" + newFileName + "]失败", e);
		}
		return b;
	}

	// public static void main(String[] args) throws IOException {
	/// * System.err.println(mkDirs("/test"));
	// createFile("/test/my.txt", "I Love Beijing!");
	// System.out.println(readFileContent("/test/my.txt"));*/
	//// deleteFile("/test/my.txt");
	//// uploadFile("D:\\道士不好惹3.txt", "/home/test01/hadoopdata/道士不好惹.txt");
	//// downLoadFile("/home/test01/hadoopdata/道士不好惹.txt", "D:\\道士不好惹5.txt");
	// }

	public static void main(String[] args) throws Exception {

		// SpringApplication.run(DemoApplication.class, args);
//		FSDataInputStream instream = hdfs.open(new Path("/data1/道士不好惹3.txt"));
//		uploadFile();
		for (int i = 0; i < 90; i++) {
			System.out.println(i+"--"+(long)Math.pow(2, i));
		}
	}

	private static void uploadFile() throws IOException {
		String localSrc = "D:\\道士不好惹3.txt";

//		conf.set("fs.defaultFS", "hdfs://192.168.202.128:9000");
//
//		FileSystem hdfs = FileSystem.get(conf); // 获取文件系统

		hdfs.copyFromLocalFile(new Path(localSrc), new Path("/data1/道士不好惹4.txt"));
	}

}
