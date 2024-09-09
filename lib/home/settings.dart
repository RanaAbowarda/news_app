import 'package:flutter/material.dart';
import 'package:news_app/theme/app_color.dart';

import 'language_dropdown.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(30.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(
            "Language",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColor.blackColor,
                ),
          ),
          const SizedBox(
            height: 30,
          ),
          const LanguageDropDown(),
          const SizedBox(
            height: 30,
          ),
        ]));
  }
}
