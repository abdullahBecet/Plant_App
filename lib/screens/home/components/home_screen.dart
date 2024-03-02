import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/home/components/body.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: kDefaultPadding*2,
          right: kDefaultPadding*2,
          bottom:kDefaultPadding
        ),
        height: 80,
        decoration: BoxDecoration(
          boxShadow:[
            BoxShadow(
              offset:Offset(0, -10),
              blurRadius: 35,
              color:Colors.white12
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(icon: SvgPicture.asset("assets/icons/flower.svg"),
            onPressed: (){}),
            IconButton(icon: SvgPicture.asset("assets/icons/heart-icon.svg"),
            onPressed: (){}),
            IconButton(icon: SvgPicture.asset("assets/icons/user-icon.svg"),
            onPressed: (){}),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: (){},),
    );
  }
}