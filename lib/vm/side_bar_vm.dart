import 'package:flutter/material.dart';
import '../config/dia_route_enums.dart';

class SideBarVM extends ChangeNotifier {
  bool isSideBarClicked = false;
  SideBarMenuName? menuName;
  BottomNavMenuName? bottomNavMenuName;
  DrawerEnum? drawerEnum = DrawerEnum.dashboard;
  SalesEnum? salesEnum = SalesEnum.dineIn;
  SalesEnum? selectedSalesEnum = SalesEnum.dineIn;
  HRMEnum? hrmEnum = HRMEnum.employeeManagement;
  HRMEnum? selectedHRMEnum = HRMEnum.employeeManagement;

  Color? color;
  SideBarVM() {
    menuName = SideBarMenuName.home;
    bottomNavMenuName = BottomNavMenuName.dineIn;

    print('SideBarVm');
  }

  refresh() {
    notifyListeners();
  }
}
