import '../repository/newsRepository.dart';

class GetNewUseCases {
  NewsRepository newsRepository;
  GetNewUseCases(this.newsRepository);

  run() => newsRepository.getNews();
}
