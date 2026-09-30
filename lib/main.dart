import 'package:flutter/material.dart';

void main() => runApp(AnalystaOriginal());

class AnalystaOriginal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF00A651),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  final _pages = [AccueilPage(), LivePage(), AnalysePage(), StatsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00A651),
        title: Text("ANALYSTA • ORIGINAL", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFF00A651),
        unselectedItemColor: Colors.grey,
        items: [
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
  final matchs = [
    {"eq1": "Man City", "eq2": "Arsenal", "heure": "20:45", "ligue": "Premier League", "conf": "82%"},
    {"eq1": "Real Madrid", "eq2": "Barcelone", "heure": "21:00", "ligue": "La Liga", "conf": "76%"},
    {"eq1": "PSG", "eq2": "Marseille", "heure": "20:00", "ligue": "Ligue 1", "conf": "85%"},
    {"eq1": "Inter", "eq2": "AC Milan", "heure": "18:30", "ligue": "Serie A", "conf": "79%"},
    {"eq1": "ASEC", "eq2": "Africa", "heure": "15:30", "ligue": "LONACI", "conf": "78%"},
    {"eq1": "Bayern", "eq2": "Dortmund", "heure": "17:30", "ligue": "Bundesliga", "conf": "81%"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(12),
      itemCount: matchs.length,
      itemBuilder: (ctx, i) {
        var m = matchs[i];
        return Card(
          color: Colors.white,
          elevation: 3,
          margin: EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: Color(0xFF00A651).withOpacity(0.3))),
          child: ListTile(
            leading: Container(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: Color(0xFF00A651), borderRadius: BorderRadius.circular(6)), child: Text(m["ligue"]!.split(" ")[0], style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold))),
            title: Text("${m["eq1"]} vs ${m["eq2"]}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
            subtitle: Text("${m["heure"]} • Conf ${m["conf"]}", style: TextStyle(color: Colors.grey)),
            trailing: Column(children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF00A651), minimumSize: Size(80, 30)),
                onPressed: () => showDialog(context: context, builder: (_) => AlertDialog(
                  title: Text("${m["eq1"]} vs ${m["eq2"]}", style: TextStyle(color: Color(0xFF00A651), fontWeight: FontWeight.bold)),
                  content: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text("${m["ligue"]}", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text("ANALYSE AUTONOME:", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("• Contrôle: ${m["eq1"]} 55% domination"),
                    Text("• Pression: Haute intensité"),
                    Text("• Fermeté: 25% équilibre défensif"),
                    SizedBox(height: 10),
                    Container(padding: EdgeInsets.all(10), decoration: BoxDecoration(color: Color(0xFF00A651).withOpacity(0.1), borderRadius: BorderRadius.circular(8)), child: Column(children: [
                      Text("PREDICTION: ${m["eq1"]} 55%", style: TextStyle(color: Color(0xFF00A651), fontWeight: FontWeight.bold)),
                      Text("Score: 2-1 | Confiance: ${m["conf"]}", style: TextStyle(color: Colors.green[700], fontWeight: FontWeight.bold)),
                    ]))
                  ]),
                  actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text("Fermer", style: TextStyle(color: Color(0xFF00A651))))],
                )),
                child: Text("Analyser", style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
              SizedBox(height: 4),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black87, minimumSize: Size(80, 28)),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PlayerPage(match: "${m["eq1"]} vs ${m["eq2"]}"))),
                child: Text("Regarder", style: TextStyle(color: Colors.white, fontSize: 11)),
              ),
            ]),
          ),
        );
      },
    );
  }
}

class PlayerPage extends StatelessWidget {
  final String match;
  PlayerPage({required this.match});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF00A651), title: Text(match, style: TextStyle(color: Colors.white))),
      body: Column(children: [
        Container(
          height: 220,
          color: Colors.black,
          child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.play_circle_fill, color: Color(0xFF00A651), size: 80),
            SizedBox(height: 10),
            Text("LECTEUR ANALYSTA", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            Text(match, style: TextStyle(color: Colors.white70)),
            SizedBox(height: 10),
            Text("▶ Lecture en direct...", style: TextStyle(color: Color(0xFF00A651))),
          ])),
        ),
        Expanded(child: Container(padding: EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("ANALYSE EN DIRECT", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF00A651), fontSize: 18)),
          SizedBox(height: 10),
          Text("• Contrôle ferme activé"),
          Text("• Pression haute"),
          Text("• Statistiques live"),
          SizedBox(height: 20),
          LinearProgressIndicator(value: 0.55, color: Color(0xFF00A651), backgroundColor: Colors.grey[200]),
          SizedBox(height: 5),
          Text("Domination 55% - 45%"),
        ]))),
      ]),
    );
  }
}

class LivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(12), children: [
      Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Color(0xFF00A651).withOpacity(0.1), borderRadius: BorderRadius.circular(10)), child: Row(children: [Icon(Icons.circle, color: Colors.red, size: 12), SizedBox(width: 8), Text("LIVE • 3 MATCHS", style: TextStyle(color: Color(0xFF00A651), fontWeight: FontWeight.bold))])),
      SizedBox(height: 12),
      Card(child: ListTile(title: Text("Man City 2-1 Arsenal", style: TextStyle(fontWeight: FontWeight.bold)), subtitle: Text("Premier League"), trailing: Text("78'", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)))),
      Card(child: ListTile(title: Text("Real Madrid 1-1 Barcelone", style: TextStyle(fontWeight: FontWeight.bold)), subtitle: Text("La Liga"), trailing: Text("78'", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)))),
      Card(child: ListTile(title: Text("PSG 2-0 Marseille", style: TextStyle(fontWeight: FontWeight.bold)), subtitle: Text("Ligue 1"), trailing: Text("78'", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)))),
    ]);
  }
}

class AnalysePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("CENTRE MONDIAL", style: TextStyle(color: Color(0xFF00A651), fontWeight: FontWeight.bold, fontSize: 20)),
      SizedBox(height: 8),
      Text("Autonome • Contrôle ferme • Analyse pression", style: TextStyle(color: Colors.grey)),
      SizedBox(height: 20),
      Card(color: Color(0xFF00A651).withOpacity(0.05), child: Padding(padding: EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Précision IA: 84.2%", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18)),
        Text("1,247 matchs analysés"),
      ]))),
    ]));
  }
}

class StatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Stats Mondiales\nBientôt...", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Color(0xFF00A651))));
  }
}
