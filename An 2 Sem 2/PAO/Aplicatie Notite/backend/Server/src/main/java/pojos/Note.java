package pojos;

/**
 * Created by calin on 01.05.2017.
 */
public class Note {
    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public boolean isHasPassword() {
        return hasPassword;
    }

    public void setHasPassword(boolean hasPassword) {
        this.hasPassword = hasPassword;
    }

    @Override
    public String toString() {
        return "Note{" +
                "id=" + id +
                ", user='" + user + '\'' +
                ", hasPassword=" + hasPassword +
                ", password='" + password + '\'' +
                ", text='" + text + '\'' +
                '}';
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Note(String user, boolean hasPassword, String password, String text) {
        this.user = user;
        this.hasPassword = hasPassword;
        this.password = password;
        this.text = text;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Note(int id, String user, boolean hasPassword, String password, String text) {
        this.id = id;
        this.user = user;
        this.hasPassword = hasPassword;
        this.password = password;
        this.text = text;
    }

    private int id;
    private String user;
    private boolean hasPassword;
    private String password;
    private String text ;



}
