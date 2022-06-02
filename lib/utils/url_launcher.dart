import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launch_url_dart;

customLaunchUrl(BuildContext context, String url) async {
  final Uri _uri = Uri.parse(url);

  if (url.contains('http')) {
    if (!await launch_url_dart.launchUrl(_uri)) {
      throw 'Could not launch $url';
    }
  } else {
    Navigator.pushNamed(context, 'Map', arguments: url);
  }
}
