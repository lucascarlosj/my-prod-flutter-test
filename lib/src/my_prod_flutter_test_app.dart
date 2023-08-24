import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_prod_flutter_test/src/core/bindings/application_bindings.dart';
import 'package:my_prod_flutter_test/src/core/ui/my_prod_theme.dart';

import 'features/home/home_module.dart';

class MyProdFlutterTestApp extends StatelessWidget {
  const MyProdFlutterTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
          defaultTransition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 300),
          theme: MyProdTheme.themeData,
          debugShowCheckedModeBanner: false,
          initialBinding: ApplicationBindings(),
          title: 'My Prod Flutter Test',
          initialRoute: '/home',
          getPages: [
            ...HomeModule().routers,
          ],
        );
  }
}
