import 'package:practica_bloc/src/domain/models/articleResponse.dart';
import 'package:practica_bloc/src/presentation/utils/Resource.dart';

import '../../domain/repository/newsRepository.dart';
import '../dataSource/remote/newsServices.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsServices newsServices;
  NewsRepositoryImpl(this.newsServices);

  @override
  Future<Resource<ArticleResponse>> getNews() {
    return newsServices.getNews();
  }
}
