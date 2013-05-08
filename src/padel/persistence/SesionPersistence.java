package padel.persistence;

import java.util.List;

import javax.jdo.PersistenceManager;

import padel.PMF;
import padel.data.Equipo;
import padel.data.Sesion;

public class SesionPersistence {

	PersistenceManager pm = null;
	String valor = null;
	String objetoString = null;
	
	public SesionPersistence (String valor, String objetoString){
		this.valor = valor;
		this.objetoString = objetoString;		
		pm = PMF.get().getPersistenceManager();
	}
		
	public SesionPersistence (String valor){
		this.valor = valor;
		pm = PMF.get().getPersistenceManager();
	}

	public void makePersistent(){
		 Sesion sesion = new Sesion(valor,objetoString);
		 pm.makePersistent(sesion);
		 pm.close();
	}
	
	public List getObjeto(){
		String query = "select from " + Sesion.class.getName()+" where valor=='"+valor+"'";
		List<Sesion> objetos = (List<Sesion>) pm.newQuery(query).execute();	
		
		return objetos;
	}
	
	public void deleteObjeto(){
		List objetos = this.getObjeto();
		if (objetos!=null && objetos.size()>0){
			Sesion sesion = (Sesion)objetos.get(0);
			pm.deletePersistent(sesion);
		}
	}

	
}
