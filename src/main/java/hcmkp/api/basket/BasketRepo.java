package hcmkp.api.basket;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BasketRepo extends JpaRepository<Basket, Long> {
    @Query(
        value = "SELECT * FROM baskets WHERE user_id = :id",
        nativeQuery = true
    )
    List<Basket> findUserBasket(@Param("id") Long id);
}
