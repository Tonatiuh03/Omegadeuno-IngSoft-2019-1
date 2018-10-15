package mx.unam.is20191.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.UIComponent;
import javax.faces.component.UIInput;
import javax.faces.context.FacesContext;
import javax.faces.validator.ValidatorException;
import javax.persistence.EntityManager;
import mx.unam.is20191.dao.UsuarioDao;
import mx.unam.is20191.models.Usuario;
import mx.unam.is20191.utils.Config;
import mx.unam.is20191.utils.Password;
import org.primefaces.event.FileUploadEvent;
import org.primefaces.model.DefaultStreamedContent;
import org.primefaces.model.StreamedContent;
import org.primefaces.model.UploadedFile;

@ManagedBean
@SessionScoped
public class RegistroController {

    private String nombreCompleto, userName, password, correo;

    private final UsuarioDao USUARIO_DAO;

    private UploadedFile file;

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public UploadedFile getFile() {
        return file;
    }

    public void setFile(UploadedFile file) {
        this.file = file;
    }

    public RegistroController() {
        USUARIO_DAO = new UsuarioDao();
    }

    /**
     * Método que registra al usuario con el formulario ya validado.
     *
     * @return La página a la que vamos a redireccionar.
     */
    public String registerUser() throws Exception {

        try {
            Usuario nuevoUsuario = new Usuario();
            nuevoUsuario.setNombreCompleto(nombreCompleto);
            nuevoUsuario.setCorreoCiencias(correo+Config.DOMINIO_CORREO);
            nuevoUsuario.setUserName(userName);
            nuevoUsuario.setPassword(Password.encryptPassword(password));
            if (this.file == null) {
                nuevoUsuario.setRutaImagen(Config.IMG_PROFILE_REPO_DEFAULT_FILE_NAME);
            } else {
                do {
                    nuevoUsuario.setRutaImagen(Password.randomString(20) + ".jpg");
                } while (new File(Config.IMG_PROFILE_REPO + nuevoUsuario.getRutaImagen()).exists());
                file.write(Config.IMG_PROFILE_REPO + nuevoUsuario.getRutaImagen());
            }
            this.USUARIO_DAO.getEntityManager().getTransaction().begin();
            this.USUARIO_DAO.save(nuevoUsuario);
            this.USUARIO_DAO.getEntityManager().getTransaction().commit();
            FacesContext.getCurrentInstance().addMessage("messages",
                    new FacesMessage(FacesMessage.SEVERITY_INFO,
                            "Se ha registrado el usuario con éxito, favor de revisar su correo para activarlo.",
                            "Se ha registrado el usuario con éxito, favor de revisar su correo para activarlo."));
        } catch (IllegalArgumentException ex) {
            FacesContext.getCurrentInstance().addMessage("messages",
                    new FacesMessage(FacesMessage.SEVERITY_FATAL,
                            "Por el momento no podemos agregar su registro al sistema, inténtelo más tarde.",
                            "Por el momento no podemos agregar su registro al sistema, inténtelo más tarde."));

            return null;
        }
        return "/index.xhtml";
    }

    //Ejemplo para algunos casos que se necesitaran para validar.
    public void validatePassword(FacesContext context, UIComponent component, Object value) {
        // Retrieve the value passed to this method
        String confirmPassword = (String) value;
        // Retrieve the temporary value from the password field
        UIInput passwordInput = (UIInput) component.findComponent("password");
        String password = (String) passwordInput.getLocalValue();
        if (password == null || confirmPassword == null || !password.equals(confirmPassword)) {
            FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Las contraseñas no coinciden", "Las contraseñas no coinciden");
            throw new ValidatorException(msg);
        }
    }

    /**
     * Método que valida si un usuario ya está registrado en la base de datos,
     * manda error si se escribe un usuario que ya esté registrado.
     *
     * @param context Es el contexto del jsf.
     * @param component Es el componente que contiene el user name.
     * @param value Es el valor obtenido del componente que llama al validador,
     * es decir, el user name.
     */
    public void validateUniqueUserName(FacesContext context, UIComponent component, Object value) {
        if (USUARIO_DAO.userExist(value.toString())) {
            FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_ERROR,
                    "El usuario ya existe, escriba otro.",
                    "El usuario ya existe, escriba otro.");
            throw new ValidatorException(msg);
        }
    }

    /**
     * Método que verifica si un email es único.
     *
     * @param context Es el contexto del jsf.
     * @param component Es el componente que contiene el email.
     * @param value Es el valor del mail que se tiene.
     */
    public void validateUniqueEmail(FacesContext context, UIComponent component, Object value) {
        if (USUARIO_DAO.mailExist(value + Config.DOMINIO_CORREO)) {
            FacesMessage msg = new FacesMessage(FacesMessage.SEVERITY_ERROR,
                    "El correo que intenta dar ya está registrado, escriba otro.",
                    "El correo que intenta dar ya está registrado, escriba otro.");
            throw new ValidatorException(msg);
        }
    }

    /**
     * Método que obtiene la imagen que el usuario subió.
     *
     * @param e Es el objeto donde se encuentra la imagen que el usuario subió.
     */
    public void uploadImg(FileUploadEvent e) {
        this.file = e.getFile();
    }

    /**
     * Método para obtener la imagen del usuario en el formulario, muetra la
     * default si no sube alguna o se muestra la que el usuario pase como
     * parámetro.
     *
     * @return La imagen que se despliega
     */
    public StreamedContent getImagestream() {
        try {
            if (file != null) {
                return new DefaultStreamedContent(file.getInputstream(), file.getContentType());
            } else {
                return new DefaultStreamedContent(new FileInputStream(new File(Config.IMG_PROFILE_REPO_DEFAULT)), "png");
            }
        } catch (IOException ex) {
            return null;
        }
    }

    /**
     * Método que elimina el archivo subido cuando se ingresa en la página de
     * regitro.
     */
    public void clear() {
        this.file = null;
        this.nombreCompleto = null;
        this.correo = null;
        this.password = null;
        this.userName = null;
    }

}
