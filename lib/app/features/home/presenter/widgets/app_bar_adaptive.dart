import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:typical_food/app/features/home/coordinator/home_coordinator.dart';
import 'package:typical_food/app/util/strings/strings_app.dart';

class AppBarAdaptive extends StatelessWidget {
  const AppBarAdaptive({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoSliverNavigationBar(
        largeTitle: const Text(StringsApp.nomeApp),
        trailing: TextButton(
          onPressed: () {
            HomeCoordinator.navigateAboutView(context);
          },
          child: const Text(StringsApp.sobre),
        ),
      );
    }
    return SliverAppBar(
      title: const Text(StringsApp.nomeApp),
      centerTitle: false,
      actions: [
        TextButton(
          onPressed: () {
            HomeCoordinator.navigateAboutView(context);
          },
          child: const Text(StringsApp.sobre),
        )
      ],
    );
  }
}
