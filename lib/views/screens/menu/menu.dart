// lib/views/widgets/app_drawer.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../utils/color.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // menuListには翻訳前のキー文字列を保持する
    final List<String> menuKeys = [
      'menu.license',
    ];

    return Drawer(
      // Drawer の子として Material を追加し、その色を設定
      child: Material(
        color: AppColor.primary.withValues(alpha: 0.2),
        child: ListView(
          children: [
            const Divider(
              thickness: 1.0,
              color: Colors.black,
            ),
            ...menuKeys.map(
                // mapでmenuKeysの各要素（キー文字列）を_buildListTileに渡す
                (key) => _buildListTile(context, key)),
            // TODO 今後シェア機能つけたい
          ],
        ),
      ),
    );
  }

  // menuKey（翻訳前の文字列）を受け取るように変更
  Widget _buildListTile(BuildContext context, String menuKey) {
    return Column(
      children: [
        InkWell(
          onTap: () async {
            await nextScreen(context, menuKey);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    menuKey.tr(), // 表示する際には翻訳する
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                const IconButton(
                  // onPressedがないためconstにできる
                  onPressed: null,
                  // 全体がInkWellでタップされるので、IconButtonのonPressedは不要
                  icon: Icon(Icons.arrow_circle_right),
                )
              ],
            ),
          ),
        ),
        const Divider(
          thickness: 1.0,
          color: Colors.black,
        ),
      ],
    );
  }

  Future<void> nextScreen(BuildContext context, String menuKey) async {
    // Drawerを閉じる
    Navigator.pop(context);
    // 翻訳前のキー文字列で分岐する
    switch (menuKey) {
      case 'menu.license':
        final PackageInfo packageInfo = await PackageInfo.fromPlatform();
        final String version = packageInfo.version; // pubspec.yamlのバージョンを取得
        if (context.mounted) {
          showLicensePage(
            context: context,
            applicationName: 'app_title'.tr(),
            applicationVersion: version, // 取得したバージョンを渡す
          );
        }
        break;
      default:
        break;
    }
  }
}
