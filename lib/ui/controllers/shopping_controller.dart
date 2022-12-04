import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../domain/product.dart';

class ShoppingController extends GetxController {
  // lista de productos
  var entries = <Product>[].obs;
  // el valor total de la compra
  var total = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // los dos elementos que vamos a tener en la tienda
    entries.add(Product(0, "Toy car", 10));
    entries.add(Product(1, "Toy house", 20));
  }

  void calcularTotal() {
    int newTotal = 0;
    //newTotal = newTotal + price*quantity // Acumular el total del costo de lo que hay en el carrito
    // TODO
    // calcular el valor total de los elementos en el carro de compras
    
    for (var element in entries) {
      newTotal = newTotal + element.quantity * element.price;
    }
    total.value = newTotal;
  }

  agregarProducto(id) {
    logInfo('agregarProducto $id');

    Product producto = entries.firstWhere((element) => id == element.id);
    int posicion = entries.indexOf(producto);
    producto.quantity = producto.quantity + 1;
    entries[posicion] = producto;

    // TODO
    // Encontrar el elemento usando el id, revisar el método firstWhere de la lista
    // después obtener el index de ese elemento, revisar el método indexOf de la lista
    // después hacer el incremento en la cantidad
    // finalmente actualizar entries usando el indice y el elemento actualizado

    calcularTotal();
  }

  quitarProducto(id) {
    logInfo('quitarProducto $id');
    // TODO
    // similar a agregarProducto
    // validar cuando la cantidad es igual a cero

    Product producto = entries.firstWhere((element) => id == element.id);
    int posicion = entries.indexOf(producto);
    if(producto.quantity > 0){
      producto.quantity = producto.quantity - 1;
    }
    entries[posicion] = producto;

    calcularTotal();
  }
}
