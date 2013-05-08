package padel.servlet;

import java.io.IOException;

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
public class ServletResultado extends javax.servlet.http.HttpServlet implements
		javax.servlet.Servlet {

	public ServletResultado() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	    UserService userService = UserServiceFactory.getUserService();
	    User user = userService.getCurrentUser();	    
	    RequestDispatcher dispatcher = null;
	    
	    if (user != null && user.getEmail().equals("lfernapalacio@gmail.com")) {
	    	
	    	dispatcher = request
			.getRequestDispatcher("puntos.jsp");
	    	
	    	
	    } else {
	    	SesionPersistence sesion = new SesionPersistence("conectado",userService.createLoginURL(request.getRequestURI()));
	    	sesion.deleteObjeto();
	    	sesion.makePersistent();
	    	dispatcher = request
			.getRequestDispatcher("google.jsp");
	    }
	 
		if (dispatcher != null)
				dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			String boton = request.getParameter("boton");
			if (boton.equals("Modificar Puntuacion")){
				String equipo = request.getParameter("equipo");
				String puntos = request.getParameter("puntos");
				EquipoPersistence equipoPersistence = new EquipoPersistence(equipo,Integer.parseInt(puntos));
				equipoPersistence.setPuntos();
			}
				
			 RequestDispatcher dispatcher = request
					.getRequestDispatcher("puntos.jsp");
			 
			if (dispatcher != null)
					dispatcher.forward(request, response);
		} catch (Exception anEx) {
			anEx.printStackTrace();
		}
	}
	

	public void init() throws ServletException {

		super.init();
	}
}