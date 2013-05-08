package padel.persistence;

import java.util.List;

import javax.jdo.PersistenceManager;

import padel.PMF;
import padel.data.Partido;
import padel.data.Torneo;

public class TorneoPersistence {

	PersistenceManager pm = null;
    private String numero = null;
    private String fecha = null;
	
	public TorneoPersistence (String numero, String fecha) {
        this.numero = numero;
        this.fecha = fecha;
		pm = PMF.get().getPersistenceManager();
	}
	

	public TorneoPersistence (){

		pm = PMF.get().getPersistenceManager();
	}

	
	public void makePersistent(){
		 Torneo torneo = new Torneo(numero,fecha);
		 pm.makePersistent(torneo);
		 pm.close();
	}
	
	
	public List getTorneo(){
		String query = "select from " + Torneo.class.getName()+" where numero=="+numero;
		List<Torneo> torneo = (List<Torneo>) pm.newQuery(query).execute();	
		return torneo;
	}
	
	public List getTorneos(){
		String query = "select from " + Torneo.class.getName();
		List<Torneo> torneo = (List<Torneo>) pm.newQuery(query).execute();	
		return torneo;
	}

}
