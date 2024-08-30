import 'package:app_weather/core/utils/colors.dart';
import 'package:flutter/material.dart';

class AditionalInformation extends StatelessWidget {
  const AditionalInformation({
    super.key, required this.icon, required this.feacture, required this.weatherInformation, required this.orientation,
  });

  final IconData icon;
  final String feacture;
  final String weatherInformation;
  final String orientation;

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: orientation == "landscape" ? 90 : 60,
        width: orientation == "landscape" ? MediaQuery.of(context).size.width * 0.42 : MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.transparent
          ),
          borderRadius: BorderRadius.circular(15),
          color: date.hour < 6 || date.hour > 20 ? const Color(0XFF302f34) : const Color(0xFF99cef7)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: orientation == "landscape" ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(feacture.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: getColorByDayOrNight())),
                  Text(weatherInformation, style: TextStyle(fontSize: 20, color: getColorByDayOrNight()))
                ],
              ),
              Icon(icon, size: 86, color: getColorByDayOrNight()),
            ],
          ) : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, size: 32, color: getColorByDayOrNight()),
                  const SizedBox(width: 15,),
                  Text(feacture.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: getColorByDayOrNight()),),
                ],
              ),
              Text(weatherInformation, style: TextStyle(fontSize: 18, color: getColorByDayOrNight()))
            ],
          ),
        )
      ),
    );
  }
}