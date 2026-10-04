import 'package:flutter/material.dart';

void main() {
  runApp(const AnalystaApp());
}

class AnalystaApp extends StatelessWidget {
  const AnalystaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ANALYSTA",
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F0F0F),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final pages = const [
    Center(child: Text("Matchs Page", style: TextStyle(fontSize: 24))),
    Center(child: Text("Favoris Page", style: TextStyle(fontSize: 24))),
    Center(child: Text("Explorer Page", style: TextStyle(fontSize: 24))),
    Center(child: Text("Transferts Page", style: TextStyle(fontSize: 24))),
    Center(child: Text("Infos Page", style: TextStyle(fontSize: 24))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ANALYSTA"), backgroundColor: const Color(0xFF1E1E1E), centerTitle: true),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (v) => setState(() => _currentIndex = v),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF1E1E1E),
        selectedItemColor: const Color(0xFF1DB680),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.sports_soccer), label: "Matchs"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favoris"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explorer"),
          BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: "Transferts"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "Infos"),
        ],
      ),
    );
  }
}
