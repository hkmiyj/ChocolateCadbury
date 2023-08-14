import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/colors.dart';
import '../../models/chocolate.dart';
import '../../services/chocolate_service.dart';
import '../../templates/custom_loading.dart';
import 'monthly_report.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChocolateService>(
        builder: (context, chocolateService, child) {
      List<Chocolate> chocolates = chocolateService.chocolate;
      bool isLoading = chocolates.isEmpty;
      return DefaultTabController(
        length: 12,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "CADBURY",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  color: logoColor),
            ),
            bottom: TabBar(
              isScrollable: true,
              tabs: months.map((text) => Tab(text: text)).toList(),
            ),
          ),
          body: isLoading
              ? const Center(
                  child: CustomLoading(),
                )
              : TabBarView(
                  children: [
                    MonthlySummary(
                      listChocolateByMonth:
                          chocolateService.getChocolatesForMonth("Jan"),
                      month: "January",
                    ),
                    MonthlySummary(
                      listChocolateByMonth:
                          chocolateService.getChocolatesForMonth("Feb"),
                      month: "February",
                    ),
                    MonthlySummary(
                      listChocolateByMonth:
                          chocolateService.getChocolatesForMonth("Mar"),
                      month: "March",
                    ),
                    MonthlySummary(
                      listChocolateByMonth:
                          chocolateService.getChocolatesForMonth("Apr"),
                      month: "April",
                    ),
                    MonthlySummary(
                      listChocolateByMonth:
                          chocolateService.getChocolatesForMonth("May"),
                      month: "May",
                    ),
                    MonthlySummary(
                      listChocolateByMonth:
                          chocolateService.getChocolatesForMonth("Jun"),
                      month: "June",
                    ),
                    MonthlySummary(
                      listChocolateByMonth:
                          chocolateService.getChocolatesForMonth("Jul"),
                      month: "July",
                    ),
                    MonthlySummary(
                      listChocolateByMonth:
                          chocolateService.getChocolatesForMonth("Aug"),
                      month: "August",
                    ),
                    MonthlySummary(
                      listChocolateByMonth:
                          chocolateService.getChocolatesForMonth("Oct"),
                      month: "September",
                    ),
                    MonthlySummary(
                      listChocolateByMonth:
                          chocolateService.getChocolatesForMonth("Sep"),
                      month: "October",
                    ),
                    MonthlySummary(
                      listChocolateByMonth:
                          chocolateService.getChocolatesForMonth("Nov"),
                      month: "November",
                    ),
                    MonthlySummary(
                      listChocolateByMonth:
                          chocolateService.getChocolatesForMonth("Dec"),
                      month: "December",
                    )
                  ],
                ),
        ),
      );
    });
  }

  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];
}
