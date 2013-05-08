package padel.servlet;

import java.io.IOException;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import padel.data.Jugador;
import padel.data.Sesion;
import padel.persistence.JugadorPersistence;
import padel.persistence.SesionPersistence;
import padel.server.MailServer;

/**
 * Servlet implementation class for Servlet: ServletUsuarios
 * 
 */
public class ServletJugador extends javax.servlet.http.HttpServlet implements
		javax.servlet.Servlet {

	 private static final Logger log = Logger.getLogger(ServletJugador.class.getName());

	
	public ServletJugador() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
			
			RequestDispatcher dispatcher = request
			.getRequestDispatcher("inscripcion.jsp");
			
				if (dispatcher != null)
					dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			String boton = request.getParameter("boton");
			 log.warning("El boton es: "+boton);
			if (boton.equals("Inscribirse")){
			
				String nombre = request.getParameter("nombre");
				String apellidos = request.getParameter("apellidos");
				String linea = request.getParameter("linea");
				String pareja = request.getParameter("pareja");
				String equipo = request.getParameter("equipo");
				JugadorPersistence jugador = new JugadorPersistence(nombre,apellidos,linea,pareja,equipo);
				if (!this.getJugador(jugador)){				
				jugador.makePersistent();				
				}
			}
			
			 log.warning("Vamos a redirigir a inscripcion.jsp");
			RequestDispatcher dispatcher = request
			.getRequestDispatcher("inscripcion.jsp");
				if (dispatcher != null)
					dispatcher.forward(request, response);

		} catch (Exception anEx) {
			anEx.printStackTrace();
		}
	}
	
	private List devolverTodosJugadores(){
		JugadorPersistence jugador = new JugadorPersistence();
		List<Jugador> jugadores = jugador.devolverTodosJugadores();
		return jugadores;
	}
	
	private boolean getJugador(JugadorPersistence jugador){
		List<Jugador> jugadores = jugador.getJugador();
		if (jugadores!=null && jugadores.size()>0){
			return true;
		}
		return false;
	}
	

	public void init() throws ServletException {

		super.init();
	}
}