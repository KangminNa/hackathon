import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  int selectedContentIndex = -1; // 선택한 컨텐츠 인덱스

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
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Lottie.asset(
            'assets/background_lotti.json',
            repeat: true,
            animate: true,
          ),
          SingleChildScrollView(
            child: Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: SizedBox(width: 10),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildTitle(),
                      const SizedBox(height: 30),
                      _buildContentButtons(),
                      _buildSelectedContent(),
                    ],
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox(width: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 제목을 생성하는 함수
  Widget _buildTitle() {
    return const Align(
      alignment: Alignment.topLeft,
      child: Text(
        '디지털 교육',
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          fontFamily: 'BMHANNA',
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }

  // 컨텐츠 버튼을 생성하는 함수
  Widget _buildContentButtons() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildContentButton(0, '컨텐츠 1'),
          _buildContentButton(1, '컨텐츠 2'),
          _buildContentButton(2, '컨텐츠 3'),
        ],
      ),
    );
  }

  // 선택한 컨텐츠를 생성하는 함수
  Widget _buildSelectedContent() {
    if (selectedContentIndex == 0) {
      return _buildContent1();
    } else if (selectedContentIndex == 1) {
      return _buildContent2();
    } else if (selectedContentIndex == 2) {
      return _buildContent3();
    }
    // 선택된 컨텐츠가 없는 경우 빈 Container를 반환
    return Container();
  }

  // 컨텐츠 버튼을 생성하는 함수
  Widget _buildContentButton(int index, String text) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedContentIndex = index;
        });
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'BMHANNA',
          color: selectedContentIndex == index
              ? Colors.blue
              : const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }

  Widget _buildContent1() {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        color: Colors.white.withOpacity(0),
        child: const Text(
          '컨텐츠 1의 내용을 여기에 표시합니다.',
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }

  Widget _buildContent2() {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        color: Colors.white.withOpacity(0),
        child: const Text(
          '컨텐츠 2의 내용을 여기에 표시합니다.',
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }

  Widget _buildContent3() {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        color: Colors.white.withOpacity(0),
        child: const Text(
          '컨텐츠 3의 내용을 여기에 표시합니다.',
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}
