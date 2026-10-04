import 'package:flutter/material.dart';
void main()=> runApp(const MaterialApp(debugShowCheckedModeBanner:false, home: Analysta()));

class Analysta extends StatefulWidget { const Analysta({super.key}); @override State<Analysta> createState()=> _AnalystaState(); }

class _AnalystaState extends State<Analysta>{
  String search="";
  final stars = [
    {"name":"Erling Haaland","team":"MCI #9","r":"8.5","g":"2","s":"3","xg":"0.78","xa":"0.70","p":"78%","k":"1","d":"1/1","t":"28"},
    {"name":"Kylian Mbappé","team":"RMA #9","r":"9.0","g":"2","s":"5","xg":"1.10","xa":"0.45","p":"82%","k":"3","d":"4/6","t":"45"},
    {"name":"Lionel Messi","team":"MIA #10","r":"9.3","g":"2","s":"4","xg":"0.89","xa":"1.12","p":"91%","k":"5","d":"4/5","t":"67"},
    {"name":"Cristiano Ronaldo","team":"NSR #7","r":"9.1","g":"3","s":"6","xg":"1.22","xa":"0.45","p":"82%","k":"3","d":"2/3","t":"41"},
    {"name":"Lamine Yamal","team":"BAR #19","r":"8.7","g":"1","s":"3","xg":"0.45","xa":"0.88","p":"87%","k":"4","d":"5/7","t":"52"},
    {"name":"Vinicius Jr","team":"RMA #7","r":"8.8","g":"1","s":"4","xg":"0.65","xa":"0.92","p":"85%","k":"4","d":"5/7","t":"51"},
    {"name":"Mohamed Salah","team":"LIV #11","r":"8.6","g":"1","s":"4","xg":"0.71","xa":"0.55","p":"81%","k":"2","d":"3/5","t":"49"},
    {"name":"Victor Osimhen","team":"GAL #45","r":"8.6","g":"2","s":"4","xg":"0.98","xa":"0.21","p":"72%","k":"1","d":"2/3","t":"32"},
  ];
  
  final others = [
    {"name":"Sebastien Haller","team":"DOR #9","r":"7.9","g":"1","s":"2","xg":"0.56","xa":"0.12","p":"74%","k":"1","d":"1/2","t":"29"},
    {"name":"Ademola Lookman","team":"ATA #11","r":"8.5","g":"2","s":"3","xg":"0.82","xa":"0.45","p":"80%","k":"2","d":"3/4","t":"44"},
    {"name":"Mohammed Kudus","team":"WHU #14","r":"8.3","g":"1","s":"3","xg":"0.48","xa":"0.62","p":"83%","k":"2","d":"4/6","t":"48"},
    {"name":"Achraf Hakimi","team":"PSG #2","r":"8.2","g":"0","s":"1","xg":"0.08","xa":"0.72","p":"87%","k":"2","d":"2/3","t":"71"},
    {"name":"Riyad Mahrez","team":"AHL #7","r":"8.1","g":"1","s":"2","xg":"0.35","xa":"0.85","p":"86%","k":"3","d":"3/5","t":"52"},
    {"name":"Sadio Mané","team":"NSR #10","r":"8.0","g":"1","s":"3","xg":"0.52","xa":"0.41","p":"80%","k":"2","d":"2/4","t":"46"},
    {"name":"Victor Boniface","team":"LEV #22","r":"8.4","g":"1","s":"4","xg":"0.88","xa":"0.33","p":"76%","k":"1","d":"2/3","t":"38"},
    {"name":"Bukayo Saka","team":"ARS #7","r":"8.4","g":"1","s":"3","xg":"0.52","xa":"0.78","p":"84%","k":"3","d":"2/4","t":"54"},
  ];

  void open(Map p){
    showModalBottomSheet(context: context, isScrollControlled:true, backgroundColor:Colors.transparent,
      builder: (_)=> DraggableScrollableSheet(initialChildSize:0.9, maxChildSize:0.95, minChildSize:0.6,
        builder: (_,ctrl)=> Container(
          decoration: BoxDecoration(color:const Color(0xFF121A12), borderRadius:const BorderRadius.vertical(top:Radius.circular(20)), border:Border.all(color:const Color(0xFF7CFF7C),width:1.2)),
          child: ListView(controller:ctrl, padding:const EdgeInsets.all(16), children:[
            Row(mainAxisAlignment:MainAxisAlignment.spaceBetween, children:[Container(padding:const EdgeInsets.symmetric(horizontal:12,vertical:6), decoration:BoxDecoration(color:const Color(0xFF1E2E1E), borderRadius:BorderRadius.circular(20), border:Border.all(color:const Color(0xFF7CFF7C))), child:const Row(children:[Icon(Icons.auto_awesome,color:Color(0xFF7CFF7C),size:16),SizedBox(width:6),Text("PLAYER FOCUS",style:TextStyle(color:Color(0xFF7CFF7C),fontWeight:FontWeight.bold,fontSize:12))])), GestureDetector(onTap:()=>Navigator.pop(context), child:Container(padding:const EdgeInsets.all(6), decoration:const BoxDecoration(color:Colors.white12,shape:BoxShape.circle), child:const Icon(Icons.close,size:18)))]),
            const SizedBox(height:12),
            Container(height:180, decoration:BoxDecoration(borderRadius:BorderRadius.circular(16), color:const Color(0xFF1A2A1A), border:Border.all(color:const Color(0xFF7CFF7C).withOpacity(0.3))), child:Row(children:[
              const SizedBox(width:16),
              Column(crossAxisAlignment:CrossAxisAlignment.start, mainAxisAlignment:MainAxisAlignment.center, children:[
                Container(padding:const EdgeInsets.symmetric(horizontal:8,vertical:3), decoration:BoxDecoration(color:const Color(0xFF1E2E1E), borderRadius:BorderRadius.circular(12)), child:Text(p['team'],style:const TextStyle(fontSize:11,color:Color(0xFF7CFF7C)))),
                const SizedBox(height:8), Text(p['name'],style:const TextStyle(fontSize:22,fontWeight:FontWeight.bold,color:Color(0xFF7CFF7C),height:1.1)),
                const SizedBox(height:10), Row(children:[Text(p['r'],style:const TextStyle(fontSize:52,fontWeight:FontWeight.bold,color:Color(0xFF7CFF7C),height:1)), const SizedBox(width:6), Container(padding:const EdgeInsets.symmetric(horizontal:8,vertical:3), decoration:BoxDecoration(color:const Color(0xFF7CFF7C),borderRadius:BorderRadius.circular(12)), child:const Text("MOTM",style:TextStyle(color:Colors.black,fontWeight:FontWeight.bold,fontSize:10)))]),
              ]),
              const Spacer(),
              Container(width:130,height:170, decoration:BoxDecoration(color:const Color(0xFF1E2E1E), borderRadius:BorderRadius.circular(12), border:Border.all(color:const Color(0xFF7CFF7C).withOpacity(0.5))), child:Column(mainAxisAlignment:MainAxisAlignment.center, children:[const Icon(Icons.person,size:60,color:Color(0xFF7CFF7C)), Text(p['name'].split(' ').last.toUpperCase(),style:const TextStyle(color:Color(0xFF7CFF7C),fontWeight:FontWeight.bold,fontSize:12)), Text(p['team'],style:const TextStyle(color:Colors.white54,fontSize:10))])),
              const SizedBox(width:10),
            ])),
            const SizedBox(height:14),
            GridView.count(crossAxisCount:4, shrinkWrap:true, physics:const NeverScrollableScrollPhysics(), mainAxisSpacing:8, crossAxisSpacing:8, childAspectRatio:0.85, children:[
              _c("GOALS",p['g']), _c("SHOTS",p['s']), _c("xG",p['xg']), _c("xA",p['xa']), _c("PASSES",p['p']), _c("KEY PASSES",p['k']), _c("DRIBBLES",p['d']), _c("TOUCHES",p['t']),
            ]),
            const SizedBox(height:12),
            Container(padding:const EdgeInsets.all(14), decoration:BoxDecoration(color:const Color(0xFF0F150F), borderRadius:BorderRadius.circular(14), border:Border.all(color:const Color(0xFF7CFF7C).withOpacity(0.4))), child:Column(crossAxisAlignment:CrossAxisAlignment.start, children:[
              const Text("PLAYER DETAILED STATS",style:TextStyle(color:Color(0xFF7CFF7C),fontWeight:FontWeight.bold,fontSize:13)),
              const SizedBox(height:12), _b("Attack","Expected Goals (xG)",p['xg'],double.tryParse(p['xg'])??0.7), _b("","Goal Conversion","67%",0.67), _b("Passing","Pass Accuracy",p['p'],0.78),
            ])),
          ]),
        ),
      ),
    );
  }

  Widget _c(String t,String v)=> Container(decoration:BoxDecoration(color:const Color(0xFF1A251A), borderRadius:BorderRadius.circular(10), border:Border.all(color:const Color(0xFF7CFF7C).withOpacity(0.6))), child:Column(mainAxisAlignment:MainAxisAlignment.center, children:[const Icon(Icons.sports_soccer,color:Color(0xFF7CFF7C),size:18), const SizedBox(height:4), Text(t,style:const TextStyle(fontSize:7,color:Colors.grey,fontWeight:FontWeight.bold)), Text(v,style:const TextStyle(fontSize:15,fontWeight:FontWeight.bold,color:Color(0xFF7CFF7C)))]));
  Widget _b(String sec,String lab,String val,double pct)=> Column(crossAxisAlignment:CrossAxisAlignment.start, children:[if(sec.isNotEmpty) Text(sec,style:const TextStyle(color:Color(0xFF7CFF7C),fontSize:11,fontWeight:FontWeight.bold)), Row(mainAxisAlignment:MainAxisAlignment.spaceBetween, children:[Text(lab,style:const TextStyle(fontSize:11)), Text(val,style:const TextStyle(fontSize:11,fontWeight:FontWeight.bold))]), const SizedBox(height:4), ClipRRect(borderRadius:BorderRadius.circular(10), child:LinearProgressIndicator(value:pct.clamp(0,1), backgroundColor:Colors.white12, color:const Color(0xFF7CFF7C), minHeight:6)), const SizedBox(height:8)]);

  @override
  Widget build(BuildContext context){
    final filt = others.where((p)=> p['name'].toString().toLowerCase().contains(search.toLowerCase())).toList();
    return Scaffold(
      backgroundColor:const Color(0xFF0A0E0A),
      appBar: AppBar(backgroundColor:const Color(0xFF141A14), title:const Text("ANALYSTA",style:TextStyle(color:Color(0xFF7CFF7C),fontWeight:FontWeight.bold,letterSpacing:2)), centerTitle:true),
      body: ListView(padding:const EdgeInsets.all(12), children:[
        const Text("⭐ STARS - CONNUS DIRECT",style:TextStyle(color:Color(0xFF7CFF7C),fontWeight:FontWeight.bold,fontSize:13)),
        const SizedBox(height:8),
        SizedBox(height:110, child:ListView(scrollDirection:Axis.horizontal, children: stars.map((p)=> GestureDetector(onTap:()=>open(p), child:Container(width:85, margin:const EdgeInsets.only(right:10), decoration:BoxDecoration(color:const Color(0xFF141A14), borderRadius:BorderRadius.circular(12), border:Border.all(color:const Color(0xFF7CFF7C).withOpacity(0.5))), child:Column(mainAxisAlignment:MainAxisAlignment.center, children:[Container(width:50,height:50, decoration:BoxDecoration(shape:BoxShape.circle, color:const Color(0xFF1E2E1E), border:Border.all(color:const Color(0xFF7CFF7C))), child:const Icon(Icons.person,color:Color(0xFF7CFF7C))), const SizedBox(height:6), Text(p['name'].toString().split(' ').last,style:const TextStyle(fontSize:10,fontWeight:FontWeight.bold),overflow:TextOverflow.ellipsis), Container(padding:const EdgeInsets.symmetric(horizontal:6,vertical:2), decoration:BoxDecoration(color:const Color(0xFF7CFF7C),borderRadius:BorderRadius.circular(6)), child:Text(p['r'].toString(),style:const TextStyle(color:Colors.black,fontSize:9,fontWeight:FontWeight.bold)))])))).toList())),
        const SizedBox(height:16),
        TextField(onChanged:(v)=>setState(()=>search=v), decoration:InputDecoration(hintText:"Cherche les autres pas trop connus...", prefixIcon:const Icon(Icons.search,color:Color(0xFF7CFF7C)), filled:true, fillColor:const Color(0xFF141A14), border:OutlineInputBorder(borderRadius:BorderRadius.circular(12), borderSide:BorderSide(color:const Color(0xFF7CFF7C).withOpacity(0.3))), enabledBorder:OutlineInputBorder(borderRadius:BorderRadius.circular(12), borderSide:BorderSide(color:const Color(0xFF7CFF7C).withOpacity(0.3))))),
        const SizedBox(height:8), Text("🌍 AUTRES JOUEURS - ${filt.length} trouvés",style:const TextStyle(color:Colors.grey,fontSize:11)),
        const SizedBox(height:8),
        ...filt.map((p)=> GestureDetector(onTap:()=>open(p), child:Container(margin:const EdgeInsets.only(bottom:8), padding:const EdgeInsets.all(10), decoration:BoxDecoration(color:const Color(0xFF141A14), borderRadius:BorderRadius.circular(12), border:Border.all(color:const Color(0xFF7CFF7C).withOpacity(0.25))), child:Row(children:[Container(width:40,height:40, decoration:BoxDecoration(shape:BoxShape.circle, color:const Color(0xFF1E2E1E), border:Border.all(color:const Color(0xFF7CFF7C))), child:const Icon(Icons.person,size:20,color:Color(0xFF7CFF7C))), const SizedBox(width:10), Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start, children:[Text(p['name'].toString(),style:const TextStyle(fontWeight:FontWeight.bold,fontSize:13)), Text("${p['team']} • ${p['g']} GOALS • Tap to view →",style:const TextStyle(color:Colors.grey,fontSize:10))])), Container(padding:const EdgeInsets.symmetric(horizontal:8,vertical:4), decoration:BoxDecoration(color:const Color(0xFF7CFF7C),borderRadius:BorderRadius.circular(8)), child:Text(p['r'].toString(),style:const TextStyle(color:Colors.black,fontWeight:FontWeight.bold)))])))),
      ]),
    );
  }
}
