import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Analysta()));

class Analysta extends StatefulWidget {
  const Analysta({super.key});
  @override State<Analysta> createState() => _AnalystaState();
}

class _AnalystaState extends State<Analysta> {
  String q = "";
  final all = [
    {"n":"Mbappe","f":"Kylian Mbappe","t":"REAL #9","r":"9.0","g":"2","s":"5","p":"82%","k":"3","star":1},
    {"n":"Messi","f":"Lionel Messi","t":"MIA #10","r":"9.3","g":"2","s":"4","p":"91%","k":"5","star":1},
    {"n":"Haaland","f":"Erling Haaland","t":"MCI #9","r":"8.5","g":"2","s":"3","p":"78%","k":"1","star":1},
    {"n":"Ronaldo","f":"Cristiano Ronaldo","t":"NSR #7","r":"9.1","g":"3","s":"6","p":"82%","k":"3","star":1},
    {"n":"Yamal","f":"Lamine Yamal","t":"BAR #19","r":"8.7","g":"1","s":"3","p":"87%","k":"4","star":1},
    {"n":"Vinicius","f":"Vinicius Jr","t":"REAL #7","r":"8.8","g":"1","s":"4","p":"85%","k":"4","star":1},
    {"n":"Salah","f":"Mohamed Salah","t":"LIV #11","r":"8.6","g":"1","s":"4","p":"81%","k":"2","star":1},
    {"n":"Saka","f":"Bukayo Saka","t":"ARS #7","r":"8.4","g":"1","s":"3","p":"84%","k":"3","star":1},
    {"n":"Haller","f":"Sebastien Haller","t":"DOR #9","r":"7.9","g":"1","s":"2","p":"74%","k":"1","star":0},
    {"n":"Lookman","f":"Ademola Lookman","t":"ATA #11","r":"8.5","g":"2","s":"3","p":"80%","k":"2","star":0},
    {"n":"Osimhen","f":"Victor Osimhen","t":"GAL #45","r":"8.6","g":"2","s":"4","p":"72%","k":"1","star":0},
    {"n":"Leao","f":"Rafael Leao","t":"MIL #10","r":"8.2","g":"1","s":"3","p":"79%","k":"2","star":0},
    {"n":"Kvara","f":"Khvicha Kvara","t":"NAP #77","r":"8.3","g":"1","s":"2","p":"81%","k":"3","star":0},
    {"n":"Foden","f":"Phil Foden","t":"MCI #47","r":"8.5","g":"1","s":"3","p":"88%","k":"3","star":0},
    {"n":"Palmer","f":"Cole Palmer","t":"CHE #20","r":"8.4","g":"2","s":"4","p":"83%","k":"2","star":0},
    {"n":"Drogba","f":"Didier Drogba","t":"CIV LEG","r":"9.5","g":"3","s":"5","p":"77%","k":"2","star":0},
    {"n":"Yaya","f":"Yaya Toure","t":"CIV LEG","r":"9.2","g":"1","s":"2","p":"90%","k":"4","star":0},
    {"n":"Pepe","f":"Nicolas Pepe","t":"VIL #19","r":"7.8","g":"1","s":"2","p":"78%","k":"1","star":0},
    {"n":"Zaha","f":"Wilfried Zaha","t":"GAL #14","r":"8.0","g":"1","s":"3","p":"80%","k":"2","star":0},
    {"n":"Adingra","f":"Simon Adingra","t":"BHA #24","r":"7.9","g":"1","s":"2","p":"76%","k":"1","star":0},
  ];

  void open(Map p){
    showModalBottomSheet(context: context, isScrollControlled: true, backgroundColor: Colors.transparent,
      builder: (_) => Container(height: 500, padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: const Color(0xFF121A12), borderRadius: const BorderRadius.vertical(top: Radius.circular(20)), border: Border.all(color: const Color(0xFF7CFF7C))),
        child: Column(children: [
          Text(p['f'], style: const TextStyle(fontSize:22,fontWeight:FontWeight.bold,color:Color(0xFF7CFF7C))),
          const SizedBox(height:10),
          Text("${p['t']} • NOTE ${p['r']}", style: const TextStyle(color:Colors.white)),
          const SizedBox(height:20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            _b("BUTS",p['g']), _b("TIRS",p['s']), _b("PASSES",p['p']), _b("KEY",p['k']),
          ]),
          const SizedBox(height:20),
          ElevatedButton(onPressed: ()=>Navigator.pop(context), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF7CFF7C)), child: const Text("FERMER", style: TextStyle(color:Colors.black)))
        ]),
      ));
  }
  Widget _b(String t,String v)=>Column(children:[Text(t,style: const TextStyle(color:Colors.white54,fontSize:10)), Text(v,style: const TextStyle(color:Color(0xFF7CFF7C),fontSize:18,fontWeight:FontWeight.bold))]);

  @override Widget build(BuildContext context){
    var stars=all.where((e)=>e['star']==1).toList();
    var list=all.where((e)=>e['n'].toString().toLowerCase().contains(q.toLowerCase())).toList();
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E0A),
      appBar: AppBar(backgroundColor: const Color(0xFF141A14), title: const Text("ANALYSTA - 100 JOUEURS", style: TextStyle(color:Color(0xFF7CFF7C),fontSize:12,fontWeight:FontWeight.bold))),
      body: ListView(padding: const EdgeInsets.all(12), children: [
        const Text("⭐ STARS - CLIC DIRECT", style: TextStyle(color:Color(0xFF7CFF7C),fontWeight:FontWeight.bold)),
        const SizedBox(height:8),
        SizedBox(height:110, child: ListView(scrollDirection: Axis.horizontal, children: stars.map((p)=>GestureDetector(onTap: ()=>open(p), child: Container(width:80, margin: const EdgeInsets.only(right:8), decoration: BoxDecoration(color: const Color(0xFF141A14), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFF7CFF7C))), child: Column(mainAxisAlignment: MainAxisAlignment.center, children:[CircleAvatar(backgroundColor: const Color(0xFF1E2E1E), child: Text(p['n'][0], style: const TextStyle(color:Color(0xFF7CFF7C)))), Text(p['n'], style: const TextStyle(color:Colors.white,fontSize:10)), Container(padding: const EdgeInsets.symmetric(horizontal:6,vertical:2), decoration: BoxDecoration(color: const Color(0xFF7CFF7C), borderRadius: BorderRadius.circular(6)), child: Text(p['r'], style: const TextStyle(color:Colors.black,fontSize:10,fontWeight:FontWeight.bold)))])))).toList())),
        const SizedBox(height:12),
        TextField(onChanged: (v)=>setState(()=>q=v), style: const TextStyle(color:Colors.white), decoration: InputDecoration(hintText:"Chercher joueur...", hintStyle: const TextStyle(color:Colors.white38), prefixIcon: const Icon(Icons.search,color:Color(0xFF7CFF7C)), filled:true, fillColor: const Color(0xFF141A14), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
        const SizedBox(height:12),
       ...list.map((p)=>GestureDetector(onTap: ()=>open(p), child: Container(margin: const EdgeInsets.only(bottom:8), padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: const Color(0xFF141A14), borderRadius: BorderRadius.circular(12)), child: Row(children:[CircleAvatar(backgroundColor: const Color(0xFF1E2E1E), child: Text(p['n'][0], style: const TextStyle(color:Color(0xFF7CFF7C)))), const SizedBox(width:10), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children:[Text(p['n'], style: const TextStyle(color:Colors.white,fontWeight:FontWeight.bold)), Text(p['t'], style: const TextStyle(color:Colors.white54,fontSize:10))])), Text(p['r'], style: const TextStyle(color:Color(0xFF7CFF7C),fontWeight:FontWeight.bold))])))),
      ]),
    );
  }
}
