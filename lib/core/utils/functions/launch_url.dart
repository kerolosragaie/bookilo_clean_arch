import 'package:url_launcher/url_launcher.dart';

Future<void> urlLaunch({required String url}) async {
  Uri uri = Uri.parse(url);
  await launchUrl(uri);
}
