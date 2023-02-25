

import 'package:flutter/material.dart';
import 'package:ghaslah/screens/main/main_screen.dart';
import 'package:ghaslah/unit/assets_manager.dart';


import '../../unit/color_manager.dart';
import '../../unit/components/componetns.dart';
import '../../unit/font_manager.dart';
import '../../unit/routes_manager.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final TextEditingController nameController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController phoneController=TextEditingController();
  final TextEditingController locationController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  final TextEditingController confirmPasswordController=TextEditingController();
  GlobalKey<FormState> kForm=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
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
                margin: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
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
                      textSpanWidget(
                        textOne: 'انشاء حساب  ',
                        textTwo: 'كعميل',
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        colorOne: ColorManager.gradientColor2,
                        colorTwo: ColorManager.secondTextColor,),
                      const SizedBox(height: 20,),
                      defaultTextFiled(
                          controller: nameController,
                          inputType: TextInputType.number,
                          labelText: 'اسم المستخدم',
                          validator: (value){
                            if(value!.isEmpty){
                              return 'من فضلك ادخل اسم المستخدم';
                            }
                            return null;
                          }
                      ),
                      const SizedBox(height: 10,),
                      defaultTextFiled(
                          controller: emailController,
                          inputType: TextInputType.number,
                          labelText: 'البريد الالكتروني',
                          validator: (value){
                            if(value!.isEmpty){
                              return 'من فضلك ادخل البريد الالكتروني';
                            }
                            return null;
                          }
                      ),
                      const SizedBox(height: 10,),
                      defaultTextFiled(
                          controller: phoneController,
                          inputType: TextInputType.number,
                          labelText: 'رقم الهاتف',
                          suffixText: '+966',
                          validator: (value){
                            if(value!.isEmpty){
                              return 'من فضلك ادخل رقم الهاتف';
                            }
                            return null;
                          }
                      ),
                      const SizedBox(height: 10,),
                      defaultTextFiled(
                          controller: locationController,
                          inputType: TextInputType.number,
                          labelText: 'الموقع',
                          validator: (value){
                            if(value!.isEmpty){
                              return 'من فضلك ادخل الموقع';
                            }
                            return null;
                          }
                      ),
                      const SizedBox(height: 10,),
                      defaultTextFiled(
                          controller: passwordController,
                          inputType: TextInputType.number,
                          labelText: 'كلمه السر',
                          validator: (value){
                            if(value!.isEmpty){
                              return 'من فضلك ادخل كلمه السر';
                            }
                            return null;
                          }
                      ),
                      const SizedBox(height: 10,),
                      defaultTextFiled(
                          controller: confirmPasswordController,
                          inputType: TextInputType.number,
                          labelText: 'تاكيد كلمه السر',
                          validator: (value){
                            if(value!.isEmpty){
                              return 'من فضلك ادخل تاكيد كلمه السر';
                            }
                          }
                      ),
                      const SizedBox(height: 20,),
                      mainButton(text: 'انشاء حساب ', fct: (){
                        if(kForm.currentState!.validate()){
                          navAndRemove(context: context,screen: const MainScreen());
                        }
                      }),
                      const SizedBox(height: 20,),
                      textSpanWidget(
                        textOne: 'لديك حساب ؟ ',
                        textTwo: 'تسجيل الدخول',
                        colorOne: ColorManager.secondTextColor,
                        colorTwo: ColorManager.gradientColor2,
                        fontSize: 15,
                        onTap: ()=>Navigator.of(context).pushReplacementNamed(Routes.loginScreen),
                      ),
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