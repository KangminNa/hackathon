import 'dart:async';

import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final ScrollController _scrollController = ScrollController();
  Timer? _scrollTimer;

  @override
  void initState() {
    super.initState();
    // 화면을 초기에 아래로 자동 스크롤 시작
    //_startAutoScroll();
  }

  // 30초에 걸쳐서 자동으로 스크롤 함수
  void _startAutoScroll() {
    _scrollTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(seconds: 30),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 31, 31),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home'); // /home으로 이동
          },
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    _buildTitle1(),
                    const SizedBox(
                      height: 70,
                    ),
                    _buildSubShort1(),
                    _buildSubShort2(),
                  ],
                ),
              ), //저희는

              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildTitle2(),
                    const SizedBox(
                      height: 70,
                    ),
                    _buildSubShort3(),
                  ],
                ),
              ), // 목표

              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    _buildTitle3(),
                    const SizedBox(
                      height: 70,
                    ),
                    _buildSubShort4(),
                  ],
                ),
              ), // 전략 및 계획

              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    _buildTitle4(),
                    const SizedBox(
                      height: 70,
                    ),
                    _buildSubShort6()
                  ],
                ),
              ), // 기대효과
            ],
          ),
        ),
      ),
    );
  }

  // 첫번째 제목
  Widget _buildTitle1() {
    return const Text(
      '저희는',
      style: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        fontFamily: 'BMHANNA',
        color: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }

  // 두번째 제목
  Widget _buildTitle2() {
    return const Text(
      '목표',
      style: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        fontFamily: 'BMHANNA',
        color: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }

  // 세번째 제목
  Widget _buildTitle3() {
    return const Text(
      '전략 및 계획',
      style: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        fontFamily: 'BMHANNA',
        color: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }

  // 네번째 제목
  Widget _buildTitle4() {
    return const Text(
      '기대효과',
      style: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        fontFamily: 'BMHANNA',
        color: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }

  // 첫번째 단락
  Widget _buildSubShort1() {
    return const Column(
      children: [
        Text(
          '수도권에 집중된',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'BMHANNA',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '기업 활동을 분산하고,',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'BMHANNA',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Text(
          '지방 지역의 경제 역량을',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'BMHANNA',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '강화하는 것을 목표합니다',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'BMHANNA',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 40,
        ),
        //구분짓기
      ],
    );
  }

  // 두번쨰 단락
  Widget _buildSubShort2() {
    return const Column(
      children: [
        Text(
          '또한',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'BMHANNA',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          '지방 지역의 지속적인',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'BMHANNA',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '성장을 촉진하고,',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'BMHANNA',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '수도 지역과 균형을 이루는',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'BMHANNA',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '지역경제를 조성합니다.',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'BMHANNA',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          textAlign: TextAlign.center,
        ),
        //구분짓기
      ],
    );
  }

  // 세번째 단락
  Widget _buildSubShort3() {
    return const Column(
      children: [
        Text(
          '지방 지역의 발전과',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'BMHANNA',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '경제 다각화를 촉진하여',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'BMHANNA',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '지방 주민들에게 더 많은',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'BMHANNA',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '일자리의 기회를',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'BMHANNA',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '제공합니다.',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'BMHANNA',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // 네번째 단락
  Widget _buildSubShort4() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '협력 및 네트워킹',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'BMHANNA',
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '지방 기업들 간의 협력 및 네트워킹을 촉진하는 플랫폼 구축.',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'BMHANNA',
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '교육',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'BMHANNA',
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '중소기업 교육 및 기술 지원 프로그램 개발',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'BMHANNA',
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '협력 파트너쉽',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'BMHANNA',
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '협력 파트너쉽 구축 및 자금 확보',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'BMHANNA',
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '마케팅',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'BMHANNA',
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '플랫폼 홍보 및 마케팅 전력',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'BMHANNA',
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }

  // 다섯번째 단락
  Widget _buildSubShort5() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '1. 지방 기업들 간의 협력 및 네트워킹을 촉진하는 플랫폼 구축,',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'BMHANNA',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '2. 중소기업 교육 및 기술 지원 프로그램 개발',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'BMHANNA',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '3. 협력 파트너쉽 구축 및 자금 확보',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'BMHANNA',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '4. 플랫폼 홍보 및 마케팅 전력',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'BMHANNA',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          textAlign: TextAlign.center,
        ),
        //구분짓기
      ],
    );
  }

  // 여섯번째 단락
  Widget _buildSubShort6() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '- 새로운 기업간의 협력 형성률 증가',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'BMHANNA',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '- 지방 기업의 매출 및 고용 증가',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'BMHANNA',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '- 플랫폼 이용 및 회원 가입 증가',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'BMHANNA',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 100,
        ),
      ],
    );
  }
}
