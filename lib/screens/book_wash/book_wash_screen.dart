import 'package:ghaslah/unit/strings_manager.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../unit/color_manager.dart';
import '../../unit/shared_widget/buttons.dart';
import '../../unit/values_manager.dart';

class BookingWashScreen extends StatefulWidget {
  const BookingWashScreen({Key? key}) : super(key: key);

  @override
  State<BookingWashScreen> createState() => _BookingWashScreenState();
}

class _BookingWashScreenState extends State<BookingWashScreen> {
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  /// The method for [DateRangePickerSelectionChanged] callback, which will be
  /// called whenever a selection changed on the date picker widget.
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      appBar: AppBar(
        elevation: AppSize.s0,
        bottom: AppBar(
          elevation: AppSize.s0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            AppStrings.bookingDetails,
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
                AppStrings.chooseLocation,
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
                      borderRadius: BorderRadius.circular(AppSize.s15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          FontAwesomeIcons.magnifyingGlass,
                        ),
                        const SizedBox(height: AppSize.s10),
                        Text(
                          AppStrings.search,
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
                      borderRadius: BorderRadius.circular(AppSize.s15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          FontAwesomeIcons.mapLocationDot,
                        ),
                        const SizedBox(height: AppSize.s10),
                        Text(
                          AppStrings.currentLocation,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s40),
              Text(
                AppStrings.selectCar,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                AppStrings.explain,
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
                      borderRadius: BorderRadius.circular(AppSize.s15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          FontAwesomeIcons.car,
                        ),
                        const SizedBox(height: AppSize.s10),
                        Text(
                          AppStrings.addVehicle,
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
                      borderRadius: BorderRadius.circular(AppSize.s15),
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
                  labelText: AppStrings.setNotice,
                  hintText: AppStrings.setNotice,
                  labelStyle: Theme.of(context).textTheme.bodySmall,
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSize.s15),
                  ),
                ),
              ),
              const SizedBox(height: AppSize.s40),
              DefaultElevatedButton(
                text: AppStrings.next,
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
        topLeft: Radius.circular(AppSize.s15),
        topRight: Radius.circular(AppSize.s15),
      )),
      builder: (context) => DefaultTabController(
        length: 9,
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSize.s20),
                Text(
                  AppStrings.selectDate,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Row(
                  children: [
                    Text(
                      AppStrings.explain2,
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
                // DatePicker(
                //   DateTime.now(),
                //   initialSelectedDate: DateTime.now(),
                //   locale: 'ar',
                //   height: 100,
                //   activeDates: [
                //     DateTime(2023, 02, 21),
                //     DateTime(2023, 02, 22),
                //     DateTime(2023, 02, 23),
                //     DateTime(2023, 02, 24),
                //     DateTime(2023, 02, 25),
                //     DateTime(2023, 02, 26),
                //     DateTime(2023, 02, 27),
                //     DateTime(2023, 02, 28),
                //   ],
                //   selectionColor: Colors.black,
                //   selectedTextColor: Colors.white,
                //   onDateChange: (date) {
                //     // New date selected
                //     // setState(() {
                //     //   _selectedValue = date;
                //     // });
                //   },
                // ),

                SfDateRangePicker(
                  onSelectionChanged: _onSelectionChanged,
                  selectionMode: DateRangePickerSelectionMode.single,
                  maxDate: DateTime(2023, 02, 28),
                  minDate: DateTime(2023, 02, 21),
                ),
                const TabBar(
                  isScrollable: true,
                  labelColor: ColorManager.mainTextColor,
                  tabs: [
                    Tab(
                      text: '3:15 PM',
                    ),
                    Tab(
                      text: '4:15 PM',
                    ),
                    Tab(
                      text: '4:30 PM',
                    ),
                    Tab(
                      text: '2:00 PM',
                    ),
                    Tab(
                      text: '11:30 AM',
                    ),
                    Tab(
                      text: '3:15 PM',
                    ),
                    Tab(
                      text: '3:15 PM',
                    ),
                    Tab(
                      text: '3:15 PM',
                    ),
                    Tab(
                      text: '3:15 PM',
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.s20),
                const DefaultElevatedButton(
                  text: AppStrings.next,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
