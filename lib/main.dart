import 'package:flutter/material.dart';
void main() { runApp(MaterialApp(debugShowCheckedModeBanner: false, theme: ThemeData.dark(), home: HomePage())); }

class HomePage extends StatefulWidget { @override State<HomePage> createState() => _HomePageState(); }
class _HomePageState extends State<HomePage> {
  int index = 0;
  Widget buildPage(int i) {
    if (i == 0) return MatchsPage();
    if (i == 1) return FavorisPage();
    if (i == 2) return ExplorerPage();
    if (i == 3) return TransfertsPage();
    return InfosPage();
  }
  @override Widget build(BuildContext context) {
    return Scaffold(
      body: buildPage(index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (v) { setState(() { index = v; }); },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF1E1E1E),
        selectedItemColor: Color(0xFF1DBE60),
        unselectedItemColor: Colors.grey,
        items: [
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

Widget logo(String team) {
  String flag = "⚽";
  Color bg = Colors.white;
  if (team == "Somalie") { flag = "🇸🇴"; bg = Color(0xFF418FDE); }
  if (team == "Côte d'Ivoire") { flag = "🇨🇮"; }
  if (team == "ASEC Mimosas") { flag = "💛"; bg = Color(0xFFFFD700); }
  if (team == "Africa Sport") { flag = "💚"; bg = Color(0xFF008000); }
  if (team == "Stella Club") { flag = "❤️"; bg = Colors.red; }
  if (team == "Man City") { flag = "💙"; }
  if (team == "Arsenal") { flag = "🔴"; }
  if (team == "Barcelona") { flag = "🔵🔴"; }
  return Container(width: 44, height: 44, decoration: BoxDecoration(color: bg, shape: BoxShape.circle), child: Center(child: Text(flag, style: TextStyle(fontSize: 20))));
}

class MatchsPage extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(title: Text("ANALYSTA V25"), backgroundColor: Color(0xFF1E1E1E)),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Color(0xFF1DBE60), borderRadius: BorderRadius.circular(10)), child: Text("V25 VRAIS DRAPEAUX OFFLINE 🇨🇮🇸🇴", style: TextStyle(fontWeight: FontWeight.bold))),
          SizedBox(height: 10),
          Container(color: Color(0xFF1E1E1E), padding: EdgeInsets.all(10), child: Text("FAVORIS", style: TextStyle(fontWeight: FontWeight.bold))),
          Container(padding: EdgeInsets.all(12), color: Color(0xFF2A2A2A), child: Row(children: [Expanded(child: Text("Somalie", textAlign: TextAlign.right)), SizedBox(width: 8), logo("Somalie"), SizedBox(width: 10), Text("0-2", style: TextStyle(fontWeight: FontWeight.bold)), SizedBox(width: 10), logo("Côte d'Ivoire"), SizedBox(width: 8), Expanded(child: Text("Côte d'Ivoire"))])),
          SizedBox(height: 10),
          Container(color: Color(0xFF1E1E1E), padding: EdgeInsets.all(10), child: Text("LONACI LIGUE 1 🇨🇮", style: TextStyle(fontWeight: FontWeight.bold))),
          Container(padding: EdgeInsets.all(12), color: Color(0xFF2A2A2A), child: Row(children: [Expanded(child: Text("ASEC Mimosas", textAlign: TextAlign.right)), SizedBox(width: 8), logo("ASEC Mimosas"), SizedBox(width: 10), Text("15:30"), SizedBox(width: 10), logo("Africa Sport"), SizedBox(width: 8), Expanded(child: Text("Africa Sport"))])),
          Container(padding: EdgeInsets.all(12), color: Color(0xFF2A2A2A), child: Row(children: [Expanded(child: Text("Stella Club", textAlign: TextAlign
