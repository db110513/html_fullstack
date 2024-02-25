import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  const App({@required Key? key}) : super(key: key);

  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      initialRoute: '/home',

      routes: {
        '/LogIn': (context) => LogIn(),
        '/LogIn': (context) => LogIn(),
        '/signUp': (context) => SignUp(),
      },

      theme: ThemeData(
        primaryColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

    );
  }
}