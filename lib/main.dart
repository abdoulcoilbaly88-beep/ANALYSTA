import 'package:flutter/material.dart';
void main()=>runApp(const AnalystaApp());
class AnalystaApp extends StatelessWidget{
const AnalystaApp({super.key});
@override
Widget build(BuildContext context){
return MaterialApp(debugShowCheckedModeBanner:false,theme:ThemeData.dark().copyWith(scaffoldBackgroundColor:const Color(0xFF101010)),home:const Home());
}
}
class Home extends StatefulWidget{
const Home({super.key});
@override
State<Home>createState()=>_HomeState();
}
class _HomeState extends State<Home>{
int index=0;
void openMatch(String h,String a,String s){
Navigator.push(context,MaterialPageRoute(builder:(_)=>DetailMatch(domicile:h,exterieur:a,score:s)));
}
Widget carte(String h,String a,String s,String t,bool live){
return GestureDetector(onTap:()=>openMatch(h,a,s),child:Container(margin:const EdgeInsets.only(bottom:12),padding:const EdgeInsets.all(16),decoration:BoxDecoration(color:const Color(0xFF1E1E1E),borderRadius:BorderRadius.circular(16),border:Border.all(color:live?const Color(0xFF1DB680):Colors.transparent)),child:Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Row(children:[const Icon(Icons.shield,size:18),const SizedBox(width:8),Text(h,style:const TextStyle(fontWeight:FontWeight.bold))]),const SizedBox(height:10),Row(children:[const Icon(Icons.shield_outlined,size:18),const SizedBox(width:8),Text(a,style:const TextStyle(fontWeight:FontWeight.bold))])]),Column(children:[Text(s,style:const TextStyle(fontSize:20,fontWeight:FontWeight.bold)),Container(margin:const EdgeInsets.only(top:4),padding:const EdgeInsets.symmetric(horizontal:8,vertical:2),decoration:BoxDecoration(color:live?Colors.red:Colors.grey[800],borderRadius:BorderRadius.circular(8)),child:Text(t,style:const TextStyle(fontSize:12)))])])));
}
Widget matchs(){
return ListView(padding:const EdgeInsets.all(12),children:[carte("Man City","Arsenal","2 - 1","78'",true),carte("Real Madrid","Barcelone","0 - 0","Mi-temps",true),carte("PSG","Marseille","3 - 0","Terminé",false),carte("Bayern","Dortmund","1 - 2","65'",true),carte("Inter","AC Milan","1 - 1","45'",true)]);
}
@override
Widget build(BuildContext context){
final pages=[matchs(),const Center(child:Text("⭐ Favoris bientôt")),const Center(child:Text("🌍 Explorer bientôt")),const Center(child:Text("🔄 Transferts bientôt")),const Center(child:Text("ANALYSTA v1.0\nPar Enock\n100% Made in Abidjan"))];
return Scaffold(appBar:AppBar(title:const Text("ANALYSTA",style:TextStyle(fontWeight:FontWeight.bold,letterSpacing:2)),backgroundColor:const Color(0xFF1E1E1E),centerTitle:true),body:pages[index],bottomNavigationBar:BottomNavigationBar(currentIndex:index,onTap:(v)=>setState(()=>index=v),type:BottomNavigationBarType.fixed,backgroundColor:const Color(0xFF1E1E1E),selectedItemColor:const Color(0xFF1DB680),unselectedItemColor:Colors.grey,items:const[BottomNavigationBarItem(icon:Icon(Icons.sports_soccer),label:"Matchs"),BottomNavigationBarItem(icon:Icon(Icons.star),label:"Favoris"),BottomNavigationBarItem(icon:Icon(Icons.explore),label:"Explorer"),BottomNavigationBarItem(icon:Icon(Icons.swap_horiz),label:"Transferts"),BottomNavigationBarItem(icon:Icon(Icons.info),label:"Infos")]));
}
}
class DetailMatch extends StatefulWidget{
final String domicile,exterieur,score;
const DetailMatch({super.key,required this.domicile,required this.exterieur,required this.score});
@override
State<DetailMatch>createState()=>_DetailMatchState();
}
class _DetailMatchState extends State<DetailMatch> with SingleTickerProviderStateMixin{
late TabController tab;
@override
void initState(){super.initState();tab=TabController(length:3,vsync:this);}
Widget ligneStat(String t,String h,String a,double hp){
return Padding(padding:const EdgeInsets.symmetric(vertical:8),child:Column(children:[Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[Text(h,style:const TextStyle(fontWeight:FontWeight.bold)),Text(t,style:const TextStyle(color:Colors.grey,fontSize:12)),Text(a,style:const TextStyle(fontWeight:FontWeight.bold))]),const SizedBox(height:4),Row(children:[Expanded(flex:(hp*100).toInt(),child:Container(height:4,decoration:BoxDecoration(color:const Color(0xFF1DB680),borderRadius:BorderRadius.circular(2)))),Expanded(flex:((1-hp)*100).toInt(),child:Container(height:4,decoration:BoxDecoration(color:Colors.grey[800],borderRadius:BorderRadius.circular(2))))])]));
}
Widget eventTile(String min,String joueur,String equipe,String score,String type){
IconData ic=type=="but"?Icons.sports_soccer:Icons.style;
Color c=type=="but"?Colors.white:type=="jaune"?Colors.yellow:Colors.red;
return Container(margin:const EdgeInsets.only(bottom:12),padding:const EdgeInsets.all(12),decoration:BoxDecoration(color:Colors.black26,borderRadius:BorderRadius.circular(10)),child:Row(children:[
Container(width:45,height:28,decoration:BoxDecoration(color:const Color(0xFF2A2A2A),borderRadius:BorderRadius.circular(20)),child:Center(child:Text(min,style:const TextStyle(fontWeight:FontWeight.bold,fontSize:12)))),
const SizedBox(width:12),
Container(padding:const EdgeInsets.all(6),decoration:BoxDecoration(color:c.withOpacity(type=="but"?0.2:0.9),shape:BoxShape.circle),child:Icon(ic,size:16,color:type=="but"?Colors.white:type=="jaune"?Colors.black:Colors.white)),
const SizedBox(width:12),
Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(joueur,style:const TextStyle(fontWeight:FontWeight.bold)),Text(equipe,style:const TextStyle(color:Colors.grey,fontSize:11))])),
Text(score,style:const TextStyle(fontWeight:FontWeight.bold,color:Color(0xFF1DB680)))
]));
}
@override
Widget build(BuildContext context){
return Scaffold(appBar:AppBar(title:Text("${widget.domicile} vs ${widget.exterieur}"),backgroundColor:const Color(0xFF1E1E1E),bottom:TabBar(controller:tab,labelColor:const Color(0xFF1DB680),unselectedLabelColor:Colors.grey,indicatorColor:const Color(0xFF1DB680),tabs:const[Tab(text:"Résumé"),Tab(text:"Statistiques"),Tab(text:"Compos")])),body:TabBarView(controller:tab,children:[
// RESUME V2 PRO
ListView(padding:const EdgeInsets.all(16),children:[
Container(padding:const EdgeInsets.all(20),decoration:BoxDecoration(color:const Color(0xFF1E1E1E),borderRadius:BorderRadius.circular(16)),child:Column(children:[Row(mainAxisAlignment:MainAxisAlignment.spaceAround,children:[Column(children:[Container(width:60,height:60,decoration:BoxDecoration(color:Colors.blue[800],shape:BoxShape.circle),child:const Icon(Icons.shield,size:35)),const SizedBox(height:8),Text(widget.domicile,style:const TextStyle(fontWeight:FontWeight.bold))]),Column(children:[Text(widget.score,style:const TextStyle(fontSize:36,fontWeight:FontWeight.bold)),Container(margin:const EdgeInsets.only(top:6),padding:const EdgeInsets.symmetric(horizontal:10,vertical:4),decoration:BoxDecoration(color:Colors.red,borderRadius:BorderRadius.circular(20)),child:const Text("78'",style:TextStyle(fontSize:12,fontWeight:FontWeight.bold)))]),Column(children:[Container(width:60,height:60,decoration:BoxDecoration(color:Colors.red[800],shape:BoxShape.circle),child:const Icon(Icons.shield_outlined,size:35)),const SizedBox(height:8),Text(widget.exterieur,style:const TextStyle(fontWeight:FontWeight.bold))])]),const SizedBox(height:20),const Divider(color:Colors.white10),const SizedBox(height:10),const Align(alignment:Alignment.centerLeft,child:Text("FIL DU MATCH",style:TextStyle(fontWeight:FontWeight.bold,letterSpacing:1,color:Color(0xFF1DB680)))),const SizedBox(height:12),
eventTile("23'","Haaland","Man City","1-0","but"),
eventTile("45'","Rice","Arsenal - Faute","","jaune"),
eventTile("55'","Saka","Arsenal","1-1","but"),
eventTile("77'","Foden","Man City","2-1","but"),
eventTile("89'","White","Arsenal - Tacle dangereux","","rouge"),
]))]),
// STATS
ListView(padding:const EdgeInsets.all(16),children:[Container(padding:const EdgeInsets.all(16),decoration:BoxDecoration(color:const Color(0xFF1E1E1E),borderRadius:BorderRadius.circular(12)),child:Column(children:[ligneStat("Possession","58%","42%",0.58),ligneStat("Buts attendus","1.8","0.9",0.66),ligneStat("Tirs","14","8",0.63),ligneStat("Tirs cadrés","6","3",0.66),ligneStat("Corners","7","4",0.63),ligneStat("Attaques dangereuses","52","38",0.57),ligneStat("Fautes","12","15",0.44),ligneStat("Cartons jaunes","2","3",0.4),ligneStat("Cartons rouges","0","1",0.0),ligneStat("Hors-jeu","3","2",0.6)]))]),
// COMPOS
ListView(padding:const EdgeInsets.all(16),children:[Container(padding:const EdgeInsets.all(16),decoration:BoxDecoration(color:const Color(0xFF1E1E1E),borderRadius:BorderRadius.circular(12)),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(widget.domicile,style:const TextStyle(fontWeight:FontWeight.bold,color:Color(0xFF1DB680))),const SizedBox(height:8),const Text("Ederson; Walker, Dias, Stones, Ake; Rodri, De Bruyne, Bernardo; Foden, Haaland, Grealish"),const SizedBox(height:20),Text(widget.exterieur,style:const TextStyle(fontWeight:FontWeight.bold,color:Color(0xFF1DB680))),const SizedBox(height:8),const Text("Raya; White, Saliba, Gabriel, Zinchenko; Rice, Odegaard, Partey; Saka, Jesus, Martinelli")]))]),
]));
}
}
