import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../configs/colors.dart';
import '../../models/chocolate.dart';
import 'chart.dart';

class MonthlySummary extends StatefulWidget {
  const MonthlySummary({
    super.key,
    required this.listChocolateByMonth,
    required this.month,
  });

  final List<Chocolate> listChocolateByMonth;
  final String month;

  @override
  State<MonthlySummary> createState() => _MonthlySummaryState();
}

class _MonthlySummaryState extends State<MonthlySummary> {
  @override
  Widget build(BuildContext context) {
    widget.listChocolateByMonth.sort((a, b) => b.volume.compareTo(a.volume));
    return widget.listChocolateByMonth.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'asset/images/notfound.json',
                  fit: BoxFit.fill,
                ),
                Text(
                  "No Data Found",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          )
        : SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "${widget.month.toUpperCase()}",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                  ),
                  Chart(
                    listChocolate: widget.listChocolateByMonth,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Monthly Top 5 Chocolate Bars & Production",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.listChocolateByMonth.length > 5
                        ? 5
                        : widget.listChocolateByMonth.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: primaryColor,
                            width: 0.5.sp,
                          ),
                        ),
                        elevation: 3.sp,
                        child: ListTile(
                          leading: Icon(
                            Icons.nature,
                            color: graphColor[index],
                          ),
                          title: Text(
                            widget.listChocolateByMonth[index].chocolateType,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15.sp,
                            ),
                          ),
                          subtitle: Text(
                            "Volume: ${widget.listChocolateByMonth[index].volume}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                            ),
                          ),
                          trailing: Text(
                            (index + 1).toString(),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 1.h,
                      );
                    },
                  )
                ],
              ),
            ),
          );
  }
}
