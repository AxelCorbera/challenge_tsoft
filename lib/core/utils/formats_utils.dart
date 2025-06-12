/// [Formats] es una clase de ayuda funciones para dar formato de algun tipo de valor
/// a otro tipo diferente
library;

class Formats {
  /// Retorna la duracion en una cadena de texto con formato {HH:mm:SS}
  String durationToString(Duration d) {
    final hours = d.inHours.remainder(60).toString().padLeft(2, '0');
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '${hours != '00' ? '$hours:' : ''}$minutes:$seconds';
  }
}
