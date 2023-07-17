package hcmkp.api.order;

import hcmkp.api.item.Item;
import hcmkp.api.user.User;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="orders")
public class Order {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="order_id")
    private Long id;
    public Long getOrderId() {
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
