// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final Color backgroundColor = const Color(0xFFF5F6FB);
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Extended Title Page',
      theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
        colorSchemeSeed: Colors.blue
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // This function show the sliver app bar
  // It will be called in each child of the TabBarView
  SliverAppBar showSliverAppBar(String screenTitle) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: false,
      title: Center(
        child: Text(screenTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      bottom: const TabBar(
        tabs: [Tab(icon: Icon(Icons.home)), Tab(icon: Icon(Icons.settings))],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: 2,
      child: TabBarView(children: [
        // This CustomScrollView display the Home tab content
        CustomScrollView(
          slivers: [
            showSliverAppBar(
              'Extended Title Home Page',
            ),

            // Anther sliver widget: SliverList
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                    padding: const EdgeInsets.all(30),
                    child: const SizedBox(
                        height: 400,
                        child: Card(
                          elevation: 20,
                          color: Color.fromRGBO(75, 87, 254, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(30)),
                          ),
                          child: SizedBox(
                            width: 300,
                            height: 200,
                            child: Center(
                                child: Text('Home Page',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white))),
                          ),
                        ))),
                Container(
                    padding: const EdgeInsets.all(30),
                    child: const SizedBox(
                        height: 400,
                        child: Card(
                          surfaceTintColor: Colors.white,
                          elevation: 20,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(30)),
                          ),
                          child: SizedBox(
                            width: 300,
                            height: 200,
                            child: Center(
                                child: Text('Home Page',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black))),
                          ),
                        ))),
              ]),
            ),
          ],
        ),

        // This shows the Settings tab content
        CustomScrollView(
          slivers: [
            showSliverAppBar('Extended Title Settings Page'),

            // Show other sliver stuff
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                    padding: const EdgeInsets.all(30),
                    child: const SizedBox(
                        height: 400,
                        child: Card(
                          elevation: 20,
                          color: Color.fromRGBO(75, 87, 254, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(30)),
                          ),
                          child: SizedBox(
                            width: 300,
                            height: 200,
                            child: Center(
                                child: Text('Settings Page',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white))),
                          ),
                        ))),
              ]),
            ),
          ],
        )
      ]),
    ));
  }
}
