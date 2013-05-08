package padel.persistence;

import java.util.List;

import javax.jdo.PersistenceManager;

import padel.PMF;
import padel.data.Equipo;
import padel.data.Jugador;

public class JugadorPersistence {

	PersistenceManager pm = null;
	String apellidos = null;
	String nombre = null;
	String linea = null;
	String pareja = null;
	String equipo = null;
	
	public JugadorPersistence(){
		pm = PMF.get().getPersistenceManager();
	}
	
	public JugadorPersistence (String nombre, String apellidos, String linea,String pareja,String equipo){
		this.apellidos = apellidos;
		this.nombre = nombre;
		this.linea = linea;	
		this.pareja = pareja;
		this.equipo = equipo;
		pm = PMF.get().getPersistenceManager();
	}
	
	public List devolverTodosJugadores(){
		String query = "select from " + Jugador.class.getName();
		List<Jugador> jugadores = (List<Jugador>) pm.newQuery(query).execute();	
		return jugadores;
	}
	
	public List getJugador(){
		String nombreUsuario = nombre+"_"+apellidos;
		String query = "select from " + Jugador.class.getName()+ " where nombreUsuario=='"+nombreUsuario+"'";
		List<Jugador> jugadores = (List<Jugador>) pm.newQuery(query).execute();	
		return jugadores;
	}
	
	public void makePersistent(){
		 Jugador jugador = new Jugador(nombre,apellidos,linea,pareja,equipo);
		 pm.makePersistent(jugador);
		 pm.close();
	}
}
