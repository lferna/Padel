package padel.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import padel.persistence.ComentarioPersistence;

/**
 * Servlet implementation class for Servlet: ServletUsuarios
 * 
 */
public class ServletComentario extends javax.servlet.http.HttpServlet implements
		javax.servlet.Servlet {

	public ServletComentario() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			String boton = request.getParameter("boton");
			if (boton.equals("Comenta")){
				String usuario = request.getParameter("usuario");
				String comentario = request.getParameter("comentario");
				this.crearTorneo(usuario,comentario);
			}
			
			RequestDispatcher dispatcher = request
			.getRequestDispatcher("resultados.jsp");
				if (dispatcher != null)
					dispatcher.forward(request, response);
			
		} catch (Exception anEx) {
			anEx.printStackTrace();
		}
	}
	
	protected void crearTorneo(String usuario, String comentario){
		ComentarioPersistence comentarioPersistence = new ComentarioPersistence(usuario,comentario);
		comentarioPersistence.makePersistent();
	}
	
	
	public void init() throws ServletException {

		super.init();
	}
}