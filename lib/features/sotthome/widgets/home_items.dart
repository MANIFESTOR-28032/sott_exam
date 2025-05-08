import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_repository/data/models/home/home.dart';

class HomeItems extends StatelessWidget {
  const HomeItems({
    super.key,
    required this.home,
  });

  final HomeModel home;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            home.image,
            width: 169.w,
            height: 128.h,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          width: 169.w,
          height: 76.h,
          child: Column(
            spacing: 8.h,
            children: [
              Text(
                "${home.price} ${home.currency}",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${home.category}•${home.rooms}•${home.qavat}•${home.area}",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 5.w,
                    children: [
                      SvgPicture.network(
                        home.nearPlace.image,
                        width: 20.w,
                        height: 20.h,
                        fit: BoxFit.cover,
                        colorFilter:
                            ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                      ),
                      Text(
                        home.nearPlace.title,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${home.nearPlace.distance} M",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
