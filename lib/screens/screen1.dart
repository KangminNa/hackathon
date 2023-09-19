import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:hackathon/screens/navigation_link.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 31, 31),
      appBar: null,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 로티 애니메이션을 배경으로 사용
          Lottie.asset(
            'assets/background_lotti.json', // 로티 애니메이션 파일 경로
            repeat: true, // 애니메이션 반복 여부
            animate: true, // 애니메이션 재생 여부
          ),
          const Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              SingleChildScrollView(
                child: Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '지방기업',
                        style: TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'BMHANNA',
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        '혁신파트너',
                        style: TextStyle(
                          fontSize: 80,
                          fontFamily: 'BMHANNA',
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Text(
                        '지방 기업 협력 플랫폼',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      NavigationLink(
                        text: '디지털 교육',
                        routeName: '/screen2',
                      ),
                      NavigationLink(
                        text: '비즈니스 자문',
                        routeName: '/screen3',
                      ),
                      NavigationLink(
                        text: '아이디어 공유 및 협업',
                        routeName: '/screen4',
                      ),
                      NavigationLink(
                        text: '이벤트 및 워크샵',
                        routeName: '/screen5',
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
