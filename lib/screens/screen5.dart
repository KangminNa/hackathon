import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Screen5 extends StatelessWidget {
  Screen5({Key? key}) : super(key: key);

  // 더미 데이터
  final List<Map<String, dynamic>> dummyData = [
    {
      'title': '참가자 모집 중',
      'sub_content':
          '책방 산들림 감사합니다 여우비 가온누리 소록소록 여우별 감사합니다 여우별 늘품 도서관 포도 도담도담 바람꽃 별하 소솜 다솜 포도 책방 달볓 예그리나 감또개 가온누리 산들림 달볓 아련 이플 여우비 도담도담 함초롱하다!',
      'main_content': '',
      'current_man': 3,
      'max_man': 5,
    },
    {
      'title': '감또개 우리는 ',
      'sub_content':
          '우리는 달볓 별하 소솜 소솜 감또개 책방 미리내 이플 달볓 노트북 달볓 컴퓨터 안녕 아슬라 안녕 나래 감또개 노트북 함초롱하다 가온해 노트북 소솜 도르레 도르레 별빛 이플 포도 우리는 미쁘다.',
      'main_content': '',
      'current_man': 7,
      'max_man': 10,
    },
    // 여기에 더 많은 더미 데이터 추가 가능
  ];

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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              _buildTitle(),
              const SizedBox(
                height: 80,
              ),
              _buildListView(),
            ],
          ),
        ),
      ),
    );
  }

  // 제목을 생성하는 함수
  Widget _buildTitle() {
    return const Text(
      '함께하실분',
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        fontFamily: 'BMHANNA',
        color: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }

  // ListView를 생성하는 함수
  Widget _buildListView() {
    return SizedBox(
      width: 600,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: dummyData.length,
        itemExtent: null,
        itemBuilder: (context, index) {
          final item = dummyData[index];
          return InkWell(
            onTap: () {
              // 상세 정보 페이지로 이동하는 코드 추가
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(item: item),
                ),
              );
            },
            child: ListTile(
              title: Text(
                item['title']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              subtitle: _buildContent(item),
              trailing: const Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Icon(
                    size: 18,
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
              textColor: Colors.white,
            ),
          );
        },
      ),
    );
  }

  // Content를 생성하는 함수
  Widget _buildContent(Map<String, dynamic> item) {
    final currentMan = item['current_man'];
    final maxMan = item['max_man'];
    return Column(
      children: [
        Text(
          '${item['sub_content']} (참가자: $currentMan/$maxMan)',
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 45,
        ),
      ],
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  const DetailScreen({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['title']),
      ),
      body: Center(
        child: Text(item['sub_content']),
      ),
    );
  }
}
