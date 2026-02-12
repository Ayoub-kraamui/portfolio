import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> openCv() async {
    final uri = Uri.parse('assets/cv/ayoub_karami.pdf');
    // استخدام وضع التطبيق الخارجي لعرض ملفات PDF
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
