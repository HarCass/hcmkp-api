package hcmkp.api;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PersonRepositry extends JpaRepository<Person, Long> {
    
}
