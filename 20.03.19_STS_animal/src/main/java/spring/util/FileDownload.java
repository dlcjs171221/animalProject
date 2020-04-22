package spring.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;


/**
 * Servlet implementation class FileDownload
 */
public class FileDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//serialVersionUID : 객체를 파일에 쓰거나 전송하기 위해 필요한 직렬화과정에서
	//					 사용되는 고유 아이디 //선언x > JVM에서 자동디폴트됨
	//형태 : static final long serialVersionUID 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileDownload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String filename = request.getParameter("f_name");
		
		String path = getServletContext().getRealPath("/resources/upload"); // path = WebContent/upload
		
		System.out.println(filename+"1111");
		System.out.println(path+"1111");
		
		
		//다시 위의 절대경로를 파일명과 연결시키자
		String fullPath = path + 
			System.getProperty("file.separator")+filename; // fullPath = WebContent/upload/filename
		
		
		//전체경로가 준비되었으니 파일을 보내기 위해
		// File객체르르 생성한다.
		File f = new File(fullPath);
		
		byte[] buf = new byte[2048];//바구니 역할
		
		
		//전송할 데이터가 스트림 처리될 때 문자셋을 지정해야 함!
		response.setContentType(
			"application/octet-stream;charset=8859_1");
		
		//다운로드 대화상자 처리
		response.setHeader("Content-Disposition",
				"attachment;filename="+new String(filename.getBytes("utf-8"),
						"8859_1"));
			
		//전송타입이 이진데이터(binary)
		response.setHeader("Content-Transfer-Encoding",
				"binary");
		
		if(f.isFile()) {
			BufferedInputStream bis =
				new BufferedInputStream(
					new FileInputStream(f));
			
			//요청한 곳으로 보내기 위해(응답하기 위해)
			//스트림을 요청객체로 부터 얻어낸다.
			BufferedOutputStream bos = 
				new BufferedOutputStream(
					response.getOutputStream());
			
			int size = -1;
			try {
				//읽어 오자마자 보내기를 수행한다.
				while((size = bis.read(buf)) != -1) {
					bos.write(buf, 0, size);//보내기
					bos.flush();//스트림 비우기
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(bos != null)
					bos.close();
				if(bis != null)
					bis.close();
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
