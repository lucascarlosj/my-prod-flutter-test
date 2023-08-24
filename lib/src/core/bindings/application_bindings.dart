import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:my_prod_flutter_test/src/features/home/data/home_repository.dart';
import 'package:my_prod_flutter_test/src/features/home/data/home_repository_impl.dart';
import 'package:my_prod_flutter_test/src/features/home/domain/usecase/get_repos.dart';
import 'package:my_prod_flutter_test/src/features/home/domain/usecase/get_repos_impl.dart';

class ApplicationBindings implements Bindings {
  @override
  dependencies() {
    log('|-----------------------------------------------|');
    log('| ApplicationBindings Injection] - Initialized! |');
    log('|-----------------------------------------------|');
    Get.lazyPut(() => http.Client());
    Get.lazyPut<HomeRepository>(() => HomeRepositoryImpl(http: Get.find()));
    Get.lazyPut<GetRepos>(() => GetReposImpl(homeRepository: Get.find()));
    
   
  }
}
