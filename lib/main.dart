import 'package:flutter/material.dart';
// IMPORTANT: vérifie que ces imports existent bien chez toi
import 'matchs_page.dart';
import 'favoris_page.dart';
import 'explorer_page.dart';
import 'transferts_page.dart';
import 'infos_page.dart';

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

  final List<Widget> pages = const [
    MatchsPage(),
    FavorisPage(),
    ExplorerPage(),
    TransfertsPage(),
    InfosPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
