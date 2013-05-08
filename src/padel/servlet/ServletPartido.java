package padel.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import padel.data.Partido;
import padel.persistence.PartidoPersistence;
import padel.persistence.SesionPersistence;

/**
 * Servlet implementation class for Servlet: ServletUsuarios
 * 
 */
public class ServletPartido extends javax.servlet.http.HttpServlet implements
		javax.servlet.Servlet {

	public ServletPartido() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {


	    UserService userService = UserServiceFactory.getUserService();
	    User user = userService.getCurrentUser();	    
	    RequestDispatcher dispatcher = null;
	    
	    if (user != null && user.getEmail().equals("lfernapalacio@gmail.com")) {
	    	
	    	dispatcher = request
			.getRequestDispatcher("partido.jsp");
	    	
	    	
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
			if (boton.equals("Crear Partido")){
				String equipo1 = request.getParameter("equipo1");
				String equipo2 = request.getParameter("equipo2");
				String resultado = request.getParameter("resultado");
				String torneo = request.getParameter("torneo");
				String ronda = request.getParameter("ronda");
				String fecha = request.getParameter("fecha");
				this.crearPartido(equipo1, equipo2, resultado, torneo, ronda, fecha);
				

			}
			if (boton.equals("Modificar Partido")){
				String equipo1 = request.getParameter("equipo1");
				String equipo2 = request.getParameter("equipo2");
				String resultado = request.getParameter("resultado");
				String torneo = request.getParameter("torneo");
				String ronda = request.getParameter("ronda");
				String fecha = request.getParameter("fecha");
				this.modificarPartido(equipo1, equipo2, resultado, torneo, ronda, fecha);
			
			}
			
			RequestDispatcher dispatcher = request
			.getRequestDispatcher("partido.jsp");
				if (dispatcher != null)
					dispatcher.forward(request, response);
				
				
		} catch (Exception anEx) {
			anEx.printStackTrace();
		}
	}
	
	protected void crearPartido(String equipo1,String equipo2,String resultado,String torneo,String ronda,String fecha){
		PartidoPersistence partidoPersistencia = new PartidoPersistence(equipo1,equipo2,resultado,torneo,ronda,fecha);
		partidoPersistencia.makePersistent();
	}
	
	protected void modificarPartido(String equipo1,String equipo2,String resultado,String torneo,String ronda,String fecha){
		PartidoPersistence partidoPersistencia = new PartidoPersistence(equipo1,equipo2,resultado,torneo,ronda,fecha);
		partidoPersistencia.updatePersistent();
	}
	
	private List getResultados (){
		PartidoPersistence partidoPersistence = new PartidoPersistence();
		List partidos = partidoPersistence.getResultados();

		return partidos;
	}
	
	private List getPartidos(String numeroTorneo){
		PartidoPersistence partidoPersistence = new PartidoPersistence(numeroTorneo);
		List<Partido> partidos = partidoPersistence.getResultadoPorTorneo();
		return partidos;
	}

	public void init() throws ServletException {

		super.init();
	}
}