package hcmkp.api.basket;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/baskets")
public class BasketController {
    @Autowired
    private BasketRepo basketRepo;

    @GetMapping("")
    public List<Basket> getBaskets() {
        return basketRepo.findAll();
    }

    @GetMapping("/{user_id}")
    public List<Basket> getUserBasket(@PathVariable("user_id") Long userId) {
        return basketRepo.findUserBasket(userId);
    }
}
