import 'package:flutter/material.dart';

class Myinfo extends StatelessWidget {
  const Myinfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.23,
        child: Container(
          color: const Color(0xFF242430),
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blueGrey,
                 // backgroundImage: AssetImage("assets/images/mine.png"),
                ),
              
                Text("Bhuvanesh Waran", style: Theme.of(context).textTheme.subtitle2),
                const Text("Flutter Developer",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w200, height: 2)),
                
              ],
            ),
          ),
        ));
  }
}
