import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Basic {
  int? userId;
  int? id;
  String? title;
  String? body;

  Basic({this.userId, this.id, this.title, this.body});

  Basic.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}

class getLuckyAPI {
  int? luckyNumber;
  String? lucky;

  getLuckyAPI({this.luckyNumber, this.lucky});

  Future<Object> getData() async {
    var response = await http.get(
        Uri.parse("https://apisuerte20220316210656.azurewebsites.net/fortunes"),
        headers: {"Accept": "aplication/json"});
    Map<String, dynamic> map = json.decode(response.body);
    int luckyNumber = map["luckyNumber"];
    String luck = map["luck"];
    print(luckyNumber);
    print(luck);
    var obj = {luck, luckyNumber};
    return obj;
  }
}
