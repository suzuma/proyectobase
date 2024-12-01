import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practica_bloc/src/domain/models/articleResponse.dart';
import 'package:practica_bloc/src/presentation/utils/Resource.dart';

import '../../../presentation/utils/listToString.dart';
import '../../api/apiConfig.dart';

/// `NewsServices` es una clase que proporciona métodos para interactuar con la API de noticias.
///
/// Esta clase contiene métodos para obtener noticias desde una API remota y manejar
/// las respuestas de manera adecuada.
class NewsServices {
  /// Obtiene las noticias principales desde la API.
  ///
  /// Este método realiza una solicitud HTTP GET a la API de noticias para obtener
  /// los titulares principales. Si la solicitud es exitosa, retorna un `Success` con
  /// los datos de la respuesta. Si la solicitud falla, retorna un `Error` con el
  /// mensaje de error correspondiente.
  ///
  /// Retorna:
  /// - Un `Resource<ArticleResponse>` que contiene los datos de la respuesta en caso
  ///   de éxito, o un mensaje de error en caso de fallo.
  Future<Resource<ArticleResponse>> getNews() async {
    try {
      // Construye la URL para la solicitud.
      Uri url = Uri.https(
        ApiConfig.API_NEWS,
        '/v2/top-headlines',
        {
          'country': 'us',
          'apiKey': ApiConfig.API__NEWS_KEY,
        },
      );

      // Define los encabezados de la solicitud.
      Map<String, String> headers = {"Content-Type": "application/json"};

      // Define el cuerpo de la solicitud (vacío en este caso).
      String body = json.encode({});

      // Realiza la solicitud HTTP GET.
      final response = await http.get(url, headers: headers);

      // Decodifica la respuesta JSON.
      final data = json.decode(response.body);

      // Verifica el código de estado de la respuesta.
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Si la solicitud es exitosa, crea una instancia de `ArticleResponse` con los datos.
        ArticleResponse articleResponse = ArticleResponse.fromJson(data);
        return Success(articleResponse);
      } else {
        // Si la solicitud falla, retorna un `Error` con el mensaje de error.
        return Error(listToString(data['message']));
      }
    } catch (e) {
      // Si ocurre una excepción, retorna un `Error` con el mensaje de la excepción.
      return Error(e.toString());
    }
  }
}
