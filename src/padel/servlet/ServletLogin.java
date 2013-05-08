package padel.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import padel.persistence.EquipoPersistence;
import padel.persistence.SesionPersistence;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

/**
 * Servlet implementation class for Servlet: ServletUsuarios
 * 
 */
public class ServletLogin extends javax.servlet.http.HttpServlet implements
		javax.servlet.Servlet {

	 private static final Logger log = Logger.getLogger(ServletLogin.class.getName());

	
	public ServletLogin() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher dispatcher = request
				.getRequestDispatcher("inicio.jsp");
		if (dispatcher != null)
			dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			// obtenemos el tipo de boton pulsado
			String boton = request.getParameter("boton");
			RequestDispatcher dispatcher = null;
			// en el caso de que sea el boton de login
		

		} catch (Exception anEx) {
			anEx.printStackTrace();
		}
	}

	private List getEquipos(){
		EquipoPersistence equipo = new EquipoPersistence();
		return equipo.getEquipos();
	}

	public void init() throws ServletException {

		super.init();
	}
}