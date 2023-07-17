package hcmkp.api.order;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepo extends JpaRepository<Order, Long> {
    @Query(
        value = "SELECT * FROM orders WHERE user_id = :id",
        nativeQuery = true
    )
    List<Order> findUserOrders(@Param("id") Long id);
}
