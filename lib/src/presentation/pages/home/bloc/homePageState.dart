import 'package:equatable/equatable.dart';

import '../../../utils/Resource.dart';

class HomePageState extends Equatable {
  final Resource? resource;

  const HomePageState({this.resource});

  /// Crea una copia del estado actual de `HomePageState` con la opción de
  /// reemplazar el valor de `resource`.
  ///
  /// Si no se proporciona un nuevo valor para `resource`, se utilizará el valor
  /// actual del estado.
  ///
  /// Parámetros:
  /// - `resource` (opcional): El nuevo valor de `resource` para el estado copiado.
  ///
  /// Retorna:
  /// - Una nueva instancia de `HomePageState` con el valor de `resource`
  ///   actualizado si se proporciona, o el valor actual si no se proporciona.

  HomePageState copyWith({Resource? resource}) {
    return HomePageState(
      resource: resource ?? this.resource,
    );
  }

  /// Sobrescribe la propiedad `props` de la clase `Equatable` para incluir
  /// los valores que deben ser considerados al comparar instancias de
  /// `HomePageState`.
  ///
  /// Esta implementación asegura que dos instancias de `HomePageState` sean
  /// consideradas iguales si sus propiedades `resource` son iguales.
  ///
  /// Retorna:
  /// - Una lista de objetos que contiene la propiedad `resource`.
  @override
  List<Object?> get props => [resource];
}
