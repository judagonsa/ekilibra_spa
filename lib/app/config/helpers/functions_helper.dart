import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class FunctionsHelper {
  openWhatsApp() async {
    Uri uri = Uri.parse(url(
        'Hola y bienvenido a Ekilibra spa, en qué podemos ayudarte', 'phone'));
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    } else {}
  }

  String url(String message, String phone) {
    if (Platform.isAndroid) {
      return "https://wa.me/$phone/?text=${Uri.parse(message)}";
    } else {
      return "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}";
    }
  }
}
