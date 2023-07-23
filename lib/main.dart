import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:playground/explicit/explicit_screen.dart';
import 'package:playground/implicit/implicit_screen.dart';
import 'package:playground/more/more_screen.dart';
import 'package:playground/page_transitions/page_transtions_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends HookWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = useMemoized(
      () => {
        const Tab(text: "Implicit"): const ImplicitScreen(), // AnimationFoo
        const Tab(text: "Explicit"): const ExplicitScreen(), // Tween, AnimatedBuilder, FooTransition, ...
        const Tab(text: "Page"): const PageTransitionsScreen(),
        const Tab(text: "More"): const MoreScreen(),
      },
      [],
    );

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Animations Examples"),
          bottom: TabBar(tabs: [...tabs.keys]),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: TabBarView(children: [...tabs.values]),
        ),
      ),
    );
  }
}
