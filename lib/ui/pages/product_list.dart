import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/home_page.dart';
import '../../domain/product.dart';
import '../Widgets/banner.dart';
import '../controllers/shopping_controller.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  ShoppingController shoppingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        
        child: Column(
          children: [
            
            Stack(
              children: [const CustomBanner(50), customAppBar()],
            ),

            
            // TODO resuelto
            // aquí debemos rodear el widget Expanded en un Obx para
            // observar los cambios en la lista de entries del shoppingController
            // realizado euler sergio cesar joan
            Obx(
              () => Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: shoppingController.entries.length,
                    itemBuilder: (context, index) {
                      return _row(shoppingController.entries[index], index);
                    }),
              ),
            ),
            logo(),
          
          ],
        ),
      ),
    );
  }

  Widget customAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _row(Product product, int index) {
    return _card(product);

  }

  Widget _card(Product product) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(product.name),
        Text(product.price.toString()),
        Column(
          children: [
            IconButton(
                onPressed: () {
                  // TODO resuelto
                  // aquí debemos llamar al método del controlador que
                  // incrementa el número de unidades del producto
                  // pasandole el product.id
                  // TODO cambios hechos arturo, joan, sergio
                  shoppingController.agregarProducto(product.id);
                  
                },
                icon: const Icon(Icons.arrow_upward)),
            IconButton(
                onPressed: () {
                  // TODO resuelto
                  // aquí debemos llamar al método del controlador que
                  // disminuye el número de unidades del producto
                  // pasandole el product.id
                  // TODO cambios hechos arturo, joan, sergio
                  shoppingController.quitarProducto(product.id);
                  
                },
                icon: const Icon(Icons.arrow_downward))
          ],
        ),
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Quantity"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product.quantity.toString()),
            ),
          ],
        )
      ]),
    );
  }

  Widget logo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Logotipo_de_la_Universidad_del_Norte.svg/2560px-Logotipo_de_la_Universidad_del_Norte.svg.png',
              width: 180,
              height: 45,
              fit: BoxFit.fill),
        )
      ],
    );
  }  


}
