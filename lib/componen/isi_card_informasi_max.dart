import 'package:aplikasi_cuaca/componen/constans.dart';
import 'package:aplikasi_cuaca/componen/container_top_cuaca.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IsiCardInformasiMax extends StatefulWidget {
  final String nameLokasi, icon, mainCuaca, dateTime, temperatur, windSpeed, humidity, clouds;
  const IsiCardInformasiMax({ Key? key, 
  required this.nameLokasi, required this.icon, required this.mainCuaca, 
  required this.temperatur, required this.windSpeed, 
  required this.humidity, required this.clouds, 
  required this.dateTime}) : super(key: key);

  @override
  State<IsiCardInformasiMax> createState() => _IsiCardInformasiMaxState();
}

class _IsiCardInformasiMaxState extends State<IsiCardInformasiMax>{
 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width.w,
      height: (size.height.h - 230.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.grid_view_rounded, color: Colors.white), 
              Row(
                children: [
                  const Icon(Icons.location_on_rounded, color: Colors.white),
                  Text(widget.nameLokasi, style: TextStyle(fontSize: 20.sp, color: whiteColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans")),
                ],
              ),
              const Icon(Icons.more_vert, color: Colors.white),
            ],
          ),
          Container(
            width: 130.w,
            decoration: BoxDecoration(
              border: Border.all(width: 1.w, color: whiteColor),
              borderRadius: BorderRadius.all(Radius.circular(25.r)),
            ),
            child: Padding(padding: EdgeInsets.symmetric(vertical: 3.h), child: Text("Updated ${DateFormat('mm', 'id').format(DateTime.now()).toString()}min ago", style: TextStyle(fontSize: 12.sp, color: whiteColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans") ,textAlign: TextAlign.center)),
          ),
          Image.network('http://openweathermap.org/img/wn/${widget.icon}@2x.png'),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(" ${widget.temperatur}", 
                    style: TextStyle(fontSize: 100.sp, 
                      color: whiteColor, 
                      fontWeight: FontWeight.bold,
                      fontFamily: "OpenSauceSans", 
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text("°", style: TextStyle(fontSize: 60.sp, color: whiteShadowColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans")),
              ],),
              Text(widget.mainCuaca, style: TextStyle(fontSize: 30.sp, color: whiteColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans")),
              Text("Today, ${DateFormat('dd MMMM').format(DateTime.parse(widget.dateTime)).toString()}", style: TextStyle(fontSize: 15.sp, color: whiteShadowColor, fontWeight: FontWeight.bold, fontFamily: "OpenSauceSans")),
            ],
          ),
          ContainerTopCuaca(icon: widget.icon.toString(), speed: widget.windSpeed, humidity: widget.humidity, clouds: widget.clouds),
        ],
      ),     
    );
  }
}