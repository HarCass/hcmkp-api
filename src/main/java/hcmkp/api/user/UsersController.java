package hcmkp.api.user;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/users")
public class UsersController {
    @Autowired
    private UserRepo userRepo;

    @GetMapping("")
    public List<User> getUsers() {
        return userRepo.findAll();
    }

    @GetMapping("/{user_id}")
    public User getUser(@PathVariable("user_id")Long id) {
        return userRepo.findById(id).get();
    }
}