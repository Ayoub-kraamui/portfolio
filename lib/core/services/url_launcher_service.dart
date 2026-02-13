import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> openCv() async {
    // استخدام المسار النسبي للملف في مجلد web
    final uri = Uri.parse('assets/cv/ayoub_karami.pdf');
    // فتح الملف في تبويب جديد للمتصفح
    await launchUrl(uri, mode: LaunchMode.platformDefault);
  }
}
