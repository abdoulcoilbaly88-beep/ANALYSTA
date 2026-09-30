import 'package:flutter/material.dart';

void main() => runApp(AnalystaFlash());

class AnalystaFlash extends StatefulWidget {
  @override
  _AnalystaFlashState createState() => _AnalystaFlashState();
}

class _AnalystaFlashState extends State<AnalystaFlash> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? ThemeData.dark().copyWith(scaffoldBackgroundColor: Color(0xFF0F0F0F), cardColor: Color(0xFF1E1E1E)) : ThemeData.light().copyWith(scaffoldBackgroundColor: Color(0xFFF0F2F5)),
      home: FlashHome(isDark: isDark, onToggle: (v) => setState(()=> isDark = v)),
    );
  }
}

class FlashHome extends StatelessWidget {
  final bool isDark;
  final Function(bool) onToggle;
  FlashHome({required this.isDark, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark? Color(0xFF1E1E1E) : Colors.white,
        title: Row(children: [Container(padding: EdgeInsets.all(6), decoration: BoxDecoration(color: Color(0xFF00A651), borderRadius: BorderRadius.circular(8)), child: Text("A", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))), SizedBox(width: 8), Text("ANALYSTA", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: isDark? Colors.white : Colors.black))]),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 12),
            decoration: BoxDecoration(color: isDark? Colors.black : Color(0xFFF0F2F5), borderRadius: BorderRadius.circular(20)),
            child: Row(children: [
              GestureDetector(onTap: ()=> onToggle(false), child: Container(padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: !isDark? Colors.white : Colors.transparent, borderRadius: BorderRadius.circular(20)), child: Row(children: [Text("☀️"), SizedBox(width: 4), Text("BLANC", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: !isDark? Colors.black : Colors.grey))]))),
              GestureDetector(onTap: ()=> onToggle(true), child: Container(padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: isDark? Colors.white : Colors.transparent, borderRadius: BorderRadius.circular(20)), child: Row(children: [Text("🌙"), SizedBox(width: 4), Text("NOIR", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: isDark? Colors.black : Colors.grey))]))),
            ]),
          )
        ],
      ),
      body: ListView(padding: EdgeInsets.all(10), children: [
        Row(children: [
          Container(padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8), decoration: BoxDecoration(color: Color(0xFF00A651), borderRadius: BorderRadius.circular(20)), child: Text("⚽ Football • Tous", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))),
          SizedBox(width: 8),
          Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8), decoration: BoxDecoration(color: isDark? Color(0xFF2A2A2A) : Colors.white, borderRadius: BorderRadius.circular(20)), child: Text("🔴 En Direct • 3", style: TextStyle(fontSize: 11, color: Colors.red, fontWeight: FontWeight.bold))),
        ]),
        SizedBox(height: 14),
        _matchCard(context, "LIGUE DES CHAMPIONS", "20:00", "Real Madrid", "Man City", "https://upload.wikimedia.org/wikipedia/en/5/56/Real_Madrid_CF.svg", "https://upload.wikimedia.org/wikipedia/en/e/eb/Manchester_City_FC_badge.svg", "45%", "20%", "35%", "Vini Jr", "84%", "2.10", "3.40", "3.20", "5,250 FCFA"),
        _matchCard(context, "PREMIER LEAGUE", "18:30", "PSG", "Arsenal", "https://upload.wikimedia.org/wikipedia/en/a/a7/Paris_Saint-Germain_F.C..svg", "https://upload.wikimedia.org/wikipedia/en/5/53/Arsenal_FC.svg", "38%", "25%", "37%", "Haaland", "79%", "2.45", "3.20", "2.85", "4,800 FCFA"),
        _matchCard(context, "LONACI LIGUE 1", "15:30", "ASEC Mimosas", "Africa Sport", "https://upload.wikimedia.org/wikipedia/en/9/9d/ASEC_Mimosas_logo.png", "https://upload.wikimedia.org/wikipedia/commons/3/3a/Africa_Sports_logo.png", "52%", "28%", "20%", "K. Koné", "82%", "1.85", "3.10", "4.20", "3,500 FCFA"),
      ]),
    );
  }

  Widget _matchCard(BuildContext ctx, String ligue, String heure, String d1, String d2, String logo1, String logo2, String p1, String pn, String p2, String buteur, String conf, String c1, String cN, String c2, String fcfa) {
    return GestureDetector(
      onTap: () => Navigator.push(ctx, MaterialPageRoute(builder: (_) => DetailFlashPage(ligue: ligue, d1: d1, d2: d2, logo1: logo1, logo2: logo2, isDark: isDark))),
      child: Container(
        margin: EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(color: isDark? Color(0xFF1E1E1E) : Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)]),
        child: Column(children: [
          Padding(padding: EdgeInsets.all(12), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Container(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: Color(0xFF00A651).withOpacity(0.1), borderRadius: BorderRadius.circular(6)), child: Text(ligue, style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Color(0xFF00A651)))), Text(heure + " • Aujourd'hui", style: TextStyle(fontSize: 11, color: Colors.grey))])),
          Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Row(children: [
            Expanded(child: Column(children: [Image.network(logo1, width: 42, height: 42, errorBuilder: (_,__,___)=> Text("⚽", style: TextStyle(fontSize: 30))), SizedBox(height: 6), Text(d1, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)), Text(p1, style: TextStyle(color: Color(0xFF00A651), fontWeight: FontWeight.bold))])),
            Column(children: [Text("VS", style: TextStyle(color: Colors.grey, fontSize: 12)), Container(margin: EdgeInsets.only(top: 4), padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2), decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(10)), child: Text("N $pn", style: TextStyle(fontSize: 10)))]),
            Expanded(child: Column(children: [Image.network(logo2, width: 42, height: 42, errorBuilder: (_,__,___)=> Text("⚽", style: TextStyle(fontSize: 30))), SizedBox(height: 6), Text(d2, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)), Text(p2, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))])),
          ])),
          SizedBox(height: 10),
          Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Buteur probable", style: TextStyle(fontSize: 11, color: Colors.grey)), Text("$buteur • Confiance $conf", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold))])),
          SizedBox(height: 6),
          Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: ClipRRect(borderRadius: BorderRadius.circular(10), child: LinearProgressIndicator(value: 0.45, color: Color(0xFF00A651), backgroundColor: Colors.grey.withOpacity(0.2), minHeight: 5))),
          SizedBox(height: 10),
          Padding(padding: EdgeInsets.all(12), child: Row(children: [
            Expanded(child: Container(padding: EdgeInsets.symmetric(vertical: 7), decoration: BoxDecoration(color: isDark? Color(0xFF2A2A2A) : Color(0xFFF0F2F5), borderRadius: BorderRadius.circular(8)), child: Column(children: [Text("1", style: TextStyle(fontSize: 10, color: Colors.grey)), Text(c1, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))]))),
            SizedBox(width: 6),
            Expanded(child: Container(padding: EdgeInsets.symmetric(vertical: 7), decoration: BoxDecoration(color: isDark? Color(0xFF2A2A2A) : Color(0xFFF0F2F5), borderRadius: BorderRadius.circular(8)), child: Column(children: [Text("N", style: TextStyle(fontSize: 10, color: Colors.grey)), Text(cN, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))]))),
            SizedBox(width: 6),
            Expanded(child: Container(padding: EdgeInsets.symmetric(vertical: 7), decoration: BoxDecoration(color: isDark? Color(0xFF2A2A2A) : Color(0xFFF0F2F5), borderRadius: BorderRadius.circular(8)), child: Column(children: [Text("2", style: TextStyle(fontSize: 10, color: Colors.grey)), Text(c2, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))]))),
            SizedBox(width: 6),
            Expanded(flex: 2, child: Container(padding: EdgeInsets.symmetric(vertical: 9), decoration: BoxDecoration(color: Color(0xFF00A651), borderRadius: BorderRadius.circular(8)), child: Text(fcfa, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11)))),
          ])),
        ]),
      ),
    );
  }
}

class DetailFlashPage extends StatefulWidget {
  final String ligue, d1, d2, logo1, logo2;
  final bool isDark;
  DetailFlashPage({required this.ligue, required this.d1, required this.d2, required this.logo1, required this.logo2, required this.isDark});
  @override
  _DetailFlashPageState createState() => _DetailFlashPageState();
}

class _DetailFlashPageState extends State<DetailFlashPage> with SingleTickerProviderStateMixin {
  late TabController _tab;
  @override
  void initState() { super.initState(); _tab = TabController(length: 6, vsync: this); }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDark? Color(0xFF0F0F0F) : Color(0xFFF0F2F5),
      appBar: AppBar(
        backgroundColor: widget.isDark? Color(0xFF1E1E1E) : Colors.white,
        title: Text("${widget.d1} vs ${widget.d2}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: widget.isDark? Colors.white : Colors.black)),
        bottom: TabBar(controller: _tab, isScrollable: true, labelColor: Color(0xFF00A651), unselectedLabelColor: Colors.grey, indicatorColor: Color(0xFF00A651), tabs: [Tab(text: "RÉSUMÉ"), Tab(text: "STATS"), Tab(text: "COMPO"), Tab(text: "H2H"), Tab(text: "CLASSEMENT"), Tab(text: "COTES")]),
      ),
      body: TabBarView(controller: _tab, children: [
        ListView(padding: EdgeInsets.all(12), children: [
          Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: widget.isDark? Color(0xFF1E1E1E) : Colors.white, borderRadius: BorderRadius.circular(14)), child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Column(children: [Image.network(widget.logo1, width: 60, height: 60, errorBuilder: (_,__,___)=> Text("⚽", style: TextStyle(fontSize: 40))), SizedBox(height: 8), Text(widget.d1, style: TextStyle(fontWeight: FontWeight.bold))]),
            Column(children: [Text("20:00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), Text(widget.ligue, style: TextStyle(fontSize: 10, color: Colors.grey)), SizedBox(height: 6), Container(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(12)), child: Text("PRÉDICTION 45%-20%-35%", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)))]),
            Column(children: [Image.network(widget.logo2, width: 60, height: 60, errorBuilder: (_,__,___)=> Text("⚽", style: TextStyle(fontSize: 40))), SizedBox(height: 8), Text(widget.d2, style: TextStyle(fontWeight: FontWeight.bold))]),
          ])),
          SizedBox(height: 12),
          _paramCard("ANALYSE AUTONOME", ["Contrôle ferme: ${widget.d1} 55% domination", "Pression: Haute intensité", "Fermeté: 25% équilibre défensif", "Buteur probable: Vini Jr", "Score prédit: 2-1", "Confiance IA: 84% - 1,247 matchs analysés"]),
          _paramCard("FORME RÉCENTE (5 derniers)", ["${widget.d1}: ✅✅➖✅❌ - 10 pts", "${widget.d2}: ✅✅✅➖✅ - 13 pts", "Buts marqués: ${widget.d1} 11 - ${widget.d2} 14", "Buts encaissés: ${widget.d1} 4 - ${widget.d2} 3"]),
          _paramCard("FACE À FACE - H2H", ["12-03-2024: ${widget.d1} 2-1 ${widget.d2}", "08-11-2023: ${widget.d2} 3-2 ${widget.d1}", "15-04-2023: ${widget.d1} 1-1 ${widget.d2}", "Total: ${widget.d1} 8V - 4N - 6V ${widget.d2}"]),
        ]),
        _paramCard("STATISTIQUES DÉTAILLÉES", ["Possession: 55% - 45%", "Tirs: 14 - 9", "Tirs cadrés: 6 - 4", "Corners: 7 - 3", "Fautes: 11 - 13", "Cartons jaunes: 2 - 3", "xG: 1.85 - 1.12"]),
        _paramCard("COMPOSITIONS PROBABLES", ["${widget.d1} (4-3-3): Courtois - Carvajal, Rüdiger, Alaba, Mendy - Valverde, Tchouaméni, Bellingham - Rodrygo, Vini Jr, Mbappé", "${widget.d2} (4-2-3-1): Ederson - Walker, Dias, Gvardiol, Ake - Rodri, De Bruyne - Foden, Alvarez, Grealish - Haaland", "Absents: ${widget.d1}: Militao (blessé) - ${widget.d2}: Stones (incertain)"]),
        _paramCard("HISTORIQUE H2H COMPLET", ["5 dernières confrontations détaillées avec buts, cartons, possession", "Bilan domicile/extérieur", "Moyenne de buts: 3.2 par match"]),
        _paramCard("CLASSEMENT", ["${widget.ligue}", "1. ${widget.d1} - 24 pts (8V 0N 2D)", "3. ${widget.d2} - 21 pts (7V 0N 3D)", "Forme à domicile: ${widget.d1} invaincu depuis 12 matchs"]),
        _paramCard("COTES & FCFA", ["1XBET: 2.10 - 3.40 - 3.20", "Bet365: 2.15 - 3.35 - 3.15", "1xBet CI: 5,250 FCFA mise max", "Value bet: ${widget.d1} 45% > cote 2.10 = +8% value"]),
      ]),
    );
  }

  Widget _paramCard(String titre, List<String> lignes) {
    return Container(margin: EdgeInsets.only(bottom: 12), padding: EdgeInsets.all(14), decoration: BoxDecoration(color: widget.isDark? Color(0xFF1E1E1E) : Colors.white, borderRadius: BorderRadius.circular(12)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(titre, style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF00A651), fontSize: 13)),
      Divider(height: 16),
      ...lignes.map((l) => Padding(padding: EdgeInsets.only(bottom: 6), child: Text("• $l", style: TextStyle(fontSize: 12)))),
    ]));
  }
}
