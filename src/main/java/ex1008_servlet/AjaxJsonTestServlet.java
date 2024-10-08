package ex1008_servlet;

import com.google.gson.Gson;
import dto.Member;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

/**
 * Servlet implementation class AjaxTestServlet
 */
@WebServlet(urlPatterns = "/ajax",loadOnStartup = 1)
public class AjaxJsonTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		//요청된 정보가 어떤 메소드를 실행해야하는지 체크
		String key = request.getParameter("key");
		System.out.println("key = " + key);
		if(key.equals("text")) {
			this.text(request, response);
		}else if(key.equals("json")) {
			this.json(request, response);
		}else if(key.equals("dto")) {
			this.dto(request, response);
		}else if(key.equals("list")) {
			this.list(request, response);
		}else if(key.equals("map")) {
			this.map(request, response);
		}else {
		    this.property(request, response);	
		}
	}
	
	/**
	 * text 결과
	 * */
    public void text(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// service 호출

		// 응답
		PrintWriter out = response.getWriter();
		out.println("Welcome to ~");

    	
	}

	/**
	 * json결과
	 * */
   public void json(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//service -> dao 
	  List<String> menus= Arrays.asList("짬뽕","짜장면");

	  Gson gson=new Gson();
	  String jsonArray=gson.toJson(menus);

	   PrintWriter out = response.getWriter();
	   out.println(jsonArray);
	}

	/**
	 * DTO 결과
	 * */
   public void dto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   Member member = new Member("jang", "장희정", 25, "서울");

	   Gson gson=new Gson();
	   String jsonArr = gson.toJson(member);

	   PrintWriter out = response.getWriter();
	   out.println(jsonArr);

   }
	
	/**
	 * List결과
	 * */
   public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  List<Member> list=new ArrayList<>();
	  list.add(new Member("jang", "장희정", 25, "서울"));
	  list.add(new Member("1", "이름1", 25, "서울"));
	  list.add(new Member("2", "이름2", 25, "서울"));
	  list.add(new Member("3", "이름3", 25, "서울"));
	  list.add(new Member("4", "이름4", 25, "서울"));

	   Gson gson=new Gson();
	   String jsonArr = gson.toJson(list);

	   PrintWriter out = response.getWriter();
	   out.println(jsonArr);

	   System.out.println("list jsonArr = " + jsonArr);
	}
	
	/**
	 * Map결과
	 * */
   public void map(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   Map<String,Object> map=new HashMap<>();
	   map.put("message", "Ajax 재미있다");
	   map.put("pageNo", 20);
	   map.put("dto", new Member("jang", "장희정", 25, "서울"));

	   List<Member> list=new ArrayList<>();
	   list.add(new Member("jang", "장희정", 25, "서울"));
	   list.add(new Member("1", "이름1", 25, "서울"));
	   list.add(new Member("2", "이름2", 25, "서울"));

	   map.put("memberList", list);

	   Gson gson=new Gson();
	   String jsonArr = gson.toJson(map);

	   PrintWriter out = response.getWriter();
	   out.println(jsonArr);

	   System.out.println("map jsonArr = " + jsonArr);
	}
	
	/**
	 * property 결과
	 * */
   public void property(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}







