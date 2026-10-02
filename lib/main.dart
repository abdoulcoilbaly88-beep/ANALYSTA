import 'package:flutter/material.dart';
void main()=>runApp(MaterialApp(debugShowCheckedModeBanner:false,theme:ThemeData.dark().copyWith(scaffoldBackgroundColor:Color(0xFF121212)),home:MainPage()));

class MainPage extends StatefulWidget{ @override State<MainPage> createState()=>_M(); }
class _M extends State<MainPage>{
int i=0;
@override Widget build(BuildContext c){
return Scaffold(
body: [Matchs(), Fav(), Exp(), Trans(), Infos()][i],
bottomNavigationBar: BottomNavigationBar(currentIndex:i,onTap:(x)=>setState(()=>i=x),type:BottomNavigationBarType.fixed,backgroundColor:Color(0xFF1E1E1E),selectedItemColor:Color(0xFF1DBE60),unselectedItemColor:Colors.grey,items:[
BottomNavigationBarItem(icon:Icon(Icons.sports_soccer),label:"Matchs"),
BottomNavigationBarItem(icon:Icon(Icons.star),label:"Favoris"),
BottomNavigationBarItem(icon:Icon(Icons.explore),label:"Explorer"),
BottomNavigationBarItem(icon:Icon(Icons.swap_horiz),label:"Transferts"),
BottomNavigationBarItem(icon:Icon(Icons.article),label:"Infos")]));
}
}

Widget realLogo(String team){
String flag="";
Color bg=Colors.white;
Color txt=Colors.black;
if(team.contains("Somalie")){flag="🇸🇴"; bg=Color(0xFF418FDE);}
else if(team.contains("Côte")){flag="🇨🇮"; bg=Colors.white;}
else if(team.contains("Barcelona")){flag="🔵🔴"; bg=Color(0xFFA50044); txt=Colors.white;}
else if(team.contains("Racing")){flag="⚪🔵"; bg=Colors.white;}
else if(team.contains("Sevilla")){flag="⚪🔴"; bg=Colors.white;}
else if(team.contains("ASEC")){flag="💛🖤"; bg=Color(0xFFFFD700);}
else if(team.contains("Africa")){flag="💚❤️"; bg=Color(0xFF008000); txt=Colors.white;}
else if(team.contains("Stella")){flag="🔴⚪"; bg=Color(0xFFD00000); txt=Colors.white;}
else if(team.contains("San Pedro")){flag="🔵⚪"; bg=Colors.blue; txt=Colors.white;}
else if(team.contains("Man City")){flag="💙"; bg=Color(0xFF6CABDD);}
else if(team.contains("Arsenal")){flag="🔴"; bg=Color(0xFFEF0107); txt=Colors.white;}
else if(team.contains("Chelsea")){flag="🔵"; bg=Color(0xFF034694); txt=Colors.white;}
else if(team.contains("United")){flag="🔴"; bg=Color(0xFFDA020E); txt=Colors.white;}
else if(team.contains("Real")){flag="⚪"; bg=Colors.white;}
else if(team.contains("Getafe")){flag="🔵"; bg=Color(0xFF0055A4); txt=Colors.white;}

return Container(width:42,height:42,decoration:BoxDecoration(color:bg,shape:BoxShape.circle,border:Border.all(color:Colors.white24)),child:Center(child:Text(flag.isNotEmpty?flag:team.substring(0,2).toUpperCase(),style:TextStyle(fontSize:flag.length>2?12:18,fontWeight:FontWeight.bold,color:txt))));
}

class Matchs extends StatelessWidget{
@override Widget build(BuildContext c){
return Column(children:[
Container(color:Color(0xFF1E1E1E),padding:EdgeInsets.only(top:36,left:12,right:12,bottom:8),child:Row(children:[Text("BESOCCER",style:TextStyle(fontWeight:FontWeight.bold)),Spacer(),Icon(Icons.calendar_today,size:18),SizedBox(width:14),Icon(Icons.search)])),
Expanded(child:ListView(padding:EdgeInsets.all(8),children:[
Container(padding:EdgeInsets.all(14),decoration:BoxDecoration(color:Color(0xFF1DBE60),borderRadius:BorderRadius.circular(10)),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text("ANALYSE V20 - LOGOS OFFLINE GARANTIS",style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white)),Text("Contrôle 55% - IA 84.2% - 1247 matchs - Côte d'Ivoire + Mondial",style:TextStyle(color:Colors.white,fontSize:11))])),
SizedBox(height:8),
sec("FAVORIS - CÔTE D'IVOIRE 🇨🇮",[mRow(c,"Somalie","0 - 2\nTF","Côte d'Ivoire")]),
sec("LIGUE DES CHAMPIONS UEFA 🏆",[mRow(c,"FC Barcelona","7 - 2\n16 SEPT","Racing"),mRow(c,"Sevilla","1 - 3\n19 SEPT","FC Barcelona")]),
sec("LONACI LIGUE 1 - CÔTE D'IVOIRE 🇨🇮",[mRow(c,"ASEC Mimosas","15:30","Africa Sport"),mRow(c,"Stella Club","15:30","FC San Pedro")]),
sec("PREMIER LEAGUE 🏴󠁧󠁢󠁥󠁮󠁧󠁿",[mRow(c,"Man City","18:30","Arsenal"),mRow(c,"Chelsea","20:00","Man United")]),
sec("LALIGA 🇪🇸",[mRow(c,"Real Madrid","20:00","Getafe")]),
]));
}
}

Widget sec(String t,List<Widget> rows)=>Container(margin:EdgeInsets.only(bottom:8),decoration:BoxDecoration(color:Color(0xFF2A2A2A),borderRadius:BorderRadius.circular(10)),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Padding(padding:EdgeInsets.all(10),child:Text(t,style:TextStyle(fontSize:11,fontWeight:FontWeight.bold))),...rows]));
Widget mRow(BuildContext ctx,String t1,String sc,String t2)=>InkWell(onTap:()=>Navigator.push(ctx,MaterialPageRoute(builder:(_)=>Detail(t1:t1,t2:t2,sc:sc))),child:Container(padding:EdgeInsets.symmetric(horizontal:10,vertical:12),decoration:BoxDecoration(border:Border(top:BorderSide(color:Colors.white10))),child:Row(children:[Expanded(child:Text(t1,textAlign:TextAlign.right,style:TextStyle(fontSize:13))),SizedBox(width:8),realLogo(t1),SizedBox(width:10),Container(width:55,child:Text(sc,textAlign:TextAlign.center,style:TextStyle(fontWeight:FontWeight.bold,fontSize:12))),SizedBox(width:10),realLogo(t2),SizedBox(width:8),Expanded(child:Text(t2,style:TextStyle(fontSize:13)))])));

class Fav extends StatelessWidget{ @override Widget build(BuildContext c){return Scaffold(appBar:AppBar(backgroundColor:Color(0xFF1E1E1E),title:Text("Favoris - 12 equipes")),body:GridView.count(crossAxisCount:3,padding:EdgeInsets.all(16),children:[for(var n in ["FC Barcelona","Real Madrid","Man City","Arsenal","ASEC Mimosas","Côte d'Ivoire","Somalie","Chelsea","Man United","Africa Sport","Stella Club","FC San Pedro"]) Column(children:[realLogo(n),SizedBox(height:8),Text(n,textAlign:TextAlign.center,style:TextStyle(fontSize:11))])]));}}
class Exp extends StatelessWidget{ @override Widget build(BuildContext c){return Scaffold(appBar:AppBar(backgroundColor:Color(0xFF1E1E1E),title:Text("Explorer 211 pays")),body:ListView(padding:EdgeInsets.all(8),children:[for(var p in ["Côte d'Ivoire - 3 compet","Espagne - 988 matchs","Angleterre - 40","France - 32","Italie - 42","Somalie - 1"]) Container(margin:EdgeInsets.only(bottom:6),padding:EdgeInsets.all(14),decoration:BoxDecoration(color:Color(0xFF1E1E1E),borderRadius:BorderRadius.circular(8)),child:Row(children:[realLogo(p.split(" -")[0]),SizedBox(width:12),Text(p)]))]));}}
class Trans extends StatelessWidget{ @override Widget build(BuildContext c){return Scaffold(appBar:AppBar(backgroundColor:Color(0xFF1E1E1E),title:Text("Transferts LONACI")),body:ListView(children:[tRow("Marc Casado","Barca -> Deportivo","Pret"),tRow("Kader Kone","ASEC -> Africa Sport","2M FCFA"),tRow("Mohamed Lamine","Stella -> San Pedro","5M"),tRow("Gabriel Jesus","Arsenal -> Barca","10M")]));} Widget tRow(String n,String d,String p)=>Container(padding:EdgeInsets.all(14),decoration:BoxDecoration(border:Border(bottom:BorderSide(color:Colors.white10))),child:Row(children:[CircleAvatar(backgroundColor:Color(0xFF1DBE60),child:Icon(Icons.person,color:Colors.white)),SizedBox(width:12),Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(n,style:TextStyle(fontWeight:FontWeight.bold)),Text(d,style:TextStyle(fontSize:11,color:Colors.grey))])),Text(p,style:TextStyle(color:Color(0xFF1DBE60),fontWeight:FontWeight.bold))]));
class Infos extends StatelessWidget{ @override Widget build(BuildContext c){return Scaffold(appBar:AppBar(backgroundColor:Color(0xFF1E1E1E),title:Text("Infos Football")),body:ListView(padding:EdgeInsets.all(10),children:[Container(padding:EdgeInsets.all(16),decoration:BoxDecoration(color:Color(0xFF1DBE60),borderRadius:BorderRadius.circular(12)),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text("V20 - LOGOS OFFLINE 🇨🇮",style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize:16)),SizedBox(height:8),Text("LONACI: ASEC champion 2024\nCôte d'Ivoire 2-0 Somalie\nBarca 7-2 Racing - Analyse ferme 55%\nPremier League ce soir",style:TextStyle(color:Colors.white))]))]));}
class Detail extends StatelessWidget{final String t1,t2,sc;Detail({required this.t1,required this.t2,required this.sc});@override Widget build(BuildContext c){return Scaffold(backgroundColor:Color(0xFF121212),appBar:AppBar(backgroundColor:Color(0xFF1E1E1E),title:Text("$t1 vs $t2",style:TextStyle(fontSize:13))),body:ListView(padding:EdgeInsets.all(12),children:[Row(mainAxisAlignment:MainAxisAlignment.spaceAround,children:[Column(children:[realLogo(t1),SizedBox(height:8),Text(t1)]),Text(sc,style:TextStyle(fontWeight:FontWeight.bold,fontSize:20)),Column(children:[realLogo(t2),SizedBox(height:8),Text(t2)])]),SizedBox(height:20),box("ANALYSE V20 OFFLINE",["Contrôle ferme 55%","Pression haute 89%","Fermeté 25%","Buteur IA 84%","Score: $sc","LONACI + Mondial inclus"]) ]));} Widget box(String t,List<String> l)=>Container(margin:EdgeInsets.only(bottom:10),padding:EdgeInsets.all(14),decoration:BoxDecoration(color:Color(0xFF1E1E1E),borderRadius:BorderRadius.circular(10)),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(t,style:TextStyle(color:Color(0xFF1DBE60),fontWeight:FontWeight.bold)),SizedBox(height:8),...l.map((e)=>Padding(padding:EdgeInsets.only(bottom:4),child:Text("• $e")))]));}
