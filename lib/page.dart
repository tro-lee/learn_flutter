import 'package:buhuiwangshi/pages/add/page.dart';
import 'package:buhuiwangshi/pages/feature/page.dart';
import 'package:buhuiwangshi/pages/home/page.dart';
import 'package:buhuiwangshi/store.dart';
import 'package:buhuiwangshi/utils/animate_route.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 主页面组件
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      body: CurrentPageWidget(),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}

/// 当前页面组件
class CurrentPageWidget extends StatelessWidget {
  const CurrentPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SystemStore>(
      builder: (context, systemStore, child) {
        final currentIndex = systemStore.currentIndex;
        switch (currentIndex) {
          case 0:
            return const HomePage();
          case 1:
            return const AddPage();
          case 2:
            return const FeaturePage();
          default:
            return const HomePage();
        }
      },
    );
  }
}

/// 底部导航栏组件
class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const barContainer = Colors.white;
    const onBarContainer = Colors.black;

    // 定义底部导航栏项目
    var items = [
      CustomNavigationBarItem(
        icon: const Icon(Icons.home_outlined, size: 28),
        selectedIcon: const Icon(Icons.home, size: 28),
      ),
      CustomNavigationBarItem(
        icon: const Icon(Icons.add_circle_outline, size: 28),
        selectedIcon: const Icon(Icons.add_circle, size: 28),
      ),
      CustomNavigationBarItem(
        icon: const Icon(Icons.interests_outlined, size: 28),
        selectedIcon: const Icon(Icons.interests, size: 28),
      )
    ];

    return Consumer<SystemStore>(
      builder: (context, systemStore, child) {
        // 处理底部导航栏点击事件
        void onTap(int index) {
          if (index == 1) {
            // 打开添加页面
            Navigator.of(context).push(animateRoute(child: const AddPage()));
          } else {
            systemStore.setCurrentIndex(index);
          }
        }

        // 创建自定义底部导航栏
        return SizedBox(
          height: 42,
          child: CustomNavigationBar(
            // 动画设置
            scaleCurve: Curves.fastEaseInToSlowEaseOut,
            scaleFactor: 0.1,
            iconSize: 28,
            // 颜色设置
            selectedColor: onBarContainer,
            unSelectedColor: onBarContainer,
            strokeColor: Colors.transparent,
            backgroundColor: barContainer,
            // 导航项目和选择逻辑
            items: items,
            currentIndex: systemStore.currentIndex,
            onTap: onTap,
          ),
        );
      },
    );
  }
}
