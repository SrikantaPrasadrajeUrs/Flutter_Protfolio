import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:srikanta_protfolio/storage/constants.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(
          flex: 2,
        ),
        TweenAnimationBuilder(
          duration: const Duration(milliseconds: 400),
          tween: Tween<double>(begin: 0, end: 1),
          builder: (context, value, child) {
            return GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Container(
                height: defaultSize * 1.5,
                width: defaultSize * 1.5,
                margin: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      blurStyle: BlurStyle.solid,
                      color: Colors.blue.withOpacity(.5),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.pink.withOpacity(.5),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Center(
                  child: ShaderMask(
                    shaderCallback: (bounds) {
                      return const LinearGradient(
                              end: Alignment.topRight,
                              begin: Alignment.bottomLeft,
                              colors: [Colors.blue, Colors.pink])
                          .createShader(bounds);
                    },
                    child: const Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        const Spacer(
          flex: 3,
        )
      ],
    );
  }
}
