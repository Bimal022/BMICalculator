import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

List<Widget> popUpButtons = [
  PopupMenuButton<int>(
    onSelected: (item) => handleClick(item),
    itemBuilder: (context) => [
      const PopupMenuItem<int>(value: 0, child: Text('About')),
      const PopupMenuItem<int>(value: 1, child: Text('Share')),
      const PopupMenuItem<int>(value: 2, child: Text('More Apps')),
      const PopupMenuItem<int>(value: 3, child: Text('Buy Me A Coffee')),
    ],
  ),
];
void shareApp() {
  Share.share(
      'Check out this cool BMI Calculator app  https://drive.google.com/drive/folders/1aqPV1Jax18H8BkZ-uXDk8ZmUJZbwAvoF',
      subject: 'Hehe download krr lena😁');
}

void sendWhatsAppMessage(String phoneNumber, String message) async {
  final encodedMessage = Uri.encodeComponent(message);
  final url = Uri.tryParse('sms:$phoneNumber?body=$encodedMessage');
  await launchUrl(url!);
}

void handleClick(int item) {
  switch (item) {
    case 0:
      // Handle "About" action
      launchUrl(Uri.parse('https://github.com/Bimal022'));
      break;
    case 1:
      // Handle "Share" action
      shareApp();
      break;
    case 2:
      // Handle "More Apps" action
      launchUrl(Uri.parse(
          'https://drive.google.com/drive/folders/1aqPV1Jax18H8BkZ-uXDk8ZmUJZbwAvoF'));
      break;
    case 3:
      // Handle "Buy Me A Coffee" action
      sendWhatsAppMessage(
          '9116492511', 'Hey! I would like to buy you a coffee☕');
      break;
  }
}
