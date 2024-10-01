import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practica_bloc/src/domain/useCases/newsUseCases.dart';

import '../../../utils/Resource.dart';
import 'homePageEvent.dart';
import 'homePageState.dart';

import '../../../utils/Resource.dart';
import 'homePageEvent.dart';
import 'homePageState.dart';

/// `HomePageBloc` es una clase que extiende `Bloc` y maneja los eventos y estados
/// de la página principal.
///
/// Esta clase utiliza el patrón BLoC para gestionar la lógica de negocio y el estado
/// de la página principal. Recibe eventos de tipo `HomePageEvent` y emite estados
/// de tipo `HomePageState`.
class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  /// Instancia de `NewsUseCases` que contiene los casos de uso relacionados con las noticias.
  final NewsUseCases newsUseCases;

  /// Constructor para `HomePageBloc`.
  ///
  /// Parámetros:
  /// - `newsUseCases`: Instancia de `NewsUseCases` para manejar las operaciones relacionadas con las noticias.
  HomePageBloc(this.newsUseCases) : super(const HomePageState()) {
    // Registra el manejador para el evento de inicialización de la página principal.
    on<HomePageInitEvent>(_onInitEvent);
  }

  /// Manejador para el evento `HomePageInitEvent`.
  ///
  /// Este método se ejecuta cuando se recibe un evento de inicialización de la página principal.
  /// Emite un estado de carga y luego intenta obtener una lista de noticias utilizando `newsUseCases`.
  /// Finalmente, emite un nuevo estado con el resultado de la operación.
  ///
  /// Parámetros:
  /// - `event`: El evento de inicialización de la página principal.
  /// - `emit`: Función para emitir nuevos estados.
  Future<void> _onInitEvent(
      HomePageEvent event, Emitter<HomePageState> emit) async {
    // Emite un estado de carga.
    emit(
      state.copyWith(resource: Loading()),
    );

    // Intenta obtener una lista de noticias.
    final Resource resource = await newsUseCases.lisNews.run();

    // Emite un nuevo estado con el resultado de la operación.
    emit(
      state.copyWith(resource: resource),
    );
  }
}
