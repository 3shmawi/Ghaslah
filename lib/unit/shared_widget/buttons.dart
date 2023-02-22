import 'package:flutter/material.dart';
import 'package:ghaslah/unit/color_manager.dart';
import 'package:ghaslah/unit/values_manager.dart';

class DefaultElevatedButton extends StatelessWidget {
  const DefaultElevatedButton({
    required this.text,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, AppSize.s40),
        backgroundColor: ColorManager.redCircleColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
