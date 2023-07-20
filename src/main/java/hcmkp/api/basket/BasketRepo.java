package hcmkp.api.basket;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BasketRepo extends JpaRepository<Basket, Long> {
    @Query(
        value = "SELECT items.item_id AS itemId, item_name AS itemName, details, img_url AS image, price, category_name AS category, COUNT(items.item_id) AS quantity FROM baskets LEFT JOIN items ON items.item_id = baskets.item_id WHERE user_id = :id GROUP BY items.item_id;",
        nativeQuery = true
    )
    List<UserBasket> findUserBasket(@Param("id") Long id);

    @Query(
        value = "INSERT INTO baskets (item_id, user_id) VALUES (:itemId, :userId) RETURNING *;",
        nativeQuery = true
    )
    Basket inertNewBasket(@Param("itemId") Long ItemId, @Param("userId") Long userId);

    @Query(
        value = "DELETE FROM baskets WHERE basket_id IN (SELECT basket_id FROM baskets WHERE item_id = :itemId AND user_id = :userId ORDER BY basket_id FETCH FIRST 1 ROWS ONLY);",
        nativeQuery = true
    )
    Void deleteBasketItem(@Param("itemId") Long ItemId, @Param("userId") Long userId);
}
