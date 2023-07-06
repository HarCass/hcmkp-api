package hcmkp.api.category;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/categories")
public class CategoryController {
    @Autowired
    private CategoryRepo categoryRepo;

    @GetMapping("")
    public List<Category> getCategories() {
        return categoryRepo.findAll();
    }

    @PostMapping("")
    public ResponseEntity<Category> postCategory(@RequestBody Category newCategory) {
        categoryRepo.save(newCategory);
        return new ResponseEntity<Category>(newCategory, null, 201);
    }
}
