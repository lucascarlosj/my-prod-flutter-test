import 'package:my_prod_flutter_test/src/features/home/data/home_repository.dart';
import 'package:my_prod_flutter_test/src/features/home/domain/entity/repos_entity.dart';
import 'package:my_prod_flutter_test/src/features/home/domain/entity/starred_entity.dart';
import 'package:my_prod_flutter_test/src/features/home/domain/entity/user_entity.dart';
import 'package:my_prod_flutter_test/src/features/home/domain/usecase/get_repos.dart';

class GetReposImpl implements GetRepos {
  final HomeRepository _homeRepository;

  GetReposImpl({
    required HomeRepository homeRepository,
  }) : _homeRepository = homeRepository;

  @override
  Future<List<ReposEntity>> getRepos(String user) => _homeRepository.getRepos(user);

  @override
  Future<List<StarredEntity>> getStarred(String user) => _homeRepository.getStarred(user);

  @override
  Future<UserEntity> getUser(String user) => _homeRepository.getUser(user);
}
