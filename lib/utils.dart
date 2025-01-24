import 'dart:math';

//this method return true if user is in the range of currentUser else return false
bool isInRange(
    {
       required double latA,
      required double lonA,
      required double latB,
      required double lonB,
      required double minDistance,
      required double maxDistance}) {
  // Convert degrees to radians
  double toRadians(double degree) {
    return degree * pi / 180;
  }

  // Radius of Earth in kilometers
  const double radiusOfEarth = 6371;

  // Convert latitude and longitude from degrees to radians
  double latAInRadians = toRadians(latA);
  double lonAInRadians = toRadians(lonA);
  double latBInRadians = toRadians(latB);
  double lonBInRadians = toRadians(lonB);

  // Haversine formula
  double deltaLat = latBInRadians - latAInRadians;
  double deltaLon = lonBInRadians - lonAInRadians;

  double a = sin(deltaLat / 2) * sin(deltaLat / 2) +
      cos(latAInRadians) * cos(latBInRadians) *
          sin(deltaLon / 2) * sin(deltaLon / 2);
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  // Calculate the distance in kilometers
  double distance = radiusOfEarth * c;

  // Check if the distance is within the specified range
  return distance >= minDistance && distance <= maxDistance;
}

