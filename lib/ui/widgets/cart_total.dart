import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/shopping_controller.dart';

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);
  final ShoppingController shoppingController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        //todo resuelto
        // aquí debemos observar la variable total del shoppingController
        // ${shoppingController.total} agragada por arturo sergio y joan anyela cesar

        child: Obx(
          () => Text('Total ${shoppingController.total} USD',
              style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.blueGrey,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w400)),
        ),
      ),
    );
  }
}
