import 'package:hive_repository/data/repositories/home/home_repositories.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../data/client.dart';

List<SingleChildWidget>provider=[
  Provider(
    create: (context) => ApiClient(),
  ),
  Provider(
    create: (context) => HomeRepositories(
      client: context.read(),
    ),
  ),
];