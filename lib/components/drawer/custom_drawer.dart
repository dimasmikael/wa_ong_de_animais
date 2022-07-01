import 'package:flutter/material.dart';
import 'package:projeto_pet_adoption_app/components/size-config/size-config.dart';
import 'package:projeto_pet_adoption_app/pages/login/login_page.dart';
import 'package:projeto_pet_adoption_app/services/prefs-service.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              title: Text(
                'Menu',
                style: TextStyle(fontSize: SizeConfig.safeBlockVertical! * 3),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                size: SizeConfig.safeBlockVertical! * 4,
              ),
              title: Text(
                'Exit',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockVertical! * 3,
                ),
              ),
              onTap: () {
                PrefsService.logout();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                    (_) => true);
              },
            ),
          ],
        ),
      ),
    );
  }
}
