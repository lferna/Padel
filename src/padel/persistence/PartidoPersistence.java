package padel.persistence;

import java.util.List;

import javax.jdo.PersistenceManager;

import padel.PMF;
import padel.data.Equipo;
import padel.data.Partido;

public class PartidoPersistence {

	PersistenceManager pm = null;
	String equipo1 = null;
	String equipo2 = null;
	String resultado = null;
	String torneo = null;
	String ronda = null;
	String fecha = null;
	
	public PartidoPersistence (String equipo1, String equipo2, String resultado,String torneo, String ronda,String fecha){
		this.equipo1 = equipo1;
		this.equipo2 = equipo2;
		this.resultado = resultado;
		this.torneo = torneo;
		this.ronda = ronda;
		this.fecha = fecha;
		pm = PMF.get().getPersistenceManager();
	}
	
	public PartidoPersistence (String torneo){
		this.torneo = torneo;
		pm = PMF.get().getPersistenceManager();
	}
	
	public PartidoPersistence (){

		pm = PMF.get().getPersistenceManager();
	}

	
	public void makePersistent(){
		 Partido resultado = new Partido(equipo1,equipo2,this.resultado,torneo,ronda,fecha);
		 pm.makePersistent(resultado);
		 pm.close();
	}
	
	public void updatePersistent(){
		 Partido partido = new Partido(equipo1,equipo2,this.resultado,torneo,ronda,fecha);
		 String id = partido.getEquipo1()+"_"+partido.getEquipo2()+"_"+partido.getTorneo();
		 Partido tmpPartido = pm.getObjectById(Partido.class, id);
		 tmpPartido.setResultado(resultado);
		 pm.close();
	}
	
	public List getResultadoPorTorneo(){
		String query = "select from " + Partido.class.getName()+" where torneo=="+torneo;
		List<Partido> partido = (List<Partido>) pm.newQuery(query).execute();	
		return partido;
	}
	
	
	public List getResultados(){
		String query = "select from " + Partido.class.getName();
		List<Partido> partido = (List<Partido>) pm.newQuery(query).execute();	
		return partido;
	}

}
