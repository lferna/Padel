package padel.persistence;

import java.util.List;

import javax.jdo.PersistenceManager;

import padel.PMF;
import padel.data.Equipo;
import padel.data.Partido;

public class EquipoPersistence {

	PersistenceManager pm = null;
	String nombre = null;
	String linea = null;
	String jugador1 = null;
	String jugador2 = null;
	int puntos = 0;
	public EquipoPersistence (String nombre, String linea, String jugador1, String jugador2){
		this.nombre = nombre;
		this.linea = linea;
		this.jugador1 = jugador1;
		this.jugador2 = jugador2;
		pm = PMF.get().getPersistenceManager();
	}
	
	public EquipoPersistence (String nombre,int puntos){
		this.nombre = nombre;
		this.puntos = puntos;
		pm = PMF.get().getPersistenceManager();
	}
	
	public EquipoPersistence (String nombre){
		this.nombre = nombre;
		pm = PMF.get().getPersistenceManager();
	}
	
	public EquipoPersistence (){
		pm = PMF.get().getPersistenceManager();
	}

	
	public void makePersistent(){
		 Equipo equipo = new Equipo(nombre,linea,jugador1,jugador2);
		 pm.makePersistent(equipo);
		 pm.close();
	}
	
	public List getEquipos(){
		String query = "select from " + Equipo.class.getName();
		List<Equipo> equipos = (List<Equipo>) pm.newQuery(query).execute();	
		return equipos;
	}
	
	public void setPuntos(){
		 Equipo equipo = new Equipo(nombre);
		 Equipo tmpEquipo = pm.getObjectById(Equipo.class, nombre);
		 tmpEquipo.setPuntos(puntos);
		 pm.close();
	}
	
	public List getEquipo(){
		String query = "select from " + Equipo.class.getName()+ " where nombre=='"+nombre+"'";
		List<Equipo> equipos = (List<Equipo>) pm.newQuery(query).execute();	
		return equipos;
	}

	
}
