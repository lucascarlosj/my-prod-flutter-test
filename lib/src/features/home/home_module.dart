import 'package:get/get.dart';
import 'package:my_prod_flutter_test/src/core/module/module.dart';
import 'package:my_prod_flutter_test/src/features/home/presenter/home_page.dart';
import 'package:my_prod_flutter_test/src/features/home/presenter/home_page_controller.dart';

class HomeModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage<dynamic>(
      name: '/home',
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
  ];
}

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      HomePageController(
        getRepos: Get.find(),
      ),
    );
  }
}
