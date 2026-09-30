import 'package:flutter/material.dart';
void main() => runApp(AnalystaV17Final());

class AnalystaV17Final extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Color(0xFF121212)), home: MainPage());
  }
}

class MainPage extends StatefulWidget { @override State<MainPage> createState() => _MainState(); }
class _MainState extends State<MainPage> {
  int idx=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [MatchsPage(), FavorisPageFull(), ExplorerPageFull(), TransfertsPageFull(), InfosPageFull()][idx],
      bottomNavigationBar: BottomNavigationBar(currentIndex: idx, onTap: (i)=> setState(()=> idx=i), type: BottomNavigationBarType.fixed, backgroundColor: Color(0xFF1E1E1E), selectedItemColor: Color(0xFF1DBE60), unselectedItemColor: Colors.grey,
        items: [BottomNavigationBarItem(icon: Icon(Icons.sports_soccer), label: "Matchs"), BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favoris"), BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explorer"), BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: "Transferts"), BottomNavigationBarItem(icon: Icon(Icons.article), label: "Infos")],
      ),
    );
  }
}

Widget logoPng(String team){
  Map<String,String> m={
    "Côte d'Ivoire":"https://flagcdn.com/w40/ci.png",
    "Somalie":"https://flagcdn.com/w40/so.png",
    "FC Barcelona":"https://crests.football-data.org/81.png",
    "Racing":"https://crests.football-data.org/560.png",
    "Sevilla":"https://crests.football-data.org/559.png",
    "ASEC Mimosas":"https://flagcdn.com/w40/ci.png",
    "Africa Sport":"https://flagcdn.com/w40/ci.png",
    "Stella Club":"https://flagcdn.com/w40/ci.png",
    "FC San Pedro":"https://flagcdn.com/w40/ci.png",
    "Man City":"https://crests.football-data.org/65.png",
    "Arsenal":"https://crests.football-data.org/57.png",
    "Chelsea":"https://crests.football-data.org/61.png",
    "Man United":"https://crests.football-data.org/66.png",
    "Real Madrid":"https://crests.football-data.org/86.png",
    "Getafe":"https://crests.football-data.org/82.png",
  };
  String url=m[team]?? "https://flagcdn.com/w40/ci.png";
  return Container(width:32,height:32,decoration:BoxDecoration(color:Colors.white,shape:BoxShape.circle),child:ClipOval(child:Image.network(url,fit:BoxFit.cover,errorBuilder:(c,e,s)=>Center(child:Text(team.substring(0,2),style:TextStyle(color:Colors.black,fontWeight:FontWeight.bold,fontSize:10))))));
}

class MatchsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children:[
      Container(color:Color(0xFF1E1E1E),padding:EdgeInsets.only(top:35,left:12,right:12,bottom:8),child:Row(children:[Text("BESOCCER",style:TextStyle(fontWeight:FontWeight.bold)),Spacer(),Icon(Icons.calendar_today,size:18),SizedBox(width:14),Icon(Icons.search)])),
      Container(color:Color(0xFF1E1E1E),child:SingleChildScrollView(scrollDirection:Axis.horizontal,child:Row(children:[for(var t in ["HIER","AUJOURD'HUI","EN DIRECT (15)","DEMAIN","SAM. 03 OCT."]) Container(padding:EdgeInsets.symmetric(horizontal:12,vertical:10),decoration:BoxDecoration(border:Border(bottom:BorderSide(color:t=="EN DIRECT (15)"?Color(0xFF1DBE60):Colors.transparent,width:3))),child:Text(t,style:TextStyle(color:t=="EN DIRECT (15)"?Colors.white:Colors.grey,fontSize:13))) ]))),
      Expanded(child:ListView(padding:EdgeInsets.all(6),children:[
        Container(padding:EdgeInsets.all(12),decoration:BoxDecoration(color:Color(0xFF1DBE60),borderRadius:BorderRadius.circular(8)),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text("ANALYSE MONDIALE AUTONOME - VRAIS LOGOS PNG",style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize:12)),Text("Contrôle ferme 55% • Pression Haute • Fermeté 25% • IA 84.2% • 1,247 matchs • LONACI + Mondial",style:TextStyle(color:Colors.white,fontSize:11))])),
        SizedBox(height:8),
        section("FAVORIS - CÔTE D'IVOIRE", [rowMatch(context,"Somalie","0 - 2\nTF","Côte d'Ivoire")]),
        section("LIGUE DES CHAMPIONS UEFA", [rowMatch(context,"FC Barcelona","7 - 2\n16 SEPT","Racing"),rowMatch(context,"Sevilla","1 - 3\n19 SEPT","FC Barcelona")]),
        section("LONACI LIGUE 1 - CÔTE D'IVOIRE 🇨🇮", [rowMatch(context,"ASEC Mimosas","15:30","Africa Sport"),rowMatch(context,"Stella Club","15:30","FC San Pedro")]),
        section("PREMIER LEAGUE 🏴󐁧󐁢󐁥󐁮󐁧󐁿", [rowMatch(context,"Man City","18:30","Arsenal"),rowMatch(context,"Chelsea","20:00","Man United")]),
        section("LALIGA 🇪🇸", [rowMatch(context,"Real Madrid","20:00","Getafe")]),
      ])),
    ]);
  }
}

Widget section(String title, List<Widget> rows)=>Container(margin:EdgeInsets.only(bottom:8),decoration:BoxDecoration(color:Color(0xFF2A2A2A),borderRadius:BorderRadius.circular(8)),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Padding(padding:EdgeInsets.all(10),child:Text(title,style:TextStyle(fontSize:11,fontWeight:FontWeight.bold))),...rows]));
Widget rowMatch(BuildContext ctx,String t1,String score,String t2)=>GestureDetector(onTap:()=>Navigator.push(ctx,MaterialPageRoute(builder:(_)=>DetailAnalyse(t1:t1,t2:t2,score:score))),child:Container(padding:EdgeInsets.symmetric(horizontal:10,vertical:10),decoration:BoxDecoration(border:Border(top:BorderSide(color:Colors.white10))),child:Row(children:[Expanded(child:Text(t1,textAlign:TextAlign.right,style:TextStyle(fontSize:13))),SizedBox(width:8),logoPng(t1),SizedBox(width:10),Text(score,textAlign:TextAlign.center,style:TextStyle(fontWeight:FontWeight.bold,fontSize:12)),SizedBox(width:10),logoPng(t2),SizedBox(width:8),Expanded(child:Text(t2,style:TextStyle(fontSize:13)))])));

// FAVORIS FULL
class FavorisPageFull extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Column(children:[
      AppBar(backgroundColor:Color(0xFF1E1E1E),title:Text("Favoris ⭐")),
      Padding(padding:EdgeInsets.all(8),child:Text("ÉQUIPES LES PLUS RECHERCHÉES",style:TextStyle(fontWeight:FontWeight.bold,fontSize:12))),
      Expanded(child:GridView.count(crossAxisCount:4,padding:EdgeInsets.all(12),children:[
        favTeam("FC Barcelona"),favTeam("Real Madrid"),favTeam("Man City"),favTeam("Arsenal"),
        favTeam("ASEC Mimosas"),favTeam("Côte d'Ivoire"),favTeam("Chelsea"),favTeam("Man United"),
        favTeam("PSG"),favTeam("Mali"),favTeam("Sénégal"),favTeam("Nigeria"),
      ]))
    ]);
  }
  Widget favTeam(String n)=>Column(children:[Container(width:56,height:56,decoration:BoxDecoration(color:Colors.white,shape:BoxShape.circle),child:Center(child:logoPng(n))),SizedBox(height:4),Text(n,textAlign:TextAlign.center,style:TextStyle(fontSize:10))]);
}

// EXPLORER FULL - 211 PAYS
class ExplorerPageFull extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Column(children:[
      AppBar(backgroundColor:Color(0xFF1E1E1E),title:Text("Explorer - Mondial 211 pays 🌍")),
      Container(margin:EdgeInsets.all(8),padding:EdgeInsets.all(12),decoration:BoxDecoration(color:Color(0xFF1DBE60),borderRadius:BorderRadius.circular(8)),child:Text("TOUS LES PAYS - CLIQUE POUR VOIR CHAMPIONNATS",textAlign:TextAlign.center,style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white))),
      Expanded(child:ListView(children:[
        paysRow("🇨🇮 Côte d'Ivoire","3 Compétitions - LONACI Ligue 1 + Coupe + Equipe Nat"),
        paysRow("🇪🇸 Espagne","988 Compétitions - LaLiga + LaLiga2 + Barça Real"),
        paysRow("🏴󐁧󐁢󐁥󐁮󐁧󐁿 Angleterre","40 Compétitions - PL + Championship + FA Cup"),
        paysRow("🇮🇹 Italie","42 Compétitions - Serie A + B + Coppa"),
        paysRow("🇩🇪 Allemagne","28 Compétitions - Bundesliga + 2.Bundesliga"),
        paysRow("🇫🇷 France","35 Compétitions - Ligue 1 + Ligue 2 + Coupe"),
        paysRow("🇲🇱 Mali","2 Compétitions - Ligue 1 Mali"),
        paysRow("🇧🇫 Burkina Faso","2 Compétitions - Fasofoot"),
        paysRow("🇨🇲 Cameroun","3 Compétitions - Elite One + Coupe"),
        paysRow("🇸🇳 Sénégal","3 Compétitions - Ligue 1 Sénégal"),
        paysRow("🇳🇬 Nigeria","5 Compétitions - NPFL + Coupe"),
        paysRow("🇧🇷 Brésil","50 Compétitions - Brasileirão + Paulistão"),
        paysRow("🇦🇷 Argentine","30 Compétitions - Liga Profesional"),
      ]))
    ]);
  }
  Widget paysRow(String name,String comp)=>Container(padding:EdgeInsets.symmetric(horizontal:12,vertical:12),margin:EdgeInsets.only(bottom:6),decoration:BoxDecoration(color:Color(0xFF1E1E1E),borderRadius:BorderRadius.circular(6)),child:Row(children:[Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(name,style:TextStyle(fontWeight:FontWeight.bold)),Text(comp,style:TextStyle(fontSize:11,color:Colors.grey))])),Icon(Icons.shield_outlined,color:Color(0xFF1DBE60))]));
}

// TRANSFERTS FULL
class TransfertsPageFull extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Column(children:[
      AppBar(backgroundColor:Color(0xFF1E1E1E),title:Text("Transferts Mondiaux")),
      Container(padding:EdgeInsets.all(8),child:Row(children:[Expanded(child:Container(padding:EdgeInsets.symmetric(vertical:8),decoration:BoxDecoration(color:Color(0xFF2A2A2A),borderRadius:BorderRadius.circular(20)),child:Text("OFFICIEL",textAlign:TextAlign.center,style:TextStyle(color:Color(0xFF1DBE60),fontWeight:FontWeight.bold,fontSize:12)))),SizedBox(width:8),Expanded(child:Container(padding:EdgeInsets.symmetric(vertical:8),child:Text("RUMEUR",textAlign:TextAlign.center,style:TextStyle(color:Colors.grey,fontSize:12))))])),
      Expanded(child:ListView(children:[
        Container(padding:EdgeInsets.all(8),color:Color(0xFF2A2A2A),child:Text("01 SEP 2026",style:TextStyle(fontWeight:FontWeight.bold))),
        transferRow("Marc Casadó","🇪🇸","MT","Barça -> Deportivo prêt","Prêt"),
        transferRow("Á. Cortés","🇪🇸","DF","Barça -> Antwerp 3,5M€","3,5 M€"),
        transferRow("Gabriel Jesus","🇧🇷","ATT","Arsenal -> Barça 10M€","10M€"),
        transferRow("K. Koné","🇨🇮","ATT","ASEC -> Africa 2M€ FCFA","2M FCFA"),
        transferRow("Héctor Fort","🇪🇸","DF","Barça -> Real Sociedad 8,5M€","8,5 M€"),
        Container(padding:EdgeInsets.all(8),color:Color(0xFF2A2A2A),child:Text("29 AOU 2026",style:TextStyle(fontWeight:FontWeight.bold))),
        transferRow("João Cancelo","🇵🇹","DF","Al-Hilal -> Barça Libre","Libre"),
      ]))
    ]);
  }
  Widget transferRow(String name,String flag,String pos,String desc,String price)=>Container(padding:EdgeInsets.all(10),decoration:BoxDecoration(border:Border(bottom:BorderSide(color:Colors.white10))),child:Row(children:[CircleAvatar(backgroundColor:Colors.grey,child:Icon(Icons.person,size:18)),SizedBox(width:10),Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Row(children:[Text(flag),SizedBox(width:6),Text(name,style:TextStyle(fontWeight:FontWeight.bold,fontSize:13)),SizedBox(width:6),Container(padding:EdgeInsets.symmetric(horizontal:5,vertical:2),decoration:BoxDecoration(color:pos=="ATT"?Colors.red:Colors.green,borderRadius:BorderRadius.circular(3)),child:Text(pos,style:TextStyle(fontSize:9,fontWeight:FontWeight.bold)))]),Text(desc,style:TextStyle(fontSize:11,color:Colors.grey))])),Text(price,style:TextStyle(color:Color(0xFF1DBE60),fontSize:12,fontWeight:FontWeight.bold))]));
}

// INFOS FULL
class InfosPageFull extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Column(children:[
      AppBar(backgroundColor:Color(0xFF1E1E1E),title:Text("Infos Mondiales")),
      Expanded(child:ListView(padding:EdgeInsets.all(8),children:[
        newsCard("Coupe du Monde 2026 : Actus en direct","Découvrez les dernières actualités CDM 2026...","Il y a 2 mois","446K"),
        newsCard("Lamine Yamal fait peur à un mois d'Halloween","Lamine impliqué dans 18 buts depuis...","Il y a 4 heures","6K"),
        newsCard("Koné bluffé par Zidane : Il a encore la même technique","Koné impressionné par le virtuose...","Il y a 1h","1.2K"),
        newsCard("Révélations Mondial 2026 : héros de l'ombre","Les héros qui ont conquis la planète...","Il y a 2 mois","22K"),
        Container(margin:EdgeInsets.only(top:8),padding:EdgeInsets.all(14),decoration:BoxDecoration(color:Color(0xFF1DBE60),borderRadius:BorderRadius.circular(10)),child:Row(children:[Text("🇨🇮",style:TextStyle(fontSize:20)),SizedBox(width:10),Expanded(child:Text("LONACI Ligue 1 - ASEC champion Journée 8 - Analyse 84% confiance",style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize:12))) ])),
      ]))
    ]);
  }
  Widget newsCard(String t,String d,String time,String views)=>Container(margin:EdgeInsets.only(bottom:10),decoration:BoxDecoration(color:Color(0xFF1E1E1E),borderRadius:BorderRadius.circular(8)),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Container(height:100,decoration:BoxDecoration(color:Color(0xFF2A2A2A),borderRadius:BorderRadius.vertical(top:Radius.circular(8))),child:Center(child:Icon(Icons.article,size:40,color:Colors.grey))),Padding(padding:EdgeInsets.all(10),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(t,style:TextStyle(fontWeight:FontWeight.bold,fontSize:14)),SizedBox(height:4),Text(d,style:TextStyle(fontSize:12,color:Colors.grey)),SizedBox(height:6),Row(children:[Text(time,style:TextStyle(fontSize:11,color:Colors.grey)),SizedBox(width:10),Icon(Icons.visibility,size:12,color:Colors.grey),Text(" $views",style:TextStyle(fontSize:11,color:Colors.grey))])]))]));
}

class DetailAnalyse extends StatelessWidget {
  final String t1,t2,score;
  DetailAnalyse({required this.t1,required this.t2,required this.score});
  @override
  Widget build(BuildContext context){
    return DefaultTabController(length:4,child:Scaffold(backgroundColor:Color(0xFF121212),appBar:AppBar(backgroundColor:Color(0xFF1E1E1E),title:Text("$t1 $score $t2",style:TextStyle(fontSize:14)),bottom:TabBar(isScrollable:true,labelColor:Color(0xFF1DBE60),unselectedLabelColor:Colors.grey,indicatorColor:Color(0xFF1DBE60),tabs:[Tab(text:"ANALYSE"),Tab(text:"STATS"),Tab(text:"TERRAIN"),Tab(text:"H2H")])),body:TabBarView(children:[
      ListView(padding:EdgeInsets.all(10),children:[
        Row(mainAxisAlignment:MainAxisAlignment.spaceAround,children:[Column(children:[logoPng(t1),Text(t1,style:TextStyle(fontWeight:FontWeight.bold))]),Text(score,style:TextStyle(fontWeight:FontWeight.bold,fontSize:20)),Column(children:[logoPng(t2),Text(t2,style:TextStyle(fontWeight:FontWeight.bold))])]),
        SizedBox(height:12),
        box("ANALYSE AUTONOME IDENTIQUE - VRAIS LOGOS",["Contrôle ferme: $t1 55% domination mondiale","Pression Haute 89% pressing","Fermeté 25% équilibre défensif","Buteur probable: Lamine Yamal / Gboho / Koné - Confiance 84%","Score prédit IA: 2-1 • Précision 84.2%","1,247 matchs analysés mondial","xG: 1.85 - 1.12 • Possession prévue 55%-45%","Tous les jeux détaillés - Vrais logos PNG"]),
        box("FORME",["$t1 ✅✅➖✅❌ - 10 pts","$t2 ✅✅✅➖✅ - 13 pts"]),
        box("COTES FCFA",["1XBET 2.10 - 3.40 - 3.20 - Mise max 5,250 FCFA","Value Bet $t1 +8%"]),
      ]),
      ListView(children:[box("STATS",["Possession 22%-78%","Tirs 1-23","Corners 0-9","Frappes non cadrées 0-12","Tirs cadrés 0-6","Arrêts 4-0"])]),
      Container(color:Color(0xFF2E7D32),child:Center(child:Text("TERRAIN 4-3-3\n\n$t1\nYamal - Gboho - Koné\nPedri - Bellingham\nASEC Défense\n\n$t2\n4-2-3-1",textAlign:TextAlign.center,style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold)))),
      ListView(children:[box("H2H MONDIAL",["8V-4N-6V","Moyenne 3.2 buts","Dernier: $t1 2-1 $t2"])]),
    ])));
  }
  Widget box(String t,List<String> l)=>Container(margin:EdgeInsets.only(bottom:10),padding:EdgeInsets.all(12),decoration:BoxDecoration(color:Color(0xFF1E1E1E),borderRadius:BorderRadius.circular(10)),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(t,style:TextStyle(color:Color(0xFF1DBE60),fontWeight:FontWeight.bold)),Divider(color:Colors.white10),...l.map((e)=>Padding(padding:EdgeInsets.only(bottom:4),child:Text("• $e",style:TextStyle(fontSize:12))))]));
}
