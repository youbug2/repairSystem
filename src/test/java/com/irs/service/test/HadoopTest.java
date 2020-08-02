package com.irs.service.test;

import java.io.File;

import javax.swing.filechooser.FileSystemView;

import org.junit.Test;

import com.irs.service.BaseTest;
import com.irs.util.HdfsUtil;

public class HadoopTest extends BaseTest{

	@Test
	public void uploadFile() {
		HdfsUtil.createFile("ffff.txt", "FileContent");
	}
	
	
	public static void main(String[] args) {
		FileSystemView fsv = FileSystemView.getFileSystemView();
		File[] files = fsv.getHomeDirectory().listFiles();
		for (File file : files) {
			String name = file.getName();
			if(name.contains("")&&(name.endsWith(".sql")||name.endsWith(".xlsx"))) {
				file.delete();
			}
		}
		System.out.println(fsv.getDefaultDirectory().getAbsolutePath());
		System.out.println(fsv.getHomeDirectory().getAbsolutePath());
		
		
	}
}
