package padel.server;

import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.util.logging.Logger;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailServer {

	private static final Logger log = Logger.getLogger(MailServer.class.getName());

	public MailServer(){		
		
	}
	
	public void sendMail(String mensaje,String asunto,String email,String nombre){
		Properties props = new Properties();
        Session session = Session.getDefaultInstance(props, null);
        log.warning("Llegamos al método sendMail");
     
        try {
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress("lfernapalacio@gmail.com", "Admin Campeonato de Padel"));
            log.warning("Tenemos el From");
            msg.addRecipient(Message.RecipientType.TO,
                             new InternetAddress(email, nombre));
            msg.setSubject(asunto);
            msg.setText(mensaje);
            log.warning("Justo antes de enviar mensaje");
            Transport.send(msg);
            log.warning("Después de enviar mensaje");
        } catch (AddressException e) {
        	log.warning("AdressException: "+e.getMessage());
          e.printStackTrace();
        } catch (MessagingException e) {
        	log.warning("MessagingException: "+e.getMessage());
        	e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
        	log.warning("UnsupportedEncodingException: "+e.getMessage());
			e.printStackTrace();
		}
	}
}
