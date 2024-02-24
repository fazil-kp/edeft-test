import 'package:dine_in_dia/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:provider/provider.dart';
import '../vm/side_bar_vm.dart';
import '../config/dia_route_enums.dart';

class DiaSideBar extends StatelessWidget {
  const DiaSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SideBarVM>(builder: (context, vm, child) {
      return SizedBox(
        width: 100,
        child: ListView(
          children: const [
            SideBarButton(menuName: SideBarMenuName.home, icon: Icons.home_outlined),
            SideBarButton(menuName: SideBarMenuName.sales, icon: Icons.monetization_on_rounded),
            SideBarButton(menuName: SideBarMenuName.stocks, icon: Icons.insert_chart),
            SideBarButton(menuName: SideBarMenuName.hrm, icon: Icons.person),
            SideBarButton(menuName: SideBarMenuName.crm, icon: Icons.groups_2),
            SideBarButton(menuName: SideBarMenuName.accounts, icon: Icons.account_balance),
            SideBarButton(menuName: SideBarMenuName.restaurent, icon: Icons.food_bank),
            SideBarButton(menuName: SideBarMenuName.reports, icon: Icons.bar_chart),
            SideBarButton(menuName: SideBarMenuName.settings, icon: Icons.settings),
            SideBarButton(icon: Icons.power_settings_new),
          ],
        ),
      );
    });
  }
}

class SideBarButton extends StatelessWidget {
  final SideBarMenuName? menuName;
  final IconData icon;

  const SideBarButton({super.key, this.menuName, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Consumer<SideBarVM>(builder: (context, vm, child) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  if (menuName?.name == null) {
                    return;
                  } else {
                    vm.menuName = menuName;
                    vm.menuName?.page;
                    vm.refresh();
                  }
                },
                borderRadius: BorderRadius.circular(10.0),
                child: Card(
                    child: HoverAnimatedContainer(
                  width: 30,
                  height: 30,
                  hoverHeight: 35,
                  hoverWidth: 35,
                  child: Icon(
                    icon,
                    size: 25,
                    color: vm.menuName == menuName ? Colors.red : Colors.grey,
                  ),
                ))),
            const SizedBox(width: 10.0),
            Text(
              menuName?.name ?? 'Logout',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 10.0,
                    color: vm.menuName == menuName
                        ? Colors.red
                        : const Color.fromARGB(255, 37, 26, 26),
                  ),
            ),
          ],
        ),
      );
    });
  }
}

class AppBarCards extends StatelessWidget {
  final SideBarMenuName? menuName;
  final SalesEnum? selectedSalesEnum;

  const AppBarCards({
    super.key,
    this.menuName,
    this.selectedSalesEnum,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SideBarVM>(builder: (context, sidebarVM, child) {
      return Tooltip(
        message: selectedSalesEnum?.value,
        child: IconButton(
          icon: Icon(
            selectedSalesEnum?.icon,
            color: UiColor.extraDarkGreyColor.withAlpha(170),
            size: 20,
          ),
          onPressed: () async {
            sidebarVM.menuName = menuName;
            sidebarVM.salesEnum = selectedSalesEnum;
            sidebarVM.refresh();
          },
        ),
      );
    });
  }
}
