import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List data=[];
  Future <void> getData()async{
    final res = await http.get(Uri.parse("https://api.themoviedb.org/3/account/21058169/rated/movies"));
    if(res.statusCode==200){
      print("the data is : ${res.body}");
      setState(() {
        data = jsonDecode(res.body);
      });
    }else{
      print("the is error in parsing data");
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: ListView.builder(itemCount: 9,itemBuilder: (context , index){
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(20),
              boxShadow:const [
               BoxShadow(
                  blurRadius: 17,
                  spreadRadius: 2,
                  offset: Offset(4, 4),
                  color: Colors.grey,
                ),
              ]
            ),
           child: Column(
            children: <Widget>[
             const Text(""),
             const Text(""),
              Image.asset(""),
            ],
           ),
          ),
        );
        }),
      ),
    );
  }
}