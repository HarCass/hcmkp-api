package hcmkp.api.item;

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
@RequestMapping("/api/items")
public class ItemController {
    @Autowired
    private ItemRepo itemRepo;

    @GetMapping("")
    public List<Item> getItems() {
        return itemRepo.findAll();
    }

    @GetMapping("/{item_id}")
    public Item getItem(@PathVariable("item_id") Long id) {
        return itemRepo.findById(id).get();
    }

    @PostMapping("")
    public ResponseEntity<Item> postItem(@RequestBody Item newItem) {
        itemRepo.save(newItem);
        return new ResponseEntity<Item>(newItem, null, 201);
    }

    @DeleteMapping
    public ResponseEntity<Void> deleteItem(@RequestBody Long id) {
        itemRepo.deleteById(id);
        return new ResponseEntity<Void>(null, null, 204);
    }
}
