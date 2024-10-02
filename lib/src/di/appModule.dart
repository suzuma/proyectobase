import 'package:injectable/injectable.dart';

import '../data/repository/remote/newsServices.dart';

@module
abstract class AppModule {
  @injectable
  NewsServices get newsServices => NewsServices();
}
