package ie.cit.cloudapp;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class UserServlet extends HttpServlet {
	
	private WebApplicationContext ctx;

	@Override
	public void init() throws ServletException {
		ctx = WebApplicationContextUtils
				.getWebApplicationContext(getServletContext());
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		UserRepository repo = getRepo(req);
		req.setAttribute("Users", repo.getUsers());
		doForward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		UserRepository repo = getRepo(req);
		User User = new User();
		User.setFirstName(req.getParameter("first"));
		repo.addUser(User);

		req.setAttribute("Users", repo.getUsers());
		doForward(req, resp);
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Integer index = Integer.valueOf(req.getParameter("UserId"));
		UserRepository repo = getRepo(req);
		User User = repo.getUsers().get(index - 1);
		User.setDone(!User.isDone());
		req.setAttribute("Users", repo.getUsers());
		doForward(req, resp);
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Integer index = Integer.valueOf(req.getParameter("UserId"));
		UserRepository repo = getRepo(req);
		repo.getUsers().remove(index - 1);
		req.setAttribute("Users", repo.getUsers());
		doForward(req, resp);
	}

	private UserRepository getRepo(HttpServletRequest req) {
		return ctx.getBean(UserRepository.class);
	}

	private void doForward(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher rd = getServletContext().getRequestDispatcher(
				"/signUp1.jsp");
		rd.forward(req, resp);
	}

}
