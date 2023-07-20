package hcmkp.api.basket;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
    public List<UserBasket> getUserBasket(@PathVariable("user_id") Long userId) {
        return basketRepo.findUserBasket(userId);
    }

    @PostMapping
    public ResponseEntity<Basket> postItemToBasket(@RequestBody NewBasketItem basketItem) {
        return new ResponseEntity<Basket>(basketRepo.inertNewBasket(basketItem.itemId, basketItem.userId), null, 201);
    }

    @DeleteMapping
    public ResponseEntity<Void> deleteBasketItem(@RequestBody Long itemId, Long userId) {
        basketRepo.deleteBasketItem(itemId, userId);
        return new ResponseEntity<Void>(null, null, 204);
    }
}
