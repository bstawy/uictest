import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'language_model.dart';

class LanguageCustomWidget extends StatelessWidget {
  final LanguageModel languageModel;

  const LanguageCustomWidget({
    super.key,
    required this.languageModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(languageModel.iconPath),
        const SizedBox(width: 8.0),
        DropdownButton(
          items: const [
            DropdownMenuItem(value: 'Item 1', child: Text('Item 1')),
            DropdownMenuItem(value: 'Item 2', child: Text('Item 2')),
          ],
          value: 'Item 1',
          onChanged: (_) {},
        ),
      ],
    );
  }
}
