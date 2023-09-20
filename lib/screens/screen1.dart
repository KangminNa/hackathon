import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:hackathon/screens/navigation_link.dart'; // ImageFilter를 사용하기 위해 추가

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: null,
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
            height: 30,
          ),
          Text(
            '수도는 우리가',
            style: TextStyle(
              fontSize: 50,
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
              fontSize: 50,
              fontFamily: 'BMHANNA',
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '수도주도',
            style: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          Text(
            '지방 기업 협력 플랫폼',
            style: TextStyle(
              fontSize: 25,
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
