import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'neumorphism_light.dart';
import 'neumorphism_dark.dart';
import 'gradient_back.dart';

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
    // TITLE AND IMAGE
    final title = NeumorphismLight('Bola Magica de Teodosio', 50, 300);
    final title2 = NeumorphismDark('Bola Magica de Teodosio', 50, 300);
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
        body: Stack(
          children: <Widget>[
            GradientBack(),
            ListView(children: <Widget>[
              title2,
              image,
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black87),
                    shadowColor: MaterialStateProperty.all(Colors.white),
                    elevation: MaterialStateProperty.all(3),
                    fixedSize:
                        MaterialStateProperty.all(const Size(40.0, 50.0)),
                  ),
                  onPressed: getData,
                  child: new Text('Call Web Service')),
              TextFormField(
                controller: luckyNumberController,
                readOnly: true,
                decoration: const InputDecoration(
                    hintText: "LuckyNumber: ", border: InputBorder.none),
              ),
              TextFormField(
                controller: luckController,
                readOnly: true,
                decoration: const InputDecoration(
                    hintText: "Luck: ", border: InputBorder.none),
              ),
            ]),
          ],
        ));
  }
}
