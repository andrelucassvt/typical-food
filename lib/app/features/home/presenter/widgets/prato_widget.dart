// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:typical_food/app/util/colors_app.dart';

class PratoWidget extends StatelessWidget {
  PratoWidget({
    Key? key,
    required this.url,
    required this.nome,
    required this.descricao,
    required this.onTap,
  }) : super(key: key);

  String url;
  String nome;
  String descricao;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          gradient: ColorsApp.linearGradientDark,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 180,
                height: 180,
                transform: Matrix4.translationValues(0, -20, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  image: DecorationImage(
                    image: NetworkImage(
                      url,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(
              nome,
              style: const TextStyle(
                color: ColorsApp.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Descrição',
              style: TextStyle(
                color: ColorsApp.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              descricao,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: const TextStyle(
                color: ColorsApp.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
