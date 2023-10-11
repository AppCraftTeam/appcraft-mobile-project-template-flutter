import 'package:url_launcher/url_launcher_string.dart';

class Link {
  static Future<void> safeLaunch(String url) async {
    if (await canLaunchUrlString(url)) await launchUrlString(url);
  }
}
