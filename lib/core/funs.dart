import 'package:url_launcher/url_launcher.dart';

Future<void> lanchUrl(String url) async {
  final web = Uri.parse(url);
  if (!await launchUrl(web)) {
    throw Exception('Could not launch $web');
  }
}
