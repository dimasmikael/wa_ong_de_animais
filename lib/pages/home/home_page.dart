import 'dart:convert';


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:projetos/models/Cachorros.dart';
import 'package:projetos/pages/home/home_bloc.dart';
import 'package:projetos/pages/home/home_repository.dart';
import 'package:projetos/pages/home/widgets/contact_tile/contact_tile_widget.dart';
import 'package:projetos/repository/cachorros-api.dart';
import 'package:projetos/shared/models/contact_model.dart';
import 'package:projetos/shared/services/custom_dio/custom_dio.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
List<Cachorros> _cachorros = <Cachorros>[];
Future<List<Cachorros>> fetchNotes()async{
var url = Uri.parse( "https://api.thedogapi.com/v1/breeds?api_key=d95c7d35-8bf5-400c-ba77-%20e08185535c37");
var response = await http.get(url);
var notes=<Cachorros>[];
if(response.statusCode==200){

var notesJson= json.decode(response.body);
for(var noteJson in notesJson){
notes.add(Cachorros.fromJson(noteJson));
}
}
return notes;
}

 //  List<Cachorros?>? cachorros = [];
 //  final CachorrosApi _api = new CachorrosApi();
 // late BuildContext _context;

  @override
  void initState() {
    fetchNotes().then((value) {
      _cachorros.addAll(value);

    });
    // WidgetsBinding.instance.addPostFrameCallback(
    //       (_) => _init(),
    // );
    super.initState();
  }
  //
  // void _init() async {
  //   _carregarCachorros();
  // }

 // Future<void> _carregarCachorros() async {
    // if (!this.paginacao.fim) {
    //   if (_context != null) ;
    //   BaseService.loading.start(this.context);
    //
    //   List<Cachorros>? _cachorros =
    //   await this._api.getCachorros();



      // setState(
      //       () {
      //     this.cachorros = _cachorros ;
      //   },
      // );

      // if (_context != null) ;
      // BaseService.loading.stop(this.context);
    //}
    //else {
    //  BaseService.alert.error(this.context, 'Sem mais produtos');
   // }
  //}

 // var bloc = HomeBloc(HomeRepository(client));


  //
  // late Future<Album> futureAlbum;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   futureAlbum = _api.fetchAlbum();
  // }


listCachorros(){
  

return ListView.builder(
    itemCount: _cachorros.length,

    itemBuilder:(context,index) {
  return ListTile(
    title:
      Column(children: [
        Text(_cachorros?[index]?.id?.toString() ??"1"),
        // Text(_cachorros?[index]?.image?.url ??"")
        Container(
          width: 100,
          height: 100,
          //color: Colors.yellow,
          child:  Center(
              child: FittedBox(
                fit: BoxFit.contain,
                child: CachedNetworkImage(
                  imageUrl: _cachorros?[index]?.image?.url ?? 'https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png',
                  placeholder: (context, url) =>
                      SpinKitFadingCircle(
                          color: Colors.amber),
                  errorWidget: (context, url, error) =>
                  new Icon(Icons.error),
                ),
              )),
        )

        // Text(_cachorros?[index]?.id?.toString() ??"1"),
        // Text(_cachorros?[index]?.id?.toString() ??"1"),
       // Text(_cachorros?[index]?.width?.toString() ??"2"),
       // Text(_cachorros?[index]?.height?.toString() ??"3"),
      //   Text(_cachorros?[index]?.url?.toString() ??"4"),
      // Text(_cachorros?[index]?.breeds?[0].name ??"5"),
      //   Text(_cachorros?[index]?.breeds?[1].bredFor ??"6"),
      //   Text(_cachorros?[index]?.breeds?[2].id.toString()??"7"),
      //   Text(_cachorros?[index]?.breeds?[3].name ??"8"),
      ],)


  );
});  }

  @override
  Widget build(BuildContext context) {

    //
    // print(_cachorros.length);  print(_cachorros[0].url ??"l");

    // print(_cachorros[0].breeds!);
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: listCachorros()

          // FutureBuilder<Album>(
          //   future: futureAlbum,
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return Text(snapshot.data!.nome);
          //     } else if (snapshot.hasError) {
          //       return Text('${snapshot.error}');
          //     }
          //
          //     // By default, show a loading spinner.
          //     return const CircularProgressIndicator();
          //   },
          // ),
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  // //  bloc.dispose();
  //   super.dispose();
  // }
  // @override
  // Widget build(BuildContext context) {
  //
  // print(cachorros!.length );
  //   return Scaffold(
  //       appBar: AppBar(),
      //  body:Text(cachorros?[0]?.id ?? "kkk")

        // StreamBuilder<List<ContactModel?>?>(
        //   stream:bloc.contactsOut,
        //   builder: (BuildContext context,
        //       AsyncSnapshot<List<ContactModel?>?> snapshot) {
        //     if (snapshot.hasData) {
        //       return Column(
        //         children: snapshot.data!
        //             .map((e) => ContactTileWidget(snapshot: e!))
        //             .toList(),
        //       );
        //     } else {
        //       return CircularProgressIndicator();
        //     }
        //   },
        // )
  //   );
  // }
}
