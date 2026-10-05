import 'package:flutter/material.dart';
void main()=> runApp(const MaterialApp(debugShowCheckedModeBanner:false, home: Analysta()));

class Analysta extends StatefulWidget { const Analysta({super.key}); @override State<Analysta> createState()=> _AnalystaState(); }

class _AnalystaState extends State<Analysta> {
  String search="";
  final List<Map<String,dynamic>> all = [
    {"name":"Erling Haaland","team":"MAN CITY #9","r":"8.5","g":"2","s":"3","xg":"0.78","xa":"0.70","p":"78%","k":"1","d":"1/1","t":"28","star":true},
    {"name":"Kylian Mbappe","team":"REAL #9","r":"9.0","g":"2","s":"5","xg":"1.10","xa":"0.45","p":"82%","k":"3","d":"4/6","t":"45","star":true},
    {"name":"Lionel Messi","team":"MIAMI #10","r":"9.3","g":"2","s":"4","xg":"0.89","xa":"1.12","p":"91%","k":"5","d":"4/5","t":"67","star":true},
    {"name":"Cristiano Ronaldo","team":"NSR #7","r":"9.1","g":"3","s":"6","xg":"1.22","xa":"0.45","p":"82%","k":"3","d":"2/3","t":"41","star":true},
    {"name":"Vinicius Jr","team":"REAL #7","r":"8.8","g":"1","s":"4","xg":"0.65","xa":"0.92","p":"85%","k":"4","d":"5/7","t":"51","star":true},
    {"name":"Lamine Yamal","team":"BARCA #19","r":"8.7","g":"1","s":"3","xg":"0.45","xa":"0.88","p":"87%","k":"4","d":"5/7","t":"52","star":true},
    {"name":"Mohamed Salah","team":"LIV #11","r":"8.6","g":"1","s":"4","xg":"0.71","xa":"0.55","p":"81%","k":"2","d":"3/5","t":"49","star":true},
    {"name":"Victor Osimhen","team":"GALATA #45","r":"8.6","g":"2","s":"4","xg":"0.98","xa":"0.21","p":"72%","k":"1","d":"2/3","t":"32","star":true},
    {"name":"Bukayo Saka","team":"ARS #7","r":"8.4","g":"1","s":"3","xg":"0.52","xa":"0.78","p":"84%","k":"3","d":"2/4","t":"54","star":true},
    {"name":"Jude Bellingham","team":"REAL #5","r":"8.7","g":"1","s":"2","xg":"0.42","xa":"0.88","p":"89%","k":"3","d":"2/3","t":"67","star":true},
    {"name":"Sebastien Haller","team":"DORT #9","r":"7.9","g":"1","s":"2","xg":"0.56","xa":"0.12","p":"74%","k":"1","d":"1/2","t":"29","star":false},
    {"name":"Ademola Lookman","team":"ATA #11","r":"8.5","g":"2","s":"3","xg":"0.82","xa":"0.45","p":"80%","k":"2","d":"3/4","t":"44","star":false},
    {"name":"Kudus","team":"WHU #14","r":"8.3","g":"1","s":"3","xg":"0.48","xa":"0.62","p":"83%","k":"2","d":"4/6","t":"48","star":false},
    {"name":"Achraf Hakimi","team":"PSG #2","r":"8.2","g":"0","s":"1","xg":"0.08","xa":"0.72","p":"87%","k":"2","d":"2/3","t":"71","star":false},
  ];

  List<Map<String,dynamic>> get hundred {
    final extra=["Leao","Kvara","Musiala","Wirtz","Pedri","Gavi","Lewandowski","Griezmann","Dembele","Odegaard","Rice","Palmer","Martinelli","Son","Kane","Rashford","Bruno","Lautaro","Alvarez","Vlahovic","Nico Williams","Zaha","Pepe","Adingra","Kessie","Bissouma","Caicedo","Onana","Mendy","Koulibaly","Drogba","Etoo","Aubameyang","Ziyech","Amrabat","Partey","Sarr","Jackson","Diaby","Olise","Eze","Bowen","Mitoma","Mbeumo","Isak","Watkins","Jesus","Havertz","Giroud","Benzema","Modric","Kroos","Valverde","Courtois","Alisson","Ederson","Van Dijk","Saliba","Araujo","Rudiger","Davies","Cancelo","Walker","James","Theo","Frimpong","Kim","De Ligt","Bastoni","Upamecano","Varane","Gabriel","White","Zinchenko","Chilwell","Tchouameni","Kounde","Martinez","Casemiro","Arnold","Saka","Foden","Rodri","Bernardo","Foden","Osimhen","Boniface","Mahrez","Mane","Salah","Sangare","Diakite","Pepe","Zaha"];
    var list=List<Map<String,dynamic>>.from(all);
    for(int i=0;i<extra.length && list.length<100;i++){ list.add({"name":extra[i],"team":"WORLD #${10+i}","r":"${(7.5+i%15/10).toStringAsFixed(1)}","g":"${i%3}","s":"${2+i%4}","xg":"0.${30+i%70}","xa":"0.${20+i%60}","p":"${75+i%15}%","k":"${1+i%4}","d":"${1+i%3}/${2+i%4}","t":"${30+i%40}","star":false}); }
    return list;
  }

  void open(Map p){
    showModalBottomSheet(context: context, isScrollControlled:true, backgroundColor:Colors.transparent,
      builder: (_)=> DraggableScrollableSheet(initialChildSize:0.92, maxChildSize:0.95, minChildSize:0.6,
        builder: (_,ctrl)=> Container(decoration: BoxDecoration(color: const Color(0xFF121A12), borderRadius: const BorderRadius.vertical(top:Radius.circular(20)), border: Border.all(color: const Color(0xFF7CFF7C),width:1.5)),
          child: ListView(controller: ctrl, padding: const EdgeInsets.all(16), children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Container(padding: const EdgeInsets.symmetric(horizontal:12,vertical:6), decoration: BoxDecoration(color: const Color(0xFF1E2E1E), borderRadius: BorderRadius.circular(20), border: Border.all(color: const Color(0xFF7CFF7C))), child: const Row(children: [Icon(Icons.auto_awesome,color:Color(0xFF7CFF7C),size:16),SizedBox(width:6),Text("PLAYER FOCUS",style:TextStyle(color:Color(0xFF7CFF7C),fontWeight:FontWeight.bold,fontSize:12))])), GestureDetector(onTap: ()=>Navigator.pop(context), child: Container(padding: const EdgeInsets.all(6), decoration: const BoxDecoration(color:Colors.white12,shape:BoxShape.circle), child: const Icon(Icons.close,size:18,color:Colors.white)))]),
            const SizedBox(height:12),
            Container(height:185, decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: const Color(0xFF1A2A1A), border: Border.all(color: const Color(0xFF7CFF7C).withOpacity(0.4))), child: Row(children: [const SizedBox(width:16), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [Container(padding: const EdgeInsets.symmetric(horizontal:8,vertical:3), decoration: BoxDecoration(color: const Color(0xFF1E2E1E), borderRadius: BorderRadius.circular(12)), child: Text(p['team'],style: const TextStyle(fontSize:11,color:Color(0xFF7CFF7C),fontWeight:FontWeight.bold))), const SizedBox(height:8), Text(p['name'],style: const TextStyle(fontSize:22,fontWeight:FontWeight.bold,color:Color(0xFF7CFF7C))), const SizedBox(height:10), Row(children: [Text(p['r'],style: const TextStyle(fontSize:52,fontWeight:FontWeight.bold,color:Color(0xFF7CFF7C))), const SizedBox(width:6), Container(padding: const EdgeInsets.symmetric(horizontal:8,vertical:3), decoration: BoxDecoration(color: const Color(0xFF7CFF7C), borderRadius: BorderRadius.circular(12)), child: const Text("MOTM",style:TextStyle(color:Colors.black,fontWeight:FontWeight.bold,fontSize:10)))])])), Container(width:110,height:140, decoration: BoxDecoration(color: const Color(0xFF1E2E1E), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFF7CFF7C).withOpacity(0.6))), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [CircleAvatar(radius:32, backgroundColor: const Color(0xFF7CFF7C).withOpacity(0.2), child: Text(p['name'][0],style: const TextStyle(fontSize:28,fontWeight:FontWeight.bold,color:Color(0xFF7CFF7C)))), const SizedBox(height:8), Text(p['name'].toString().split(' ').last.toUpperCase(),style: const TextStyle(color:Color(0xFF7CFF7C),fontWeight:FontWeight.bold,fontSize:10),textAlign:TextAlign.center)])), const SizedBox(width:12)])),
            const SizedBox(height:14),
            GridView.count(crossAxisCount:4, shrinkWrap:true, physics: const NeverScrollableScrollPhysics(), mainAxisSpacing:8, crossAxisSpacing:8, childAspectRatio:0.85, children: [_c("GOALS",p['g']), _c("SHOTS",p['s']), _c("xG",p['xg']), _c("xA",p['xa']), _c("PASSES",p['p']), _c("KEY",p['k']), _c("DRIBBLES",p['d']), _c("TOUCHES",p['t'])]),
          ]),
        ),
      ),
    );
  }
  Widget _c(String t,String v)=> Container(decoration: BoxDecoration(color: const Color(0xFF1A251A), borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color(0xFF7CFF7C).withOpacity(0.6))), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [const Icon(Icons.sports_soccer,color:Color(0xFF7CFF7C),size:18), const SizedBox(height:4), Text(t,style: const TextStyle(fontSize:7,color:Colors.white54,fontWeight:FontWeight.bold),textAlign:TextAlign.center), Text(v,style: const TextStyle(fontSize:15,fontWeight:FontWeight.bold,color:Color(0xFF7CFF7C)))]));
  @override
  Widget build(BuildContext context){
    final stars=hundred.where((p)=>p['star']==true).toList();
    final others=hundred.where((p)=>p['star']==false && p['name'].toString().toLowerCase().contains(search.toLowerCase())).toList();
    return Scaffold(backgroundColor: const Color(0xFF0A0E0A), appBar: AppBar(backgroundColor: const Color(0xFF141A14), title: const Text("ANALYSTA - 100 JOUEURS",style:TextStyle(color:Color(0xFF7CFF7C),fontWeight:FontWeight.bold,fontSize:13,letterSpacing:1.2)), centerTitle:true),
      body: ListView(padding: const EdgeInsets.all(12), children: [
        const Text("⭐ STARS - CONNUS DIRECT",style:TextStyle(color:Color(0xFF7CFF7C),fontWeight:FontWeight.bold,fontSize:12)),
        const SizedBox(height:10),
        SizedBox(height:125, child: ListView(scrollDirection: Axis.horizontal, children: stars.map((p)=> GestureDetector(onTap: ()=>open(p), child: Container(width:88, margin: const EdgeInsets.only(right:10), decoration: BoxDecoration(color: const Color(0xFF141A14), borderRadius: BorderRadius.circular(14), border: Border.all(color: const Color(0xFF7CFF7C).withOpacity(0.5))), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [CircleAvatar(radius:27, backgroundColor: const Color(0xFF1E2E1E), child: Text(p['name'][0],style: const TextStyle(color:Color(0xFF7CFF7C),fontWeight:FontWeight.bold,fontSize:20))), const SizedBox(height:6), Text(p['name'].toString().split(' ').last,style: const TextStyle(fontSize:10,fontWeight:FontWeight.bold,color:Colors.white),overflow:TextOverflow.ellipsis), const SizedBox(height:3), Container(padding: const EdgeInsets.symmetric(horizontal:8,vertical:3), decoration: BoxDecoration(color: const Color(0xFF7CFF7C), borderRadius: BorderRadius.circular(6)), child: Text(p['r'].toString(),style: const TextStyle(color:Colors.black,fontSize:10,fontWeight:FontWeight.bold)))])))).toList())),
        const SizedBox(height:18),
        TextField(onChanged: (v)=>setState(()=>search=v), style: const TextStyle(color:Colors.white), decoration: InputDecoration(hintText: "Cherche les 90 autres...", hintStyle: TextStyle(color:Colors.white.withOpacity(0.4)), prefixIcon: const Icon(Icons.search,color:Color(0xFF7CFF7C)), filled:true, fillColor: const Color(0xFF141A14), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: const Color(0xFF7CFF7C).withOpacity(0.3))), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: const Color(0xFF7CFF7C).withOpacity(0.3))))),
        const SizedBox(height:10), Text("🌍 AUTRES - ${others.length} / 90",style: const TextStyle(color:Colors.white54,fontSize:11,fontWeight:FontWeight.bold)),
        const SizedBox(height:8),
       ...others.map((p)=> GestureDetector(onTap: ()=>open(p), child: Container(margin: const EdgeInsets.only(bottom:8), padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: const Color(0xFF141A14), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFF7CFF7C).withOpacity(0.25))), child: Row(children: [CircleAvatar(radius:20, backgroundColor: const Color(0xFF1E2E1E), child: Text(p['name'][0],style: const TextStyle(color:Color(0xFF7CFF7C),fontWeight:FontWeight.bold))), const SizedBox(width:10), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(p['name'].toString(),style: const TextStyle(fontWeight:FontWeight.bold,fontSize:12,color:Colors.white)), Text("${p['team']} • ${p['g']} GOALS • Tap →",style: const TextStyle(color:Colors.white54,fontSize:10))])), Container(padding: const EdgeInsets.symmetric(horizontal:10,vertical:5), decoration: BoxDecoration(color: const Color(0xFF7CFF7C), borderRadius: BorderRadius.circular(8)), child: Text(p['r'].toString(),style: const TextStyle(color:Colors.black,fontWeight:FontWeight.bold)))])))),
      ]),
    );
  }
}
