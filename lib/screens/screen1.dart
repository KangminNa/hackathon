import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:hackathon/screens/navigation_link.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  // Function to launch a URL
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.black, // 검정색 배경
        title: null, // 제목을 표시하지 않음
        actions: [
          IconButton(
            icon: const Icon(Icons.login), // 원하는 아이콘 사용
            onPressed: () {
              // 로그인 아이콘을 눌렀을 때 지정한 URL로 이동
              const loginURL = "https://admin-hackaton.web.app/"; // 원하는 URL로 변경
              _launchURL(loginURL);
            },
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/test_image.jpeg',
            fit: BoxFit.cover,
          ),
          // 흐림 효과를 적용하는 BackdropFilter
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // 흐림 정도 설정
            child: Container(
              color: Colors.black.withOpacity(0.3), // 배경 색상 및 투명도
            ),
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainTitleWidget(),
                  NavigationLink(
                    text: '소개',
                    routeName: '/screen2',
                  ),
                  NavigationLink(
                    text: '추천 교육',
                    routeName: '/screen3',
                  ),
                  NavigationLink(
                    text: '알려주세요',
                    routeName: '/screen4',
                  ),
                  NavigationLink(
                    text: '함께하실분',
                    routeName: '/screen5',
                  ),
                  NavigationLink(
                    text: '참고사례',
                    routeName: '/screen6',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainTitleWidget extends StatelessWidget {
  const MainTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Text(
            '수도는 우리가',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: 'BMHANNA',
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            '주도한다',
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'BMHANNA',
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            '수도주도',
            style: TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          Text(
            '지방 기업 협력 플랫폼',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
