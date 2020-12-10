import 'package:hello_world_2/cart_icon.dart';
import 'package:hello_world_2/page_one.dart';
import 'package:hello_world_2/page_two.dart';
import 'package:hello_world_2/view_models/change_page.vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show ChangeNotifierProvider, Consumer;

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 5.0,
          title: Text('My Shop with Three Mobiles(Amazon Prices)'),
          leading: Padding(
            padding: const EdgeInsets.only(left: 20, top: 5.0),
            child: CartIcon(),
          ),
        ),
        body: ChangeNotifierProvider<ChangePageViewModel>(
          create: (_) => ChangePageViewModel(),
          child:
              Consumer<ChangePageViewModel>(builder: (context, model, child) {
            return IndexedStack(
              index: model.selectedPage,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: PageOne(),
                ),
                PageTwo(
                  index: model.index,
                ),
              ],
            );
          }),
        ));
  }
}
