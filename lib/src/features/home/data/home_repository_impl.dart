import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_prod_flutter_test/src/features/home/data/home_repository.dart';
import 'package:my_prod_flutter_test/src/features/home/domain/entity/repos_entity.dart';
import 'package:my_prod_flutter_test/src/features/home/domain/entity/starred_entity.dart';
import 'package:my_prod_flutter_test/src/features/home/domain/entity/user_entity.dart';

class HomeRepositoryImpl implements HomeRepository {
  final http.Client _http;

  HomeRepositoryImpl({
    required http.Client http,
  }) : _http = http;

  @override
  Future<UserEntity> getUser(String user) async {
    final url = Uri.https('api.github.com', '/users/$user');
    final response = await _http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return UserEntity.fromMap(responseData);
    } else {
      throw Exception('Failed to load user data');
    }
  }

  @override
  Future<List<ReposEntity>> getRepos(String user) async {
    final url = Uri.https('api.github.com', '/users/$user/repos');
    final response = await _http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData
          .map<ReposEntity>((json) => ReposEntity.fromMap(json))
          .toList();
    } else {
      throw Exception('Failed to load user repositories');
    }
  }

  @override
  Future<List<StarredEntity>> getStarred(String user) async {
    try {
      final url = Uri.https('api.github.com', '/users/$user/starred');
      final response = await _http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        return responseData
            .map<StarredEntity>((json) => StarredEntity.fromMap(json))
            .toList();
      } else {
        throw Exception('Failed to load starred repositories');
      }
    } catch (e) {
      throw Exception('Failed to load starred repositories: $user');
    }
  }
}
