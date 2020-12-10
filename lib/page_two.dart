import 'package:hello_world_2/add_cart_button.dart';
import 'package:hello_world_2/view_models/cart.vm.dart';
import 'package:hello_world_2/data/data.dart';
import 'package:hello_world_2/view_models/change_page.vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Provider, Consumer;

class PageTwo extends StatelessWidget {
  final int index;
  const PageTwo({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return this.index == null
        ? Center(
            child: CupertinoActivityIndicator(),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Provider.of<ChangePageViewModel>(context, listen: false)
                        .goToPageOne();
                  },
                ),
              ),
              Expanded(
                flex: 10,
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[index].name,
                          style: TextStyle(fontSize: 16.0, color: Colors.black),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          data[index].price,
                          style:
                              TextStyle(fontSize: 13.0, color: Colors.black54),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Consumer<CartViewModel>(
                            builder: (context, model, child) {
                          return AddCartButton(
                            itemId: data[index].id,
                            type: AddCartButtonType.text,
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 25,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                  child: Image.network(data[index].imageURL),
                ),
              ),
            ],
          );
  }
}
