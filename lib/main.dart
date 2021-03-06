import 'package:chat_socket/chat.dart';
import 'package:chat_socket/inicial.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
  }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Navig(),
    );
  }
}

class Navig extends StatefulWidget {
  const Navig({ Key? key }) : super(key: key);

  @override
  _NavigState createState() => _NavigState();
}

class _NavigState extends State<Navig> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(builder: (_) => const Inicial());
            case '/chat':
              return MaterialPageRoute(builder: (_) => Chat(author: settings.arguments as String));
            default:
              return MaterialPageRoute(
                builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}