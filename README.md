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

### UI
La interfaz de usuario (UI) escucha los cambios en el estado y se actualiza en consecuencia. La UI envía eventos al BLoC cuando el usuario interactúa con la aplicación.

### Ejemplo de implementación básica del patrón BLoC en Flutter

#### Pseudocódigo:
1. Definir eventos.
2. Definir estados.
3. Crear una clase BLoC que maneje los eventos y emita estados.
4. Conectar la UI al BLoC para enviar eventos y escuchar estados.