import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Transform.rotate(
              angle: 1,
              origin: Offset(350, 50),
              child: Container(
                height: 700,
                width: 700,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  shape: BoxShape.circle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
