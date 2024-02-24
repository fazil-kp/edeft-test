import 'package:dine_in_dia/helpers/responsive_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../vm/side_bar_vm.dart';
import '../config/dia_route_enums.dart';
import 'dia_side_bar.dart';

class DiaAppBar extends StatelessWidget {
  final Widget? childwidget;
  const DiaAppBar({super.key, this.childwidget});

  @override
  Widget build(BuildContext context) {
    final respo = ResponsiveHelpers.isDesktop(context);
    return Consumer<SideBarVM>(
      builder: (context, vm, child) {
        return SafeArea(
          child: Container(
            height: 60.0,
            decoration: BoxDecoration(
                color: Theme.of(context).appBarTheme.backgroundColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    }),
                const SizedBox(width: 3.0),
                Image.asset('assets/images/screl.png', height: 18),
                const Spacer(),
                if (childwidget == null)
                  if (respo)
                    const AppBarCards(
                      menuName: SideBarMenuName.sales,
                      selectedSalesEnum: SalesEnum.dineIn,
                    ),
                if (childwidget == null)
                  if (respo)
                    const AppBarCards(
                      menuName: SideBarMenuName.sales,
                      selectedSalesEnum: SalesEnum.takeAway,
                    ),
                if (childwidget == null)
                  if (respo)
                    const AppBarCards(
                      menuName: SideBarMenuName.sales,
                      selectedSalesEnum: SalesEnum.delivery,
                    ),
                if (childwidget == null)
                  if (respo)
                    const AppBarCards(
                      menuName: SideBarMenuName.sales,
                      selectedSalesEnum: SalesEnum.orders,
                    ),
                if (childwidget == null)
                  if (respo)
                    const AppBarCards(
                      menuName: SideBarMenuName.sales,
                      selectedSalesEnum: SalesEnum.token,
                    ),
                if (childwidget == null)
                  if (respo)
                    const AppBarCards(
                      menuName: SideBarMenuName.sales,
                      selectedSalesEnum: SalesEnum.bookTable,
                    ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class DiaDrawerScreen extends StatelessWidget {
  const DiaDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SideBarVM>(builder: (context, vm, child) {
      return Drawer(
        child: Container(
          color: whiteColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  child: Image.asset('assets/images/screl.png', height: 18)),
              const SizedBox(height: 50),
              ListTile(
                leading: Icon(
                  Icons.dashboard,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text('Dashboard',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
                        )),
                onTap: () {
                  vm.drawerEnum = DrawerEnum.dashboard;
                  vm.refresh();
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 15),
              ListTile(
                leading: Icon(
                  Icons.book,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text('Book Table',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
                        )),
                onTap: () {
                  vm.drawerEnum = DrawerEnum.booktable;
                  vm.refresh();

                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 15),
              ListTile(
                leading: Icon(
                  Icons.list,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text('Item List',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
                        )),
                onTap: () {
                  vm.drawerEnum = DrawerEnum.itemlist;
                  vm.refresh();
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 15),
              ListTile(
                leading: Icon(
                  CupertinoIcons.grid_circle,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text('Token List',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
                        )),
                onTap: () {
                  vm.drawerEnum = DrawerEnum.tokenlist;
                  vm.refresh();
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 15),
              ListTile(
                leading: Icon(
                  Icons.support,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text('Support',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
                        )),
                onTap: () {
                  vm.drawerEnum = DrawerEnum.support;
                  vm.refresh();
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 15),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                title: Text('Logout',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
                        )),
                onTap: () {
                 
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
