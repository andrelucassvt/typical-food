import 'package:flutter/material.dart';

class BottomNavBarStatesWidget extends StatefulWidget {
  const BottomNavBarStatesWidget({
    required this.onTap,
    required this.titulo,
    super.key,
  });

  final VoidCallback onTap;
  final String titulo;

  @override
  State<BottomNavBarStatesWidget> createState() =>
      _BottomNavBarStatesWidgetState();
}

class _BottomNavBarStatesWidgetState extends State<BottomNavBarStatesWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: widget.onTap,
            child: Container(
              width: 200,
              height: 50,
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(32))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.titulo,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
    );
  }
}
