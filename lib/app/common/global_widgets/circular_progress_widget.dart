// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CircularProgressWidget extends StatelessWidget {
  CircularProgressWidget({
    Key? key,
    required this.color,
  }) : super(key: key);

  Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
