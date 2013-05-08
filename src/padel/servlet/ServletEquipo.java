package padel.servlet;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import padel.data.Equipo;
import padel.data.Jugador;
import padel.data.Sesion;
import padel.persistence.EquipoPersistence;
import padel.persistence.JugadorPersistence;
import padel.persistence.SesionPersistence;

/**
 * Servlet implementation class for Servlet: ServletUsuarios
 * 
 */
public class ServletEquipo extends javax.servlet.http.HttpServlet implements
		javax.servlet.Servlet {

	 private static final Logger log = Logger.getLogger(ServletEquipo.class.getName());
	
	public ServletEquipo() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
			
			SesionPersistence sesion = new SesionPersistence("contectado");
			List objetos = sesion.getObjeto();
			String url = null;
			if (objetos!=null && objetos.size()>0){
				Sesion objetoSesion = (Sesion) objetos.get(0);
				url = objetoSesion.objeto;
			}
			RequestDispatcher dispatcher = null;
			
			if (url!=null){
				dispatcher = request
				.getRequestDispatcher("google.jsp");
			}else{
						
			this.emparejar();
			
			dispatcher = request
			.getRequestDispatcher("equipos.jsp");
			}
			
			if (dispatcher != null)
					dispatcher.forward(request, response);
			

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {

			RequestDispatcher dispatcher = request
			.getRequestDispatcher("inicio.jsp");
				if (dispatcher != null)
					dispatcher.forward(request, response);

		} catch (Exception anEx) {
			anEx.printStackTrace();
		}
	}
	
	private void emparejar(){
		List<Jugador> jugadores = this.devolverJugadores();		
		Iterator<Jugador> iterador = jugadores.iterator();
	 	while (iterador.hasNext()){
	 	Jugador jugador = (Jugador)iterador.next();
	 	String nombreEquipo = jugador.getEquipo();
	 	if (!this.getEquipo(nombreEquipo)){
	 	String linea = jugador.getLinea();
	 	String jugador1 = jugador.getNombre()+" "+jugador.getApellidos();
	 	String jugador2 = jugador.getPareja();
	 	if (!jugador2.equals("vacio")){
	 	EquipoPersistence equipo = new EquipoPersistence(nombreEquipo,linea,jugador1,jugador2);
	 	equipo.makePersistent();
	 	}
	 	}	 	
	 			
	 	}
	}
	
	private boolean getEquipo(String nombreEquipo){
		boolean existe = false;
		EquipoPersistence equipoPersistence = new EquipoPersistence(nombreEquipo);
		List<Equipo> equipo = equipoPersistence.getEquipo();
		if (equipo!=null && equipo.size()>0){
			existe = true;
		}else{
			existe = false;
		}
		return existe;
	}
	
	private List getEquipos(){
		EquipoPersistence equipo = new EquipoPersistence();
		return equipo.getEquipos();
	}
	
	private List devolverJugadores(){
		JugadorPersistence jugador = new JugadorPersistence();
		List<Jugador> jugadores = jugador.devolverTodosJugadores();
		return jugadores;
	}
	public void init() throws ServletException {

		super.init();
	}
}