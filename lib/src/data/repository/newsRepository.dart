import '../../domain/models/articleResponse.dart';
import '../../domain/repository/newsRepository.dart';
import '../../presentation/utils/resource.dart';
import 'remote/newsServices.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsServices newsServices;
  NewsRepositoryImpl(this.newsServices);

  @override
  Future<Resource<ArticleResponse>> getNews() {
    return newsServices.getNews();
  }
}
