package spring.util;

import java.io.File;

public class FileRenameUtil {

	public static String checkFileName(String path, String fname) {
		
		//넘어오는 path는 절대경로이고 fname은 originalname이다.
		//파일명에서 .을 중심으로 파일명과 확장자를 분리하자! 
		int period = fname.lastIndexOf("."); // 자릿 값, test.txt 
		
		String name = fname.substring(0, period); //(0, 4) 0부터 4전까지인 3까지만 잘라라   // test
		String suffix = fname.substring(period); //확장자 (4부터 끝까지 잘라라) // .txt
		
		//전체경로
		String savePath = path + System.getProperty("file.separator")+fname; 
		
		//이제 위의 경로를 가지고 java.io.File객체를
		//생성하자!(이유는 파일의 존재여부를 
		// 확인하기 위해서다. - exists())
		File f = new File(savePath);
		
		
		//같은 이름이 있을 경우 파일명 뒤에 숫자를
		//붙여줘야 한다.(int형 변수 필요)
		int idx = 1;
		while(f.exists()) { //같은 이름의 파일이
							// 있는 경우!!
							//파일명 뒤에 숫자를 붙여 파일명을 변경함!
			StringBuffer sb = new StringBuffer();
			sb.append(name);
			sb.append(idx++);
			sb.append(suffix); 
			
			fname = sb.toString(); //test1.txt
			
			savePath = path + System.getProperty("file.separator")+fname;
			
			f = new File(savePath);
		}
		
		return fname;
	}
}
