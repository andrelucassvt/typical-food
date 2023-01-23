import 'package:flutter/material.dart';

class CircularProgressWidget extends StatelessWidget {
  const CircularProgressWidget({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
