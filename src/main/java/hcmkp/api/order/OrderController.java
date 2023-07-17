package hcmkp.api.order;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/orders")
public class OrderController {
    @Autowired
    OrderRepo orderRepo;

    @GetMapping
    public List<Order> getOrders() {
        return orderRepo.findAll();
    }

    @GetMapping("/{user_id}")
    public List<Order> getUserOrders(@PathVariable("user_id") Long userId) {
        return orderRepo.findUserOrders(userId);
    }

    @PostMapping
    public ResponseEntity<Order> postOrder(@RequestBody Order newOrder) {
        orderRepo.save(newOrder);
        return new ResponseEntity<Order>(newOrder, null, 201);
    }
}
