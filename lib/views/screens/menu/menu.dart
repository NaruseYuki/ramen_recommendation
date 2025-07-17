// lib/views/widgets/app_drawer.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> menuList = [
      'menu.top'.tr(),
      'menu.favorite'.tr(),
      'menu.archive'.tr(),
      'menu.license'.tr()
    ];

    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Center(
              child: Text(
                'DrawerHeader',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 1.0,
            color: Colors.black,
          ),
          ...menuList.map(
                (e) => _buildListTile(context, e), //、mapでmenuListの各要素をListTileに変換し、...でリストを展開して表示
          )
        ],
      ),
    );
  }

  Widget _buildListTile(BuildContext context, String title) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                ),
              ),
              IconButton(
                onPressed: () {
                  // ここに各メニュー項目に応じたナビゲーションロジックを追加
                  // 例: Navigator.pop(context); // ドロワーを閉じる
                  // 例: Navigator.push(context, MaterialPageRoute(builder: (context) => YourNewScreen()));
                },
                icon: const Icon(Icons.arrow_circle_right),
              )
            ],
          ),
        ),
        const Divider(
          thickness: 1.0,
          color: Colors.black,
        ),
      ],
    );
  }
}