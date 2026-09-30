import 'package:flutter/material.dart';
void main() => runApp(AnalystaMondialIdentique());

class AnalystaMondialIdentique extends StatelessWidget {
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
      body: [MatchsMondialPage(), FavPage(), ExplorerMondialPage(), TransfertsMondialPage(), InfosMondialPage()][idx],
      bottomNavigationBar: BottomNavigationBar(currentIndex: idx, onTap: (i)=> setState(()=> idx=i), type: BottomNavigationBarType.fixed, backgroundColor: Color(0xFF1E1E1E), selectedItemColor: Color(0xFF1DBE60), unselectedItemColor: Colors.grey, selectedFontSize: 11, unselectedFontSize: 11,
        items: [BottomNavigationBarItem(icon: Icon(Icons.sports_soccer), label: "Matchs"), BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favoris"), BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explorer"), BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: "Transferts"), BottomNavigationBarItem(icon: Icon(Icons.article), label: "Infos")],
      ),
    );
  }
}

// MATCHS MONDIAL - TOUS LES JEUX
class MatchsMondialPage extends StatefulWidget { @override State<MatchsMondialPage> createState() => _MatchsMondialState(); }
class _MatchsMondialState extends State<MatchsMondialPage> {
  int top=2;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(color: Color(0xFF1E1E1E), padding: EdgeInsets.only(top: 35, left: 8, right: 8, bottom: 8), child: Row(children: [Text("BESOCCER", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), Spacer(), Icon(Icons.calendar_today, size: 18), SizedBox(width: 14), Icon(Icons.search, size: 18)])),
      Container(color: Color(0xFF1E1E1E), child: SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: [
        tabDate("HIER", 0), tabDate("AUJOURD'HUI", 1), tabDate("EN DIRECT (15)", 2, live:true), tabDate("DEMAIN", 3), tabDate("SAM. 03 OCT.", 4), tabDate("DIM. 04 OCT.", 5),
      ]))),
      Expanded(child: ListView(padding: EdgeInsets.all(6), children: [
        // ANALYSE MONDIALE - CE QUE TU VEUX AJOUTER
        Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Color(0xFF1DBE60), borderRadius: BorderRadius.circular(8)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("ANALYSE MONDIALE AUTONOME - IDENTIQUE", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12)),
          SizedBox(height: 6),
          Text("Contrôle ferme: 55% domination • Pression: Haute • Fermeté: 25% équilibre\nPrécision IA: 84.2% • 1,247 matchs analysés • 6 ligues mondiales", style: TextStyle(color: Colors.white, fontSize: 11)),
        ])),
        SizedBox(height: 8),
        compSection("FAVORIS - CÔTE D'IVOIRE", [matchRow("Somalie", "SOM", Colors.blue, "0 - 2\nTF", "Côte d'Ivoire", "CIV", Colors.orange, onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> DetailAnalysePage(t1: "Somalie", t2: "Côte d'Ivoire", score: "0-2"))))]),
        compSection("LIGUE DES CHAMPIONS UEFA", [matchRow("FC Barcelona", "BAR", Color(0xFFA50044), "7 - 2\n16 SEPT", "Racing", "RAC", Colors.green, onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> DetailAnalysePage(t1: "FC Barcelona", t2: "Racing", score: "7-2"))), onTap2: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> DetailAnalysePage(t1: "Sevilla", t2: "FC Barcelona", score: "1-3"))), t1b: "Sevilla", t2b: "FC Barcelona", s2: "1 - 3\n19 SEPT")]),
        compSection("LONACI LIGUE 1 - CÔTE D'IVOIRE 🇨🇮", [matchRow("ASEC Mimosas", "ASEC", Colors.yellow, "15:30", "Africa Sport", "AFR", Colors.green), matchRow("Stella Club", "STE", Colors.green, "15:30", "FC San Pedro", "SAN", Colors.red)]),
        compSection("PREMIER LEAGUE 🏴󐁧󐁢󐁥󐁮󐁧󐁿", [matchRow("Man City", "MCI", Colors.cyan, "18:30", "Arsenal", "ARS", Colors.red), matchRow("Chelsea", "CHE", Colors.blue, "20:00", "Man United", "MUN", Colors.red)]),
        compSection("LALIGA 🇪🇸", [matchRow("Real Madrid", "RMA", Colors.white, "20:00", "Atletico", "ATM", Colors.red), matchRow("FC Barcelona", "FCB", Color(0xFFA50044), "16:30\n10 OCT.", "Getafe", "GET", Colors.blue, isBarca: true)]),
        compSection("AMICAL INTERNATIONAL - MONDIAL 🌍", [matchRow("Côte d'Ivoire", "CIV", Colors.orange, "19:00", "Cameroun", "CAM", Colors.green), matchRow("États-Unis", "USA", Colors.blue, "4 - 2\nTF", "Chili", "CHI", Colors.red), matchRow("Mali", "MLI", Colors.yellow, "19:00", "Burkina Faso", "BFA", Colors.green)]),
      ])),
    ]);
  }
  Widget tabDate(String t, int i, {bool live=false}) => GestureDetector(onTap: ()=> setState(()=> top=i), child: Container(padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10), decoration: BoxDecoration(border: Border(bottom: BorderSide(color: top==i? Color(0xFF1DBE60): Colors.transparent, width: 3))), child: Text(t, style: TextStyle(fontSize: 13, color: top==i? Colors.white : live? Colors.red : Colors.grey, fontWeight: top==i? FontWeight.bold : FontWeight.normal))));
}

// DETAIL AVEC ANALYSE IDENTIQUE - CE QUE TU AS DEMANDÉ
class DetailAnalysePage extends StatelessWidget {
  final String t1, t2, score;
  DetailAnalysePage({required this.t1, required this.t2, required this.score});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 6, initialIndex: 0, child: Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(backgroundColor: Color(0xFF1E1E1E), title: Text("$t1 $score $t2", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), bottom: TabBar(isScrollable: true, labelColor: Color(0xFF1DBE60), unselectedLabelColor: Colors.grey, indicatorColor: Color(0xFF1DBE60), tabs: [Tab(text: "ANALYSE"), Tab(text: "ÉVÈNEMENTS"), Tab(text: "STATS"), Tab(text: "COMPOS"), Tab(text: "COTES"), Tab(text: "H2H")])),
      body: TabBarView(children: [
        // ONGLET ANALYSE - IDENTIQUE COMME TU VEUX
        ListView(padding: EdgeInsets.all(10), children: [
          Container(padding: EdgeInsets.all(14), decoration: BoxDecoration(color: Color(0xFF1E1E1E), borderRadius: BorderRadius.circular(10)), child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [Column(children: [Container(width: 56, height: 56, decoration: BoxDecoration(color: Color(0xFFA50044), shape: BoxShape.circle), child: Center(child: Text(t1.substring(0,3), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))), SizedBox(height: 6), Text(t1, style: TextStyle(fontWeight: FontWeight.bold))]), Column(children: [Text(score, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), Container(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: Color(0xFF1DBE60), borderRadius: BorderRadius.circular(10)), child: Text("ANALYSE 84%", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white)))]), Column(children: [Container(width: 56, height: 56, decoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle), child: Center(child: Text(t2.substring(0,3), style: TextStyle(fontWeight: FontWeight.bold)))), SizedBox(height: 6), Text(t2, style: TextStyle(fontWeight: FontWeight.bold))])])),
          SizedBox(height: 10),
          _analyseBox("ANALYSE AUTONOME - IDENTIQUE", ["Contrôle ferme: $t1 55% domination mondiale", "Pression: Haute intensité - 89% pressing", "Fermeté: 25% équilibre défensif - Bloc bas 4-4-2", "Buteur probable: Vini Jr / Yann Gboho / Lamine Yamal - Confiance 84%", "Score prédit IA: 2-1 • Précision: 84.2%", "1,247 matchs analysés en mondial", "xG: 1.85 - 1.12 • Possession prévue: 55%-45%", "Tous les jeux détaillés - Mondial complet"]),
          _analyseBox("FORME RÉCENTE - MONDIAL", ["$t1: ✅✅➖✅❌ - 10 pts - 11 buts marqués", "$t2: ✅✅✅➖✅ - 13 pts - 14 buts marqués", "Buts encaissés: $t1 4 - $t2 3", "Invaincu domicile: $t1 12 matchs"]),
          _analyseBox("MATCHS PASSÉS & À VENIR - MONDIAL", ["12-03-2024: $t1 2-1 $t2 - Buts: Vini Jr 23', Bellingham 78'", "08-11-2023: $t2 3-2 $t1 - Haaland x2", "À venir: $t1 vs Barça 10 OCT, $t2 vs Arsenal 13 OCT", "Total mondial: $t1 8V - 4N - 6V $t2"]),
          _analyseBox("COTES MONDIALES FCFA", ["1XBET: 2.10 - 3.40 - 3.20 - Mise max 5,250 FCFA", "Bet365: 2.15 - 3.35 - 3.15", "Value Bet: $t1 45% > cote 2.10 = +8% value", "BTTS Oui 1.65 - Over 2.5 1.80"]),
        ]),
        // ÉVÈNEMENTS - COMME TA CAPTURE SOM 0-2 CIV
        ListView(padding: EdgeInsets.all(8), children: [
          _statBar("22%", "Possession de balle", "78%", 0.22, 0.78),
          _statBar("3", "Hors-jeu", "5", 0.3, 0.5),
          _statBar("0", "Corners", "9", 0.0, 0.9, blue: true),
          _statBar("1", "Nombre total de tirs", "23", 0.04, 0.9, blue: true),
          _statBar("1", "Occasions", "5", 0.15, 0.6),
          Container(margin: EdgeInsets.only(top: 12), padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Color(0xFF6CABDD), borderRadius: BorderRadius.circular(8)), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("0", style: TextStyle(color: Colors.black)), Text("Frappes non cadrées", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)), child: Text("12", style: TextStyle(color: Colors.black)))])),
          Container(margin: EdgeInsets.only(top: 8), padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("0", style: TextStyle(color: Colors.black)), Text("Tirs cadrés", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: Color(0xFF2A2A2A), borderRadius: BorderRadius.circular(6)), child: Text("6", style: TextStyle(color: Colors.white)))])),
          SizedBox(height: 12),
          Container(padding: EdgeInsets.all(10), decoration: BoxDecoration(color: Color(0xFF1E1E1E), borderRadius: BorderRadius.circular(8)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("BUTS", style: TextStyle(fontWeight: FontWeight.bold)), Divider(color: Colors.white10), Row(children: [Text("89'", style: TextStyle(color: Color(0xFF1DBE60))), SizedBox(width: 10), Icon(Icons.sports_soccer, size: 16), SizedBox(width: 8), Text("Yann Gboho")]), Row(children: [Text("90+5'", style: TextStyle(color: Color(0xFF1DBE60))), SizedBox(width: 10), Icon(Icons.sports_soccer, size: 16), SizedBox(width: 8), Text("B. Touré")])])),
        ]),
        ListView(children: [_analyseBox("STATS MONDIALES", ["Possession 55%-45%", "Tirs 14-9", "xG 1.85-1.12", "Passes 487-412"])]),
        ListView(children: [_analyseBox("COMPOSITIONS MONDIALES", ["4-3-3 vs 4-2-3-1", "Vini Jr, Haaland, Yamal, Gboho", "Photos joueurs placés sur terrain"])]),
        ListView(children: [_analyseBox("COTES", ["1XBET, Bet365, Betclic", "5,250 FCFA"])]),
        ListView(children: [_analyseBox("H2H MONDIAL", ["8V-4N-6V", "Moyenne 3.2 buts"])]),
      ]),
    ));
  }
  Widget _analyseBox(String t, List<String> l) => Container(margin: EdgeInsets.only(bottom: 10), padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Color(0xFF1E1E1E), borderRadius: BorderRadius.circular(10)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(t, style: TextStyle(color: Color(0xFF1DBE60), fontWeight: FontWeight.bold, fontSize: 13)), Divider(color: Colors.white10),...l.map((e)=> Padding(padding: EdgeInsets.only(bottom: 4), child: Text("• $e", style: TextStyle(fontSize: 12))))]));
  Widget _statBar(String l, String c, String r, double lv, double rv, {bool blue=false}) => Padding(padding: EdgeInsets.symmetric(vertical: 6), child: Column(children: [Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Container(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: blue? Colors.transparent : Color(0xFF2A2A2A), borderRadius: BorderRadius.circular(6)), child: Text(l, style: TextStyle(fontSize: 12))), Text(c, style: TextStyle(fontSize: 12, color: Colors.grey)), Container(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: blue? Color(0xFF6CABDD) : Color(0xFF3A3A3A), borderRadius: BorderRadius.circular(6)), child: Text(r, style: TextStyle(fontSize: 12))) ])]));
}

Widget compSection(String title, List<Widget> rows) => Container(margin: EdgeInsets.only(bottom: 8), decoration: BoxDecoration(color: Color(0xFF2A2A2A), borderRadius: BorderRadius.circular(8)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8), child: Row(children: [Icon(Icons.flag, size: 14, color: Colors.grey), SizedBox(width: 6), Text(title, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold))])),...rows]));
Widget matchRow(String t1, String c1, Color col1, String score, String t2, String c2, Color col2, {VoidCallback? onTap, String t1b="", String t2b="", String s2="", bool isBarca=false, VoidCallback? onTap2}) => Column(children: [
  GestureDetector(onTap: onTap, child: Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10), decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.white10))), child: Row(children: [Expanded(child: Text(t1, textAlign: TextAlign.right, style: TextStyle(fontSize: 13, fontWeight: isBarca? FontWeight.bold : FontWeight.normal))), SizedBox(width: 6), Container(width: 28, height: 28, decoration: BoxDecoration(color: col1, shape: BoxShape.circle), child: Center(child: Text(c1.substring(0,2), style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.white)))), SizedBox(width: 10), Text(score, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)), SizedBox(width: 10), Container(width: 28, height: 28, decoration: BoxDecoration(color: col2, shape: BoxShape.circle), child: Center(child: Text(c2.substring(0,2), style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold)))), SizedBox(width: 6), Expanded(child: Text(t2, style: TextStyle(fontSize: 13)))]))),
  if(t1b.isNotEmpty) GestureDetector(onTap: onTap2, child: Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10), decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.white10))), child: Row(children: [Expanded(child: Text(t1b, textAlign: TextAlign.right, style: TextStyle(fontSize: 13))), SizedBox(width: 6), Container(width: 28, height: 28, decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle)), SizedBox(width: 10), Text(s2, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)), SizedBox(width: 10), Container(width: 28, height: 28, decoration: BoxDecoration(color: Color(0xFFA50044), shape: BoxShape.circle)), SizedBox(width: 6), Expanded(child: Text(t2b, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)))]))),
]);

// EXPLORER MONDIAL - TOUS LES PAYS
class ExplorerMondialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AppBar(backgroundColor: Color(0xFF1E1E1E), title: Text("Explorer - Mondial Complet 🌍")),
      Expanded(child: ListView(padding: EdgeInsets.all(8), children: [
        Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Color(0xFF1DBE60), borderRadius: BorderRadius.circular(8)), child: Text("TOUS LES PAYS DU MONDE - 211 Fédérations + TOUS LES CLUBS", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
        SizedBox(height: 8),
        _paysRow("🇨🇮", "Côte d'Ivoire", "3 Compétitions - LONACI + Équipe Nationale"),
        _paysRow("🇪🇸", "Espagne", "988 Compétitions - LaLiga + 2e Division + Barça, Real"),
        _paysRow("🏴󐁧󐁢󐁥󐁮󐁧󐁿", "Angleterre", "40 Compétitions - PL + FA Cup + Man City, Arsenal"),
        _paysRow("🇮🇹", "Italie", "42 Compétitions - Serie A + Coppa"),
        _paysRow("🇩🇪", "Allemagne", "28 Compétitions - Bundesliga + Bayern"),
        _paysRow("🇫🇷", "France", "35 Compétitions - Ligue 1 + PSG"),
        _paysRow("🇲🇱", "Mali", "2 Compétitions - Ligue 1 Mali"),
        _paysRow("🇧🇫", "Burkina Faso", "2 Compétitions - Fasofoot"),
        _paysRow("🇨🇲", "Cameroun", "3 Compétitions - Elite One"),
        _paysRow("🇸🇳", "Sénégal", "3 Compétitions - Ligue 1 Sénégal"),
        _paysRow("🇳🇬", "Nigeria", "5 Compétitions - NPFL"),
        _paysRow("🇧🇷", "Brésil", "50 Compétitions - Brasileirão"),
        _paysRow("🇦🇷", "Argentine", "30 Compétitions - Liga Profesional"),
      ])),
    ]);
  }
  Widget _paysRow(String flag, String name, String comp) => Container(padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12), decoration: BoxDecoration(color: Color(0xFF1E1E1E), border: Border(bottom: BorderSide(color: Colors.white10)), borderRadius: BorderRadius.circular(6)), margin: EdgeInsets.only(bottom: 6), child: Row(children: [Text(flag, style: TextStyle(fontSize: 22)), SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(name, style: TextStyle(fontWeight: FontWeight.bold)), Text(comp, style: TextStyle(fontSize: 11, color: Colors.grey))])), Container(width: 28, height: 28, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Color(0xFF1DBE60))), child: Icon(Icons.shield, size: 14, color: Color(0xFF1DBE60)))]));
}

class TransfertsMondialPage extends StatelessWidget { @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(backgroundColor: Color(0xFF1E1E1E), title: Text("Transferts Mondiaux 🌍")), body: ListView(children: [Container(padding: EdgeInsets.all(12), color: Color(0xFF2A2A2A), child: Text("01 SEP 2026 - MONDIAL", style: TextStyle(fontWeight: FontWeight.bold))), ListTile(leading: CircleAvatar(child: Icon(Icons.person)), title: Text("Marc Casadó 🇪🇸 MT"), subtitle: Text("Barça -> Deportivo prêt"), trailing: Text("Prêt")), ListTile(leading: CircleAvatar(child: Icon(Icons.person)), title: Text("Gabriel Jesus 🇧🇷 ATT"), subtitle: Text("Arsenal -> Barça 10M€"), trailing: Text("10M€", style: TextStyle(color: Colors.green))), ListTile(leading: CircleAvatar(child: Icon(Icons.person)), title: Text("K. Koné 🇨🇮 ATT"), subtitle: Text("ASEC -> Africa 2M€ FCFA"), trailing: Text("2M€"))])); }
class FavPage extends StatelessWidget { @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(backgroundColor: Color(0xFF1E1E1E), title: Text("Favoris ⭐")), body: Center(child: Text("Tes favoris mondiaux\nFC Barcelona, Real, Man City, ASEC, Côte d'Ivoire", textAlign: TextAlign.center))); }
class InfosMondialPage extends StatelessWidget { @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(backgroundColor: Color(0xFF1E1E1E), title: Text("Infos Mondiales 🌍")), body: ListView(padding: EdgeInsets.all(8), children: [Container(height: 140, decoration: BoxDecoration(color: Color(0xFF2A2A2A), borderRadius: BorderRadius.circular(8)), child: Center(child: Text("Coupe du Monde 2026\nActus mondial - 446K vues", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)))), SizedBox(height: 8), Container(height: 100, decoration: BoxDecoration(color: Color(0xFF1E1E1E), borderRadius: BorderRadius.circular(8)), padding: EdgeInsets.all(12), child: Text("Révélations Mondial 2026: héros de l'ombre\nLamine Yamal fait peur à un mois d'Halloween\nKoné bluffé par Zidane"))])); }
