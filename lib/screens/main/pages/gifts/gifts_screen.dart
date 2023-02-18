import 'package:flutter/material.dart';
import 'package:ghaslah/unit/color_manager.dart';

class GiftsScreen extends StatelessWidget {
  const GiftsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.gradientColor2,
        title: const Text('Gifts'),
      ),

    );
  }
}
