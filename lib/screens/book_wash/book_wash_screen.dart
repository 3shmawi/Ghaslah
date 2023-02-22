import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../unit/color_manager.dart';
import '../../unit/shared_widget/buttons.dart';
import '../../unit/values_manager.dart';

class BookingWashScreen extends StatelessWidget {
  const BookingWashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      appBar: AppBar(
        elevation: 0,

        bottom: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title:Text(
            'تفاصيل الحجز',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'حدد موقع الحجز',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: AppSize.s20),
              Row(
                children: [
                  Container(
                    width: AppSize.s100,
                    height: AppSize.s100,
                    decoration: BoxDecoration(
                      color: ColorManager.whiteColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          FontAwesomeIcons.magnifyingGlass,
                        ),
                        const SizedBox(height: AppSize.s10),
                        Text(
                          'بحث',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSize.s10),
                  Container(
                    width: AppSize.s100,
                    height: AppSize.s100,
                    decoration: BoxDecoration(
                      color: ColorManager.whiteColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          FontAwesomeIcons.mapLocationDot,
                        ),
                        const SizedBox(height: AppSize.s10),
                        Text(
                          'الموقع الحالي',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s40),
              Text(
                'حدد السيارة',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'حتى يتمكن البايكر من العثور على سيارتك دون ازعاجك',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: AppSize.s20),
              Row(
                children: [
                  Container(
                    width: AppSize.s79,
                    height: AppSize.s100,
                    decoration: BoxDecoration(
                      color: ColorManager.whiteColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          FontAwesomeIcons.car,
                        ),
                        const SizedBox(height: AppSize.s10),
                        Text(
                          'Add Vehicle',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSize.s10),
                  Container(
                    width: AppSize.s100,
                    height: AppSize.s100,
                    decoration: BoxDecoration(
                      color: ColorManager.whiteColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          FontAwesomeIcons.car,
                        ),
                        const SizedBox(height: AppSize.s10),
                        Text(
                          'ت ه و',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          '7767-a b h',
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s40),
              TextFormField(
                maxLines: 5,
                minLines: 1,
                decoration: InputDecoration(
                  labelText: 'اضف ملاحظة للبايكر',
                  hintText: 'اضف ملاحظة للبايكر',
                  labelStyle: Theme.of(context).textTheme.bodySmall,
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: AppSize.s40),
              DefaultElevatedButton(
                text: 'التالي',
                onPressed: () {
                  bottomSheet(context);
                },
              ),
              const SizedBox(height: AppSize.s10),
            ],
          ),
        ),
      ),
    );
  }

  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,

      backgroundColor: ColorManager.backgroundColor,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      )),
      builder: (context) => DefaultTabController(
        length: 9,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 400,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  'حدد موعد الحجز',
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Row(
                  children: [
                    Text(
                      'قد يصلك البايكر قبل أو بعد موعد الحجز بحوالي 15 دقيقة',
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          FontAwesomeIcons.xmark,
                        )),
                  ],
                ),
                DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  locale: 'ar',
                  height: 100,
                  activeDates: [
                    DateTime(2023, 02, 21),
                    DateTime(2023, 02, 22),
                    DateTime(2023, 02, 23),
                    DateTime(2023, 02, 24),
                    DateTime(2023, 02, 25),
                    DateTime(2023, 02, 26),
                    DateTime(2023, 02, 27),
                    DateTime(2023, 02, 28),
                  ],
                  selectionColor: Colors.black,
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    // New date selected
                    // setState(() {
                    //   _selectedValue = date;
                    // });
                  },
                ),
                const TabBar(
                  isScrollable: true,
                  labelColor: ColorManager.mainTextColor,
                  tabs: [
                    Tab(text: '3:15 PM',),
                    Tab(text: '4:15 PM',),
                    Tab(text: '4:30 PM',),
                    Tab(text: '2:00 PM',),
                    Tab(text: '11:30 AM',),
                    Tab(text: '3:15 PM',),
                    Tab(text: '3:15 PM',),
                    Tab(text: '3:15 PM',),
                    Tab(text: '3:15 PM',),
                  ],
                ),
                const SizedBox(height: 20),
                const DefaultElevatedButton(
                  text: 'التالي',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
