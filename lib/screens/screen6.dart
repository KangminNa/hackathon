import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Screen6 extends StatelessWidget {
  const Screen6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 31, 31),
      appBar: AppBar(
        backgroundColor: Colors.transparent, // AppBar를 투명하게 설정
        elevation: 0, // 그림자 효과를 제거
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // 뒤로 가기 버튼이 눌렸을 때 수행할 동작
            Navigator.pop(context);
          },
        ),
        // 다른 AppBar 관련 설정
        // title: Text('Your Title'),
        // actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: const Stack(
        fit: StackFit.expand,
        children: [
          // 로티 애니메이션을 배경으로 사용
          // Lottie.asset(
          //   'assets/background_lotti.json', // 로티 애니메이션 파일 경로
          //   repeat: true, // 애니메이션 반복 여부
          //   animate: true, // 애니메이션 재생 여부
          // ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 제목을 생성하는 함수
  Widget _buildTitle() {
    return const Text(
      '참고사례',
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        fontFamily: 'BMHANNA',
        color: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
