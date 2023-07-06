package hcmkp.api.item;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.persistence.Id;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;

@Entity
@Table(name = "items")
public class Item {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "item_id")
    private Long id;
    public Long getItemId() {
        return id;
    }

    @Column(name = "item_name")
    private String itemName;
    public String getItemName() {
        return itemName;
    }

    @Column(name = "details")
    private String details;
    public String getDetails() {
        return details;
    }

    @Column(name = "img_url")
    private String image;
    public String getImage() {
        return image;
    }

    @Column(name = "price")
    private Long price;
    public Long getPrice() {
        return price;
    }

    @Column(name = "category_name")
    private String category;
    public String getCategory() {
        return category;
    }
}
