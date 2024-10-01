# practica_bloc

Código base para trabajar con el patrón BLoC en Flutter.

## El patrón BLoC

El patrón BLoC (Business Logic Component) es un patrón de diseño utilizado en el desarrollo de aplicaciones Flutter para gestionar el estado y la lógica de negocio de una manera estructurada y eficiente. Aquí hay una descripción paso a paso de cómo funciona:

### Eventos
Los eventos son acciones que pueden ocurrir en la aplicación, como un usuario presionando un botón o una llamada a una API completándose. Los eventos son enviados al BLoC.

### BLoC
El BLoC recibe los eventos y contiene la lógica de negocio para manejar esos eventos. Puede transformar los eventos en nuevos estados.

### Estados
Los estados son el resultado de la lógica de negocio aplicada a los eventos. El BLoC emite nuevos estados en respuesta a los eventos.
gti .
### UI
La interfaz de usuario (UI) escucha los cambios en el estado y se actualiza en consecuencia. La UI envía eventos al BLoC cuando el usuario interactúa con la aplicación.

### Ejemplo de implementación básica del patrón BLoC en Flutter

#### Pseudocódigo:
1. Definir eventos.
2. Definir estados.
3. Crear una clase BLoC que maneje los eventos y emita estados.
4. Conectar la UI al BLoC para enviar eventos y escuchar estados.

#### Código
'''
```dart
// Definir eventos
abstract class CounterEvent {}
class IncrementEvent extends CounterEvent {}

// Definir estados
abstract class CounterState {}
class CounterInitial extends CounterState {}
class CounterValue extends CounterState {
  final int value;
  CounterValue(this.value);
}

// Crear la clase BLoC
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial());

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      final currentState = state;
      int newValue = 0;
      if (currentState is CounterValue) {
        newValue = currentState.value + 1;
      }
      yield CounterValue(newValue);
    }
  }
}

// Conectar la UI al BLoC
void main() {
  final CounterBloc counterBloc = CounterBloc();

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('BLoC Pattern Example')),
      body: BlocBuilder<CounterBloc, CounterState>(
        bloc: counterBloc,
        builder: (context, state) {
          int counterValue = 0;
          if (state is CounterValue) {
            counterValue = state.value;
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Counter Value: $counterValue'),
                ElevatedButton(
                  onPressed: () {
                    counterBloc.add(IncrementEvent());
                  },
                  child: Text('Increment'),
                ),
              ],
            ),
          );
        },
      ),
    ),
  ));
}

```