import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../vm/side_bar_vm.dart';
import 'dia_app_bar.dart';
import '../config/dia_route_enums.dart';
import 'dia_side_bar.dart';
import 'responsive_helpers.dart';

class DiaScaffold extends StatelessWidget {
  final Widget? childwidget;

  const DiaScaffold({super.key, this.childwidget});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SideBarVM()),
      ],
      child: Consumer<SideBarVM>(builder: (context, vm, child) {
        return Scaffold(
          drawer: ResponsiveHelpers.isDesktop(context) ? null : const DiaDrawerScreen(),
          body: Column(
            children: [
              DiaAppBar(childwidget: childwidget),
              ResponsiveHelpers.isDesktop(context)
                  ? Expanded(
                      child: Row(
                        children: [
                          if (childwidget == null) const DiaSideBar(),
                          Expanded(
                            child: childwidget ?? vm.menuName?.page ?? const DiaSideBar(),
                          )
                        ],
                      ),
                    )
                  : Expanded(child: vm.drawerEnum?.page ?? const DiaSideBar()),
            ],
          ),
        );
      }),
    );
  }
}
