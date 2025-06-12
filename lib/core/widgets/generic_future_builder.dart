import 'package:flutter/material.dart';

/// Widget reutilizable para manejar estados comunes de un [Future].
///
/// Muestra un widget de carga, error, vacío o éxito, según el estado del `Future`.
class GenericFutureBuilder<T> extends StatelessWidget {
  final Future<T> future;
  final Widget Function(BuildContext context, T data) builder;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final bool Function(T)? isEmpty;
  final Widget? emptyWidget;

  const GenericFutureBuilder({
    super.key,
    required this.future,
    required this.builder,
    this.loadingWidget,
    this.errorWidget,
    this.isEmpty,
    this.emptyWidget,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loadingWidget ??
              const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return errorWidget ?? const Center(child: Text('Error'));
        } else if (snapshot.hasData) {
          final data = snapshot.data as T;
          if (isEmpty != null && isEmpty!(data)) {
            return emptyWidget ?? const Center(child: Text('Sin resultados'));
          }
          return builder(context, data);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
