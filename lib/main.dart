import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Analysta()));

class Analysta extends StatefulWidget {
  const Analysta({super.key});
  @override
  State<Analysta> createState() => _AnalystaState();
}

class _AnalystaState extends State<Analysta> {
  String q = "";
  final all = [
    {"n":"Julian Whappert","p":"REAL #9","s":"9.0","g":"3","a":"5","t":"B2B","r":"33","st":"1"},
    {"n":"Lionel Messi","p":"MIA #10","s":"9.3","g":"4","a":"6","t":"B2B","r":"91%","st":"1"},
    {"n":"Erling Haaland","p":"MCI #9","s":"8.9","g":"5","a":"1","t":"FIN","r":"78%","st":"1"},
    {"n":"Cristiano Ronaldo","p":"NOR #7","s":"8.8","g":"3","a":"2","t":"B2X","r":"83%","st":"1"},
    {"n":"Lamine Yamal","p":"BAR #19","s":"8.8","g":"2","a":"3","t":"DRI","r":"89%","st":"1"},
    {"n":"Vinicius Jr","p":"REAL #7","s":"8.7","g":"3","a":"2","t":"DRI","r":"85%","st":"1"},
    {"n":"Jude Bellingham","p":"REAL #5","s":"8.6","g":"2","a":"4","t":"BOX","r":"87%","st":"1"},
    {"n":"Bukayo Saka","p":"ARS #7","s":"8.4","g":"1","a":"3","t":"CRE","r":"84%","st":"1"},
    {"n":"Sebastien Haller","p":"DOR #9","s":"7.9","g":"2","a":"1","t":"TAR","r":"71%","st":"1"},
    {"n":"Ademola Lookman","p":"ATA #11","s":"8.5","g":"3","a":"2","t":"FIN","r":"72%","st":"0"},
    {"n":"Victor Osimhen","p":"GAL #45","s":"8.6","g":"4","a":"0","t":"FIN","r":"72%","st":"0"},
    {"n":"Rafael Leao","p":"MIL #10","s":"8.2","g":"2","a":"2","t":"DRI","r":"77%","st":"0"},
    {"n":"Moussa Diaby","p":"AL-I #19","s":"8.0","g":"1","a":"4","t":"CRE","r":"82%","st":"0"},
    {"n":"Phil Foden","p":"MCI #47","s":"8.5","g":"3","a":"2","t":"CRE","r":"88%","st":"0"},
    {"n":"Cole Palmer","p":"CHE #20","s":"8.4","g":"3","a":"3","t":"CRE","r":"83%","st":"0"},
    {"n":"Didier Drogba","p":"CIV LEG","s":"9.5","g":"10","a":"2","t":"LEG","r":"77%","st":"0"},
    {"n":"Yaya Toure","p":"CIV LEG","s":"9.2","g":"3","a":"5","t":"LEG","r":"90%","st":"0"},
    {"n":"Nicolas Pepe","p":"VIL #19","s":"7.8","g":"2","a":"1","t":"DRI","r":"78%","st":"0"},
    {"n":"Serge Aurier","p":"GAL #24","s":"7.5","g":"0","a":"2","t":"DEF","r":"79%","st":"0"},
    {"n":"Simon Adingra","p":"BHA #24","s":"7.9","g":"1","a":"2","t":"DRI","r":"76%","st":"0"},
  ];

  void open(Map p){
    showModalBottomSheet(context: context, isScrollControlled: true, backgroundColor: Colors.transparent,
      builder: (_)=>Container(height: 500, padding: const EdgeInsets.all(15), decoration: BoxDecoration(color: const Color(0xFF1F1F1F), borderRadius: BorderRadius.circular(20)),
        child: Column(children: [
          Text(p['n'], style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF7CFC71))),
          const SizedBox(height:10),
          Text("Équipe: ${p['p']} | NOTE: ${p['s']}/10", style: const TextStyle(color: Colors.white)),
          const SizedBox(height:10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [b("BUTS", p['g']), b("TIRS", p['s']), b("PASSES", p['p']), b("KEY", p['a'])]),
          const SizedBox(height:20),
          ElevatedButton(onPressed: ()=>Navigator.pop(context), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF7CFC71)), child: const Text("Fermer", style: TextStyle(color: Colors.black))),
        ]),
      ),
    );
  }
  Widget b(String t, String v)=>Column(children:[Text(t, style: const TextStyle(color: Colors.white54, fontSize: 10)), Text(v, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))]);

  @override
  Widget build(BuildContext c){
    var list = all.where((e)=> e['n']!.toString().toLowerCase().contains(q.toLowerCase())).toList();
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E0A),
      appBar: AppBar(backgroundColor: const Color(0xFF1A4A14), title: const Text("ANALYSTA - 100 JOUEURS", style: TextStyle(color: Color(0xFF7CFC71), fontWeight: FontWeight.bold))),
      body: ListView(padding: const EdgeInsets.all(12), children: [
        TextField(onChanged: (v)=>setState(()=>q=v), style: const TextStyle(color: Colors.white), decoration: InputDecoration(hintText: "Rechercher joueur (Messi, Ronaldo...)", hintStyle: const TextStyle(color: Colors.white54), filled: true, fillColor: const Color(0xFF1F1F1F), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), prefixIcon: const Icon(Icons.search, color: Color(0xFF7CFC71)))),
        const SizedBox(height:10),
       ...list.map((p)=>GestureDetector(onTap: ()=>open(p), child: Container(margin: const EdgeInsets.only(bottom:8), padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: const Color(0xFF1F1F1F), borderRadius: BorderRadius.circular(12), border: Border.all(color: p['st']=='1'? const Color(0xFF7CFC71) : Colors.transparent)),
          child: Row(children:[
            CircleAvatar(backgroundColor: const Color(0xFF7CFC71), child: Text(p['n']![0], style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold))),
            const SizedBox(width:10),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Text(p['n']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), Text(p['p']!, style: const TextStyle(color: Colors.white54, fontSize: 12))])),
            Text(p['s']!, style: const TextStyle(color: Color(0xFF7CFC71), fontWeight: FontWeight.bold, fontSize: 18)),
          ]),
        ))),
      ]),
    );
  }
}
