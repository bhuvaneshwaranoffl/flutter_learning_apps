import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios,color: Colors.white,),
      title: const Text("json Serialization",style: TextStyle(
        color: Colors.white
      ),),
      backgroundColor: const Color.fromARGB(255, 124, 102, 184),
    ));
  }
}
