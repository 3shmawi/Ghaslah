import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ghaslah/unit/color_manager.dart';

import '../font_manager.dart';

Widget textWidget({
  required String text,
  required double fontSize,
  Color? color,
  FontWeight? fontWeight,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    textAlign: textAlign ?? TextAlign.start,
    style: TextStyle(
      fontSize: fontSize,
      color: color ?? ColorManager.secondTextColor,
      fontWeight: fontWeight ?? FontWeight.normal,
      fontFamily: FontConstants.fontFamily,
    ),
  );
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    required this.text,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.textAlign,
    Key? key,
  }) : super(key: key);

  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? FontSize.s14,
        color: color ??ColorManager.secondTextColor,
        fontWeight: fontWeight ?? FontWeightManager.normal,
        fontFamily: FontConstants.fontFamily,
      ),
    );
  }
}
Widget defaultTextFiled({
  required TextEditingController controller,
  required TextInputType inputType,
  required String labelText,
  Widget? suffixIcon,
  String? suffixText,
  required FormFieldValidator<String> validator,
  ValueChanged<String>? onFieldSubmitted,
}){
  return  TextFormField(
    keyboardType:inputType ,
    controller: controller,
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle:  TextStyle(
          color: ColorManager.gradientColor2
      ),
      hintText: labelText,
      suffixIcon: suffixIcon,
      suffixText: suffixText,
      suffixStyle:  TextStyle(fontWeight: FontWeight.bold,color: ColorManager.gradientColor2,fontSize: 20),
      contentPadding:const  EdgeInsets.all(20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(SizedConstant.radiusAuthSize),
        borderSide:const BorderSide(color: ColorManager.secondTextColor,width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(SizedConstant.radiusAuthSize),
        borderSide: BorderSide(color: ColorManager.gradientColor2,width: 1),
      ),
    ),
    validator: validator,
    onFieldSubmitted: onFieldSubmitted,

  );
}
Widget mainButton({
  required String text,
  required Function() fct,
  Color? color
}){
  return MaterialButton(
    onPressed: fct,
    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
    color: color??ColorManager.gradientColor2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(SizedConstant.radiusAuthSize),
    ),
    child: textWidget(text: text, fontSize: 16,color: ColorManager.whiteColor,fontWeight: FontWeight.bold),
  );
}
Widget textSpanWidget({
  required String textOne,
  required String textTwo,
  FontWeight? fontWeight,
  required Color colorOne,
  required Color colorTwo,
  double? fontSize,
  Function()? onTap,
}){
  return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          children: [
            TextSpan(text: textOne,
                style:  TextStyle(
                  color: colorOne,
                  fontWeight: fontWeight??FontWeight.normal,
                  fontSize: fontSize??11.0,
                )),
            TextSpan(text: textTwo,
              recognizer: TapGestureRecognizer()..onTap =  onTap,
              style:  TextStyle(
                color: colorTwo,
                fontWeight: fontWeight??FontWeight.normal,
                fontSize: fontSize??11.0,
              ),),
          ]
      ));
}
navAndRemove({required BuildContext context,required Widget screen}){
  Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>screen),(route) => false);
}

