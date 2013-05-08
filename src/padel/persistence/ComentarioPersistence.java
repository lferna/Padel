package padel.persistence;

import java.util.Date;
import java.util.List;

import javax.jdo.PersistenceManager;

import padel.PMF;
import padel.data.Comentario;
import padel.data.Torneo;

public class ComentarioPersistence {

	PersistenceManager pm = null;
    private String usuario = null;
    private String comentario = null;
	
	public ComentarioPersistence (String usuario, String comentario) {
        this.usuario = usuario;
        this.comentario = comentario;
		pm = PMF.get().getPersistenceManager();
	}
	

	public ComentarioPersistence (){

		pm = PMF.get().getPersistenceManager();
	}

	
	public void makePersistent(){
		 Comentario comentario = new Comentario(usuario,this.comentario);
		 pm.makePersistent(comentario);
		 pm.close();
	}
	

	public List getComentarios(){
		String query = "select from " + Comentario.class.getName()+" order by fecha desc";
		List<Comentario> comentario = (List<Comentario>) pm.newQuery(query).execute();	
		return comentario;
	}

}
