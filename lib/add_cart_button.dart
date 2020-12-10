import 'package:flutter/material.dart';
import 'package:hello_world_2/view_models/cart.vm.dart';
import 'package:provider/provider.dart' show Provider;

enum AddCartButtonType { text, icon }

class AddCartButton extends StatelessWidget {
  final int itemId;
  final AddCartButtonType type;
  const AddCartButton(
      {Key key, this.type: AddCartButtonType.icon, @required this.itemId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<CartViewModel>(context, listen: false);
    var present = model.checkCartItem(this.itemId);
    var text;
    var icon;
    void Function(int id) callFunction;
    if (present) {
      text = 'Remove';
      icon = Icons.remove;
      callFunction = model.removeFromCart;
    } else {
      text = 'Add';
      icon = Icons.add;
      callFunction = model.addToCart;
    }
    return RaisedButton(
      color: Colors.black87,
      child: this.type == AddCartButtonType.text ? Text(text) : Icon(icon),
      onPressed: () {
        callFunction(this.itemId);
      },
    );
  }
}
