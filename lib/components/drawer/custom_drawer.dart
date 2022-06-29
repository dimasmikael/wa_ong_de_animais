import 'package:flutter/material.dart';
import 'package:projetos/main.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              title: const Text('Menu'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home');
                //  Navigator.of(context).pushNamed(AppRoutes.Home);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.add_a_photo),
              title: const Text('Iniciar visita'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/inciovisita');
                //  Navigator.of(context).pushNamed(AppRoutes.InicioVisita);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.loyalty),
              title: const Text('Produtos'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/ProdutosListagem');
                //  Navigator.of(context).pushNamed(AppRoutes.ProdutosListagem);
              },
            ),
            //   const Divider(),
            // Theme(
            //   data: Theme.of(context).copyWith(
            //     colorScheme:
            //     ColorScheme.fromSwatch().copyWith(primary: Colors.amber),
            //   ),
            //   child: ExpansionTile(
            //     title: const Text('Sobre'),
            //     leading: ConstrainedBox(
            //       constraints: const BoxConstraints(
            //         minWidth: 30,
            //         minHeight: 30,
            //         maxWidth: 40,
            //         maxHeight: 500,
            //       ),
            //       child: Image.asset("imagens/appbar-logo.png",
            //           fit: BoxFit.contain),
            //     ),
            //     children: [SobreAppWidget()],
            //   ),
            // ),
            const Divider(),
            // ListTile(
            //   leading: const Icon(Icons.calendar_today),
            //   title: const Text('Meus horários'),
            //   onTap: () {
            //     Navigator.pushReplacementNamed(context, HorariosPage.rota);
            //     //  Navigator.of(context).pushNamed(AppRoutes.ProdutosListagem);
            //   },
            // ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sair'),
              // onTap: () async {
              //   await _usuarioProvider?.logout();
              //
              //   Route route = MaterialPageRoute(builder: (context) => Login());
              //   Navigator.pushReplacement(context, route);
              //
              //   // Navigator.pushReplacement(context,Login());
              //
              //   //  Navigator.of(context).pushNamed('login');
              // },
            ),
          ],
        ),
      ),
    );
  }
}
