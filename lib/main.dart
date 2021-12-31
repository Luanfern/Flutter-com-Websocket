import 'package:chat_socket/inicial.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Chat com Websocket';
    return const MaterialApp(
      title: title,
      home: Inicial(
      ),
    );
  }
}