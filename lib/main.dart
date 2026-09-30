import 'package:flutter/material.dart';

void main() => runApp(AnalystaIdentique());

class AnalystaIdentique extends StatefulWidget {
  @override
  _AnalystaIdentiqueState createState() => _AnalystaIdentiqueState();
}

class _AnalystaIdentiqueState extends State<AnalystaIdentique> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark? ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0F0F0F),
        cardColor: Color(0xFF1E1E1E),
      ) : ThemeData.light().copyWith(
        scaffoldBackgroundColor: Color(0xFFF5F5F7),
        cardColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: isDark? Color(0xFF1E1E1E) : Colors.white,
          elevation: 1,
          title: Row(children: [
            Container(padding: EdgeInsets.all(6), decoration: BoxDecoration(color: Color(0xFF00A651), borderRadius: BorderRadius.circular(8)), child: Text("A", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
            SizedBox(width: 8),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("ANALYSTA", style: TextStyle(color: isDark? Colors.white : Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
              Text("Prédiction 100% autonome", style: TextStyle(color: Colors.grey, fontSize: 10)),
            ]),
          ]),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 12),
              decoration: BoxDecoration(color: isDark? Colors.black : Colors.grey[100], borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey.withOpacity(0.2))),
              child: Row(children: [
                GestureDetector(
                  onTap: () => setState(() => isDark = false),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color:!isDark? Colors.white : Colors.transparent, borderRadius: BorderRadius.circular(20), boxShadow:!isDark? [BoxShadow(color: Colors.black12, blurRadius: 4)] : []),
                    child: Row(children: [Icon(Icons.wb_sunny, size: 14, color:!isDark? Colors.orange : Colors.grey), SizedBox(width: 4), Text("BLANC", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color:!isDark? Colors.black : Colors.grey))]),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => isDark = true),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: isDark? Colors.white : Colors.transparent, borderRadius: BorderRadius.circular(20)),
                    child: Row(children: [Icon(Icons.nightlight_round, size: 14, color: isDark? Colors.black : Colors.grey), SizedBox(width: 4), Text("NOIR", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: isDark? Colors.black : Colors.grey))]),
                  ),
                ),
              ]),
            ),
          ],
        ),
        body: HomeIdentique(isDark: isDark),
      ),
    );
  }
}

class HomeIdentique extends StatelessWidget {
  final bool isDark;
  HomeIdentique({required this.isDark});

  final matchs = [
    {"domicile": "Real Madrid", "exterieur": "Man City", "logo1": "⚪", "logo2": "🔵", "ligue": "LIGUE DES CHAMPIONS", "heure": "20:00", "p1": "45%", "pn": "20%", "p2": "35%", "buteur": "Vini Jr", "confiance": "84%", "cote1": "2.10", "coteN": "3.40", "cote2": "3.20", "fcfa": "5,250 FCFA"},
    {"domicile": "PSG", "exterieur": "Arsenal", "logo1": "🔴🔵", "logo2": "🔴", "ligue": "PREMIER LEAGUE", "heure": "18:30", "p1": "38%", "pn": "25%", "p2": "37%", "buteur": "Haaland", "confiance": "79%", "cote1": "2.45", "coteN": "3.20", "cote2": "2.85", "fcfa": "4,800 FCFA"},
    {"domicile": "ASEC Mimosas", "exterieur": "Africa Sport", "logo1": "🟡⚫", "logo2": "🟢🔴", "ligue": "LONACI LIGUE 1", "heure": "15:30", "p1": "52%", "pn": "28%", "p2": "20%", "buteur": "K. Koné", "confiance": "82%", "cote1": "1.85", "coteN": "3.10", "cote2": "4.20", "fcfa": "3,500 FCFA"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(12),
      children: [
        Row(children: [
          Container(padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8), decoration: BoxDecoration(color: Color(0xFF00A651), borderRadius: BorderRadius.circular(20)), child: Row(children: [Icon(Icons.filter_list, color: Colors.white, size: 16), SizedBox(width: 6), Text("Filtres • Football", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))])),
          SizedBox(width: 8),
          Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8), decoration: BoxDecoration(color: isDark? Color(0xFF2A2A2A) : Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey.withOpacity(0.2))), child: Text("En Direct • 3", style: TextStyle(fontSize: 11, color: Colors.red, fontWeight: FontWeight.bold))),
        ]),
        SizedBox(height: 16),
       ...matchs.map((m) => Container(
          margin: EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(color: isDark? Color(0xFF1E1E1E) : Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: Offset(0, 4))]),
          child: Column(children: [
            Padding(padding: EdgeInsets.all(14), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: Color(0xFF00A651).withOpacity(0.1), borderRadius: BorderRadius.circular(6)), child: Text(m["ligue"]!, style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Color(0xFF00A651)))),
              Text(m["heure"]! + " • Aujourd'hui", style: TextStyle(fontSize: 11, color: Colors.grey)),
            ])),
            Padding(padding: EdgeInsets.symmetric(horizontal: 14), child: Row(children: [
              Expanded(child: Column(children: [Text(m["logo1"]!, style: TextStyle(fontSize: 32)), SizedBox(height: 6), Text(m["domicile"]!, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: isDark? Colors.white : Colors.black)), Text(m["p1"]!, style: TextStyle(color: Color(0xFF00A651), fontWeight: FontWeight.bold, fontSize: 16))])),
              Column(children: [Text("VS", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)), SizedBox(height: 4), Container(padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2), decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1), borderRadius: BorderRadius.circular(10)), child: Text("N ${m["pn"]}", style: TextStyle(fontSize: 11)))]),
              Expanded(child: Column(children: [Text(m["logo2"]!, style: TextStyle(fontSize: 32)), SizedBox(height: 6), Text(m["exterieur"]!, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: isDark? Colors.white : Colors.black)), Text(m["p2"]!, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16))])),
            ])),
            SizedBox(height: 12),
            Padding(padding: EdgeInsets.symmetric(horizontal: 14), child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text("Buteur probable", style: TextStyle(fontSize: 11, color: Colors.grey)), Text(m["buteur"]! + " • Confiance " + m["confiance"]!, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: isDark? Colors.white : Colors.black))]),
              SizedBox(height: 8),
              ClipRRect(borderRadius: BorderRadius.circular(10), child: LinearProgressIndicator(value: 0.45, backgroundColor: Colors.grey.withOpacity(0.2), color: Color(0xFF00A651), minHeight: 6)),
              SizedBox(height: 12),
              Row(children: [
                Expanded(child: Container(padding: EdgeInsets.symmetric(vertical: 8), decoration: BoxDecoration(color: isDark? Color(0xFF2A2A2A) : Color(0xFFF5F5F7), borderRadius: BorderRadius.circular(8)), child: Column(children: [Text("1", style: TextStyle(fontSize: 10, color: Colors.grey)), Text(m["cote1"]!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13))]))),
                SizedBox(width: 8),
                Expanded(child: Container(padding: EdgeInsets.symmetric(vertical: 8), decoration: BoxDecoration(color: isDark? Color(0xFF2A2A2A) : Color(0xFFF5F5F7), borderRadius: BorderRadius.circular(8)), child: Column(children: [Text("N", style: TextStyle(fontSize: 10, color: Colors.grey)), Text(m["coteN"]!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13))]))),
                SizedBox(width: 8),
                Expanded(child: Container(padding: EdgeInsets.symmetric(vertical: 8), decoration: BoxDecoration(color: isDark? Color(0xFF2A2A2A) : Color(0xFFF5F5F7), borderRadius: BorderRadius.circular(8)), child: Column(children: [Text("2", style: TextStyle(fontSize: 10, color: Colors.grey)), Text(m["cote2"]!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13))]))),
                SizedBox(width: 8),
                Expanded(flex: 2, child: Container(padding: EdgeInsets.symmetric(vertical: 10), decoration: BoxDecoration(color: Color(0xFF00A651), borderRadius: BorderRadius.circular(8)), child: Text(m["fcfa"]!, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)))),
              ]),
            ])),
            SizedBox(height: 14),
          ]),
        )).toList(),
      ],
    );
  }
}
