import 'package:flutter/material.dart';

class AditionalInformation extends StatelessWidget {
  const AditionalInformation({
    super.key, required this.icon, required this.feacture, required this.weatherInformation,
  });

  final IconData icon;
  final String feacture;
  final String weatherInformation;

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.transparent
          ),
          borderRadius: BorderRadius.circular(15),
          color: date.hour < 6 || date.hour > 20 ? const Color(0XFF302f34) : const Color(0xFF99cef7)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, size: 32, color: date.hour < 6 || date.hour > 20 ? Colors.white : Colors.black),
                  const SizedBox(width: 15,),
                  Text(feacture.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: date.hour < 6 || date.hour > 20 ? Colors.white : Colors.black),),
                ],
              ),
              Text(weatherInformation, style: TextStyle(fontSize: 20, color: date.hour < 6 || date.hour > 20 ? Colors.white : Colors.black))
            ],
          ),
        )
      ),
    );
  }
}