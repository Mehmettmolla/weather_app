import 'package:flutter/material.dart';
import 'package:weather_app/product/constant/app_color.dart';
import 'package:weather_app/product/constant/app_radius.dart';
import 'package:weather_app/product/constant/app_size.dart';
import 'package:weather_app/product/constant/app_text_style.dart';
import 'package:weather_app/product/models/dropdown/dropdown_item.dart';

class CustomDropdownButton extends StatefulWidget {
  CustomDropdownButton(
      {super.key,
      this.selected,
      this.list = const [],
      this.title,
      this.onChanged});
  DropdownItem? selected;
  final List<String> list;
  final String? title;
  Function(DropdownItem?)? onChanged;
  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.screenWidth(context) * 0.7,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.black),
        borderRadius: AppRadius.radius12,
      ),
      child: DropdownButtonHideUnderline(
          child: DropdownButton<DropdownItem>(
        hint: Text(
          widget.title!,
          style: AppTextStyle.blackSemibold16,
        ),
        value: widget.selected,
        onChanged: (DropdownItem? newValue) {
          setState(() {
            widget.selected = newValue;
          });
          widget.onChanged!(newValue);
        },
        items: widget.list.map((String value) {
          return DropdownMenuItem<DropdownItem>(
            value: DropdownItem(
              id: value,
              name: value,
            ),
            child: Text(
              value,
              style: AppTextStyle.blackSemibold16,
            ),
          );
        }).toList(),
      )),
    );
  }
}
