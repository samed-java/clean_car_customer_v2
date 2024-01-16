import 'package:url_launcher/url_launcher.dart';

void launchEmail(String email) async {
  final Uri url = Uri(
    scheme: 'mailto',
    path: email,
  );

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {}
}
