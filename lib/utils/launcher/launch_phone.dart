import 'package:url_launcher/url_launcher.dart';

Future<void> call(String phone) async{
  print(phone);
  await launch("tel:+$phone");
}