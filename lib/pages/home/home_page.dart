import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projetos/components/base.service.dart';
import 'package:projetos/components/card/custom-card.dart';
import 'package:projetos/components/container/custom-container-home.dart';
import 'package:projetos/components/drawer/custom_drawer.dart';
import 'package:projetos/components/size-config/size-config.dart';
import 'package:projetos/controllers/pet_controller.dart';
import 'package:projetos/main.dart';
import 'package:projetos/models/cachorro-model.dart';
import 'package:projetos/models/gato-model.dart';
import 'package:projetos/pages/home/widgets/listagem-cats-widget.dart';
import 'package:projetos/pages/home/widgets/listagem-dogs-widget.dart';
import 'package:projetos/shared/formatacao_Texto.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PetController _api = PetController();
  List<CachorroModel>? cachorros = [];
  List<GatoModel>? gatos = [];

  List names = ['jerry', 'mark', 'john'];

// generates a new Random object
  final _random = Random();

// generate a random index based on the list length
// and use it to retrieve the element

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _iniciarDadosPets());
    super.initState();
    var element = names[_random.nextInt(names.length)];
    print(element);
  }

  //
  void _iniciarDadosPets() async {
    _carregarDadosPets();
  }

  Future<void> _carregarDadosPets() async {
    // if (!this.paginacao.fim) {
    //   if (_context != null) ;
    BaseService.loading.start(this.context);

    List<CachorroModel>? cachorrosApi = await this._api.getCachorros();
    List<GatoModel>? gatosApi = await this._api.getGatos();
    GatoModel? gatoApi = await this._api.getGato();

    setState(
      () {
        cachorros = cachorrosApi;
        gatos = gatosApi;
      },
    );

    BaseService.loading.stop(this.context);
  }

  Widget cardDog() {
    return CustomCard(
      content: Row(
        children: [
          Expanded(
            child: CustomContainerHome(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.green.shade300),
              content: Image.asset('assets/imagens/dog.png'),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardCat() {
    return CustomCard(
      content: Row(
        children: [
          Expanded(
            child: CustomContainerHome(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blue.shade300),
              content: Image.asset('assets/imagens/cat.png'),
            ),
          ),
        ],
      ),
    );
  }

  Widget tabBarWidget(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          textoHomeCategoria(
            'Categoria',
          ),
          DefaultTabController(
            length: 2, // length of tabs
            initialIndex: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TabBar(
                  labelColor: Colors.transparent,
                  unselectedLabelColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  tabs: [cardDog(), cardCat()],
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal! *
                      100, //height of TabBarView

                  child: TabBarView(
                    children: <Widget>[
                      ListagemDogsWidget((cachorros ?? []), context),
                      ListagemCatsWidget((gatos ?? []), context),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TextTheme _textTheme = Theme.of(context).textTheme;
    // bool isDark = Theme.of(context).brightness == Brightness.dark;



    final randomNumberGenerator = Random();
    final randomBoolean = randomNumberGenerator.nextBool();
    print(randomBoolean);
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: textoAppBar(
          'Pet',
        ),
        actions: [
          Switch(
            value: themeManager.themeMode == ThemeMode.dark,
            onChanged: (newValue) {
              themeManager.toggleTheme(newValue);
            },
          )
        ],
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [tabBarWidget(context)],
        ),
      ),
    );
  }
}

class BoolRandom {
  bool? geraBoleano;
  BoolRandom({this.geraBoleano});
}

class Fake {
  static List<BoolRandom> getSomeValues = [
    BoolRandom(geraBoleano: false),
    BoolRandom(geraBoleano: true),
    BoolRandom(geraBoleano: false),
    BoolRandom(geraBoleano: true),
  ];
}

List<BoolRandom> shuffle(List<BoolRandom> items, int item) {
  var random = new Random();

  items.shuffle();

  return items.sublist(0, item);
}
