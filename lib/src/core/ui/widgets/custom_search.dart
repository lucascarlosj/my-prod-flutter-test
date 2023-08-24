import 'package:flutter/material.dart';
import 'package:my_prod_flutter_test/src/core/ui/constants.dart';
import 'package:my_prod_flutter_test/src/core/ui/helper/form_helper.dart';

class CustomSearch extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  const CustomSearch({super.key, this.onChanged, this.onTap, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTapOutside: (_) => context.unfocus(),
      onChanged: onChanged,
      onTap: onTap,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: "Filter by name",
        hintStyle: const TextStyle(
          color: ColorsConstants.slateGrey,
          fontSize: 14,
          fontWeight: FontWeight.w300,
          fontFamily: 'OpenSans',
        ),
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: ColorsConstants.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: Colors.blue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: ColorsConstants.warmGrey,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
