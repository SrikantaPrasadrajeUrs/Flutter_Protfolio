import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srikanta_protfolio/storage/constants.dart';
import 'package:srikanta_protfolio/themes/theme_provider.dart';
import 'navigation/routes.dart';

Future<void> main() async {
  return runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<FlutterDeveloperText>(create: (_) => FlutterDeveloperText()),
        ],
        child: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {

 const  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: MyRoutes.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeProvider.themeData,
    );
    // return Home();
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int val=0;
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            children: [
              InkWell(
                  onTap: (){
                    setState(() {
                      val=val+1;
                    });
                  },
                  child: Text("+")),
              Text(val.toString()),
              InkWell(
                  onTap: (){
                    setState(() {
                      val=val-1;
                    });
                  },
                  child: Text("-")
              ),
            ],
          ),
        ),
      ),
    );
  }
}
