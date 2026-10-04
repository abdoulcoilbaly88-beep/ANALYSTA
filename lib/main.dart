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
Navigator.push(context,MaterialPageRoute(builder:(_)=>MatchDetail(home:h,away:a,score:s)));
}
Widget card(String h,String a,String s,String t,bool live){
return GestureDetector(
onTap:()=>openMatch(h,a,s),
child:Container(margin:const EdgeInsets.only(bottom:12),padding:const EdgeInsets.all(16),decoration:BoxDecoration(color:const Color(0xFF1E1E1E),borderRadius:BorderRadius.circular(16),border:Border.all(color:live?const Color(0xFF1DB680):Colors.transparent)),child:Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Row(children:[const Icon(Icons.shield,size:18),const SizedBox(width:8),Text(h,style:const TextStyle(fontWeight:FontWeight.bold))]),const SizedBox(height:10),Row(children:[const Icon(Icons.shield_outlined,size:18),const SizedBox(width:8),Text(a,style:const TextStyle(fontWeight:FontWeight.bold))])]),Column(children:[Text(s,style:const TextStyle(fontSize:20,fontWeight:FontWeight.bold)),Container(margin:const EdgeInsets.only(top:4),padding:const EdgeInsets.symmetric(horizontal:8,vertical:2),decoration:BoxDecoration(color:live?Colors.red:Colors.grey[800],borderRadius:BorderRadius.circular(8)),child:Text(t,style:const TextStyle(fontSize:12)))])])));
}
Widget matchs(){
return ListView(padding:const EdgeInsets.all(12),children:[card("Man City","Arsenal","2 - 1","78'",true),card("Real Madrid","Barcelona","0 - 0","MT",true),card("PSG","Marseille","3 - 0","Terminé",false),card("Bayern","Dortmund","1 - 2","65'",true),card("Inter","AC Milan","1 - 1","45'",true)]);
}
@override
Widget build(BuildContext context){
final pages=[matchs(),const Center(child:Text("⭐ Favoris bientôt")),const Center(child:Text("🌍 Explorer bientôt")),const Center(child:Text("🔄 Transferts bientôt")),const Center(child:Text("ANALYSTA v1.0\nPar Enock",textAlign:TextAlign.center))];
return Scaffold(appBar:AppBar(title:const Text("ANALYSTA",style:TextStyle(fontWeight:FontWeight.bold,letterSpacing:2)),backgroundColor:const Color(0xFF1E1E1E),centerTitle:true),body:pages[index],bottomNavigationBar:BottomNavigationBar(currentIndex:index,onTap:(v)=>setState(()=>index=v),type:BottomNavigationBarType.fixed,backgroundColor:const Color(0xFF1E1E1E),selectedItemColor:const Color(0xFF1DB680),unselectedItemColor:Colors.grey,items:const[BottomNavigationBarItem(icon:Icon(Icons.sports_soccer),label:"Matchs"),BottomNavigationBarItem(icon:Icon(Icons.star),label:"Favoris"),BottomNavigationBarItem(icon:Icon(Icons.explore),label:"Explorer"),BottomNavigationBarItem(icon:Icon(Icons.swap_horiz),label:"Transferts"),BottomNavigationBarItem(icon:Icon(Icons.info),label:"Infos")]));
}
}
class MatchDetail extends StatelessWidget{
final String home,away,score;
const MatchDetail({super.key,required this.home,required this.away,required this.score});
@override
Widget build(BuildContext context){
return Scaffold(appBar:AppBar(title:Text("$home vs $away"),backgroundColor:const Color(0xFF1E1E1E)),body:ListView(padding:const EdgeInsets.all(16),children:[Container(padding:const EdgeInsets.all(20),decoration:BoxDecoration(color:const Color(0xFF1E1E1E),borderRadius:BorderRadius.circular(16)),child:Column(children:[Row(mainAxisAlignment:MainAxisAlignment.spaceAround,children:[Column(children:[const Icon(Icons.shield,size:50),const SizedBox(height:8),Text(home,style:const TextStyle(fontWeight:FontWeight.bold))]),Text(score,style:const TextStyle(fontSize:32,fontWeight:FontWeight.bold)),Column(children:[const Icon(Icons.shield_outlined,size:50),const SizedBox(height:8),Text(away,style:const TextStyle(fontWeight:FontWeight.bold))])]),const SizedBox(height:20),const Text("⚽ Haaland 23' - Saka 55' - Foden 77'",textAlign:TextAlign.center)])),const SizedBox(height:16),Container(padding:const EdgeInsets.all(16),decoration:BoxDecoration(color:const Color(0xFF1E1E1E),borderRadius:BorderRadius.circular(12)),child:Column(children:[statRow("Possession","58%","42%"),statRow("Tirs","14","8"),statRow("Tirs cadrés","6","3"),statRow("Corners","7","4")]))]));
}
Widget statRow(String t,String h,String a){
return Padding(padding:const EdgeInsets.symmetric(vertical:8),child:Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[Text(h,style:const TextStyle(fontWeight:FontWeight.bold)),Text(t,style:const TextStyle(color:Colors.grey)),Text(a,style:const TextStyle(fontWeight:FontWeight.bold))]));
}
}
