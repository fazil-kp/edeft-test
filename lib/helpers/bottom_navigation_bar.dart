import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../vm/side_bar_vm.dart';
import '../config/dia_route_enums.dart'; 
class MobileNavigationBar extends StatelessWidget {
  const MobileNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SideBarVM>(builder: (context, vm, _) {
      return Scaffold(
        body: vm.bottomNavMenuName?.page,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
          child: SalomonBottomBar(
            currentIndex: vm.bottomNavMenuName?.index ?? 0,
            onTap: (i) {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
              vm.bottomNavMenuName = BottomNavMenuName.values[i];
              vm.refresh();
            },
            items: BottomNavMenuName.values.map((menuName) {
              return SalomonBottomBarItem(
                icon: Icon(menuName.icon),
                title: Text(menuName.name),
                selectedColor: Theme.of(context).primaryColor,
              );
            }).toList(),
          ),
        ),
      );
    });
  }
}
