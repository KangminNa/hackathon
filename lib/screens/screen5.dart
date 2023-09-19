import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Screen5 extends StatelessWidget {
  const Screen5({super.key});

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
                child: SizedBox(
                  width: 10,
                ),
              ),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
