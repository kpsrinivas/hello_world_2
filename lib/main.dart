import 'package:hello_world_2/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_world_2/view_models/cart.vm.dart';
import 'package:provider/provider.dart' show ChangeNotifierProvider;

void main() async {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.light(),
      title: 'Compass Example',
      home: ChangeNotifierProvider<CartViewModel>(
          create: (_) => CartViewModel(), child: Home()),
    );
  }
}
