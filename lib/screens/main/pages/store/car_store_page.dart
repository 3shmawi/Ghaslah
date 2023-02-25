import 'dart:ui';
import 'package:ghaslah/unit/color_manager.dart';
import 'package:ghaslah/unit/font_manager.dart';
import 'package:ghaslah/unit/routes_manager.dart';
import '../../../../unit/shared_widget/car_category_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';

import '../../../car_details/single_car.dart';

class CarStorePage extends StatefulWidget {
  const CarStorePage({
    Key? key,
  }) : super(key: key);

  @override
  State<CarStorePage> createState() => _CarStorePageState();
}

class _CarStorePageState extends State<CarStorePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        top: 0.0,
        left: 0.0,
        right: 0.0,
        bottom: MediaQuery.of(context).size.height * 0.65,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.35,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF3D41B6),
                Color(0xFF5B47EC),
              ],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(
                300,
                100,
              ),
              bottomRight: Radius.elliptical(750, 275),
            ),
          ),
        ),
      ),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.06,
        left: 0.0,
        right: 0.0,
        bottom: MediaQuery.of(context).size.height * 0.88,
        child: Container(
          padding: const EdgeInsets.only(
            left: 25.0,
            right: 25.0,
          ),
          child: Row(
            children: const [
              SizedBox(
                width: 50.0,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "مرحبا سيف",
                    style: TextStyle(
                      fontSize: FontSize.s28,
                      color: Colors.white,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 50.0,
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.14,
        left: 25.0,
        right: 0.0,
        bottom: 0.0,
        child: const Text(
          "GHASLAH",
          style: TextStyle(
            fontSize: 38.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.25,
        left: 0.0,
        right: 0.0,
        bottom: MediaQuery.of(context).size.height * 0.5,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              CarCategory(
                onTap: () =>Navigator.of(context).pushNamed(Routes.bookingWashRoute),
                carPicture: 'assets/img/jpg/car.jpeg',
                categoryName: 'غسيل كوفيد',
                categoryText: '49 SAR',
                circleColor: ColorManager.redCircleColor,
              ),
              CarCategory(
                onTap: () {},
                carPicture: 'assets/img/jpg/images.jpeg',
                categoryName: 'غسيل سويتر بلس ',
                categoryText: '54 SAR',
                circleColor: ColorManager.purpleCircleColor,
              ),
              CarCategory(
                onTap: () {},
                carPicture: 'assets/img/jpg/car.jpeg',
                categoryName: 'غسيل كوفيد',
                categoryText: '49 SAR',
                circleColor: ColorManager.redCircleColor,
              ),
              CarCategory(
                onTap: () {},
                carPicture: 'assets/img/jpg/images.jpeg',
                categoryName: 'غسيل سويتر بلس ',
                categoryText: '54 SAR',
                circleColor: ColorManager.purpleCircleColor,
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.52,
        left: 25.0,
        right: 25.0,
        bottom: 0.0,
        child: Column(
          children: [
            Row(
              children: const [
                Text(
                  "اختر خدمات اضافيه",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.mainTextColor,
                  ),
                ),
              ],
            ),
            ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                },
              ),
              child: Expanded(
                child: FutureBuilder(
                    future: DefaultAssetBundle.of(context)
                        .loadString('assets/json/car_list.json'),
                    builder: (context, snapshot) {
                      // Decode the JSON
                      var newData = json.decode(snapshot.data.toString());

                      return ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SinglePage(index: index),
                                  ),
                                );
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 115,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  25.0,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage(newData[index]['img']),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        20.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.03,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        newData[index]['year'],
                                        style: const TextStyle(
                                          color: ColorManager.secondTextColor,
                                          fontSize: 13.0,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        newData[index]['name'],
                                        style: const TextStyle(
                                          color: ColorManager.mainTextColor,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Center(
                                        child: FaIcon(
                                          FontAwesomeIcons.plus,
                                          size: 20.0,
                                          color: ColorManager.heartGreyColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),//
                            ),
                          );
                        },
                        itemCount: newData == null ? 0 : newData.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                          height: 15.0,
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
