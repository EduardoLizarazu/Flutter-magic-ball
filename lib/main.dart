import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'basic.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  const MiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      home: inicio(),
    );
  }
}

class inicio extends StatefulWidget {
  inicio({Key? key}) : super(key: key);

  @override
  State<inicio> createState() => _inicioState();
}

class _inicioState extends State<inicio> {
  TextEditingController luckyNumberController = TextEditingController();
  TextEditingController luckController = TextEditingController();
  Future<String> getData() async {
    var response = await http.get(
        Uri.parse("https://apisuerte20220316210656.azurewebsites.net/fortunes"),
        headers: {"Accept": "aplication/json"});
    Map<String, dynamic> map = json.decode(response.body);
    int luckyNumber = map["luckyNumber"];
    String luck = map["luck"];
    print(luckyNumber);
    print(luck);
    luckyNumberController.text = 'Lucky Number: ' + luckyNumber.toString();
    luckController.text = 'Luck: ' + luck.toString();
    var obj = {luck, luckyNumber};
    return 'okey';
  }

  @override
  Widget build(BuildContext context) {
    final title = Container(
      child: const Text(
        "Bola Magica de Teodosio",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
    final image = Container(
      height: 300,
      width: 200,
      margin: const EdgeInsets.only(top: 50, bottom: 50),
      child: Image.asset("assets/bola-magica.png"),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('LizarazuApp'),
      ),
      body: ListView(children: <Widget>[
        title,
        image,
        ElevatedButton(
            onPressed: getData, child: new Text('Llamando a servicio web')),
        TextFormField(
          controller: luckyNumberController,
          readOnly: true,
          decoration: InputDecoration(
              hintText: "LuckyNumber: ", border: InputBorder.none),
        ),
        TextFormField(
          controller: luckController,
          readOnly: true,
          decoration:
              InputDecoration(hintText: "Luck: ", border: InputBorder.none),
        ),
      ]),
    );
  }
}
