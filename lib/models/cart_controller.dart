import 'package:get/get.dart';
import 'fil_model.dart';

class CartController extends GetxController {
  var cartItems = <FilDish>[].obs;

  void addToCart(FilDish item) {
    cartItems.add(item);
  }

  void removeToCart(int index) {
    cartItems.removeAt(index);
    update();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i].price);
    }
    return totalPrice.toStringAsFixed(2);
  }

  void restartCart() {
    cartItems.clear();
    update();
  }

  void orderedItems() {
    print('Ordered Items:');
    for (var item in cartItems) {
      print(item.label);
    }
  }
}
