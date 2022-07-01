import 'package:flutter/material.dart';
import 'package:projetos/main.dart';
import 'package:projetos/pages/login/login_page.dart';
import 'package:projetos/services/prefs-service.dart';

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
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sair'),
              onTap: ()
             {
                PrefsService.logout();

             //   Navigator.pushReplacement(context,LoginPage());
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                    LoginPage()), (_) => true);
                //  Navigator.of(context).pushNamed('login');
             },
            ),
          ],
        ),
      ),
    );
  }
}
