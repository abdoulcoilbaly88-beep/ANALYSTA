import 'package:flutter/material.dart';
void main() => runApp(const AnalystaApp());
class AnalystaApp extends StatelessWidget {
  const AnalystaApp({super.key});
  @override
  Widget build(BuildContext c) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      home: const MainScreen(),
    );
  }
}
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFFFFA500), centerTitle: true, title: const Text("ANALYSTA", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
      body: _index==0 ? const AccueilPage() : _index==1 ? const Center(child: Text("LIVE - Bientôt", style: TextStyle(color: Colors.white70))) : _index==2 ? const AnalysePage() : const Center(child: Text("Stats - Bientôt", style: TextStyle(color: Colors.white70))),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        backgroundColor: const Color(0xFF1E1E1E),
        selectedItemColor: const Color(0xFFFFA500),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
          BottomNavigationBarItem(icon: Icon(Icons.live_tv), label: "Live"),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: "Analyse"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Stats"),
        ],
      ),
    );
  }
}
class AccueilPage extends StatelessWidget {
  const AccueilPage({super.key});
  void _showAnalyse(BuildContext context){
    showDialog(context: context, builder: (_) => AlertDialog(
      backgroundColor: const Color(0xFF2A2A2A),
      title: const Text("ANALYSE ANALYSTA", style: TextStyle(color: Color(0xFFFFA500), fontWeight: FontWeight.bold)),
      content: const Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("ASEC Mimosas vs Africa Sports", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        Text("• ASEC: 4 victoires sur 5 derniers", style: TextStyle(color: Colors.white70)),
        Text("• Africa: 2 défaites extérieur", style: TextStyle(color: Colors.white70)),
        SizedBox(height: 12),
        Text("PRÉDICTION IA: Victoire ASEC 65%", style: TextStyle(color: Color(0xFFFFA500), fontWeight: FontWeight.bold)),
        Text("Score: 2-1 | Confiance: 78%", style: TextStyle(color: Colors.green)),
      ]),
      actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("Fermer", style: TextStyle(color: Color(0xFFFFA500))))],
    ));
  }
  @override
  Widget build(BuildContext context){
    return Padding(padding: const EdgeInsets.all(16), child: Container(
      decoration: BoxDecoration(color: const Color(0xFF1E1E1E), borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(20),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Column(children: [Icon(Icons.shield, size: 60, color: Colors.yellow), Text("ASEC Mimosas", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))]),
          Text("VS", style: TextStyle(color: Color(0xFFFFA500), fontSize: 24, fontWeight: FontWeight.bold)),
          Column(children: [Icon(Icons.shield, size: 60, color: Colors.green), Text("Africa Sports", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))]),
        ]),
        const SizedBox(height: 20),
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => _showAnalyse(context), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFFA500), padding: const EdgeInsets.symmetric(vertical: 14)), child: const Text("Analyser le match", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)))),
      ]),
    ));
  }
}
class AnalysePage extends StatelessWidget {
  const AnalysePage({super.key});
  @override
  Widget build(BuildContext context){
    return ListView(padding: const EdgeInsets.all(16), children: const [
      Text("Analyses", style: TextStyle(color: Color(0xFFFFA500), fontWeight: FontWeight.bold, fontSize: 18)),
      SizedBox(height: 10),
      ListTile(tileColor: Color(0xFF1E1E1E), title: Text("ASEC vs Africa - 65% ASEC", style: TextStyle(color: Colors.white)), subtitle: Text("Confiance 78%", style: TextStyle(color: Colors.green))),
    ]);
  }
}
