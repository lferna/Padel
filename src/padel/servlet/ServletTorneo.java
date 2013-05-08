package padel.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import padel.persistence.SesionPersistence;
import padel.persistence.TorneoPersistence;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

/**
 * Servlet implementation class for Servlet: ServletUsuarios
 * 
 */
public class ServletTorneo extends javax.servlet.http.HttpServlet implements
		javax.servlet.Servlet {

	public ServletTorneo() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	    UserService userService = UserServiceFactory.getUserService();
	    User user = userService.getCurrentUser();	    
	    RequestDispatcher dispatcher = null;
	    
	    if (user != null && user.getEmail().equals("lfernapalacio@gmail.com")) {
	    	
	    	dispatcher = request
			.getRequestDispatcher("torneo.jsp");
	    	
	    	
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
			if (boton.equals("Crear Torneo")){
				String fecha = request.getParameter("fecha");
				String numero = request.getParameter("numero");
				this.crearTorneo(numero, fecha);
				
			}
			
			RequestDispatcher dispatcher = request
			.getRequestDispatcher("torneo.jsp");
				if (dispatcher != null)
					dispatcher.forward(request, response);
			
		} catch (Exception anEx) {
			anEx.printStackTrace();
		}
	}
	
	protected void crearTorneo(String numero, String fecha){
		TorneoPersistence torneoPersistence = new TorneoPersistence(numero,fecha);
		torneoPersistence.makePersistent();
	}
	
	
	public void init() throws ServletException {

		super.init();
	}
}