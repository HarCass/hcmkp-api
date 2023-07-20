package hcmkp.api.basket;

public interface UserBasket {
    Long getItemId();
    String getItemName();
    String getDetails();
    String getImage();
    Long getPrice();
    String getCategory();
    Long getQuantity();
}
