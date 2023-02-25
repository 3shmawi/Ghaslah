import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghaslah/unit/color_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorManager.heartGreyColor,
      appBar: AppBar(
        backgroundColor: ColorManager.gradientColor1,

      ),
    );
  }
}
