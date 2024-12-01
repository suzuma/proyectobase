import 'package:equatable/equatable.dart';

import '../../../../domain/models/Article.dart';

/// Clase abstracta que representa un evento en la página principal.
///
/// Esta clase extiende `Equatable` para facilitar la comparación de instancias.
/// Todos los eventos de la página principal deben extender esta clase.
abstract class HomePageEvent extends Equatable {
  /// Constructor constante para `HomePageEvent`.
  const HomePageEvent();

  /// Sobrescribe la propiedad `props` de `Equatable` para incluir los valores
  /// que deben ser considerados al comparar instancias de `HomePageEvent`.
  ///
  /// Retorna una lista vacía ya que esta clase es abstracta y no tiene
  /// propiedades propias.
  @override
  List<Object?> get props => [];
}

/// Evento que representa la inicialización de la página principal.
///
/// Este evento puede contener una lista opcional de artículos que se
/// utilizarán para inicializar la página.
///
/// Parámetros:
/// - `articles` (opcional): Una lista de artículos para inicializar la página.
class HomePageInitEvent extends HomePageEvent {
  final List<Article>? articles;

  /// Constructor constante para `HomePageInitEvent`.
  ///
  /// Parámetros:
  /// - `articles` (opcional): Una lista de artículos para inicializar la página.
  const HomePageInitEvent({this.articles});

  /// Sobrescribe la propiedad `props` de `Equatable` para incluir los valores
  /// que deben ser considerados al comparar instancias de `HomePageInitEvent`.
  ///
  /// Retorna una lista que contiene la propiedad `articles`.
  @override
  List<Object?> get props => [articles];
}
