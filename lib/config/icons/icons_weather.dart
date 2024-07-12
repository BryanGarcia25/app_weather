
import 'package:flutter/material.dart';

Image showIconsWeather(String icon, double heightIcon) {
  switch (icon) {
    case "01d":
      return Image.asset("lib/assets/sun.png", height: heightIcon);
    case "02d":
      return Image.asset("lib/assets/sun_with_cloud.png", height: heightIcon);
    case "03d":
      return Image.asset("lib/assets/clouds.png", height: heightIcon);
    case "04d":
      return Image.asset("lib/assets/clouds.png", height: heightIcon);
    case "09d":
      return Image.asset("lib/assets/rain.png", height: heightIcon);
    case "10d":
      return Image.asset("lib/assets/sun_with_rain.png", height: heightIcon);
    case "11d":
      return Image.asset("lib/assets/storm.png", height: heightIcon);
    case "13d":
      return Image.asset("lib/assets/sun.png", height: heightIcon);
    case "01n":
      return Image.asset("lib/assets/moon.png", height: heightIcon);
    case "02n":
      return Image.asset("lib/assets/moon_with_cloud.png", height: heightIcon);
    case "03n":
      return Image.asset("lib/assets/clouds.png", height: heightIcon);
    case "04n":
      return Image.asset("lib/assets/clouds.png", height: heightIcon);
    case "09n":
      return Image.asset("lib/assets/rain.png", height: heightIcon);
    case "10n":
      return Image.asset("lib/assets/moon_with_rain.png", height: heightIcon);
    case "11n":
      return Image.asset("lib/assets/storm.png", height: heightIcon);
    case "13n":
      return Image.asset("lib/assets/sun.png", height: heightIcon);
    default:
      return Image.asset("");
  }
  
}