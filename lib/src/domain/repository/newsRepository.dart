import 'package:practica_bloc/src/domain/models/articleResponse.dart';

import '../../presentation/utils/Resource.dart';

abstract class NewsRepository {
  Future<Resource<ArticleResponse>> getNews();
}
