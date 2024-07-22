import 'package:flutter/material.dart';

class ContactMe extends StatelessWidget{
  final BuildContext context;
  const ContactMe({super.key,required this.context});

  @override
  Widget build(BuildContext context) {
   Size size= MediaQuery.of(context).size;
    return Container(
      width: size.width*.4,
      height: size.height*.1,
      decoration: const BoxDecoration(
        color: Colors.green
      ),
      child:const Text('Contact me  l'),
    );
  }
}
