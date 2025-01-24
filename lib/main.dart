import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Responsivo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ResponsiveLayout(),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtém informações sobre o tamanho da tela
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Responsivo'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Define breakpoints para diferentes tamanhos de tela
          if (constraints.maxWidth > 1200) {
            return const DesktopLayout();
          } else if (constraints.maxWidth > 800) {
            return const TabletLayout();
          } else {
            return const MobileLayout();
          }
        },
      ),
    );
  }
}

// Layout para Desktop
class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.blue[100],
            child: const Center(
              child: Text('Menu Lateral', style: TextStyle(fontSize: 18)),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.white,
            child: const Center(
              child: Text('Conteúdo Principal - Desktop', style: TextStyle(fontSize: 24)),
            ),
          ),
        ),
      ],
    );
  }
}

// Layout para Tablet
class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.blue[200],
            child: const Center(
              child: Text('Cabeçalho', style: TextStyle(fontSize: 18)),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.white,
            child: const Center(
              child: Text('Conteúdo Principal - Tablet', style: TextStyle(fontSize: 24)),
            ),
          ),
        ),
      ],
    );
  }
}

// Layout para Mobile
class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          color: Colors.blue[300],
          height: 100,
          child: const Center(
            child: Text('Cabeçalho - Mobile', style: TextStyle(fontSize: 18)),
          ),
        ),
        Container(
          color: Colors.white,
          height: 300,
          child: const Center(
            child: Text('Conteúdo Principal - Mobile', style: TextStyle(fontSize: 24)),
          ),
        ),
      ],
    );
  }
}
