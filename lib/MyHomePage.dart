import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'Hovering.dart';

class PortfolioHome extends StatefulWidget {
  @override
  _PortfolioHomeState createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  late VideoPlayerController _controller;
  List<int> likes = List.generate(8, (_) => 0);

  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey(); // Add this line
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://www.example.com/demo_video.mp4')
      ..initialize().then((_) => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
        key.currentContext!, duration: Duration(seconds: 1));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Portfolio')),
      drawer: _buildDrawer(),
      body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              SizedBox(height: 20),
          Container(key: homeKey, child: _buildIntroSection(),),
          SizedBox(height: 40),
          Container(key: aboutKey, child: _buildAboutSection(),),

          SizedBox(height: 40),
          Container(key: projectsKey, child: _buildProject(),),

          SizedBox(height: 20),
      // _buildVideoPlayer(),
      SizedBox(height: 40),
      Container(key: contactKey, child: _buildContactSection(),),
                SizedBox(height: 40),
                _buildFooter()

      ],
    ),)
    ,
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Navigation',
                style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          _buildDrawerItem('Home', homeKey),
          _buildDrawerItem('About Me', aboutKey),
          _buildDrawerItem('Projects', projectsKey),
          _buildDrawerItem('Contact', contactKey),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(String title, GlobalKey key) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        _scrollToSection(key);
      },
    );
  }


  Widget _buildIntroSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isWideScreen = constraints.maxWidth > 800;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome to My Portfolio',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold)),
                    SizedBox(height: 30),
                    Text(
                      "Hi, I'm a Flutter Developer with experience in building mobile and web applications. I specialize in creating interactive and visually appealing apps with smooth animations and engaging user experiences.",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 30),
                    // Text(
                    //   "Explore my work, watch demo videos of my applications, and feel free to reach out if you'd like to collaborate!",
                    //   style: TextStyle(
                    //       fontSize: 16, fontWeight: FontWeight.w500),
                    // ),
                  ],
                ),
              ),
              if (isWideScreen) ...[
                SizedBox(width: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://th.bing.com/th/id/OIP.lx2sf8RzSVDxy8bDVskJRgHaLI?w=377&h=567&rs=1&pid=ImgDetMain',
                    height: 736,
                    width: 600,
                    fit: BoxFit.fill,
                  ),
                ),
              ]
            ],
          );
        },
      ),
    );
  }

  Widget _buildAboutSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Animated "About Me" Header
          AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 500),
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            child: Text('About Me'),
          ),
          SizedBox(height: 60),
          // About Me Description
          Text(
            "Motivated and results-driven professional with a Diploma in Computer Engineering. Passionate about programming and software development, with expertise in Flutter, HTML, and CSS. Experienced in creating innovative and efficient software solutions.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 40),
          // Skills Section
          Text(
            'Skills:',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 40),
          // Skill Chips
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              _buildSkillChip("Dart", Icons.code),
              _buildSkillChip("Flutter", Icons.mobile_friendly),
              _buildSkillChip("Bloc", Icons.widgets),
              _buildSkillChip("Firebase", Icons.cloud),
              _buildSkillChip("API", Icons.api),
              _buildSkillChip("UI/UX", Icons.design_services),
              _buildSkillChip("Provider", Icons.build),
              _buildSkillChip("GetX", Icons.bolt),
              _buildSkillChip("Shared Preferences", Icons.storage),
              _buildSkillChip("Restful API", Icons.link),
              _buildSkillChip("Figma", Icons.design_services),
              _buildSkillChip("GitHub", Icons.code),
              _buildSkillChip("Postman", Icons.api),
              _buildSkillChip("Android", Icons.android),
              _buildSkillChip("iOS", Icons.phone_iphone),
              _buildSkillChip("HTML", Icons.language),
              _buildSkillChip("CSS", Icons.color_lens),
              _buildSkillChip("C", Icons.memory),
              _buildSkillChip("C++", Icons.memory),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String skill, IconData icon) {
    return Chip(
      avatar: Icon(icon, size: 18, color: Colors.white),
      label: Text(
        skill,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.grey[800],
      elevation: 3,
      shadowColor: Colors.black.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget _buildProject() {
    return Column(
      children: [
        Text(
          'Projects',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "Explore my work, watch demo videos of my applications, and feel free to reach out if you'd like to collaborate!",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 10),

        _buildProjectShowcase(),
      ],
    );
  }


  Widget _buildProjectShowcase() {
    List<String> projects = List.generate(8, (index) => 'Project ${index + 1}');
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = constraints.maxWidth > 1200
              ? 4
              : constraints.maxWidth > 800
              ? 3
              : constraints.maxWidth > 600
              ? 2
              : 1;
          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              return _buildAnimatedContainer(index);
            },
          );
        },
      ),
    );
  }

  Widget _buildAnimatedContainer(int index) {
    return Column(
      children: [
        HoverableContainer(index: index),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.thumb_up, color: Colors.blue),
              onPressed: () {
                setState(() {
                  likes[index]++;
                });
              },
            ),
            Text('${likes[index]} Likes', style: TextStyle(fontSize: 18)),
          ],
        ),
      ],
    );
  }

  Widget _buildContactSection() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Me',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 60),
          Text(
            "I'm always open to new opportunities and collaborations. Feel free to reach out to me!",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.email, color: Colors.blue),
              SizedBox(width: 10),
              Text("Email: example@email.com", style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Icon(Icons.phone, color: Colors.blue),
              SizedBox(width: 10),
              Text("Phone: +123 456 7890", style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            child: Text("Get In Touch",style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
  Widget _buildFooter() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      color:  Colors.black.withOpacity(0.2) ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.facebook, color: Colors.blue),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.link, color: Colors.blue),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.email, color: Colors.blue),
            onPressed: () {},
          ),
          SizedBox(width: 20),
          Text(
            '© 2023 Shameer Babu. All rights reserved.',
            style: TextStyle(color:  Colors.white38),
          ),
        ],
      ),
    );
  }

}
