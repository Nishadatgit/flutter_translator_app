import 'package:flutter/material.dart';

import 'country_choose_button.dart';

class ChooseLanguageSection extends StatelessWidget {
  const ChooseLanguageSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: LanguageChooseButton(
            title: 'Germany',
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Icon(
            Icons.sync_alt,
            color: Colors.grey.withOpacity(0.8),
          ),
        ),
        Expanded(
          child: LanguageChooseButton(
            title: 'India',
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
