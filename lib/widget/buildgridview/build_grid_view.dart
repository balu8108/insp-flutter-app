import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:insp/utils/extensions.dart';

Widget BuildGridView({
  required List<dynamic> items,
  required Widget Function(BuildContext, int) itemBuilder,
  required BuildContext context,
}) {
  return GridView.builder(
    itemCount: items.length,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: itemBuilder,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: context.isWebOrLandScape() ? 3 : 1,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      mainAxisExtent: 230,
    ),
  );
}
