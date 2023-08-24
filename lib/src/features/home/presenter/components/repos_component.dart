import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_prod_flutter_test/src/core/ui/constants.dart';
import 'package:my_prod_flutter_test/src/core/ui/widgets/custom_search.dart';
import 'package:my_prod_flutter_test/src/features/home/domain/entity/repos_entity.dart';

class ReposComponent extends StatelessWidget {
  final void Function(String)? onChanged;
  final List<ReposEntity> reposEntity;

  const ReposComponent({
    Key? key,
    required this.reposEntity,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CustomSearch(onChanged: onChanged),
        ),
        Expanded(
          child: Center(
            child: ShaderMask(
              shaderCallback: (Rect rect) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.purple,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.purple
                  ],
                  stops: [0.0, 0.1, 1.0, 1.0],
                ).createShader(rect);
              },
              blendMode: BlendMode.dstOut,
              child: ListView.builder(
                itemCount: reposEntity.length,
                itemBuilder: (context, index) {
                  final item = reposEntity[index];
                  return buildRepoItem(item);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildRepoItem(ReposEntity item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              Text(
                item.name ?? '',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff3498db),
                ),
              ),
              if (item.description!.isNotEmpty)
                Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      item.description!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: ColorsConstants.slateGrey,
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.code,
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      Text(item.language ?? ''),
                    ],
                  ),
                  const SizedBox(width: 18),
                  if (item.forksCount != 0)
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/branch_icon.svg',
                          width: 15,
                          height: 15,
                        ),
                        const SizedBox(width: 4),
                        Text(item.forksCount.toString()),
                      ],
                    ),
                ],
              ),
              const SizedBox(height: 22),
            ],
          ),
        ),
        const Divider(
          color: ColorsConstants.slateGrey,
        ),
      ],
    );
  }
}
