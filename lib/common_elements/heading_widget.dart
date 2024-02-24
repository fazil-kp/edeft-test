import 'package:flutter/material.dart';

import '../helpers/colors.dart';

class HeadingWidget extends StatelessWidget {
  final String menuname;
  final String submenuname;

  const HeadingWidget( {super.key, 
    required this.menuname,
    required this.submenuname,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          menuname,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        Text(
          " | ",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: UiColor.extraDarkGreyColor,
              ),
        ),
        Text(
          submenuname,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
      ],
    );
  }
}
