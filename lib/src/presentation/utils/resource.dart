/// Clase abstracta que representa un recurso genérico.
///
/// Esta clase puede ser extendida para representar diferentes estados de un
/// recurso, como inicial, cargando, éxito y error.
abstract class Resource<T> {}

/// Clase que representa el estado inicial de un recurso.
///
/// Esta clase no contiene datos adicionales y se utiliza para indicar que
/// el recurso está en su estado inicial.
class Inicial extends Resource {}

/// Clase que representa el estado de carga de un recurso.
///
/// Esta clase no contiene datos adicionales y se utiliza para indicar que
/// el recurso está siendo cargado.
class Loading extends Resource {}

/// Clase que representa el estado de "OnBoarding" de un recurso.
///
/// Esta clase no contiene datos adicionales y se utiliza para indicar que
/// el recurso está en el estado de "OnBoarding".
class OnBoarding extends Resource {}

/// Clase que representa el estado de éxito de un recurso.
///
/// Esta clase contiene los datos asociados con el recurso cuando la operación
/// ha sido exitosa.
///
/// Parámetros:
/// - `data`: Los datos asociados con el recurso en estado de éxito.
class Success<T> extends Resource<T> {
  final T data;
  Success(this.data);
}

/// Clase que representa el estado de error de un recurso.
///
/// Esta clase contiene un mensaje de error asociado con el recurso cuando
/// la operación ha fallado.
///
/// Parámetros:
/// - `message`: El mensaje de error asociado con el recurso en estado de error.
class Error<T> extends Resource<T> {
  final String message;
  Error(this.message);
}
