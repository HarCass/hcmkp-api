package hcmkp.api.basket;

import hcmkp.api.item.Item;
import hcmkp.api.user.User;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;


@Entity
@Table(name="baskets")
public class Basket {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="basket_id")
    private Long id;
    public Long getbasketId() {
        return id;
    }

    @OneToOne
    @JoinColumn(name="item_id")
    private Item item;
    public Item getItem() {
        return item;
    }

    @OneToOne
    @JoinColumn(name="user_id")
    private User user;
    public User getUser() {
        return user;
    }

}
