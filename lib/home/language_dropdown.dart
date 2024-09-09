import 'package:flutter/material.dart';
import 'package:news_app/theme/app_color.dart';

class LanguageDropDown extends StatefulWidget {
  const LanguageDropDown({super.key});

  @override
  State<LanguageDropDown> createState() => _LanguageDropDownState();
}

class _LanguageDropDownState extends State<LanguageDropDown> {
  String? valueChoose;
  List<String> languages = ["Arabic", "English"];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        iconEnabledColor: AppColor.primaryColor,
        decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: AppColor.primaryColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.primaryColor)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.primaryColor))),
        value: valueChoose,
        hint: Text(
          ('Select language'),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColor.primaryColor,
              ),
        ),
        items: languages.map((valueItem) {
          return DropdownMenuItem(
              value: valueItem,
              child: Text(
                valueItem,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: AppColor.primaryColor),
              ));
        }).toList(),
        onChanged: (newValue) {
          valueChoose = newValue;
          if (valueChoose == languages[0]) {
          } else if (valueChoose == languages[1]) {}
          setState(() {});
        });
  }
}
