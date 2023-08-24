import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_prod_flutter_test/src/core/ui/constants.dart';
import 'package:my_prod_flutter_test/src/core/ui/widgets/custom_badge_count.dart';
import 'package:my_prod_flutter_test/src/core/ui/widgets/custom_search.dart';
import 'package:my_prod_flutter_test/src/features/home/presenter/components/repos_component.dart';
import 'package:my_prod_flutter_test/src/features/home/presenter/components/starred_component.dart';
import 'components/user_component.dart';
import 'home_page_controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorsConstants.slateGrey,
      title: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: SvgPicture.asset(
          height: 25,
          ImageConstants.logo,
        ),
      ),
      actions: [
        IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onPressed: () => modalSearchComponent(context),
          icon: const Icon(
            Icons.person_search_outlined,
            color: ColorsConstants.white,
          ),
        ),
      ],
    );
  }

  Widget buildTab(String label, int count, int index) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: controller.index.value == index
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
          ),
          const SizedBox(width: 5),
          CustomBadgeCount(count: count),
        ],
      ),
    );
  }

  Widget buildBody() {
    return SizedBox.expand(
      child: Obx(
        () {
          final userData = controller.userData.value;
          if (userData == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              UserComponent(
                name: userData.name,
                description: userData.bio,
                avatarUrl: userData.avatarUrl,
              ),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.0),
                          border: const Border(
                            bottom: BorderSide(
                              color: ColorsConstants.warmGrey,
                              width: 1,
                            ),
                          ),
                        ),
                        child: TabBar(
                          indicatorColor: ColorsConstants.rustyOrange,
                          dividerColor: ColorsConstants.slateGrey,
                          indicatorWeight: 6,
                          labelColor: ColorsConstants.black,
                          onTap: (value) => controller.index.value = value,
                          tabs: [
                            buildTab('Repos', controller.reposList.length, 0),
                            buildTab(
                                'Starred', controller.starredList.length, 1),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            ReposComponent(
                              reposEntity: controller.reposList,
                              onChanged: (v) => controller.filterRepos(v),
                            ),
                            StarredComponent(
                              starredEntity: controller.starredList,
                              onChanged: (v) => controller.filterStarred(v),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> modalSearchComponent(BuildContext context) async {
    final nameEC = TextEditingController();
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomSearch(controller: nameEC),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Procurar usuário'),
                onPressed: () {
                  controller.getInfos(nameUser: nameEC.text);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
