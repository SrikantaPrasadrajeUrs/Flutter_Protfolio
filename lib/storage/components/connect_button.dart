import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ConnectButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color? color;
  final String url;

  const ConnectButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.color,
    required this.url,
  }) : super(key: key);

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 500;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          } else {
            log("Cannot launch URL: $url");
          }
        } catch (e) {
          log("Error opening link", error: e);
        }
      },
      child: Container(
        height: isMobile(context) ? 50 : 60,
        width: 160,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurStyle: BlurStyle.solid,
              color: Colors.blue.withOpacity(0.7),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.pink.withOpacity(0.4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ],
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Colors.blue, Colors.pink],
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: isMobile(context) ? 4 : 8),
              Icon(
                icon,
                color: color ?? Theme.of(context).iconTheme.color,
                size: isMobile(context) ? 15 : 22,
              ),
              SizedBox(width: isMobile(context) ? 4 : 8),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(width: isMobile(context) ? 4 : 8),
            ],
          ),
        ),
      ),
    );
  }
}
