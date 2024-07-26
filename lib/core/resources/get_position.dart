import 'package:geolocator/geolocator.dart';

class GetCurrentPosition {

  Future<Position> getPositions() async {
    return await _getPermissions();
  }

  Future<Position> _getPermissions() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Error al obtener permiso de acceso a su ubicación");
      }
    }
    return await Geolocator.getCurrentPosition();
  }

}