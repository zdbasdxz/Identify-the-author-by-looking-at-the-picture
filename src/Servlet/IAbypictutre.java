package Servlet;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.ResultSet;
import Model.Result_Data;
import net.sf.json.JSONArray;
import utl.FileUpload;
import utl.Identity;

/**
 * Servlet implementation class IAbypictuter
 */
@WebServlet("/IAbypictuter")
public class IAbypictutre extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Identity I = new Identity();
	ResultSet rs = new ResultSet();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IAbypictutre() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		//"Frida Kahlo","弗里达·卡罗","墨西哥","女","《底特律的流产》","画家","1907-07-06 00:00:00" "ImgUrl" "Baike"
		
        PrintWriter out=response.getWriter();

		String pth =FileUpload.uploadFiles(request,response);//得到路径
		System.out.println(I.get(pth));
		String result = I.get(pth);
		String[] strArr = result.split("-");
		String[] res = rs.getRes(Integer.parseInt(strArr[0]));
		
//		String s = request.getRealPath("/")+"images\\1.jpg";
		res[7] = "images\\"+strArr[0]+".jpg" ;//s.replaceAll("\\\\","/");
		System.out.println("----------------");
//		System.out.println(s);
		System.out.println(res[7]);
		Result_Data rd = new Result_Data(res[0],res[1],res[2],res[3],res[4],res[5],res[6],res[7],res[8]);
		JSONArray  json = JSONArray.fromObject(rd);
		pth = json.toString();
		System.out.print(pth);
		out.print(pth);
		
		//request.setAttribute("res", rd);
		
        out.flush();
        out.close();
		//request.getRequestDispatcher("result.jsp").forward(request, response);  //网址不会改变
		return;
	}
	

}
