import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: AnalystaPro()));

class AnalystaPro extends StatefulWidget {
  const AnalystaPro({super.key});
  @override State<AnalystaPro> createState() => _AnlystaProState();
}

class _AnlystaProState extends State<AnalystaPro> {
  String q = "";
  final players = [
    {"n":"Lionel Messi","club":"Inter Miami","num":"#10","pos":"BU","note":"9.3","but":"4","pass":"6","img":"https://upload.wikimedia.org/wikipedia/commons/c/c1/Lionel_Messi_20180626.jpg"},
    {"n":"Cristiano Ronaldo","club":"Al Nassr","num":"#7","pos":"BU","note":"8.8","but":"5","pass":"2","img":"https://upload.wikimedia.org/wikipedia/commons/8/8c/Cristiano_Ronaldo_2018.jpg"},
    {"n":"Kylian Mbappe","club":"Real Madrid","num":"#9","pos":"BU","note":"9.0","but":"6","pass":"2","img":"https://upload.wikimedia.org/wikipedia/commons/5/57/Kylian_Mbapp%C3%A9_2018.jpg"},
    {"n":"Erling Haaland","club":"Man City","num":"#9","pos":"BU","note":"8.9","but":"6","pass":"1","img":"https://upload.wikimedia.org/wikipedia/commons/0/07/Erling_Haaland_2023.jpg"},
    {"n":"Vinicius Jr","club":"Real Madrid","num":"#7","pos":"AG","note":"8.7","but":"4","pass":"3","img":"https://upload.wikimedia.org/wikipedia/commons/f/f2/Vinicius_Junior_2021.jpg"},
    {"n":"Jude Bellingham","club":"Real Madrid","num":"#5","pos":"MC","note":"8.6","but":"2","pass":"4","img":"https://upload.wikimedia.org/wikipedia/commons/c/cb/Jude_Bellingham_2023.jpg"},
    {"n":"Lamine Yamal","club":"FC Barcelone","num":"#19","pos":"AD","note":"8.8","but":"3","pass":"5","img":"https://upload.wikimedia.org/wikipedia/commons/1/1a/Lamine_Yamal_2024.jpg"},
    {"n":"Bukayo Saka","club":"Arsenal","num":"#7","pos":"AD","note":"8.4","but":"2","pass":"3","img":"https://upload.wikimedia.org/wikipedia/commons/2/2d/Bukayo_Saka_2020.jpg"},
    {"n":"Sebastien Haller","club":"Dortmund","num":"#9","pos":"BU","note":"7.9","but":"2","pass":"1","img":"https://upload.wikimedia.org/wikipedia/commons/6/6d/S%C3%A9bastien_Haller_2022.jpg"},
    {"n":"Victor Osimhen","club":"Galatasaray","num":"#45","pos":"BU","note":"8.6","but":"4","pass":"0","img":"https://upload.wikimedia.org/wikipedia/commons/9/9e/Victor_Osimhen_2023.jpg"},
    {"n":"Julian Whappert","club":"REAL ACADEMY","num":"#9","pos":"STAR","note":"9.1","but":"3","pass":"5","img":"https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png"},
    {"n":"Didier Drogba","club":"CIV LEGENDE","num":"LEG","pos":"BU","note":"9.5","but":"10","pass":"2","img":"https://upload.wikimedia.org/wikipedia/commons/3/3b/Didier_Drogba_2018.jpg"},
    {"n":"Mohamed Salah","club":"Liverpool","num":"#11","pos":"AD","note":"8.7","but":"5","pass":"3","img":"https://upload.wikimedia.org/wikipedia/commons/c/c4/Mohamed_Salah_2018.jpg"},
    {"n":"Kevin De Bruyne","club":"Man City","num":"#17","pos":"MC","note":"8.9","but":"1","pass":"6","img":"https://upload.wikimedia.org/wikipedia/commons/5/5b/Kevin_De_Bruyne_201807091.jpg"},
  ];

  Widget avatar(String url, String name){
    return Container(
      width: 60, height: 60,
      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: const Color(0xFF7CFC71), width: 2)),
      child: ClipOval(child: Image.network(url, fit: BoxFit.cover,
        errorBuilder: (c,e,s)=> Container(color: const Color(0xFF1A1A1A), child: Center(child: Text(name[0], style: const TextStyle(color: Color(0xFF7CFC71), fontWeight: FontWeight.bold, fontSize: 22)))))),
    );
  }

  void showPlayer(Map p){
    showModalBottomSheet(context: context, backgroundColor: Colors.transparent, isScrollControlled: true,
      builder: (_)=> Container(
        height: 520,
        decoration: const BoxDecoration(color: Color(0xFF151515), borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(10))),
          const SizedBox(height: 16),
          avatar(p['img']!, p['n']!),
          const SizedBox(height: 12),
          Text(p['n']!, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          Text("${p['club']} ${p['num']} • ${p['pos']}", style: const TextStyle(color: Color(0xFF7CFC71))),
          const SizedBox(height: 24),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            _kpi("NOTE", p['note']!, true), _kpi("BUTS", p['but']!, false), _kpi("PASSES D", p['pass']!, false),
          ]),
          const SizedBox(height: 20),
          Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: const Color(0xFF1F1F1F), borderRadius: BorderRadius.circular(12)), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [Text("Application:", style: TextStyle(color: Colors.white70)), Text("ANALYSTA", style: TextStyle(color: Color(0xFF7CFC71), fontWeight: FontWeight.bold))])),
          const Spacer(),
          SizedBox(width: double.infinity, height: 50, child: ElevatedButton(onPressed: ()=>Navigator.pop(context), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF7CFC71), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))), child: const Text("Fermer", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16))))
        ]),
      ));
  }

  Widget _kpi(String t, String v, bool hl)=> Column(children: [Text(t, style: const TextStyle(color: Colors.white54, fontSize: 11)), const SizedBox(height: 8), Container(width: 56, height: 56, decoration: BoxDecoration(color: hl? const Color(0xFF7CFC71): const Color(0xFF2A2A2A), shape: BoxShape.circle), alignment: Alignment.center, child: Text(v, style: TextStyle(color: hl? Colors.black: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))) ]);

  @override
  Widget build(BuildContext context){
    var filtered = players.where((e)=> e['n']!.toLowerCase().contains(q.toLowerCase())).toList();
    return Scaffold(
      backgroundColor: const Color(0xFF070A07),
      appBar: AppBar(backgroundColor: const Color(0xFF0F2B0E), elevation: 0, title: Row(children: [Container(width: 32, height: 32, decoration: BoxDecoration(color: const Color(0xFF7CFC71), borderRadius: BorderRadius.circular(8)), child: const Center(child: Text("A", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)))), const SizedBox(width: 10), const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("ANALYSTA", style: TextStyle(color: Color(0xFF7CFC71), fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1.2)), Text("100 JOUEURS • STATS PRO", style: TextStyle(color: Colors.white54, fontSize: 9))])])),
      body: Column(children: [
        Padding(padding: const EdgeInsets.all(12), child: TextField(onChanged: (v)=>setState(()=>q=v), style: const TextStyle(color: Colors.white), decoration: InputDecoration(hintText: "Rechercher Messi, Ronaldo, Yamal...", hintStyle: const TextStyle(color: Colors.white38), prefixIcon: const Icon(Icons.search, color: Color(0xFF7CFC71)), filled: true, fillColor: const Color(0xFF1A1A1A), border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none)))),
        Expanded(child: ListView.builder(padding: const EdgeInsets.symmetric(horizontal: 12), itemCount: filtered.length, itemBuilder: (_, i){
          var p = filtered[i];
          return GestureDetector(onTap: ()=>showPlayer(p),
            child: Container(margin: const EdgeInsets.only(bottom: 10), padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: const Color(0xFF161616), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFF7CFC71).withOpacity(0.3))),
              child: Row(children: [
                avatar(p['img']!, p['n']!),
                const SizedBox(width: 12),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(p['n']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(height: 2),
                  Row(children: [Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2), decoration: BoxDecoration(color: const Color(0xFF2A2A2A), borderRadius: BorderRadius.circular(4)), child: Text(p['club']!, style: const TextStyle(color: Colors.white60, fontSize: 10))), const SizedBox(width: 6), Text(p['num']!, style: const TextStyle(color: Colors.white38, fontSize: 11))]),
                  const SizedBox(height: 4),
                  Text("⚽ ${p['but']} buts • 🎯 ${p['pass']} passes", style: const TextStyle(color: Colors.white38, fontSize: 11))
                ])),
                Column(children: [Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: const Color(0xFF7CFC71), borderRadius: BorderRadius.circular(20)), child: Text(p['note']!, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16))), const SizedBox(height: 4), Text(p['pos']!, style: const TextStyle(color: Colors.white38, fontSize: 9))])
              ]),
            ));
        }))
      ]),
    );
  }
}
