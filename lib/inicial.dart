import 'package:flutter/material.dart';
class Inicial extends StatefulWidget {
  const Inicial({Key? key}) : super(key: key);

  @override
  _InicialState createState() => _InicialState();
}

class _InicialState extends State<Inicial> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.amber,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(flex: 4, child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('CHAT', style: TextStyle(fontSize: 30)),
                  SizedBox(width: 10),
                  Icon(Icons.chat, size: 30),
                ],
              ),
            Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                width: double.infinity,
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                      labelText: 'Digite seu nome de exibicao'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            GestureDetector(
                onTap: () {
                  if (_controller.text.isNotEmpty) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    Navigator.pushNamed(context, '/chat', arguments: _controller.text);
                  } else {
                    final snackBar = SnackBar(
                      content: const Text('Escreva seu nome de exibicao'),
                      action: SnackBarAction(
                        label: 'OK',
                        onPressed: () {
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))),
                  child: const Center(child: Text('Entrar')),
                ),
              ),
            
            Expanded(flex: 4, child: Container()),
          ],
        ),
      ),
    );
  }
}
