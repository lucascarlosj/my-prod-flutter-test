import 'package:flutter/material.dart';
import 'package:my_prod_flutter_test/src/core/ui/constants.dart';
class CustomBadgeCount extends StatelessWidget {
  final int count;

  const CustomBadgeCount({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 17,
      width: 22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorsConstants.whiteTwo,
      ),
      child: Center(
        child: Text(
          count.toString(),
          style: const TextStyle(
            color: ColorsConstants.slateGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
