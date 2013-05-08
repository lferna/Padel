package padel.data;

import java.io.Serializable;
import java.util.List;
import java.util.ArrayList;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Sesion implements Serializable {
	
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)	
	public java.lang.String valor;
	
	@Persistent
	public String objeto;
	
	public Sesion(String valor, String objeto){
		this.valor = valor;
		this.objeto = objeto;
	}
	
	public Sesion(){
		
	}

	

}
