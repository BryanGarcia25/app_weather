
import 'package:flutter/material.dart';

Image showIconsWeather(String icon) {
  switch (icon) {
    case "01d":
      return Image.asset("lib/assets/sun.png", height: 175);
    case "02d":
      return Image.asset("lib/assets/sun_with_cloud.png", height: 175);
    case "03d":
      return Image.asset("lib/assets/clouds.png", height: 175);
    case "04d":
      return Image.asset("lib/assets/clouds.png", height: 175);
    case "09d":
      return Image.asset("lib/assets/rain.png", height: 175);
    case "10d":
      return Image.asset("lib/assets/sun_with_rain.png", height: 175);
    case "11d":
      return Image.asset("lib/assets/storm.png", height: 175);
    case "13d":
      return Image.asset("lib/assets/sun.png", height: 175);
    case "01n":
      return Image.asset("lib/assets/moon.png", height: 175);
    case "02n":
      return Image.asset("lib/assets/moon_with_cloud.png", height: 175);
    case "03n":
      return Image.asset("lib/assets/clouds.png", height: 175);
    case "04n":
      return Image.asset("lib/assets/clouds.png", height: 175);
    case "09n":
      return Image.asset("lib/assets/rain.png", height: 175);
    case "10n":
      return Image.asset("lib/assets/moon_with_rain.png", height: 175);
    case "11n":
      return Image.asset("lib/assets/storm.png", height: 175);
    case "13n":
      return Image.asset("lib/assets/sun.png", height: 175);
    default:
      return Image.asset("");
  }
  
}