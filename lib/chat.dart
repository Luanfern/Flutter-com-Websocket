import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:http/http.dart' as http;

class Chat extends StatefulWidget {
  final String author;
  const Chat({ Key? key, required this.author}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController _controller = TextEditingController();
  final WebSocketChannel channel = IOWebSocketChannel.connect('ws://echo.websocket.org');
  final _channel = WebSocketChannel.connect(Uri.parse('wss://echo.websocket.org'),);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat com Websocket'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text('Seu nome de exibicao: ${widget.author}'),
            ),
            const SizedBox(height: 10),
            StreamBuilder(
              stream: _channel.stream,
              builder: (context, snapshot) {
                return Text(snapshot.hasData ? '${snapshot.data}' : '');
              },
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(labelText: 'Escreva uma mensagem'),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                Expanded(
                  flex: 2,
                  child: IconButton(
                    onPressed: _sendMessage,
                    icon: const Icon(Icons.send, color: Colors.amber,),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      _channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }
}