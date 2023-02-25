import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghaslah/unit/assets_manager.dart';
import 'package:ghaslah/unit/color_manager.dart';

import '../../unit/components/componetns.dart';
import '../../unit/font_manager.dart';
import '../main/main_screen.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({Key? key}) : super(key: key);
  final TextEditingController otpCode=TextEditingController();
  GlobalKey<FormState> kForm=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorManager.gradientColor2,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 30,),
              Image.asset(AssetsManager.logoImage,height: 150,width: 200),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 60),
                margin: const EdgeInsets.symmetric(horizontal: 30,),
                decoration: BoxDecoration(
                    color: ColorManager.whiteColor,
                    borderRadius: BorderRadius.circular(SizedConstant.radiusAuthSize)
                ),
                child: Form(
                  key: kForm,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      textWidget(text: 'أدخل الكود المرسل الى هاتفك', fontSize: 16),
                      const SizedBox(height: 60,),
                      defaultTextFiled(
                          controller: otpCode,
                          inputType: TextInputType.number,
                          labelText: 'ادخل الكود',
                          validator: (value){
                            if(value!.isEmpty){
                              return 'من فضلك ادخل الكود';
                            }
                          }
                      ),
                      const SizedBox(height: 60,),
                      mainButton(text: 'استمرار', fct: (){
                        if(kForm.currentState!.validate()){
                          navAndRemove(context: context, screen:const MainScreen());
                        }
                      }),


                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
