import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HorizontalListViewItem extends StatelessWidget {
  final String title;
  final String value;
  final Color itemColor;
  final bool isSelected; // Add this variable
  final void Function()? onTap;

  const HorizontalListViewItem({
    Key? key,
    required this.title,
    required this.value,
    required this.itemColor,
    required this.isSelected, // Initialize isSelected
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isSelected ? Colors.lightBlueAccent : Colors.white,
          ),
        ),
        elevation: isSelected ? 3.sp : 0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
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
      ),
    );
  }
}
