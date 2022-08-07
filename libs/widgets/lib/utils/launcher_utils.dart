import 'package:url_launcher/url_launcher.dart';

class LauncherUtils {
  static final LauncherUtils _launcherUtils = LauncherUtils();

  static LauncherUtils get launcherUtilsInstance => _launcherUtils;

  static const String CONTACT_NUMBER = "677-039-999";

  //launch url in Browser
  Future<bool> launchInBrowser(
      {String? url, Map<String, String>? headers}) async {
    if (await canLaunchUrl(Uri.parse(url!))) {
      return await launchUrl(
        Uri.parse(url),
      );
    } else {
      return false;
    }
  }

  //method to make phone call
  Future<bool> makePhoneCall({String? phoneNumber}) async {
    if (await canLaunchUrl(Uri(scheme: 'tel', path: '${phoneNumber}'))) {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      return await launchUrl(launchUri);
    } else {
      return false;
    }
  }

  //method used to open email
  Future<bool> launchEmail(
      {String? email, String subject = "", String body = ""}) async {
    if (await canLaunchUrl(Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=${subject}&body=${body}', //add subject and body here
    ))) {
      return await launchUrl(Uri(
        scheme: 'mailto',
        path: email,
        query: 'subject=${subject}&body=${body}', //add subject and body here
      ));
    } else {
      return false;
    }
  }
}
