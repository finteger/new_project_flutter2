import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      'assets/images/bark.jpg',
      'assets/images/cat.jpg',
      'assets/images/city.png',
      'assets/images/hippo.jpg',
      'assets/images/iceland.jpg',
      'assets/images/jellyfish.jpg'
    ];

    List<String> imageTitle = [
      'tree',
      'cat',
      'city',
      'hippo',
      'iceland',
      'jellyfish'
    ];

    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;

    List<Widget> gridStuff = List.generate(6, (index) {
      return Container(
        width: Width,
        height: Height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          image: DecorationImage(
            image: AssetImage(imageList[index]),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            imageTitle[index],
            style: TextStyle(
              color: Colors.white,
              fontSize: 42,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(5, 5),
                ),
              ],
            ),
          ),
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Home Page',
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            SizedBox(
              width: 120,
            ),
            ElevatedButton(
              onPressed: null,
              child: Icon(Icons.notification_add, color: Colors.white),
            ),
            Icon(Icons.settings),
          ],
        ),
      ),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      )),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.red,
        ),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 240,
            ),
            itemCount: gridStuff.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(height: 240, child: gridStuff[index]),
                ],
              );
            }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.red,
              icon: Icon(Icons.home),
              label: 'Home'),
          BottomNavigationBarItem(
              backgroundColor: Colors.red,
              icon: Icon(Icons.search),
              label: 'Search'),
          BottomNavigationBarItem(
              backgroundColor: Colors.red,
              icon: Icon(Icons.settings),
              label: 'Settings'),
          BottomNavigationBarItem(
              backgroundColor: Colors.red,
              icon: Icon(Icons.person),
              label: 'Profile'),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/');
              break;
            case 2:
              Navigator.pushNamed(context, '/settings');
              break;
            case 3:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
      ),
    );
  }
}
