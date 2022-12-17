import 'package:flutter/material.dart';
import 'package:hidable/hidable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final colorsPath = [
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.red
  ];

  int index = 0;

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorsPath[index],
        title: const Text('Hidable',style: TextStyle(fontSize: 15),),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: ListView.separated(
          controller: scrollController,
          itemCount: 15,
          itemBuilder: (_, i) => _ListItem(),
          separatorBuilder: (_, __) => const SizedBox(height: 10),
        ),
      ),
      bottomNavigationBar: Hidable(
        controller: scrollController,
        wOpacity: true,
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (i) => setState(() => index = i),
          items: bottomBarItems(),
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> bottomBarItems() {
    return [
      BottomNavigationBarItem(
        label: 'Menu 1',
        icon: const Icon(Icons.home, color: Colors.white),
        backgroundColor: colorsPath[0],
      ),
      BottomNavigationBarItem(
        label: 'Menu 2',
        icon: const Icon(Icons.favorite, color: Colors.white),
        backgroundColor: colorsPath[1],
      ),
      BottomNavigationBarItem(
        label: 'Menu 3',
        icon: const Icon(Icons.person, color: Colors.white),
        backgroundColor: colorsPath[2],
      ),
      BottomNavigationBarItem(
        label: 'Menu 4',
        icon: const Icon(Icons.settings, color: Colors.white),
        backgroundColor: colorsPath[3],
      ),
    ];
  }
}

class _ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withOpacity(.4),
            ),
          ),
          title: Align(
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                Container(
                  height: 15,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(.5),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          subtitle: Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              children: [
                Container(
                  height: 10,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(.3),
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(height: 1,)
      ],
    );
  }
}
