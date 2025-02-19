import 'dart:math';
import 'package:url_launcher/url_launcher.dart';
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



// Function to launch the email app
//import 'package:url_launcher/url_launcher.dart';
  Future<void> sendEmail({
    required BuildContext context,
    required String email,
    required String subject,
    required String body,
  }) async {
    String email1 = email;
    final String subject1 = Uri.encodeComponent(subject);
    final String body1 = Uri.encodeComponent(body);
    final Uri emailUri = Uri.parse('mailto:$email1?subject=$subject1&body=$body1');
    try {
      await launchUrl(emailUri, mode: LaunchMode.externalApplication);
    } catch (e) {
      // Catch any other errors
      MySnackBar.showError(title: "An error occurred: $e");
    }
  }
