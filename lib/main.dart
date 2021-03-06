import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'neumorphism_dark.dart';

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
  TextEditingController firstDate = TextEditingController();
  TextEditingController firstText = TextEditingController();
  TextEditingController lastDate = TextEditingController();
  TextEditingController lastText = TextEditingController();
  Future<String> getData() async {
    var response = await http.get(
        Uri.parse("https://date.nager.at/api/v3/PublicHolidays/2022/BO"),
        headers: {"Accept": "aplication/json"});
    if (response.statusCode == 200) {
      Map<String, dynamic> map1 = json.decode(response.body)[0];
      Map<String, dynamic> map2 = json.decode(response.body).last;
      String firstDateHoliday = map1["date"];
      String firstTextHoliday = map1["localName"];
      String lastDateHoliday = map2["date"];
      String lastTextHoliday = map2["localName"];
      print(firstDateHoliday);
      print(firstTextHoliday);
      print(lastDateHoliday);
      print(lastTextHoliday);
      firstDate.text = 'Primer Feriado Date: ' + firstDateHoliday.toString();
      firstText.text = 'Primer Feriado Name: ' + firstTextHoliday.toString();
      lastDate.text = 'Ultimo Feriado Date: ' + lastDateHoliday.toString();
      lastText.text = 'Ultimo Feriado Name: ' + lastTextHoliday.toString();
      return 'okey';
    }
    throw Exception('Failed to load the api');
  }

  @override
  Widget build(BuildContext context) {
    // TITLE AND IMAGE
    final title2 = NeumorphismDark('Eduardo Lizarazu', 50, 300);
    final image = Container(
      height: 300,
      width: 200,
      margin: const EdgeInsets.only(top: 50, bottom: 50),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: const DecorationImage(
          fit: BoxFit.contain,
          image: NetworkImage(
              'https://4.bp.blogspot.com/-5OH-tlHlBi8/Vmy1nQqB55I/AAAAAAAA2rc/sDkk84-6unY/s1600/Eduardo%2BLizarazu%2Bse%2Bqued%25C3%25B3%2Bayer%2Bcon%2Bla%2Bmedalla%2Bde%2Bplata%2Ben%2Bla%2Bdisciplina%2Bde%2Btenis%2Bde%2Bmesa.jpg'),
        ),
        boxShadow: [
          const BoxShadow(
            color: Colors.black,
            offset: Offset(4, 4),
            blurRadius: 15,
          ),
          BoxShadow(
              color: Colors.grey.shade800,
              offset: const Offset(-4, -4),
              blurRadius: 15),
        ],
      ),
    );
    const buttonText = Text(
      'Feriados 2022',
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
    );
    return Scaffold(
        appBar: AppBar(
          title: Text('LizarazuApp'),
        ),
        body: Stack(
          children: <Widget>[
            Container(
                decoration:
                    const BoxDecoration(color: Color.fromRGBO(33, 33, 33, 1))),
            ListView(children: <Widget>[
              title2,
              image,
              Container(
                margin: const EdgeInsets.only(bottom: 50),
                alignment: Alignment.center,
                color: Colors.transparent,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(350, 50),
                      primary: Colors.grey[900],
                      shadowColor: Colors.white60,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.transparent)),
                    ),
                    onPressed: getData,
                    child: buttonText),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 300,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.black,
                          offset: Offset(4, 4),
                          blurRadius: 15,
                        ),
                        BoxShadow(
                            color: Colors.grey.shade600,
                            offset: const Offset(-4, -4),
                            blurRadius: 15),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: firstDate,
                          readOnly: true,
                          decoration: const InputDecoration(
                              hintText: "First Date: ",
                              border: InputBorder.none),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: firstText,
                          readOnly: true,
                          decoration: const InputDecoration(
                              hintText: "Fist text: ",
                              border: InputBorder.none),
                        ),
                        TextFormField(
                          controller: lastDate,
                          readOnly: true,
                          decoration: const InputDecoration(
                              hintText: "Last Date: ",
                              border: InputBorder.none),
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          controller: lastText,
                          readOnly: true,
                          decoration: const InputDecoration(
                              hintText: "Last text: ",
                              border: InputBorder.none),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ]),
          ],
        ));
  }
}
