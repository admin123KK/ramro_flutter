import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:nepaltop/items/calculator_page.dart';
import 'package:nepaltop/items/calendar_page.dart';
import 'package:nepaltop/items/message_page.dart';
import 'package:nepaltop/items/music_page.dart';
import 'package:nepaltop/items/search_page.dart';

import 'package:provider/provider.dart';
import 'items/clock_page.dart';
import 'items/theme_page.dart';
import 'pages/store_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<HomePage> {
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(
      context,
    );
    return Scaffold(
        appBar: AppBar(
          actions: [
            Container(
              child: Container(
                  alignment: Alignment.topLeft,
                  child: ClipOval(
                    child: Image.asset('assets/image/google.png'),
                  )),
            ),
            IconButton(
              icon: Icon(themeNotifier.isDarkMode
                  ? Icons.wb_sunny
                  : Icons.nights_stay),
              onPressed: () => themeNotifier.toggleTheme(),
            ),
          ],
          title: const Text('Home Page '),
          backgroundColor: Colors.green,
        ),
        bottomNavigationBar: Container(
          child: GNav(tabs: [
            const GButton(
              icon: Icons.home,
              text: 'Home',
              gap: 4,
            ),
            GButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StorePage(),
                    ));
              },
              icon: Icons.shop_sharp,
              text: 'Shop',
              gap: 4,
            ),
            GButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchPage(),
                    ));
              },
              icon: Icons.search,
              text: 'Search',
              gap: 4,
            ),
            const GButton(
              icon: Icons.person_2_outlined,
              text: 'Profile',
              gap: 4,
            )
          ]),
        ),
        body: ListView(scrollDirection: Axis.vertical, children: [
          Container(
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Text(
                ' Hello Welcome, ',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      prefixIconConstraints:
                          BoxConstraints(maxHeight: 20, minWidth: 25),
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade300),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              // alignment: Alignment.topCenter,
              child: Image.network(
                'https://images.unsplash.com/photo-1578235107258-f6e405a4ffc0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=725&q=80',
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              // alignment: Alignment.topCenter,
              child: Image.network(
                  'https://images.unsplash.com/photo-1578235107258-f6e405a4ffc0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=725&q=80'),
            ),
          ),
          const SizedBox(height: 20),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                // alignment: Alignment.topCenter,
                child: Image.network(
                    'https://images.unsplash.com/photo-1578235107258-f6e405a4ffc0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=725&q=80'),
              )),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 25),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                  'https://images.unsplash.com/photo-1578235107258-f6e405a4ffc0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=725&q=80'),
            ),
          )
        ]),
        drawer: Drawer(
          width: 250,
          elevation: 20,
          child: InkWell(
            child: Container(
              child: ListView(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: const Text('Sky'),
                    accountEmail: const Text('sky111@gmai.com'),
                    currentAccountPicture: CircleAvatar(
                      child: ClipOval(
                        child: Image.network(
                          'https://th.bing.com/th/id/OIP.xf_xYnZ0_GysQbIbQch6BgHaHa?pid=ImgDet&rs=1',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1485470733090-0aae1788d5af?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1834&q=80'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MessagePage(),
                          ));
                    },
                    leading: const Icon(Icons.message),
                    title: const Text(
                      'Message',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Calculator()));
                    },
                    leading: const Icon(Icons.calculate),
                    title: const Text(
                      'Calculator',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.library_music),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MusicPage(),
                          ));
                    },
                    title: const Text(
                      'Music',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.calendar_month_rounded),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CalendarPage(),
                          ));
                    },
                    title: const Text(
                      'Calendar',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.call),
                    title: Text(
                      'Call',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.location_on_rounded),
                    title: Text(
                      'Location',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.radio),
                    title: Text(
                      'Radio',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.change_history,
                    ),
                    title: const Text(
                      'Change_histroy',
                      style: TextStyle(fontSize: 15),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.timer),
                    title: const Text(
                      'Clock',
                      style: TextStyle(fontSize: 14),
                    ),
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context)=>ClockPage()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.logout,
                    ),
                    title: const Text(
                      'Log out',
                      style: TextStyle(fontSize: 17),
                    ),
                    onTap: () => signUserOut(),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
