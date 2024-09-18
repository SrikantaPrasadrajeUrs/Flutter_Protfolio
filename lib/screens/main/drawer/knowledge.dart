import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
class Knowledge extends StatelessWidget {
  const Knowledge({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Knowledge",style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Colors.white, fontSize: 18),),
        const Gap(10),
        const KnowledgeBlock(title: "Dart, Flutter"),
        const KnowledgeBlock(title: "ReactNative"),
        const KnowledgeBlock(title: "Java, Hibernate, Springboot"),
        const KnowledgeBlock(title: "HTML, css, Javascript, React, Node.js"),
        const KnowledgeBlock(title: "Git, Github,"),
        const Gap(10),
      ],
    );
  }
}

class KnowledgeBlock extends StatelessWidget {
  final String title;
  const KnowledgeBlock({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('asset/icons/check.svg'),
        const Gap(10),
        Text(title,style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Colors.white60, fontSize: 14),),
      ],
    );
  }
}

