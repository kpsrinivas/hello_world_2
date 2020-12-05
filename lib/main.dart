import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class CurrentUser {
  String name = "Srinivas";
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var currentUser = new CurrentUser();
    currentUser.name = "Srinivas K";
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Column(
        children: [
          CurrentUserName(cu: currentUser),
          ChangeUsernameButton(cu: currentUser)
        ]
      ),
    );
  }
}

class CurrentUserName extends StatelessWidget {
  final CurrentUser cu;
  const CurrentUserName({Key key, this.cu}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(cu.name);
  }
}

class ChangeUsernameButton extends StatelessWidget {
  final CurrentUser cu;
  const ChangeUsernameButton({Key key, this.cu}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text("Hit me to change name"),
      onPressed: () {
        cu.name = "Srinivas Kolluri";
      },
    );
  }
}



