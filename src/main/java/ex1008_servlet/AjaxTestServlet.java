package ex1008_servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/ajaxCheck",loadOnStartup = 1)
public class AjaxTestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //전송된 데이터 받기
        String name = req.getParameter("name");
        System.out.println("name = " + name);

        //서비스->dao->결과를 받아서
        //브라우저로 응답
        PrintWriter out = resp.getWriter();
        out.println(name + " 님 반가워요~, Nice to meet you");

    }
}
