import 'package:hive_repository/data/models/home/home.dart';

import '../../client.dart';

class HomeRepositories{
  final ApiClient client;

  HomeRepositories({required this.client});

  List<HomeModel> home = [];

  Future<List<HomeModel>> fetchHome() async {
    final rawPosts = await client.fetchHome();
    home = rawPosts.map((e) => HomeModel.fromJson(e)).toList();
    return home;
  }
}