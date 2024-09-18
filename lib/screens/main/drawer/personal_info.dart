import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:srikanta_protfolio/storage/components/custom_divider.dart';
import 'package:srikanta_protfolio/storage/constants/helper_methods.dart';
import 'package:srikanta_protfolio/storage/constants/my_enums.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: 55,
                child: Text("Contact",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white60, fontSize: 14))),
            const Expanded(
              child: CustomDivider(
                  height: 2,
                  colors: [Colors.grey, Colors.white],
                  horizontalMargin: 10,
                  verticalMargin: 0,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
            ),
            GestureDetector(
                onTap: () async {
                  final Uri phoneUri = Uri(
                    scheme: 'tel',
                    path: '+91 7892200860',
                  );
                  if (await canLaunchUrl(phoneUri)) {
                    await launchUrl(phoneUri);
                  }
                },
                child: Text("+91 7892200860",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white, fontSize: 14))),
          ],
        ),
        const Gap(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: 55,
                child: Text("Email",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white60, fontSize: 14))),
            const Expanded(
              child: CustomDivider(
                  height: 2,
                  colors: [Colors.grey, Colors.white],
                  horizontalMargin: 10,
                  verticalMargin: 0,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
            ),
            GestureDetector(
                onTap: () async {
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'srikantaprasadrajeurs456@gmail.com',
                  );
                  if (await canLaunchUrl(emailLaunchUri)) {
                    await launchUrl(emailLaunchUri);
                  } else {
                    // Handle error if email cannot be launched
                  }
                },
                child: Text("srikantapra@...",
                    textAlign: TextAlign.end,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white, fontSize: 14))),
          ],
        ),
        const Gap(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: 55,
                child: Text("Linkedln",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white60, fontSize: 14))),
            const Expanded(
              child: CustomDivider(
                  height: 2,
                  colors: [Colors.grey, Colors.white],
                  horizontalMargin: 10,
                  verticalMargin: 0,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
            ),
            GestureDetector(
                onTap: () async {
                  launchMyUrl(Links.linkdln);
                },
                child: Text("@srikanta",
                    textAlign: TextAlign.end,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white, fontSize: 14)))
          ],
        ),
        const Gap(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: 55,
                child: Text("GitHub",
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white60, fontSize: 14))),
            const Expanded(
              child: CustomDivider(
                  height: 2,
                  colors: [Colors.grey, Colors.white],
                  horizontalMargin: 10,
                  verticalMargin: 0,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
            ),
            GestureDetector(
                onTap: () async {
                  launchMyUrl(Links.github);
                },
                child: Text("@srikanta",
                    textAlign: TextAlign.end,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white, fontSize: 14))),
          ],
        ),
      ],
    );
  }
}
