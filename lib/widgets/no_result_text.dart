import 'package:flutter/material.dart';

class NoResultText extends StatelessWidget {
  const NoResultText({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [Text('Realiza una búsqueda')],
        ),
      ),
    );
  }
}
