import 'package:my_prod_flutter_test/src/features/home/domain/entity/repos_entity.dart';
import 'package:my_prod_flutter_test/src/features/home/domain/entity/starred_entity.dart';
import 'package:my_prod_flutter_test/src/features/home/domain/entity/user_entity.dart';

abstract class GetRepos {
  Future<List<ReposEntity>> getRepos(String user);
  Future<List<StarredEntity>> getStarred(String user);
  Future<UserEntity> getUser(String user);
}
