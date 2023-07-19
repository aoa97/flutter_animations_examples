import 'package:flutter/material.dart';
import 'package:playground/main_scaffold.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Container(
                color: Colors.blue,
                padding: const EdgeInsets.all(45),
                child: Stack(
                  children: [
                    Image.asset("assets/tom.png"),
                    Image.asset("assets/jerry.png"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text("Welcome :)", style: Theme.of(context).textTheme.headlineLarge),
          ],
        ),
      ),
    );
  }
}
