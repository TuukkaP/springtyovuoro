package tyovuoro.model;

import java.util.Set;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "roles")
public class Role {

    @Id
    @GeneratedValue
    private Integer id;

    private String role_name;
    @OneToMany(mappedBy="role")
//    @JoinTable(name = "user_roles",
//            joinColumns = {
//                @JoinColumn(name = "role_id", referencedColumnName = "id")},
//            inverseJoinColumns = {
//                @JoinColumn(name = "user_id", referencedColumnName = "id")})
    private Set<User> userRoles;

    public int getId() {
        return id;
    }    
    
    public void setId(Integer id) {
        this.id = id;
    }

    public void setUserRoles(Set<User> userRoles) {
        this.userRoles = userRoles;
    }

    public Set<User> getUserRoles() {
        return userRoles;
    }

    public String getRole_name() {
        return role_name;
    }

    public void setRole_name(String role_name) {
        this.role_name = role_name;
    }

    @Override
    public String toString() {
        return id + " : " + role_name;
    }
    
    

}
