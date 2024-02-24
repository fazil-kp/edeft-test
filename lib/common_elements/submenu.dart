import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

import '../config/dia_route_enums.dart';

class SubmenuCard extends StatelessWidget {
  final IconData icon;
  final SalesEnum? salesEnum;
  final StocksEnum? stocksEnum;
  final HRMEnum? hrmEnum;
  final CRMEnum? crmEnum;
  final AccountsEnum? accountsEnum;
  final RestaurentEnum? restaurentEnum;
  final ReportsEnum? reportsEnum;
  final SettingsEnum? settingsEnum;
  final bool isSelected;
  final Function(bool) onSelected;

  const SubmenuCard({
    super.key,
    required this.icon,
    this.salesEnum,
    this.stocksEnum,
    this.hrmEnum,
    this.crmEnum,
    this.accountsEnum,
    this.restaurentEnum,
    this.reportsEnum,
    this.settingsEnum,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    String? title = salesEnum?.value ??
        stocksEnum?.value ??
        hrmEnum?.value ??
        crmEnum?.value ??
        accountsEnum?.value ??
        settingsEnum?.value ??
        "";
    IconData? icon = salesEnum?.icon ??
        stocksEnum?.icon ??
        hrmEnum?.icon ??
        crmEnum?.icon ??
        accountsEnum?.icon ??
        settingsEnum?.icon ??
        Icons.error;
    Color iconColor = isSelected ? Colors.red : Colors.grey;
    return InkWell(
      onTap: () {
        onSelected(!isSelected);
      },
      borderRadius: BorderRadius.circular(10.0),
      child: Column(
        children: [
          Card(
            child: HoverAnimatedContainer(
              width: 30,
              height: 30,
              hoverHeight: 35,
              hoverWidth: 35,
              child: Icon(
                icon,
                size: 20,
                color: iconColor,
              ),
            ),
          ),
          SizedBox(
            width: 50.0,
            child: Center(
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: Colors.grey, fontSize: 10.0),
                overflow: TextOverflow.clip,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
