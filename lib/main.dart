import 'package:flutter/material.dart';

void main() => runApp(const AnalystaApp());

class AnalystaApp extends StatelessWidget {
  const AnalystaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0E0A),
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
  void openMatch() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const Detail()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF141A14),
        title: const Text("ANALYSTA", style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold, color: Color(0xFF7CFF7C))),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          GestureDetector(
            onTap: openMatch,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF141A14),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF7CFF7C).withOpacity(0.4)),
                boxShadow: [BoxShadow(color: const Color(0xFF7CFF7C).withOpacity(0.1), blurRadius: 20)],
              ),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Column(children: [CircleAvatar(backgroundColor: Colors.blue[900], radius: 24, child: const Text("MCI", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold))), const SizedBox(height: 6), const Text("MAN CITY", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold))]),
                    const Column(children: [Text("2 - 1", style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: Color(0xFF7CFF7C))), Text("FT • 90+4\"", style: TextStyle(color: Colors.grey, fontSize: 11))]),
                    Column(children: [CircleAvatar(backgroundColor: Colors.red[900], radius: 24, child: const Text("ARS", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold))), const SizedBox(height: 6), const Text("ARSENAL", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold))]),
                  ]),
                  const SizedBox(height: 16),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                    Column(children: const [Text("POSSESSION", style: TextStyle(color: Colors.grey, fontSize: 10)), SizedBox(height: 4), Text("58%", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF7CFF7C))), Text("Man City", style: TextStyle(fontSize: 10))]),
                    Container(width: 1, height: 50, color: Colors.white12),
                    const Column(children: [Text("xG", style: TextStyle(color: Colors.grey, fontSize: 10)), SizedBox(height: 4), Text("1.82 - 0.91", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), Text("Expected Goals", style: TextStyle(fontSize: 10, color: Colors.grey))]),
                    Container(width: 1, height: 50, color: Colors.white12),
                    Column(children: const [Text("POSSESSION", style: TextStyle(color: Colors.grey, fontSize: 10)), SizedBox(height: 4), Text("42%", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)), Text("Arsenal", style: TextStyle(fontSize: 10))]),
                  ]),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: const Color(0xFF141A14), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFF7CFF7C).withOpacity(0.2))),
            child: Row(children: [Container(width: 36, height: 36, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: const Color(0xFF7CFF7C)), color: Colors.grey[800]), child: const Icon(Icons.person, size: 20)), const SizedBox(width: 10), const Expanded(child: Text("Erling Haaland • 87' GOAL 2-1 • Tap to view", style: TextStyle(fontSize: 12))), Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: const Color(0xFF7CFF7C), borderRadius: BorderRadius.circular(8)), child: const Text("8.5 MOTM", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 11)))]),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: openMatch,
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF7CFF7C), foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(vertical: 14)),
            child: const Text("VOIR MATCH DETAIL - DESIGN 4+5", style: TextStyle(fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}

class Detail extends StatefulWidget {
  const Detail({super.key});
  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  void showPlayerFocus() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => DraggableScrollableSheet(
        initialChildSize: 0.92,
        maxChildSize: 0.95,
        minChildSize: 0.6,
        builder: (_, controller) => Container(
          decoration: BoxDecoration(
            color: const Color(0xFF121A12),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            border: Border.all(color: const Color(0xFF7CFF7C), width: 1.2),
          ),
          child: ListView(
            controller: controller,
            padding: const EdgeInsets.all(16),
            children: [
              // HEADER PLAYER FOCUS
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: const Color(0xFF1E2E1E), borderRadius: BorderRadius.circular(20), border: Border.all(color: const Color(0xFF7CFF7C).withOpacity(0.5))), child: const Row(children: [Icon(Icons.auto_awesome, color: Color(0xFF7CFF7C), size: 16), SizedBox(width: 6), Text("PLAYER FOCUS", style: TextStyle(color: Color(0xFF7CFF7C), fontWeight: FontWeight.bold, fontSize: 12))])),
                GestureDetector(onTap: () => Navigator.pop(context), child: Container(padding: const EdgeInsets.all(6), decoration: const BoxDecoration(color: Colors.white12, shape: BoxShape.circle), child: const Icon(Icons.close, size: 18))),
              ]),
              const SizedBox(height: 12),
              // PHOTO + NAME
              Stack(
                children: [
                  Container(
                    height: 180,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: const Color(0xFF1A2A1A), border: Border.all(color: const Color(0xFF7CFF7C).withOpacity(0.3))),
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                          Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: const Color(0xFF1E2E1E), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white24)), child: const Text("MCI • #9", style: TextStyle(fontSize: 11, color: Color(0xFF7CFF7C)))),
                          const SizedBox(height: 8),
                          const Text("Erling\nHaaland", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF7CFF7C), height: 1.1)),
                          const SizedBox(height: 6),
                          Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: const Color(0xFF1E2E1E), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.white24)), child: const Text("Striker", style: TextStyle(fontSize: 11))),
                          const SizedBox(height: 10),
                          Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                            const Text("8.5", style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold, color: Color(0xFF7CFF7C), height: 1)),
                            const SizedBox(width: 4),
                            Container(margin: const EdgeInsets.only(bottom: 8), padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: const Color(0xFF7CFF7C), borderRadius: BorderRadius.circular(12)), child: const Row(children: [Icon(Icons.star, size: 12, color: Colors.black), SizedBox(width: 3), Text("MOTM", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10))])),
                          ]),
                        ]),
                        const Spacer(),
                        // PHOTO JOUEUR
                        Container(
                          width: 150,
                          height: 180,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network("https://resources.premierleague.com/premierleague/photos/players/250x250/p223094.png", fit: BoxFit.cover, errorBuilder: (_, __, ___) => const Icon(Icons.person, size: 80, color: Colors.grey)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              // GRID STATS 4x2
              GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.85,
                children: [
                  _statCard("GOALS", "2", Icons.sports_soccer),
                  _statCard("SHOTS", "3", Icons.my_location),
                  _statCard("xG", "", Icons.bubble_chart, small: "0.78"),
                  _statCard("xA", "0.70", Icons.bar_chart),
                  _statCard("PASSES", "78%", Icons.grid_view),
                  _statCard("KEY PASSES", "1", Icons.my_location),
                  _statCard("DRIBBLES", "1/1", Icons.bubble_chart),
                  _statCard("TOUCHES", "28", Icons.bar_chart),
                ],
              ),
              const SizedBox(height: 8),
              const Center(child: Text("85 min played • 89% performance • 3 duels won", style: TextStyle(color: Color(0xFF7CFF7C), fontSize: 11))),
              const SizedBox(height: 6),
              Row(children: [const Text("Performance", style: TextStyle(fontSize: 11, color: Colors.grey)), const SizedBox(width: 8), Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(10), child: LinearProgressIndicator(value: 0.84, backgroundColor: Colors.white12, color: const Color(0xFF7CFF7C), minHeight: 6))), const SizedBox(width: 8), const Text("84%", style: TextStyle(color: Color(0xFF7CFF7C), fontSize: 11, fontWeight: FontWeight.bold))]),
              const SizedBox(height: 18),
              // DETAILED STATS
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(color: const Color(0xFF0F150F), borderRadius: BorderRadius.circular(14), border: Border.all(color: const Color(0xFF7CFF7C).withOpacity(0.4))),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text("PLAYER DETAILED STATS", style: TextStyle(color: Color(0xFF7CFF7C), fontWeight: FontWeight.bold, fontSize: 13)), GestureDetector(onTap: () => Navigator.pop(context), child: Container(padding: const EdgeInsets.all(4), decoration: BoxDecoration(border: Border.all(color: const Color(0xFF7CFF7C)), borderRadius: BorderRadius.circular(6)), child: const Icon(Icons.close, size: 16, color: Color(0xFF7CFF7C))))]),
                  const SizedBox(height: 12),
                  _bar("Attack", "Expected Goals (xG)", "78%", 0.78),
                  _bar("", "Goal Conversion", "67%", 0.67),
                  _bar("", "Shot On Target", "2/3", 0.67, showValueRight: true),
                  const SizedBox(height: 10),
                  _bar("Passing", "Pass Accuracy", "78%", 0.78),
                  const SizedBox(height: 10),
                  const Text("Playmaking", style: TextStyle(color: Color(0xFF7CFF7C), fontSize: 11, fontWeight: FontWeight.bold)),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [Text("Key Passes 1 • Big Chances Created", style: TextStyle(fontSize: 11)), Text("1", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold))]),
                  const SizedBox(height: 10),
                  const Text("Other", style: TextStyle(color: Color(0xFF7CFF7C), fontSize: 11, fontWeight: FontWeight.bold)),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [Text("Dribbles 1/1 • Duels Won 3/5 • Fouls", style: TextStyle(fontSize: 11)), Text("0", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold))]),
                  const SizedBox(height: 16),
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Navigator.pop(context), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF7CFF7C), foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))), child: const Text("Close", style: TextStyle(fontWeight: FontWeight.bold)))),
                ]),
              ),
              const SizedBox(height: 10),
              const Center(child: Text("Live Data • Opta Stats • Updated 21:47 GMT • 23 Oct 2024", style: TextStyle(color: Colors.grey, fontSize: 9))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statCard(String title, String value, IconData icon, {String small = ""}) {
    return Container(
      decoration: BoxDecoration(color: const Color(0xFF1A251A), borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color(0xFF7CFF7C).withOpacity(0.6))),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(icon, color: const Color(0xFF7CFF7C), size: 20),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(fontSize: 8, color: Colors.grey, fontWeight: FontWeight.bold)),
        Text(value.isEmpty? small : value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF7CFF7C))),
        if (small.isNotEmpty && value.isNotEmpty) Text(small, style: const TextStyle(fontSize: 10, color: Color(0xFF7CFF7C))),
      ]),
    );
  }

  Widget _bar(String section, String label, String val, double pct, {bool showValueRight = false}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (section.isNotEmpty) Text(section, style: const TextStyle(color: Color(0xFF7CFF7C), fontSize: 11, fontWeight: FontWeight.bold)),
      const SizedBox(height: 2),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(label, style: const TextStyle(fontSize: 11)), Text(val, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold))]),
      const SizedBox(height: 4),
      ClipRRect(borderRadius: BorderRadius.circular(10), child: LinearProgressIndicator(value: pct, backgroundColor: Colors.white12, color: const Color(0xFF7CFF7C), minHeight: 6)),
      const SizedBox(height: 8),
    ]);
  }

  Widget timelineItem(String minute, String name, String detail) {
    return GestureDetector(
      onTap: showPlayerFocus,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: const Color(0xFF141A14), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.white10)),
        child: Row(children: [
          Container(width: 40, height: 40, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: const Color(0xFF7CFF7C)), color: Colors.grey[800]), child: const Icon(Icons.person, size: 20)),
          const SizedBox(width: 10),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2), decoration: BoxDecoration(color: const Color(0xFF7CFF7C), borderRadius: BorderRadius.circular(6)), child: Text(minute, style: const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold))), const SizedBox(width: 6), Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12))]), Text(detail, style: const TextStyle(color: Colors.grey, fontSize: 10)), const Text("Tap to view →", style: TextStyle(color: Color(0xFF7CFF7C), fontSize: 9))])),
          const Text("1-0", style: TextStyle(color: Color(0xFF7CFF7C), fontWeight: FontWeight.bold)),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFF141A14), title: const Text("MATCH DETAIL", style: TextStyle(color: Color(0xFF7CFF7C), fontSize: 14, fontWeight: FontWeight.bold)), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: const Color(0xFF141A14), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFF7CFF7C).withOpacity(0.3))),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(children: [CircleAvatar(backgroundColor: Colors.blue[900], radius: 22, child: const Text("MCI")), const Text("MAN CITY", style: TextStyle(fontSize: 10))]),
              const Column(children: [Text("2 - 1", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFF7CFF7C))), Text("FT • 90+4\"", style: TextStyle(fontSize: 10, color: Colors.grey))]),
              Column(children: [CircleAvatar(backgroundColor: Colors.red[900], radius: 22, child: const Text("ARS")), const Text("ARSENAL", style: TextStyle(fontSize: 10))]),
            ]),
          ),
          const SizedBox(height: 12),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: const [
            Text("POSSESSION 58%", style: TextStyle(color: Color(0xFF7CFF7C), fontWeight: FontWeight.bold, fontSize: 11)),
            Text("xG 1.82 - 0.91", style: TextStyle(fontSize: 11)),
            Text("42%", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
          ]),
          const SizedBox(height: 12),
          const Text("MATCH TIMELINE - Tap player", style: TextStyle(color: Color(0xFF7CFF7C), fontWeight: FontWeight.bold, fontSize: 11)),
          const SizedBox(height: 8),
          timelineItem("87'", "Erling Haaland", "GOAL • 2-1 • Assist: Kevin De Bruyne"),
          timelineItem("45+2'", "Phil Foden", "GOAL • 1-1 • Assist: Bernardo Silva"),
          timelineItem("12'", "Saka", "GOAL • 0-1 • Arsenal #7"),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: showPlayerFocus, backgroundColor: const Color(0xFF7CFF7C), label: const Text("PLAYER FOCUS - TEST", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), icon: const Icon(Icons.person, color: Colors.black)),
    );
  }
}
