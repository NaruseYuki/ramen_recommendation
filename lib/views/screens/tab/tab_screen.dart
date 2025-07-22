import 'package:flutter/material.dart';
import 'package:ramen_recommendation/utils/color.dart';
import 'package:ramen_recommendation/views/screens/favorite_places_screen.dart';
import 'package:ramen_recommendation/views/screens/home_screen.dart';

import '../menu/menu.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.animation?.addListener(() {
      setState(() {}); // アニメーションの進行に合わせて再描画
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget buildTab(String label, String assetPath, int index) {
    // 現在の選択位置（アニメーション中は中間値になる）
    final double selectedIndex =
        _tabController.animation?.value ?? _tabController.index.toDouble();
    final bool isSelected = (selectedIndex - index).abs() < 0.5;

    return Tab(
      text: label,
      icon: SizedBox(
        width: 24,
        height: 24,
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            isSelected ? Colors.white : Colors.grey,
            BlendMode.srcIn,
          ),
          child: Image.asset(assetPath, fit: BoxFit.contain),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/images/ic_splash.png',
            fit: BoxFit.fill,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.star),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavoritePlacesScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        drawer: const AppDrawer(),
        body: TabBarView(
          controller: _tabController,
          children: const [
            HomeScreen(),
            Center(
              child: Text(
                'フリーワード検索機能は現在開発中です。\nお楽しみに！',
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Text(
                '訪問記録機能は現在開発中です。\nお楽しみに！',
                textAlign: TextAlign.center,
              ),
            ),
            FavoritePlacesScreen(),
          ],
        ),
        bottomNavigationBar: Container(
          color: AppColor.primary,
          child: TabBar(
            controller: _tabController,
            labelPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            indicatorColor: AppColor.secondary,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              buildTab('分析する', 'assets/images/ic_analyze.png', 0),
              buildTab('探す', 'assets/images/ic_search.png', 1),
              buildTab('訪問記録', 'assets/images/ic_history.png', 2),
              buildTab('お気に入り', 'assets/images/ic_favorite.png', 3),
            ],
          ),
        ),
      ),
    );
  }
}
