import 'package:flutter/material.dart';
void main() => runApp(AnalystaV16LogosReels());

class AnalystaV16LogosReels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Color(0xFF121212)), home: MainPage());
  }
}

class MainPage extends StatefulWidget { @override State<MainPage> createState() => _MainState(); }
class _MainState extends State<MainPage> {
  int idx=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [MatchsPage(), FavPage(), ExplorerPage(), TransfertsPage(), InfosPage()][idx],
      bottomNavigationBar: BottomNavigationBar(currentIndex: idx, onTap: (i)=> setState(()=> idx=i), type: BottomNavigationBarType.fixed, backgroundColor: Color(0xFF1E1E1E), selectedItemColor: Color(0xFF1DBE60), unselectedItemColor: Colors.grey, selectedFontSize: 11, unselectedFontSize: 11,
        items: [BottomNavigationBarItem(icon: Icon(Icons.sports_soccer), label: "Matchs"), BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favoris"), BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explorer"), BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: "Transferts"), BottomNavigationBarItem(icon: Icon(Icons.article), label: "Infos")],
      ),
    );
  }
}

// FONCTION LOGO RÉEL AVEC IMAGE DU NET
Widget logoReel(String team) {
  Map<String, String> logos = {
    "Somalie": "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Flag_of_Somalia.svg/120px-Flag_of_Somalia.svg.png",
    "Côte d'Ivoire": "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Flag_of_C%C3%B4te_d%27Ivoire.svg/120px-Flag_of_C%C3%B4te_d%27Ivoire.svg.png",
    "FC Barcelona": "https://upload.wikimedia.org/wikipedia/en/4/47/FC_Barcelona_%28crest%29.svg.png",
    "Racing": "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Racing_Club_de_Avellaneda_logo.svg/120px-Racing_Club_de_Avellaneda_logo.svg.png",
    "Sevilla": "https://upload.wikimedia.org/wikipedia/en/3/3b/Sevilla_cf.svg.png",
    "ASEC Mimosas": "https://upload.wikimedia.org/wikipedia/en/9/90/ASEC_Mimosas_logo.png",
    "Africa Sport": "https://upload.wikimedia.org/wikipedia/fr/6/6e/Logo_Africa_Sports.png",
    "Stella Club": "https://upload.wikimedia.org/wikipedia/fr/5/5c/Logo_Stella_Club_d%27Adjame.png",
    "FC San Pedro": "https://upload.wikimedia.org/wikipedia/fr/0/0e/FC_San-Pedro_logo.png",
    "Man City": "https://upload.wikimedia.org/wikipedia/en/e/eb/Manchester_City_FC_badge.svg.png",
    "Arsenal": "https://upload.wikimedia.org/wikipedia/en/5/53/Arsenal_FC.svg.png",
    "Chelsea": "https://upload.wikimedia.org/wikipedia/en/c/cc/Chelsea_FC.svg.png",
    "Man United": "https://upload.wikimedia.org/wikipedia/en/7/7a/Manchester_United_FC_crest.svg.png",
  };
  String url = logos[team]?? "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/120px-No_image_available.svg.png";
  return Container(width: 32, height: 32, decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle), child: ClipOval(child: Image.network(url, fit: BoxFit.cover, errorBuilder: (c,e,s)=> Center(child: Text(team.substring(0,2), style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black))))));
}

class MatchsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(color: Color(0xFF1E1E1E), padding: EdgeInsets.only(top: 35, left: 12, right: 12, bottom: 8), child: Row(children: [Text("BESOCCER", style: TextStyle(fontWeight: FontWeight.bold)), Spacer(), Icon(Icons.calendar_today, size: 18), SizedBox(width: 14), Icon(Icons.search)])),
      Container(color: Color(0xFF1E1E1E), child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: [tab("HIER", false), tab("AUJOURD'HUI", false), tab("EN DIRECT (15)", true), tab("DEMAIN", false), tab("SAM. 03 OCT.", false)]))),
      Expanded(child: ListView(padding: EdgeInsets.all(6), children: [
        Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Color(0xFF1DBE60), borderRadius: BorderRadius.circular(8)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("ANALYSE MONDIALE AUTONOME - VRAIS LOGOS", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12)),
          SizedBox(height: 4),
          Text("Contrôle ferme 55% • Pression Haute • Fermeté 25% • IA 84.2% • 1,247 matchs", style: TextStyle(color: Colors.white, fontSize: 11)),
        ])),
        SizedBox(height: 8),
        section("FAVORIS - CÔTE D'IVOIRE", [rowMatch(context, "Somalie", "0 - 2\nTF", "Côte d'Ivoire")]),
        section("LIGUE DES CHAMPIONS UEFA", [rowMatch(context, "FC Barcelona", "7 - 2\n16 SEPT", "Racing"), rowMatch(context, "Sevilla", "1 - 3\n19 SEPT", "FC Barcelona")]),
        section("LONACI LIGUE 1 - CÔTE D'IVOIRE 🇨🇮", [rowMatch(context, "ASEC Mimosas", "15:30", "Africa Sport"), rowMatch(context, "Stella Club", "15:30", "FC San Pedro")]),
        section("PREMIER LEAGUE 🏴󐁧󐁢󐁥󐁮󐁧󐁿", [rowMatch(context, "Man City", "18:30", "Arsenal"), rowMatch(context, "Chelsea", "20:00", "Man United")]),
      ])),
    ]);
  }
  Widget tab(String t, bool active) => Container(padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10), decoration: BoxDecoration(border: Border(bottom: BorderSide(color: active? Color(0xFF1DBE60): Colors.transparent, width: 3))), child: Text(t, style: TextStyle(color: active? Colors.white : t.contains("DIRECT")? Colors.red : Colors.grey, fontWeight: active? FontWeight.bold : FontWeight.normal, fontSize: 13)));
}

Widget section(String title, List<Widget> rows) => Container(margin: EdgeInsets.only(bottom: 8), decoration: BoxDecoration(color: Color(0xFF2A2A2A), borderRadius: BorderRadius.circular(8)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Padding(padding: EdgeInsets.all(10), child: Row(children: [Icon(Icons.flag, size: 14, color: Colors.grey), SizedBox(width: 6), Text(title, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold))])),...rows]));
Widget rowMatch(BuildContext ctx, String t1, String score, String t2) => GestureDetector(onTap: ()=> Navigator.push(ctx, MaterialPageRoute(builder: (_)=> DetailPage(t1: t1, t2: t2, score: score))), child: Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10), decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.white10))), child: Row(children: [Expanded(child: Text(t1, textAlign: TextAlign.right, style: TextStyle(fontSize: 13))), SizedBox(width: 8), logoReel(t1), SizedBox(width: 10), Text(score, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)), SizedBox(width: 10), logoReel(t2), SizedBox(width: 8), Expanded(child: Text(t2, style: TextStyle(fontSize: 13)))])));

class DetailPage extends StatelessWidget {
  final String t1, t2, score;
  DetailPage({required this.t1, required this.t2, required this.score});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 6, child: Scaffold(backgroundColor: Color(0xFF121212), appBar: AppBar(backgroundColor: Color(0xFF1E1E1E), title: Text("$t1 vs $t2", style: TextStyle(fontSize: 14)), bottom: TabBar(isScrollable: true, labelColor: Color(0xFF1DBE60), unselectedLabelColor: Colors.grey, tabs: [Tab(text: "ANALYSE"), Tab(text: "STATS"), Tab(text: "COMPO"), Tab(text: "TERRAIN"), Tab(text: "H2H"), Tab(text: "COTES")])), body: TabBarView(children: [
      ListView(padding: EdgeInsets.all(10), children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [Column(children: [logoReel(t1), Text(t1, style: TextStyle(fontWeight: FontWeight.bold))]), Text(score, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)), Column(children: [logoReel(t2), Text(t2, style: TextStyle(fontWeight: FontWeight.bold))])]),
        SizedBox(height: 12),
        box("ANALYSE AUTONOME MONDIALE - VRAIS LOGOS", ["Contrôle ferme: $t1 55% domination", "Pression haute 89%", "Fermeté 25%", "Buteur: Lamine Yamal / Gboho 84%", "Score prédit 2-1", "1,247 matchs analysés", "VRAIS LOGOS DU SITE - Modification depuis départ"]),
      ]),
      ListView(children: [box("STATS", ["Possession 55%-45%", "Tirs 14-9"])]),
      ListView(children: [box("COMPO", ["$t1 4-3-3 - $t2 4-2-3-1"])]),
      Container(color: Color(0xFF2E7D32), child: Center(child: Text("TERRAIN\n\n $t1 - 4-3-3\n Yamal Gboho Koné\n Pedri Bellingham\n ASEC DEFENSE\n\n $t2 - 4-2-3-1", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
      ListView(children: [box("H2H", ["8V-4N-6V"])]),
      ListView(children: [box("COTES FCFA", ["2.10 - 3.40 - 3.20 - 5,250 FCFA"])]),
    ])));
  }
  Widget box(String t, List<String> l) => Container(margin: EdgeInsets.only(bottom: 10), padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Color(0xFF1E1E1E), borderRadius: BorderRadius.circular(10)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(t, style: TextStyle(color: Color(0xFF1DBE60), fontWeight: FontWeight.bold)), Divider(color: Colors.white10),...l.map((e)=> Text("• $e", style: TextStyle(fontSize: 12)))]));
}

class FavPage extends StatelessWidget { @override Widget build(BuildContext c) => Center(child: Text("Favoris")); }
class ExplorerPage extends StatelessWidget { @override Widget build(BuildContext c) => Center(child: Text("Explorer Mondial 211 pays")); }
class TransfertsPage extends StatelessWidget { @override Widget build(BuildContext c) => Center(child: Text("Transferts Mondial")); }
class InfosPage extends StatelessWidget { @override Widget build(BuildContext c) => Center(child: Text("Infos Mondial")); }
