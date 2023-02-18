import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/colors.dart';

class GiftsScreen extends StatelessWidget {
  const GiftsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.gradientColor2,
        title: const Text('Gifts'),
      ),

    );
  }
}
