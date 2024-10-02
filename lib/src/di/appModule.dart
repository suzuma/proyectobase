import 'package:injectable/injectable.dart';
import 'package:practica_bloc/src/data/repository/newsRepository.dart';

import '../data/dataSource/remote/newsServices.dart';
import '../domain/repository/newsRepository.dart';

@module
abstract class AppModule {
  @injectable
  NewsServices get newsServices => NewsServices();

  @injectable
  NewsRepository get newsRepository => NewsRepositoryImpl(newsServices);
}
