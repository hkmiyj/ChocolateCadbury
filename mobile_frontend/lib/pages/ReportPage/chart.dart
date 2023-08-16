import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_frontend/configs/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../models/chocolate.dart';
import '../../templates/custom_horizontalListView.dart';

class Chart extends StatefulWidget {
  final List<Chocolate> listChocolate;

  const Chart({
    Key? key,
    required this.listChocolate,
  }) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  int? explodeIndex;

  List<Color> generatedColor = [];
  List<Chocolate> chocolates = [];
  int totalvolume = 0;

  @override
  void initState() {
    chocolates = widget.listChocolate;

    generatedColor.addAll([
      ...chocolates
          .map((e) => graphColor[Random().nextInt(graphColor.length - 1)])
          .toList()
    ]);

    totalvolume = chocolates.fold(
        0, (previousValue, chocolate) => previousValue + chocolate.volume);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SfCircularChart(
          enableMultiSelection: false,
          annotations: [
            CircularChartAnnotation(
              horizontalAlignment: ChartAlignment.center,
              verticalAlignment: ChartAlignment.center,
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Total Volume  ",
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    totalvolume.toString(),
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ],
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <CircularSeries>[
            DoughnutSeries<_ChartData, String>(
              dataSource: List.generate(chocolates.length, (index) {
                final chocolate = chocolates[index];
                return _ChartData(
                  chocolate.chocolateType,
                  chocolate.volume.toDouble(),
                  generatedColor[index],
                );
              }),
              onPointTap: (pointInteractionDetails) {
                setState(() {
                  explodeIndex = pointInteractionDetails.pointIndex;
                });
              },
              pointColorMapper: (_ChartData data, _) => data.color,
              xValueMapper: (_ChartData data, _) => data.category,
              yValueMapper: (_ChartData data, _) => data.value,
              explode: true,
              enableTooltip: true,
              explodeIndex: explodeIndex,
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: chocolates.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return HorizontalListViewItem(
                itemColor: generatedColor[index],
                title: chocolates[index].chocolateType,
                value: chocolates[index].volume.toString(),
                isSelected: explodeIndex == index,
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ChartData {
  _ChartData(
    this.category,
    this.value,
    this.color,
  );
  final Color color;
  final String category;
  final double value;
}
