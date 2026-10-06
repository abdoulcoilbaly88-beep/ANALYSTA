import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Analysta()));

class Analysta extends StatefulWidget {
  const Analysta({super.key});
  @override
  State<Analysta> createState() => _AnalystaState();
}

class _AnalystaState extends State<Analysta> {
  String q = "";
  final List<Map<String,String>> players = [
    {"n":"Julian Whappert","c":"REAL #9","s":"9.0","b":"3","a":"5","tir":"10","key":"3.5","pct":"91%"},
    {"n":"Lionel Messi","c":"MIA #10","s":"9.3","b":"4","a":"6","tir":"12","key":"4.2","pct":"91%"},
    {"n":"Erling Haaland","c":"MCI #9","s":"8.9","b":"5","a":"1","tir":"14","key":"0.9","pct":"78%"},
    {"n":"Cristiano Ronaldo","c":"NOR #7","s":"8.8","b":"3","a":"2","tir":"15","key":"1.8","pct":"83%"},
    {"n":"Lamine Yamal","c":"BAR #19","s":"8.8","b":"2","a":"3","tir":"9","key":"2.5","pct":"89%"},
    {"n":"Vinicius Jr","c":"REAL #7","s":"8.7","b":"3","a":"2","tir":"11","key":"2.1","pct":"85%"},
    {"n":"Jude Bellingham","c":"REAL #5","s":"8.6","b":"2","a":"4","tir":"8","key":"2.8","pct":"87%"},
    {"n":"Bukayo Saka","c":"ARS #7","s":"8.4","b":"1","a":"3","tir":"7","key":"2.3","pct":"84%"},
    {"n":"Sebastien Haller","c":"DOR #9","s":"7.9","b":"2","a":"1","tir":"6","key":"0.8","pct":"71%"},
    {"n":"Victor Osimhen","c":"GAL #45","s":"8.6","b":"4","a":"0","tir":"9","key":"0.5","pct":"72%"},
    {"n":"Kylian Mbappe","c":"REAL #9","s":"9.0","b":"5","a":"2","tir":"13","key":"2.0","pct":"86%"},
    {"n":"Didier Drogba","c":"CIV LEG","s":"9.5","b":"10","a":"2","tir":"20","key":"1.5","pct":"77%"},
  ];

  void open(Map<String,String> p){
    showModalBottomSheet(context: context, isScrollControlled: true, backgroundColor: Colors.transparent,
      builder: (_)=>Container(
        height: 460,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: const Color(0xFF1F1F1F), borderRadius: const BorderRadius.vertical(top: Radius.circular(20))),
        child: Column(children: [
          Text(p['n']!, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF7CFC71))),
          const SizedBox(height:8),
          Text("Equipe: ${p['c']} | NOTE: ${p['s']}/10", style: const TextStyle(color: Colors.white70)),
          const SizedBox(height:20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            stat("BUTS", p['b']!), stat("TIRS", p['tir']!), stat("PASSES D", p['a']!), stat("KEY", p['key']!),
          ]),
          const SizedBox(height:20),
          Container(width: double.infinity, padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: const Color(0xFF2A2A2A), borderRadius: BorderRadius.circular(10)),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text("Passes reussies", style: TextStyle(color: Colors.white54)),
              Text(p['pct']!, style: const TextStyle(color: Color(0xFF7CFC71), fontWeight: FontWeight.bold)),
            ])),
          const Spacer(),
          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=>Navigator.pop(context), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF7CFC71), padding: const EdgeInsets.symmetric(vertical: 14)), child: const Text("Fermer", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)))),
        ]),
      ),
    );
  }

  Widget stat(String t, String v)=>Column(children:[Text(t, style: const TextStyle(color: Colors.white54, fontSize: 11)), const SizedBox(height:5), Text(v, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))]);

  @override
  Widget build(BuildContext context){
    var list = players.where((e)=> e['n']!.toLowerCase().contains(q.toLowerCase())).toList();
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E0A),
      appBar: AppBar(backgroundColor: const Color(0xFF1A4A14), title: const Text("ANALYSTA - 100 JOUEURS", style: TextStyle(color: Color(0xFF7CFC71), fontWeight: FontWeight.bold, fontSize: 18))),
      body: Column(children: [
        Padding(padding: const EdgeInsets.all(12), child: TextField(onChanged: (v)=>setState(()=>q=v), style: const TextStyle(color: Colors.white), decoration: InputDecoration(hintText: "Rechercher joueur (Messi, Ronaldo...)", hintStyle: const TextStyle(color: Colors.white38), filled: true, fillColor: const Color(0xFF1F1F1F), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none), prefixIcon: const Icon(Icons.search, color: Color(0xFF7CFC71))))),
        Expanded(child: ListView.builder(padding: const EdgeInsets.symmetric(horizontal: 12), itemCount: list.length, itemBuilder: (_, i){
          var p = list[i];
          return GestureDetector(onTap: ()=>open(p),
            child: Container(margin: const EdgeInsets.only(bottom: 8), padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: const Color(0xFF1F1F1F), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFF7CFC71).withOpacity(0.4))),
              child: Row(children:[
                CircleAvatar(backgroundColor: const Color(0xFF7CFC71), child: Text(p['n']![0], style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
                const SizedBox(width:10),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Text(p['n']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), Text(p['c']!, style: const TextStyle(color: Colors.white54, fontSize: 12))])),
                Text(p['s']!, style: const TextStyle(color: Color(0xFF7CFC71), fontWeight: FontWeight.bold, fontSize: 18)),
              ]),
            ));
        }))
      ]),
    );
  }
}
