import 'package:dine_in_dia/helpers/bottom_navigation_bar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../home.dart';


enum RoutePathDia {
  scaffold,
  login,
  splash,
}

/// ************************************************sidebar**************************************
enum SideBarMenuName { home, sales, stocks, hrm, crm, accounts, logout, restaurent, reports, settings }

extension SideBarMenuNameExtension on SideBarMenuName {
  String get name {
    switch (this) {
      case SideBarMenuName.home:
        return 'Dashboard';
      case SideBarMenuName.stocks:
        return 'Stocks';
      case SideBarMenuName.hrm:
        return 'HRM';
      case SideBarMenuName.crm:
        return 'CRM';
      case SideBarMenuName.accounts:
        return 'Accounts';
      case SideBarMenuName.logout:
        return 'Logout';
      case SideBarMenuName.sales:
        return 'Sales';
      case SideBarMenuName.restaurent:
        return 'Restaurent';
      case SideBarMenuName.reports:
        return 'Reports';
      case SideBarMenuName.settings:
        return 'Settings';
    }
  }
}

extension SideBarMenuNameIconExtension on SideBarMenuName {
  IconData get icon {
    switch (this) {
      case SideBarMenuName.home:
        return Icons.dashboard;
      case SideBarMenuName.sales:
        return Icons.monetization_on_rounded;
      case SideBarMenuName.stocks:
        return Icons.insert_chart;
      case SideBarMenuName.hrm:
        return Icons.person;
      case SideBarMenuName.crm:
        return Icons.groups_2;
      case SideBarMenuName.accounts:
        return Icons.account_balance;
      case SideBarMenuName.logout:
        return Icons.logout;
      case SideBarMenuName.restaurent:
        return Icons.food_bank;
      case SideBarMenuName.reports:
        return Icons.bar_chart;
      case SideBarMenuName.settings:
        return Icons.settings;
    }
  }
}

extension SideBarMenuNamePageExtension on SideBarMenuName {
  Widget? get page {
    switch (this) {
      case SideBarMenuName.home:
        return const HomePage();
      case SideBarMenuName.sales:
        return const Text("data");
      case SideBarMenuName.stocks:
        return const Text("data");
      case SideBarMenuName.hrm:
        return const Text("data");
      case SideBarMenuName.crm:
        return const Text("data");
      case SideBarMenuName.accounts:
        return const Text("data");
      case SideBarMenuName.restaurent:
        return const Text("data");
      case SideBarMenuName.reports:
        return const Text("data");
      case SideBarMenuName.settings:
        return const Text("data");
      case SideBarMenuName.logout:
        return null;
      default:
        return const HomePage();
    }
  }
}

/// ************************************************bottomnav**************************************
enum BottomNavMenuName { dineIn, takeAway, delivery, orders, invoice }

extension BottomNavMenuNameExtension on BottomNavMenuName {
  String get name {
    switch (this) {
      case BottomNavMenuName.dineIn:
        return 'Dine In';
      case BottomNavMenuName.takeAway:
        return 'Take Away';
      case BottomNavMenuName.delivery:
        return 'Delivery';

      case BottomNavMenuName.orders:
        return 'Running Orders';
      case BottomNavMenuName.invoice:
        return 'Invoice';
    }
  }
}

extension BottomNavMenuNameIconExtension on BottomNavMenuName {
  IconData get icon {
    switch (this) {
      case BottomNavMenuName.dineIn:
        return FontAwesomeIcons.bowlRice;
      case BottomNavMenuName.takeAway:
        return Icons.shopping_bag;
      case BottomNavMenuName.delivery:
        return Icons.delivery_dining;
      case BottomNavMenuName.orders:
        return FontAwesomeIcons.personRunning;
      case BottomNavMenuName.invoice:
        return Icons.receipt;
    }
  }
}

extension BottomNavMenuNamePageExtension on BottomNavMenuName {
  Widget get page {
    switch (this) {
      case BottomNavMenuName.dineIn:
        return const Text("data");

      case BottomNavMenuName.takeAway:
        return const Text("data");

      case BottomNavMenuName.delivery:
        return const Text("data");

      case BottomNavMenuName.orders:
        return const Text("data");

      case BottomNavMenuName.invoice:
        return const Text("data");

      default:
        return const Text("data");
    }
  }
}

/// ************************************************drawer**************************************
enum DrawerEnum { dashboard, booktable, itemlist, tokenlist, support, logout }

extension DrawerEnumExtension on DrawerEnum {
  String get value {
    switch (this) {
      case DrawerEnum.dashboard:
        return 'Dashboard';
      case DrawerEnum.booktable:
        return 'Book Table';
      case DrawerEnum.itemlist:
        return 'Item List';
      case DrawerEnum.tokenlist:
        return 'Token List';
      case DrawerEnum.support:
        return 'Support';
      case DrawerEnum.logout:
        return 'Logout';
    }
  }
}

extension DrawerEnumIconExtension on DrawerEnum {
  IconData get icon {
    switch (this) {
      case DrawerEnum.dashboard:
        return Icons.dashboard;
      case DrawerEnum.booktable:
        return Icons.book;
      case DrawerEnum.itemlist:
        return Icons.list;
      case DrawerEnum.tokenlist:
        return CupertinoIcons.grid_circle;
      case DrawerEnum.support:
        return Icons.support;
      case DrawerEnum.logout:
        return Icons.logout;
    }
  }
}

extension DrawerEnumPageExtension on DrawerEnum {
  Widget? get page {
    switch (this) {
      case DrawerEnum.dashboard:
        return const MobileNavigationBar();
      case DrawerEnum.booktable:
        return const Text("data");

      case DrawerEnum.itemlist:
        return const Text("data");
      case DrawerEnum.tokenlist:
        return const Text("data");
      case DrawerEnum.support:
        return const Text("data");
      case DrawerEnum.logout:
        return null;
    }
  }
}

/// ************************************************sales**************************************
enum SalesEnum { dineIn, takeAway, delivery, orders, token, bookTable }

extension SalesEnumExtension on SalesEnum {
  String get value {
    switch (this) {
      case SalesEnum.dineIn:
        return 'Dine In';
      case SalesEnum.bookTable:
        return 'Book Table';
      case SalesEnum.delivery:
        return 'Delivery';
      case SalesEnum.takeAway:
        return 'Take Away';
      case SalesEnum.orders:
        return 'Orders';
      case SalesEnum.token:
        return 'Token';
    }
  }
}

extension SalesEnumIconExtension on SalesEnum {
  IconData get icon {
    switch (this) {
      case SalesEnum.dineIn:
        return Icons.ramen_dining_outlined;
      case SalesEnum.takeAway:
        return Icons.shopping_bag;
      case SalesEnum.delivery:
        return Icons.delivery_dining_sharp;
      case SalesEnum.orders:
        return Icons.shopping_cart;
      case SalesEnum.token:
        return CupertinoIcons.grid_circle;
      case SalesEnum.bookTable:
        return Icons.table_chart;
    }
  }
}

extension SalesEnumPageExtension on SalesEnum {
  Widget get page {
    switch (this) {
      case SalesEnum.dineIn:
        return const Text("data");

      case SalesEnum.bookTable:
        return const Text("data");

      case SalesEnum.delivery:
        return const Text("data");
      case SalesEnum.takeAway:
        return const Text("data");
      case SalesEnum.orders:
        return const Text("data");
      case SalesEnum.token:
        return const Text("data");
      default:
        return const Text("data");
    }
  }
}

/// ***********************************************************stocks****************************
enum StocksEnum { inventory, stockIn, stockOut, stockTransfer }

extension StocksEnumExtension on StocksEnum {
  String get value {
    switch (this) {
      case StocksEnum.inventory:
        return 'Inventory';
      case StocksEnum.stockIn:
        return 'Stock In';
      case StocksEnum.stockOut:
        return 'Stock Out';
      case StocksEnum.stockTransfer:
        return 'Stock Transfer';
    }
  }
}

extension StocksEnumIconExtension on StocksEnum {
  IconData get icon {
    switch (this) {
      case StocksEnum.inventory:
        return Icons.inventory;
      case StocksEnum.stockIn:
        return Icons.arrow_upward;
      case StocksEnum.stockOut:
        return Icons.arrow_downward;
      case StocksEnum.stockTransfer:
        return Icons.swap_horiz;
    }
  }
}

/// ***********************************************************HRM****************************
enum HRMEnum { employeeManagement, employeeView, attendance, payroll }

extension HRMEnumExtension on HRMEnum {
  String get value {
    switch (this) {
      case HRMEnum.employeeManagement:
        return ' Employee Management';
      case HRMEnum.attendance:
        return 'Attendance';
      case HRMEnum.payroll:
        return 'Payroll';
      case HRMEnum.employeeView:
        return 'Employee View';
    }
  }
}

extension HRMEnumIconExtension on HRMEnum {
  IconData get icon {
    switch (this) {
      case HRMEnum.employeeManagement:
        return Icons.people;
      case HRMEnum.attendance:
        return Icons.access_time;
      case HRMEnum.payroll:
        return Icons.monetization_on;
      case HRMEnum.employeeView:
        return Icons.person;
    }
  }
}

extension HRMEnumPageExtension on HRMEnum {
  Widget get page {
    switch (this) {
      case HRMEnum.employeeManagement:
        return const Text("data");

      case HRMEnum.attendance:
        return const Text("data");

      case HRMEnum.payroll:
        return const Text("data");

      case HRMEnum.employeeView:
        return const Text("data");
    }
  }
}

/// ***********************************************************CRM****************************
enum CRMEnum { customers }

extension CRMEnumExtension on CRMEnum {
  String get value {
    switch (this) {
      case CRMEnum.customers:
        return 'Customers';
    }
  }
}

extension CRMEnumIconExtension on CRMEnum {
  IconData get icon {
    switch (this) {
      case CRMEnum.customers:
        return Icons.people;
    }
  }
}

/// ***********************************************************Accounts****************************
enum AccountsEnum { accounts, transactions, reports, settings }

extension AccountsEnumExtension on AccountsEnum {
  String get value {
    switch (this) {
      case AccountsEnum.accounts:
        return 'Accounts';
      case AccountsEnum.transactions:
        return 'Transactions';
      case AccountsEnum.reports:
        return 'Reports';
      case AccountsEnum.settings:
        return 'Settings';
    }
  }
}

extension AccountsEnumIconExtension on AccountsEnum {
  IconData get icon {
    switch (this) {
      case AccountsEnum.accounts:
        return Icons.account_balance;
      case AccountsEnum.transactions:
        return Icons.compare_arrows;
      case AccountsEnum.reports:
        return Icons.receipt;
      case AccountsEnum.settings:
        return Icons.settings;
    }
  }
}

/// ***********************************************************Restaurent****************************
enum RestaurentEnum { rm }

/// ***********************************************************Reports****************************
enum ReportsEnum { reports }

/// ***********************************************************Settings****************************
enum SettingsEnum { areaFloorManagement, settings }

extension SettingsEnumExt on SettingsEnum {
  String get value {
    switch (this) {
      case SettingsEnum.settings:
        return 'Settings';
      case SettingsEnum.areaFloorManagement:
        return 'Area & Floor Management';
    }
  }
}

extension SettingsEnumEIconxt on SettingsEnum {
  IconData get icon {
    switch (this) {
      case SettingsEnum.settings:
        return Icons.settings;
      case SettingsEnum.areaFloorManagement:
        return Icons.app_registration;
    }
  }
}

extension SettingsEnumPageExtension on SettingsEnum {
  Widget get page {
    switch (this) {
      case SettingsEnum.areaFloorManagement:
        return const Text("data");
      case SettingsEnum.settings:
        return const Text("data");
      default:
        return const Text("data");
    }
  }
}
