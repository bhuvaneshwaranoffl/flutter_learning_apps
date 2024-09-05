import 'package:flutter/material.dart';
import 'package:portfolio/models/Project.dart';
import 'package:portfolio/screens/HomeScreen/components/highlightinfo.dart';
import 'package:portfolio/screens/HomeScreen/components/homeBanner.dart';
import 'package:portfolio/screens/HomeScreen/components/myProjects.dart';
import 'package:portfolio/screens/mainScreen/home/mainScreen.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  HomeScreen(children: [
             HomeBanner(),
           // HighLightsInfo(),
            MyProjects(),
            
    ],);
  }
}
