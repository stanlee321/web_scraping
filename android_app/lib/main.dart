import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "Rastreador de Ads"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> demoData = [
    "alquilo tienda zona central. 74145528",
    "urgente vendo casa circunvalacion 77143718",
    "pintor interior exterior. 67533879",
    "por carnavales alquilamos departamento, ambientes para delegaciones. 6 de agosto, oblitas 5236481, 70428733",
    "vendo lote zona sud de ocasion ref.: 74106052",
    "alquilo tienda c/ bano frente surtidor tacna. 5285753, 71181841",
    "albanil remodelaciones, pintura. 71989341",
    "anticretico departamento centrico, mercado campero. 67203302, 71840414",
    "en venta ecografo chison 600m seminuevo transductor convexo \$s. 3.500 celular: 72259459",
    "san jose lote 250 m2. cerca a facultad de medicina 27.000 \$us. cel.: 72457571",
    "vendo lote nor este con financiamiento bancario, 300 m2. entrega inmediata, todo al dia. 67201968",
    "plomero 76154669",
    "departamento en alquiler, ubicado san felipe, soria galvarro apto para oficinas. referencia: 71849255, 72487213",
    "departamentos: edificio en oferta \$us. 305.000 5 pisos, garaje para 8 autos, locales comerciales. carretera a vinto km 5 (a estrenar). ref.: 744-67447 [0218-1584]",
    "se da un departamento en anticretico ubicado en la 6 de octubre y charcas, cerca plaza pagador. ref.: 70422274, 63649111",
    "terreno en la zona sud 3.300 m2. sobre la avenida espana y presidente montes. ref.: 78611170",
    "carpintero 75719865",
    "guinches de mineria de 1tn, 3tn, 500kg, guinches de construccion de 200 y 300kg, mezcladoras de cemento. 5272658, 70430821",
    "vendo departamentos avda. del ejercito 639 tacna, arica. 76155037"
  ];

  List<String> demoDataDisplay =[
    "alquilo tienda zona central. 74145528",
    "urgente vendo casa circunvalacion 77143718",
    "pintor interior exterior. 67533879",
    "por carnavales alquilamos departamento, ambientes para delegaciones. 6 de agosto, oblitas 5236481, 70428733",
    "vendo lote zona sud de ocasion ref.: 74106052",
    "alquilo tienda c/ bano frente surtidor tacna. 5285753, 71181841",
    "albanil remodelaciones, pintura. 71989341",
    "anticretico departamento centrico, mercado campero. 67203302, 71840414",
    "en venta ecografo chison 600m seminuevo transductor convexo \$s. 3.500 celular: 72259459",
    "san jose lote 250 m2. cerca a facultad de medicina 27.000 \$us. cel.: 72457571",
    "vendo lote nor este con financiamiento bancario, 300 m2. entrega inmediata, todo al dia. 67201968",
    "plomero 76154669",
    "departamento en alquiler, ubicado san felipe, soria galvarro apto para oficinas. referencia: 71849255, 72487213",
    "departamentos: edificio en oferta \$us. 305.000 5 pisos, garaje para 8 autos, locales comerciales. carretera a vinto km 5 (a estrenar). ref.: 744-67447 [0218-1584]",
    "se da un departamento en anticretico ubicado en la 6 de octubre y charcas, cerca plaza pagador. ref.: 70422274, 63649111",
    "terreno en la zona sud 3.300 m2. sobre la avenida espana y presidente montes. ref.: 78611170",
    "carpintero 75719865",
    "guinches de mineria de 1tn, 3tn, 500kg, guinches de construccion de 200 y 300kg, mezcladoras de cemento. 5272658, 70430821",
    "vendo departamentos avda. del ejercito 639 tacna, arica. 76155037"
  ];

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...'
        ),
        onChanged: (text) {
          setState(() {
            demoDataDisplay = demoData.where((note) {
              return note.contains(text);
            }).toList();
          });
        },
      ),
    );
  }
  _listItem(index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              demoDataDisplay[index],
              style: TextStyle(
                color: Colors.grey.shade600
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
        // actions: <Widget>[
        //   IconButton(icon: Icon(Icons.search),onPressed: (){
        //     showSearch(context: context, delegate: DataSearch());
        //   },)],
      ),
      drawer: Drawer(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return index == 0 ? _searchBar() : _listItem(index-1);
        },
        itemCount: demoDataDisplay.length+1,

      )
    );
  }
}

List<String> demoData = [
  "alquilo tienda zona central. 74145528",
  "urgente vendo casa circunvalacion 77143718",
  "pintor interior exterior. 67533879",
  "por carnavales alquilamos departamento, ambientes para delegaciones. 6 de agosto, oblitas 5236481, 70428733",
  "vendo lote zona sud de ocasion ref.: 74106052",
  "alquilo tienda c/ bano frente surtidor tacna. 5285753, 71181841",
  "albanil remodelaciones, pintura. 71989341",
  "anticretico departamento centrico, mercado campero. 67203302, 71840414",
  "en venta ecografo chison 600m seminuevo transductor convexo \$s. 3.500 celular: 72259459",
  "san jose lote 250 m2. cerca a facultad de medicina 27.000 \$us. cel.: 72457571",
  "vendo lote nor este con financiamiento bancario, 300 m2. entrega inmediata, todo al dia. 67201968",
  "plomero 76154669",
  "departamento en alquiler, ubicado san felipe, soria galvarro apto para oficinas. referencia: 71849255, 72487213",
  "departamentos: edificio en oferta \$us. 305.000 5 pisos, garaje para 8 autos, locales comerciales. carretera a vinto km 5 (a estrenar). ref.: 744-67447 [0218-1584]",
  "se da un departamento en anticretico ubicado en la 6 de octubre y charcas, cerca plaza pagador. ref.: 70422274, 63649111",
  "terreno en la zona sud 3.300 m2. sobre la avenida espana y presidente montes. ref.: 78611170",
  "carpintero 75719865",
  "guinches de mineria de 1tn, 3tn, 500kg, guinches de construccion de 200 y 300kg, mezcladoras de cemento. 5272658, 70430821",
  "vendo departamentos avda. del ejercito 639 tacna, arica. 76155037"
];


List<String> recentData = [
  "alquilo tienda zona central. 74145528",
  "urgente vendo casa circunvalacion 77143718",
  "pintor interior exterior. 67533879"
];

class DataSearch extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query = "";
      },)
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon:AnimatedIcon(
        icon:AnimatedIcons.menu_arrow , 
        progress: transitionAnimation, ), onPressed: (){
          close(context, null);
      },);
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ?recentData
        :demoData.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.library_books),
        title: Text(suggestionList[index])
      ),
      itemCount: suggestionList.length,);
  }

}