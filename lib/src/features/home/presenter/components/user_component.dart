import 'package:flutter/material.dart';
import 'package:my_prod_flutter_test/src/core/ui/constants.dart';

class UserComponent extends StatelessWidget {
  final String name;
  final String? description;
  final String avatarUrl;
  const UserComponent({
    super.key,
    required this.name,
    this.description,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: ColorsConstants.paleGrey,
            radius: 35,
            backgroundImage: avatarUrl.isNotEmpty
                ? NetworkImage(avatarUrl)
                : const NetworkImage(
                    'https://api-private.atlassian.com/users/da25b9cdbd685e91c96948b0e7530271/avatar',
                  ),
          ),
          const SizedBox(width: 15),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    fontFamily: 'OpenSans',
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description ?? '',
                  softWrap: true,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    fontFamily: 'OpenSans',
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
