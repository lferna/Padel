package padel.data;

import java.io.Serializable;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Jugador implements Serializable{
    @PrimaryKey
    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
    private String nombreUsuario;

    @Persistent
    private String linea;

    @Persistent
    private String nombre;

    @Persistent
    private String apellidos;
    
    @Persistent
    private String pareja;

    @Persistent
    private String equipo;
    
    
    public String getEquipo() {
		return equipo;
	}

	public void setEquipo(String equipo) {
		this.equipo = equipo;
	}

	public Jugador(String nombre,String apellidos,String linea,String pareja,String equipo){
    	this.nombreUsuario = nombre+"_"+apellidos;
    	this.linea = linea;
    	this.nombre = nombre;
    	this.apellidos = apellidos;
    	this.pareja = pareja;
    	this.equipo = equipo;
    }

	public String getPareja() {
		return pareja;
	}

	public void setPareja(String pareja) {
		this.pareja = pareja;
	}

	public String getNombreUsuario() {
		return nombreUsuario;
	}

	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}

	public String getLinea() {
		return linea;
	}

	public void setLinea(String linea) {
		this.linea = linea;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
    
    
        
}
