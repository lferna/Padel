package padel.data;

import java.io.Serializable;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Partido implements Serializable{
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private String id;

    @Persistent
    private String equipo1;

    @Persistent
    private String equipo2;

    @Persistent
    private String resultado;
    
    @Persistent
    private String torneo;
    
    @Persistent
    private String ronda;
    
    @Persistent
    private String fecha;
    
   
    public Partido(String equipo1, String equipo2, String resultado,String torneo,String ronda,String fecha) {
        this.id = equipo1+"_"+equipo2+"_"+torneo;
        this.equipo1 = equipo1;
        this.equipo2 = equipo2;
        this.resultado = resultado;
        this.torneo = torneo;
        this.ronda = ronda;
        this.fecha = fecha;
    }
    
    public Partido (String torneo){
    	this.torneo = torneo;
    }



	public String getFecha() {
		return fecha;
	}


	public void setFecha(String fecha) {
		this.fecha = fecha;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getEquipo1() {
		return equipo1;
	}


	public void setEquipo1(String equipo1) {
		this.equipo1 = equipo1;
	}


	public String getEquipo2() {
		return equipo2;
	}


	public String getTorneo() {
		return torneo;
	}



	public void setTorneo(String torneo) {
		this.torneo = torneo;
	}



	public String getRonda() {
		return ronda;
	}



	public void setRonda(String ronda) {
		this.ronda = ronda;
	}



	public void setEquipo2(String equipo2) {
		this.equipo2 = equipo2;
	}


	public String getResultado() {
		return resultado;
	}


	public void setResultado(String resultado) {
		this.resultado = resultado;
	}
	
    
}
