
import 'package:flutter/material.dart';

void main() {
  runApp(AnalystaApp());
}

class AnalystaApp extends StatefulWidget {
  @override
  State<AnalystaApp> createState() => _AnalystaAppState();
}

class _AnalystaAppState extends State<AnalystaApp> {
  bool isDark = false;
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark
         ? ThemeData.dark().copyWith(scaffoldBackgroundColor: Color(0xFF0F0F0F), cardColor: Color(0xFF1E1E1E))
          : ThemeData.light().copyWith(scaffoldBackgroundColor: Color(0xFFF0F2F5)),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: isDark? Color(0xFF1E1E1E) : Colors.white,
          title: Row(children: [
            Container(padding: EdgeInsets.all(6), decoration: BoxDecoration(color: Color(0xFF00A651), borderRadius: BorderRadius.circular(8)), child: Text("A", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
            SizedBox(width: 8),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("ANALYSTA", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: isDark? Colors.white : Colors.black)),
              Text("100% autonome • Mondial", style: TextStyle(fontSize: 10, color: Colors.grey)),
            ])
          ]),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 12),
              decoration: BoxDecoration(color: isDark? Colors.black : Color(0xFFF0F2F5), borderRadius: BorderRadius.circular(20)),
              child: Row(children: [
                GestureDetector(
                  onTap: () => setState(() => isDark = false),
                  child: Container(padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color:!isDark? Colors.white : Colors.transparent, borderRadius: BorderRadius.circular(20)), child: Row(children: [Text("☀️", style: TextStyle(fontSize: 12)), SizedBox(width: 3), Text("BLANC", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color:!isDark? Colors.black : Colors.grey))])),
                ),
                GestureDetector(
                  onTap: () => setState(() => isDark = true),
                  child: Container(padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: isDark? Colors.white : Colors.transparent, borderRadius: BorderRadius.circular(20)), child: Row(children: [Text("🌙", style: TextStyle(fontSize: 12)), SizedBox(width: 3), Text("NOIR", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: isDark? Colors.black : Colors.grey))])),
                ),
              ]),
            ),
          ],
        ),
        body: [HomePage(isDark: isDark), Center(child: Text("🔴 En Direct\n3 matchs", textAlign: TextAlign.center, style: TextStyle(fontSize: 18))), Center(child: Text("📊 Analyse Mondiale\n84% précision", textAlign: TextAlign.center)), Center(child: Text("🌍 Stats Mondial\n6 Ligues", textAlign: TextAlign.center))][tabIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: tabIndex,
          onTap: (i) => setState(() => tabIndex = i),
          type: BottomNavigationBarType.fixed,
          backgroundColor: isDark? Color(0xFF1E1E1E) : Colors.white,
          selectedItemColor: Color(0xFF00A651),
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
            BottomNavigationBarItem(icon: Icon(Icons.live_tv), label: "En Direct"),
            BottomNavigationBarItem(icon: Icon(Icons.analytics), label: "Analyse"),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Stats"),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final bool isDark;
  HomePage({required this.isDark});

  Widget logo(String ab, Color a, Color b) {
    return Container(width: 44, height: 44, decoration: BoxDecoration(gradient: LinearGradient(colors: [a, b]), shape: BoxShape.circle), child: Center(child: Text(ab, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(10), children: [
      SingleChildScrollView(scrollDirection: Axis.horizontal, child: Row(children: [
        Container(padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8), decoration: BoxDecoration(color: Color(0xFF00A651), borderRadius: BorderRadius.circular(20)), child: Text("⚽ Football • Tous", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))),
        SizedBox(width: 8),
        Container(padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8), decoration: BoxDecoration(color: isDark? Color(0xFF2A2A2A) : Colors.white, borderRadius: BorderRadius.circular(20)), child: Text("🏆 LDC", style: TextStyle(fontSize: 12))),
        SizedBox(width: 8),
        Container(padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8), decoration: BoxDecoration(color: isDark? Color(0xFF2A2A2A) : Colors.white, borderRadius: BorderRadius.circular(20)), child: Text("🇨🇮 LONACI", style: TextStyle(fontSize: 12))),
      ])),
      SizedBox(height: 12),
      matchCard(context, "LIGUE DES CHAMPIONS", "20:00 Aujourd'hui", "Real Madrid", "RMA", Colors.white, Color(0xFF1A237E), "Man City", "MCI", Color(0xFF6CABDD), Color(0xFF1C2C5B), "45%", "20%", "35%", "Vini Jr • 84%", "2.10", "3.40", "3.20", "5,250 FCFA"),
      matchCard(context, "PREMIER LEAGUE", "18:30 Aujourd'hui", "PSG", "PSG", Color(0xFF004170), Color(0xFFDA020E), "Arsenal", "ARS", Color(0xFFEF0107), Color(0xFF023474), "38%", "25%", "37%", "Haaland • 79%", "2.45", "3.20", "2.85", "4,800 FCFA"),
      matchCard(context, "LONACI LIGUE 1", "15:30 Aujourd'hui", "ASEC", "ASEC", Color(0xFFFFD700), Colors.black, "Africa", "AFR", Color(0xFF00A651), Color(0xFFEF0107), "52%", "28%", "20%", "K. Koné • 82%", "1.85", "3.10", "4.20", "3,500 FCFA"),
      matchCard(context, "MATCH PASSÉ - Hier", "Terminé", "Bayern", "BAY", Color(0xFFDC052D), Colors.white, "Dortmund", "BVB", Color(0xFFFDE100), Colors.black, "2", "-", "1", "Kane 89' • 2-1", "1.90", "3.50", "3.80", "6,100 FCFA"),
      matchCard(context, "À VENIR - Demain", "16:00 Demain", "Barça", "BAR", Color(0xFFA50044), Color(0xFF004D98), "Atletico", "ATM", Color(0xFFCB3524), Colors.white, "48%", "22%", "30%", "Lewan • 81%", "2.05", "3.30", "3.40", "4,200 FCFA"),
    ]);
  }

  Widget matchCard(BuildContext ctx, String ligue, String heure, String n1, String ab1, Color c1a, Color c1b, String n2, String ab2, Color c2a, Color c2b, String p1, String pn, String p2, String buteur, String cote1, String coteN, String cote2, String fcfa) {
    return GestureDetector(
      onTap: () => Navigator.push(ctx, MaterialPageRoute(builder: (_) => DetailPage(ligue: ligue, d1: n1, d2: n2, ab1: ab1, ab2: ab2, c1a: c1a, c1b: c1b, c2a: c2a, c2b: c2b, isDark: isDark))),
      child: Container(margin: EdgeInsets.only(bottom: 14), decoration: BoxDecoration(color: isDark? Color(0xFF1E1E1E) : Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)]), child: Column(children: [
        Padding(padding: EdgeInsets.all(12), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Container(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: Color(0xFF00A651).withOpacity(0.1), borderRadius: BorderRadius.circular(6)), child: Text(ligue, style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Color(0xFF00A651)))), Text(heure, style: TextStyle(fontSize: 11, color: Colors.grey))])),
        Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Row(children: [
          Expanded(child: Column(children: [logo(ab1, c1a, c1b), SizedBox(height: 6), Text(n1, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)), Text(p1, style: TextStyle(color: Color(0xFF00A651), fontWeight: FontWeight.bold))])),
          Column(children: [Text("VS", style: TextStyle(color: Colors.grey, fontSize: 12)), Container(margin: EdgeInsets.only(top: 4), padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2), decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(10)), child: Text("N $pn", style: TextStyle(fontSize: 10)))]),
          Expanded(child: Column(children: [logo(ab2, c2a, c2b), SizedBox(height: 6), Text(n2, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)), Text(p2, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))])),
        ])),
        SizedBox(height: 8),
        Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Buteur probable", style: TextStyle(fontSize: 11, color: Colors.grey)), Text(buteur, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold))])),
        Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: ClipRRect(borderRadius: BorderRadius.circular(10), child: LinearProgressIndicator(value: 0.45, color: Color(0xFF00A651), backgroundColor: Colors.grey.withOpacity(0.2), minHeight: 5))),
        Padding(padding: EdgeInsets.all(12), child: Row(children: [
          Expanded(child: Container(padding: EdgeInsets.symmetric(vertical: 7), decoration: BoxDecoration(color: isDark? Color(0xFF2A2A2A) : Color(0xFFF0F2F5), borderRadius: BorderRadius.circular(8)), child: Column(children: [Text("1", style: TextStyle(fontSize: 10, color: Colors.grey)), Text(cote1, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))]))),
          SizedBox(width: 6),
          Expanded(child: Container(padding: EdgeInsets.symmetric(vertical: 7), decoration: BoxDecoration(color: isDark? Color(0xFF2A2A2A) : Color(0xFFF0F2F5), borderRadius: BorderRadius.circular(8)), child: Column(children: [Text("N", style: TextStyle(fontSize: 10, color: Colors.grey)), Text(coteN, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))]))),
          SizedBox(width: 6),
          Expanded(child: Container(padding: EdgeInsets.symmetric(vertical: 7), decoration: BoxDecoration(color: isDark? Color(0xFF2A2A2A) : Color(0xFFF0F2F5), borderRadius: BorderRadius.circular(8)), child: Column(children: [Text("2", style: TextStyle(fontSize: 10, color: Colors.grey)), Text(cote2, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))]))),
          SizedBox(width: 6),
          Expanded(flex: 2, child: Container(padding: EdgeInsets.symmetric(vertical: 9), decoration: BoxDecoration(color: Color(0xFF00A651), borderRadius: BorderRadius.circular(8)), child: Text(fcfa, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11)))),
        ])),
      ])),
    );
  }
}

class DetailPage extends StatefulWidget {
  final String ligue, d1, d2, ab1, ab2;
  final Color c1a, c1b, c2a, c2b;
  final bool isDark;
  DetailPage({required this.ligue, required this.d1, required this.d2, required this.ab1, required this.ab2, required this.c1a, required this.c1b, required this.c2a, required this.c2b, required this.isDark});
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with SingleTickerProviderStateMixin {
  late TabController _tab;
  @override
  void initState() { super.initState(); _tab = TabController(length: 5, vsync: this); }
  Widget bigLogo(String ab, Color a, Color b) => Container(width: 56, height: 56, decoration: BoxDecoration(gradient: LinearGradient(colors: [a, b]), shape: BoxShape.circle), child: Center(child: Text(ab, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDark? Color(0xFF0F0F0F) : Color(0xFFF0F2F5),
      appBar: AppBar(backgroundColor: widget.isDark? Color(0xFF1E1E1E) : Colors.white, title: Text("${widget.d1} vs ${widget.d2}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: widget.isDark? Colors.white : Colors.black)), bottom: TabBar(controller: _tab, isScrollable: true, labelColor: Color(0xFF00A651), tabs: [Tab(text: "RÉSUMÉ"), Tab(text: "STATS"), Tab(text: "COMPO"), Tab(text: "TERRAIN"), Tab(text: "COTES")])),
      body: TabBarView(controller: _tab, children: [
        ListView(padding: EdgeInsets.all(12), children: [
          Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: widget.isDark? Color(0xFF1E1E1E) : Colors.white, borderRadius: BorderRadius.circular(14)), child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [Column(children: [bigLogo(widget.ab1, widget.c1a, widget.c1b), Text(widget.d1, style: TextStyle(fontWeight: FontWeight.bold))]), Column(children: [Text("20:00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), Container(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(12)), child: Text("45%-20%-35%", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)))]), Column(children: [bigLogo(widget.ab2, widget.c2a, widget.c2b), Text(widget.d2, style: TextStyle(fontWeight: FontWeight.bold))])])),
          SizedBox(height: 12),
          box("ANALYSE AUTONOME", ["Contrôle ferme 55%", "Pression haute", "Fermeté 25%", "Buteur Vini Jr 84%", "Score 2-1", "1,247 matchs analysés"]),
          box("MATCHS PASSÉS", ["Real 2-1 City (12-03-24)", "City 3-2 Real (08-11-23)", "Total 8V-4N-6V"]),
          box("MATCHS À VENIR", ["vs Barça 20-10", "vs Arsenal 23-10"]),
        ]),
        box("STATS", ["Possession 55%-45%", "Tirs 14-9", "Corners 7-3", "xG 1.85-1.12"]),
        box("COMPO AVEC PHOTOS", ["Real: 👤 Courtois - Carvajal, Rüdiger, Alaba, Mendy - Valverde, Tchouaméni, Bellingham - Rodrygo, Vini Jr, Mbappé", "City: 👤 Ederson - Walker, Dias, Gvardiol, Ake - Rodri, De Bruyne - Foden, Alvarez, Grealish - Haaland"]),
        Container(margin: EdgeInsets.all(12), height: 500, decoration: BoxDecoration(color: Color(0xFF2E7D32), borderRadius: BorderRadius.circular(12)), child: Center(child: Text("TERRAIN\n\n Mbappé\n Vini Jr Rodrygo\nValverde Bellingham Tchoua\nMendy Alaba Rüdiger Carvajal\n Courtois\n\n---\n\n Haaland\nGrealish Alvarez Foden\n De Bruyne Rodri", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))),
        box("COTES", ["1: 2.10 N:3.40 2:3.20", "5,250 FCFA", "BTTS Oui 1.65", "Over 2.5 1.80"]),
      ]),
    );
  }
  Widget box(String t, List<String> l) => Container(margin: EdgeInsets.only(bottom: 12), padding: EdgeInsets.all(14), decoration: BoxDecoration(color: widget.isDark? Color(0xFF1E1E1E) : Colors.white, borderRadius: BorderRadius.circular(12)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(t, style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF00A651))), Divider(),...l.map((e) => Text("• $e", style: TextStyle(fontSize: 12)))]));
}
