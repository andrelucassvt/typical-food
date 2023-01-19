import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:typical_food/app/common/strings/colors_app.dart';
import 'package:typical_food/app/features/home/domain/entiy/home_entity.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({
    Key? key,
    required this.prato,
  }) : super(key: key);

  final HomeEntity prato;

  @override
  Widget build(BuildContext context) {
    final heightContainer = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: const Color(0x00FFFFFF),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Opacity(
                opacity: 0.75,
                child: Image.network(
                  prato.image,
                  fit: BoxFit.none,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(20),
                height: heightContainer * 0.69,
                decoration: const BoxDecoration(
                  color: ColorsApp.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          width: 200,
                          height: 200,
                          transform: Matrix4.translationValues(0, -100, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            image: DecorationImage(
                              image: NetworkImage(prato.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        prato.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        prato.description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          log('Click !!');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsApp.darkSecondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 80,
                          ),
                        ),
                        child: const Text(
                          'Modelo 3D',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
