import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    AddScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  toolbarHeight: 100,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '@nicole_edison1',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(CupertinoIcons.share_up, color: Colors.white),
                          SizedBox(width: 40),
                          Icon(CupertinoIcons.settings, color: Colors.white)
                        ],
                      ),
                    ],
                  ),
                  centerTitle: false,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF833AB4),
                          Color(0xFFFD1D1D),
                          Color(0xFFFCB045),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: screens[selectedIndex],
          ),
          Positioned(
            top: 120,
            left: 20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 40,
              child: Icon(
                Icons.person,
                size: 40,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home, color: Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search, color: Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add, color: Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble, color: Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person, color: Colors.grey),
            label: '',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String text =
      '🚀 Passionate about turning cutting-edge Ai research into real-word applications.Founder of NeuralFLow a startup revolutionizing automated decision-making for';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(Icons.verified_outlined),
                              SizedBox(width: 10),
                              Text('Verify Account')
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Nicole Edison',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            '213',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Following'),
                        ],
                      ),
                      SizedBox(width: 10),
                      Row(
                        children: [
                          Text(
                            '781',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Followers'),
                        ],
                      ),
                      SizedBox(width: 10),
                      Row(
                        children: [
                          Text(
                            '3',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(' Pages'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    text,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 3,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(Icons.link),
                          SizedBox(
                            width: 5,
                          ),
                          Text('neccle.portfolio.com')
                        ],
                      )),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Edit Profile",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        )),
                  ),
                  TabBar(
                    tabs: [
                      Tab(icon: Text('Posts')),
                      Tab(icon: Text('Replies')),
                      Tab(icon: Text('Inspired')),
                      Tab(icon: Text('Pages')),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Grid of posts
                        Center(
                            child: ImageGridWidget(imageUrls: [
                          'https://picsum.photos/id/1011/200/300',
                          'https://picsum.photos/id/1025/200/300',
                          'https://picsum.photos/id/1035/200/300',
                          'https://picsum.photos/id/1043/200/300',
                          'https://picsum.photos/id/1052/200/300',
                          'https://picsum.photos/id/1069/200/300',
                          'https://picsum.photos/id/1074/200/300',
                          'https://picsum.photos/id/1084/200/300',
                          'https://picsum.photos/id/109/200/300',
                        ])),
                        Center(child: Text('Replies Tab')),

                        // Videos
                        Center(child: Text('Inspired Tab')),
                        // Tagged posts
                        Center(child: Text('Pages Tab')),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class ImageGridWidget extends StatelessWidget {
  final List<String> imageUrls;

  const ImageGridWidget({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: imageUrls.length,
      physics: NeverScrollableScrollPhysics(), // disable inner scrolling
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 3 by 3 grid
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
      ),
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            imageUrls[index],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) => Center(child: Text(' Search Screen'));
}

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) => Center(child: Text(' Add Screen'));
}

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) => Center(child: Text(' Message Screen'));
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => Center(child: Text(' Profile Screen'));
}
