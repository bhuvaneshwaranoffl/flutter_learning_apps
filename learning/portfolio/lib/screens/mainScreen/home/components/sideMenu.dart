import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/screens/mainScreen/home/components/Area_info.dart';
import 'package:portfolio/screens/mainScreen/home/components/Skills.dart';
import 'package:portfolio/screens/mainScreen/home/components/coding.dart';
import 'package:portfolio/screens/mainScreen/home/components/myInfo.dart';
import 'package:portfolio/utlis/Constant.dart';

class sideMenu extends StatelessWidget {
  const sideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Column(
        children: [
          const Myinfo(),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                   const AreaInfoText(
                    title: "Residence",
                    text: "TamilNadu",
                  ),
                  const AreaInfoText(
                    title: "City",
                    text: "Coimbatore",
                  ),
                  const AreaInfoText(
                    title: "Age",
                    text: "21",
                  ),
                  const Skills(),
                  const Divider(),
                  const Coding(),
                    const SizedBox(height: defaultPadding / 2),
                  TextButton(
                    onPressed: (){},
                    child: FittedBox(
                      child: Row(
                        children: [
                          Text(
                            "DOWNLOAD CV",
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                          const SizedBox(width: defaultPadding / 2),
                          SvgPicture.asset("assets/icons/download.svg")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
