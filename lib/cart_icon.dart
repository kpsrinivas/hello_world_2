import 'package:flutter/material.dart';
import 'package:hello_world_2/cart.vm.dart';
import 'package:provider/provider.dart' show Consumer;

class CartIcon extends StatelessWidget {
  final int value;

  const CartIcon({
    Key key,
    this.value,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          onPressed: null,
        ),
        Positioned(
            child: Stack(
          children: <Widget>[
            Icon(Icons.brightness_1, size: 20.0, color: Colors.green[800]),
            Positioned(
                top: 3.0,
                right: 4.0,
                child: Center(
                  child:
                      Consumer<CartViewModel>(builder: (context, model, child) {
                    return Visibility(
                      visible: model.getCartLength > 0,
                      child: Text(
                        model.getCartLength.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 11.0,
                            fontWeight: FontWeight.w500),
                      ),
                    );
                  }),
                )),
          ],
        )),
      ],
    );
  }
}
