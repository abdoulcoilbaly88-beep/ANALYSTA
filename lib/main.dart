import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Analysta()));

class Analysta extends StatefulWidget {
  const Analysta({super.key});
  @override State<Analysta> createState() => _AnalystaState();
}

class _AnalystaState extends State<Analysta> {
  String q = "";
  final players = [
    {"n":"Lionel Messi","t":"Inter Miami #10","s":9.3,"img":"https://i.imgur.com/8Km9tLL.png","b":4,"p":6,"tir":12,"key":4.2},
    {"n":"Cristiano Ronaldo","t":"Al Nassr #7","s":8.8,"img":"https://i.imgur.com/k2EL2rQ.png","b":5,"p":2,"tir":15,"key":1.8},
    {"n":"Erling Haaland","t":"Man City #9","s":8.9,"img":"https://i.imgur.com/Q1b2J1A.png","b":6,"p":1,"tir":14,"key":0.9},
    {"n":"Lamine Yamal","t":"Barcelona #19","s":8.8,"img":"https://i.imgur.com/3o1d1bM.png","b":3,"p":5,"tir":9,"key":2.5},
    {"n":"Vinicius Jr","t":"Real Madrid #7","s":8.7,"img":"https://i.imgur.com/8Km9tLL.png","b":4,"p":3,"tir":11,"key":2.1},
    {"n":"Jude Bellingham","t":"Real Madrid #5","s":8.6,"img":"https://i.imgur.com/k2EL2rQ.png","b":2,"p":4,"tir":8,"key":2.8},
    {"n":"Julian Whappert","t":"REAL #9 - STAR","s":9.0,"img":"https://i.imgur.com/3o1d1bM.png","b":3,"p":5,"tir":10,"key":3.5},
    {"n":"Bukayo Saka","t":"Arsenal #7","s":8.4,"img":"https://i.imgur.com/Q1b2J1A.png","b":2,"p":3,"tir":7,"key":2.3},
    {"n":"Sebastien Haller","t":"Dortmund #9","s":7.9,"img":"https://i.imgur.com/8Km9tLL.png","b":2,"p":1,"tir":6,"key":0.8},
    {"n":"Victor Osimhen","t":"Galatasaray #45","s":8.6,"img":"https://i.imgur.com/k2EL2rQ.png","b":4,"p":0,"tir":9,"key":0.5},
  ];

  void open(Map pl){
    showModalBottomSheet(context: context, isScrollControlled: true, backgroundColor: Colors.transparent,
      builder: (_)=> Container(
        height: 520,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(color: Color(0xFF151515), borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        child: Column(children: [
          Container(width: 50, height: 5, decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(10))),
          const SizedBox(height: 15),
          CircleAvatar(radius: 50, backgroundColor: const Color(0xFF7CFC71), child: CircleAvatar(radius: 47, backgroundImage: NetworkImage(pl['img']))),
          const SizedBox(height: 10),
          Text(pl['n'], style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          Text(pl['t'], style: const TextStyle(color: Color(0xFF7CFC71))),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            _stat("NOTE", "${pl['s']}", true),
            _stat("BUTS", "${pl['b']}", false),
            _stat("PASSES", "${pl['p']}", false),
            _stat("TIRS", "${pl['tir']}", false),
          ]),
          const SizedBox(height: 20),
          Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: const Color(0xFF1F1F1F), borderRadius: BorderRadius.circular(12)),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text("Passes clés / match", style: TextStyle(color: Colors.white70)),
              Text("${pl['key']}", style: const TextStyle(color: Color(0xFF7CFC71), fontWeight: FontWeight.bold)),
            ])),
          const Spacer(),
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=>Navigator.pop(context), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF7CFC71), padding: const EdgeInsets.all(15)), child: const Text("Fermer", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))))
        ]),
      )
    );
  }

  Widget _stat(String t, String v, bool isNote)=> Column(children: [
    Text(t, style: const TextStyle(color: Colors.white54, fontSize: 11)),
    const SizedBox(height: 4),
    Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: isNote? const Color(0xFF7CFC71) : const Color(0xFF2A2A2A), shape: BoxShape.circle), child: Text(v, style: TextStyle(color: isNote? Colors.black : Colors.white, fontWeight: FontWeight.bold, fontSize: 16))),
  ]);

  @override
  Widget build(BuildContext context){
    var list = players.where((e)=> e['n'].toString().toLowerCase().contains(q.toLowerCase())).toList();
    return Scaffold(
      backgroundColor: const Color(0xFF070A07),
      appBar: AppBar(backgroundColor: const Color(0xFF0F2B0E), elevation: 0, title: Row(children: [Container(padding: const EdgeInsets.all(6), decoration: BoxDecoration(color: const Color(0xFF7CFC71), borderRadius: BorderRadius.circular(6)), child: const Text("A", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))), const SizedBox(width: 8), const Text("ANALYSTA PRO", style: TextStyle(color: Color(0xFF7CFC71), fontWeight: FontWeight.bold, letterSpacing: 1.2))])),
      body: Column(children: [
        Padding(padding: const EdgeInsets.all(12), child: TextField(onChanged: (v)=>setState(()=>q=v), style: const TextStyle(color: Colors.white), decoration: InputDecoration(hintText: "Rechercher Messi, Ronaldo...", hintStyle: const TextStyle(color: Colors.white38), prefixIcon: const Icon(Icons.search, color: Color(0xFF7CFC71)), filled: true, fillColor: const Color(0xFF1A1A1A), border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none)))),
        Expanded(child: ListView.builder(padding: const EdgeInsets.all(12), itemCount: list.length, itemBuilder: (_, i){
          var p = list[i];
          return GestureDetector(onTap: ()=>open(p),
            child: Container(margin: const EdgeInsets.only(bottom: 12), padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: const Color(0xFF161616), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFF7CFC71).withOpacity(0.3))),
              child: Row(children: [
                CircleAvatar(radius: 28, backgroundColor: const Color(0xFF7CFC71), child: CircleAvatar(radius: 26, backgroundImage: NetworkImage(p['img'] as String))),
                const SizedBox(width: 12),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(p['n'] as String, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                  Text(p['t'] as String, style: const TextStyle(color: Colors.white54, fontSize: 12)),
                  const SizedBox(height: 4),
                  Row(children: [Icon(Icons.sports_soccer, size: 12, color: Colors.white38), Text(" ${p['b']} buts • ${p['p']} passes", style: TextStyle(color: Colors.white38, fontSize: 11))])
                ])),
                Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: const Color(0xFF7CFC71), borderRadius: BorderRadius.circular(20)), child: Text("${p['s']}", style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)))
              ]),
            ));
        }))
      ]),
    );
  }
}
