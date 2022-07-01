import 'package:flutter/material.dart';
import 'package:projeto_pet_adoption_app/components/base.service.dart';
import 'package:projeto_pet_adoption_app/components/card/custom-card.dart';
import 'package:projeto_pet_adoption_app/components/container/custom-container-home.dart';
import 'package:projeto_pet_adoption_app/components/drawer/custom_drawer.dart';
import 'package:projeto_pet_adoption_app/components/listagem-pets/listagem-pets-widget.dart';
import 'package:projeto_pet_adoption_app/components/size-config/size-config.dart';
import 'package:projeto_pet_adoption_app/controllers/pet-controller.dart';
import 'package:projeto_pet_adoption_app/main.dart';
import 'package:projeto_pet_adoption_app/models/pet-model.dart';
import 'package:projeto_pet_adoption_app/shared/formatacao-texto/formatacao_Texto.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<PetModel>? cachorros = [];
  List<PetModel>? gatos = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _iniciarDadosPets(),
    );
    super.initState();
  }

  void _iniciarDadosPets() async {
    _carregarDadosPets();
  }

  Future<void> _carregarDadosPets() async {
    BaseService.loading.start(context);
    try {
      List<PetModel>? cachorrosApi = await PetController.getCachorros();
      List<PetModel>? gatosApi = await PetController.getGatos();

      setState(
        () {
          cachorros = cachorrosApi;
          gatos = gatosApi;
        },
      );

      BaseService.loading.stop(context);
    } catch (e) {
      BaseService.loading.stop(context);
      print(e);
    }
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
            'Category',
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
                  height: SizeConfig.safeBlockHorizontal! * 100,
                  child: TabBarView(
                    children: <Widget>[
                      ListagemPetsWidget((cachorros ?? []), context),
                      ListagemPetsWidget((gatos ?? []), context),
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
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            size: SizeConfig.safeBlockVertical! * 4,
          ), // change this size and style
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
        centerTitle: true,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textoAppBar(
              'PetAdoption',
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical! * 5,
              width: SizeConfig.safeBlockHorizontal! * 5,
              child: Image.asset(themeManager.themeMode == ThemeMode.dark
                  ? 'assets/imagens/paw-128.png'
                  : 'assets/imagens/paw.png'),
            ),
          ],
        ),
        actions: [
          Switch(
            value: themeManager.themeMode == ThemeMode.dark,
            onChanged: (newValue) {
              setState(
                () {
                  themeManager.toggleTheme(newValue);
                },
              );
            },
          )
        ],
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            tabBarWidget(context),
          ],
        ),
      ),
    );
  }
}
