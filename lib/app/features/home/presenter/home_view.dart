import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:typical_food/app/features/home/coordinator/home_coordinator.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //AppBar para Android
        appBar: Platform.isAndroid
            ? AppBar(
                title: const Text('Typical Food'),
                centerTitle: false,
                actions: [
                  TextButton(
                    onPressed: () {
                      HomeCoordinator.navigateAboutView(context);
                    },
                    child: const Text('Sobre'),
                  )
                ],
              )
            : null,
        body: CustomScrollView(
          slivers: <Widget>[
            //AppBar para IOS
            if (Platform.isIOS)
              CupertinoSliverNavigationBar(
                largeTitle: const Text('Typical Food'),
                trailing: TextButton(
                  onPressed: () {
                    HomeCoordinator.navigateAboutView(context);
                  },
                  child: const Text('Sobre'),
                ),
              ),
            // Fim AppBar IOS
            SliverFillRemaining(
              child: Column(
                children: const [],
              ),
            )
          ],
        ));
  }
}
