import 'dart:developer';

import 'package:get/get.dart';
import 'package:my_prod_flutter_test/src/features/home/domain/entity/repos_entity.dart';
import 'package:my_prod_flutter_test/src/features/home/domain/entity/starred_entity.dart';
import 'package:my_prod_flutter_test/src/features/home/domain/entity/user_entity.dart';
import 'package:my_prod_flutter_test/src/features/home/domain/usecase/get_repos.dart';

class HomePageController extends GetxController {
  final GetRepos _getReposService;

  HomePageController({
    required GetRepos getRepos,
  }) : _getReposService = getRepos;

  @override
  void onInit() {
    getInfos();
    super.onInit();
  }

  final reposList = <ReposEntity>[].obs;
  final _reposListSearch = <ReposEntity>[];

  final starredList = <StarredEntity>[].obs;
  final _starredListSearch = <StarredEntity>[];

  final _searching = false.obs;
  final index = 0.obs;
  final userData = Rxn<UserEntity>();
  var userName = 'lucascarlosj'.obs;

  Future<void> getInfos({String? nameUser}) async {
    final userNameSearch = nameUser ?? userName.value;

    await getUser(userNameSearch);
    await getReposData(userNameSearch);
    await getStarredData(userNameSearch);
  }

  Future<void> getUser(String user) async {
    try {
      userData.value = null;
      final userResult = await _getReposService.getUser(user);
      userData.value = userResult;
    } catch (e) {
      log('Usuario não encontrado!');
    }
  }

  Future<void> getReposData(String user) async {
    try {
      reposList.clear();
      _reposListSearch.clear();
      final reposResult = await _getReposService.getRepos(user);
      reposList.addAll(reposResult);
      _reposListSearch.addAll(reposResult);
    } catch (e) {
      log('Usuario não encontrado!');
    }
  }

  Future<void> getStarredData(String user) async {
    try {
      starredList.clear();
      _starredListSearch.clear();
      final starredResult = await _getReposService.getStarred(user);
      starredList.addAll(starredResult);
      _starredListSearch.addAll(starredResult);
    } catch (e) {
      log('Usuario não encontrado!');
    }
  }

  void filterRepos(String title) {
    if (title.isNotEmpty) {
      var newListRepos = _reposListSearch.where((m) {
        return m.name!.toLowerCase().contains(title.toLowerCase());
      });

      newListRepos.isEmpty ? _searching.value = true : _searching.value = false;

      reposList.clear();
      reposList.addAll(newListRepos);
    } else {
      reposList.clear();
      reposList.addAll(_reposListSearch);
    }
  }

  void filterStarred(String title) {
    if (title.isNotEmpty) {
      var newListStarred = _starredListSearch.where((m) {
        return m.fullName!.toLowerCase().contains(title.toLowerCase());
      });

      newListStarred.isEmpty
          ? _searching.value = true
          : _searching.value = false;

      starredList.clear();
      starredList.addAll(newListStarred);
    } else {
      starredList.clear();
      starredList.addAll(_starredListSearch);
    }
  }
}
