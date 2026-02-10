import 'package:url_launcher/url_launcher.dart' as launcher;

class UrlLauncherService {
  Future<void> launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await launcher.canLaunchUrl(uri)) {
      await launcher.launchUrl(uri);
    }
  }

  Future<void> openCv() async {
    final uri = Uri.parse('assets/cv/ayoub_karami.pdf');
    // استخدام وضع التطبيق الخارجي لعرض ملفات PDF
    await launcher.launchUrl(
      uri,
      mode: launcher.LaunchMode.externalApplication,
    );
  }
}
