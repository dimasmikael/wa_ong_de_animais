import 'package:flutter/material.dart';
import 'package:projeto_pet_adoption_app/components/base.service.dart';
import 'package:projeto_pet_adoption_app/components/card/custom-card.dart';
import 'package:projeto_pet_adoption_app/components/container/custom-container-home.dart';
import 'package:projeto_pet_adoption_app/components/drawer/custom_drawer.dart';
import 'package:projeto_pet_adoption_app/components/listagem-pets/listagem-pets-widget.dart';
import 'package:projeto_pet_adoption_app/components/size-config/size-config.dart';
import 'package:projeto_pet_adoption_app/controllers/pet-controller.dart';
import 'package:projeto_pet_adoption_app/main.dart';
import 'package:projeto_pet_adoption_app/models/gato-model.dart';
import 'package:projeto_pet_adoption_app/models/pet-model.dart';
import 'package:projeto_pet_adoption_app/pages/home/widgets/listagem-cats-widget.dart';
import 'package:projeto_pet_adoption_app/pages/home/widgets/listagem-dogs-widget.dart';
import 'package:projeto_pet_adoption_app/shared/formatacao-texto/formatacao_Texto.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PetController _api = PetController();
  List<PetModel>? cachorros = [];
  List<PetModel>? gatos = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _iniciarDadosPets());
    super.initState();
  }


  void _iniciarDadosPets() async {
    _carregarDadosPets();
  }

  Future<void> _carregarDadosPets() async {
    // if (!this.paginacao.fim) {
    //   if (_context != null) ;
    BaseService.loading.start(this.context);

    List<PetModel>? cachorrosApi = await PetController.getCachorros();
    List<PetModel>? gatosApi = await PetController.getGatos();

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
                      ListagemPetsWidget((cachorros ?? []), context), ListagemPetsWidget((gatos ?? []), context),
                    //  ListagemCatsWidget((gatos ?? []), context),
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
    final Duration disableAfterClick;
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: textoAppBar(
          'Pet Adoption',
        ),
        actions: [
          Switch(
            value: themeManager.themeMode == ThemeMode.dark,
            onChanged: (newValue) {
              setState(() {
                themeManager.toggleTheme(newValue);
              });
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
