import 'package:flutter/material.dart';

import '../../constants/heights.dart';
import '../screen_home.dart';

class TranslateFromSection extends StatelessWidget {
  const TranslateFromSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            direction: Axis.horizontal,
            spacing: 4,
            children: [
              Text(
                'Translate From',
                style: TextStyle(color: Colors.grey.withOpacity(0.5)),
              ),
              const Text('(Germany)'),
            ],
          ),
          kHeight20,
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
                controller: fromController,
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                maxLines: 10,
                maxLength: 1200,
              ),
            ),
          )
        ],
      ),
    );
  }
}
