import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HorizontalListViewItem extends StatelessWidget {
  final String title;
  final String value;
  final Color itemColor;
  final bool isSelected; // Add this variable

  const HorizontalListViewItem({
    Key? key,
    required this.title,
    required this.value,
    required this.itemColor,
    required this.isSelected, // Initialize isSelected
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Add logic to handle item selection here
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        decoration: BoxDecoration(
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // Adjust the offset as needed
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            SizedBox(
              child: Icon(
                Icons.circle,
                color: itemColor,
                size: 25.sp,
              ),
            ),
            SizedBox(width: 1.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
                ),
                Text(
                  value,
                  style: TextStyle(fontSize: 15.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}