import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mahfazty/features/dashboard/ui/widgets/latest_entry.dart';

class FullEntries extends StatelessWidget {
  final List enteries = [
    {
      "icon": Icons.money,
      "category": "Food",
      "date": "20 Feb 2024",
      "cost": "20\$ + 0.5% Vat",
      "paymentMethod": "Google Pay",
    },
    {
      "icon": Icons.directions_bike,
      "category": "Uber",
      "date": "13 Mar 2024",
      "cost": "18\$ + 0.8% Vat",
      "paymentMethod": "Cash",
    },
    {
      "icon": Icons.shopping_bag_outlined,
      "category": "Shopping",
      "date": "11 Mar 2024",
      "cost": "400\$ + 0.12% Vat",
      "paymentMethod": "Instapay",
    },
    {
      "icon": Icons.cake,
      "category": "Birthday",
      "date": "10 Mar 2024",
      "cost": "20\$ + 0.5% Vat",
      "paymentMethod": "Google Pay",
    },
    {
      "icon": Icons.call_end,
      "category": "Phone Bill",
      "date": "10 July 2026",
      "cost": "50\$ + 0.8% Vat",
      "paymentMethod": "Vodafone Cash",
    },
    {
      "icon": Icons.coffee,
      "category": "Coffe",
      "date": "25 July 2026",
      "cost": "35\$ + 0.7% Vat",
      "paymentMethod": "Cash",
    },
  ];
  FullEntries({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      itemCount: enteries.length,
      itemBuilder: (c, i) => LatestEntry(
        category: enteries[i]["category"],
        cost: enteries[i]["cost"],
        date: enteries[i]["date"],
        icon: enteries[i]["icon"],
        paymentMethod: enteries[i]["paymentMethod"],
      ),
      separatorBuilder: (c, i) => Gap(20.h),
    );
  }
}
