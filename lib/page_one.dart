import 'package:hello_world_2/add_cart_button.dart';
import 'package:hello_world_2/view_models/cart.vm.dart';
import 'package:hello_world_2/data/data.dart';

import 'package:hello_world_2/view_models/change_page.vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show Provider, Selector;

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      children: <Widget>[
        for (int i = 0; i < data.length; i++)
          GestureDetector(
            onTap: () {
              Provider.of<ChangePageViewModel>(context, listen: false)
                  .goToPageTwo(i);
            },
            child: Card(
              elevation: 5,
              child: Card(
                elevation: 4.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Image.network(data[i].imageURL),
                      height: 250.0,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            data[i].name,
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                data[i].price,
                                style: TextStyle(
                                    fontSize: 13.0, color: Colors.black54),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Selector<CartViewModel, int>(
                                  selector: (_, model) => model.triggerId,
                                  shouldRebuild: (previous, next) {
                                    return next == data[i].id;
                                  },
                                  builder: (context, model, child) {
                                    return AddCartButton(
                                      itemId: data[i].id,
                                    );
                                  }),
                              SizedBox(
                                width: 8.0,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
