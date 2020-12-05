import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class CurrentUser with ChangeNotifier {
  String name = "Srinivas";

  setName(String name) {
    this.name = name;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (_) => new CurrentUser(),
        child: Column(
          children: [
            CurrentUserName(),
            ChangeUsernameButton()
          ]
        ),
      )
    );
  }
}

class CurrentUserName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<CurrentUser>(
          builder: (c, currentUser, _) {
            return Text(currentUser.name);
          }
        ),
        Text("image")
      ],
    );
    // return Consumer<CurrentUser>(
    //   builder: (c, currentUser, _) {
    //     return Column(
    //       children: [
    //         Text(currentUser.name),
    //         Text("image")
    //       ],
    //     );
    //   }
    // );
  }
}

class ChangeUsernameButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text("Hit me to change name"),
      onPressed: () {
        Provider.of<CurrentUser>(context, listen: false).setName("Srinivas Kolluri");
      },
    );
  }
}



