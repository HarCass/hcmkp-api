package hcmkp.api;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/people")
public class PeopleController {
    @Autowired
    private PersonRepositry personRepositry;

    @GetMapping("")
    public List<Person> getPeople() {
        return personRepositry.findAll();
    }
}
