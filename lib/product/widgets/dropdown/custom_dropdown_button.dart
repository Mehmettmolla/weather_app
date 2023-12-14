import 'package:flutter/material.dart';
import 'package:weather_app/product/constant/app_color.dart';
import 'package:weather_app/product/constant/app_radius.dart';
import 'package:weather_app/product/constant/app_size.dart';
import 'package:weather_app/product/constant/app_text_style.dart';

class CustomDropdownButton extends StatefulWidget {
  CustomDropdownButton({super.key, this.selected, this.list = const [], this.title});
  String? selected;
  final List<String> list;
  final String? title;
  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.screenWidth(context) * 0.45,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.black),
        borderRadius: AppRadius.radius12,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(
            widget.title!,
            style: AppTextStyle.blackSemibold16,
          ),
          value: widget.selected,
          onChanged: (String? newValue) {
            setState(() {
              widget.selected = newValue;
            });
          },
          items: widget.list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
