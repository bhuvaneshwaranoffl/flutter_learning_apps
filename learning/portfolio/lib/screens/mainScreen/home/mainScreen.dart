// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:portfolio/screens/mainScreen/home/components/sideMenu.dart';
import 'package:portfolio/utlis/Constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints(maxWidth: maxWidth),
        child:  Row(
          children: [
            const Expanded(
                //now this take 75%
                flex: 2,
                child: sideMenu()),
            Expanded(
                flex: 7,
                child:SingleChildScrollView(
                  child: Column(
                    children: [
                       ...children,
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
  
}

