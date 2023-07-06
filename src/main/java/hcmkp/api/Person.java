package hcmkp.api;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.persistence.Id;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;

@Entity
@Table(name = "people")
public class Person {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "person_id")
    private Long id;

    @Column(name = "first_name")
    private String firstName;
    public String getFirstName() {
        return firstName;
    }

    @Column(name = "last_name")
    private String lastName;
    public String getLastName() {
        return lastName;
    }
    
    @Column(name = "email")
    private String email;
    public String getEmail() {
        return email;
    }
}
