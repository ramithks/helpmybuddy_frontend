import 'package:url_launcher/url_launcher.dart';

enum URLLauncherType {
  browser,
  email,
  phone,
}

class UrlLauncher {
  static Future<void> launch(Uri url, URLLauncherType type) async {
    switch (type) {
      case URLLauncherType.browser:
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        } else {
          throw UrlLaunchException('Could not launch $url');
        }
        break;
      case URLLauncherType.email:
        const subject = 'Inquiry about JustPoll';

        final Uri emailLaunchUri = Uri(
          scheme: 'mailto',
          path: 'justpollsocial@gmail.com',
          queryParameters: {
            'subject': subject,
            'body': Uri.encodeFull(
                'Hello JustPoll Team,I am writing to inquire about [insert your query or concern here]. I have noticed [describe the issue or question in more detail].)')
          },
        );
        if (await canLaunchUrl(emailLaunchUri)) {
          await launchUrl(emailLaunchUri);
        } else {
          throw UrlLaunchException('Could not launch $emailLaunchUri');
        }
        break;
      case URLLauncherType.phone:
        final Uri phoneLaunchUri = Uri(
          scheme: 'tel',
          path: '+1234567890',
        );
        if (await canLaunchUrl(phoneLaunchUri)) {
          await launchUrl(phoneLaunchUri);
        } else {
          throw UrlLaunchException('Could not launch $phoneLaunchUri');
        }
        break;
      default:
        throw ArgumentError('Invalid URL Launcher Type');
    }
  }
}

class UrlLaunchException implements Exception {
  final String message;

  UrlLaunchException(this.message);

  @override
  String toString() => 'UrlLaunchException: $message';
}