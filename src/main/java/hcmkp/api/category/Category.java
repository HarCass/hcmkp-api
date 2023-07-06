package hcmkp.api.category;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="categories")
public class Category {
    @Id
    @Column(name="category_name")
    private String categoryName;
    public String getCategoryName() {
        return categoryName;
    }
}
