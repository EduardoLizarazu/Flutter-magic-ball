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
    final buttonText = Text(
      'Call Web Service',
      style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
          color: Colors.white,
          shadows: [
            const Shadow(
                offset: Offset(3, 3), color: Colors.black38, blurRadius: 8),
            Shadow(
                offset: const Offset(-3, -3),
                color: Colors.white.withOpacity(0.85),
                blurRadius: 8)
          ]),
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
              Container(
                alignment: Alignment.center,
                color: Colors.transparent,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(350, 50),
                      primary: Colors.grey[900],
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.transparent)),
                    ),
                    onPressed: getData,
                    child: buttonText),
              ),
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
