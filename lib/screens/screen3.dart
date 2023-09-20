import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

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
              _buildCardGrid(), // 카드 그리드 추가
            ],
          ),
        ),
      ),
    );
  }

  // 제목을 생성하는 함수
  Widget _buildTitle() {
    return const Column(
      children: [
        Text(
          '추천 교육',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontFamily: 'BMHANNA',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        SizedBox(
          height: 80,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 30,
            ),
            Text(
              '기업 형태별 추천 교육 영상',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'BMHANNA',
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // 카드 그리드를 생성하는 함수
  Widget _buildCardGrid() {
    return GridView.builder(
      shrinkWrap: true, // GridView 크기를 자식 위젯에 맞게 조정
      physics: const NeverScrollableScrollPhysics(), // 스크롤 금지
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 열의 수
        childAspectRatio: 1, // 카드의 가로 세로 비율
      ),
      itemCount: 8, // 카드 개수
      itemBuilder: (context, index) {
        return _buildCard(index);
      },
    );
  }

  // 각각의 카드를 생성하는 함수
  Widget _buildCard(int index) {
    String cardTitle;
    String cardSubTitle;
    String cardTag;

    if (index == 0) {
      cardTitle = '제조업';
      cardSubTitle = '제조업에 관련 한줄 문구';
      cardTag = '#가 #나 #다 #라';
    } else if (index == 1) {
      cardTitle = '서비스업';
      cardSubTitle = '서비스업에 관련 한줄 문구';
      cardTag = '#가 #나 #다 #라';
    } else if (index == 2) {
      cardTitle = '농업';
      cardSubTitle = '제조업에 관련 한줄 문구';
      cardTag = '#가 #나 #다 #라';
    } else if (index == 3) {
      cardTitle = '수산업';
      cardSubTitle = '제조업에 관련 한줄 문구';
      cardTag = '#가 #나 #다 #라';
    } else if (index == 4) {
      cardTitle = '스타트업';
      cardSubTitle = '제조업에 관련 한줄 문구';
      cardTag = '#가 #나 #다 #라';
    } else if (index == 5) {
      cardTitle = '축산업';
      cardSubTitle = '제조업에 관련 한줄 문구';
      cardTag = '#가 #나 #다 #라';
    } else if (index == 6) {
      cardTitle = '요식업';
      cardSubTitle = '제조업에 관련 한줄 문구';
      cardTag = '#가 #나 #다 #라';
    } else if (index == 7) {
      cardTitle = '유통업';
      cardSubTitle = '유통업에 관련 한줄 문구';
      cardTag = '#가 #나 #다 #라';
    } else if (index == 8) {
      cardTitle = 'IT업';
      cardSubTitle = '제조업에 관련 한줄 문구';
      cardTag = '#가 #나 #다 #라';
    } else {
      cardTitle = '다른 카테고리';
      cardSubTitle = '다른 이야기';
      cardTag = '다른 해쉬태그';
    }

    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            cardTitle,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'BMHANNA',
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            cardSubTitle,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'BMHANNA',
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            cardTag,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              fontFamily: 'BMHANNA',
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          const SizedBox(height: 8),
          // 다른 카드 내용을 추가할 수 있습니다.
        ],
      ),
    );
  }
}
