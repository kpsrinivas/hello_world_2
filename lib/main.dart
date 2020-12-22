import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class Session with ChangeNotifier {
  var isLogged = false;

  login() {
    //Go to backend, firebase
    this.isLogged = true;
    notifyListeners();
  }

  logout() {
    this.isLogged = false;
    notifyListeners();
  }
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
      home: 
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => new CurrentUser(),
          ),
          ChangeNotifierProvider(
            create: (_) => new Session(),
          )
        ],

        child: Consumer<Session>(
          builder: (context, session, widget) {
            if(session.isLogged) {
              return Column(
                children: [
                  CurrentUserName(),
                  ChangeUsernameButton()
                ]
              );
            } else {
              return FlatButton(
                child: Text("Log me in"),
                onPressed: (){
                  Provider.of<Session>(context, listen: false).login();
                }
              );
            }
          }
        )
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



