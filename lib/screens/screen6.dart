import 'package:flutter/material.dart';

class Screen6 extends StatelessWidget {
  Screen6({Key? key}) : super(key: key);

  // 더미 데이터
  final List<Map<String, dynamic>> dummyData = [
    {
      'mainImage': 'assets/images/index_0.jpeg',
      'writer': '김민지',
      'subTitle': '빅데이터가 뭡니까?',
      'date': '2023-09-20',
      'mainContent':
          '제조업에 종사하고 있는 69년 닭띠입니다. 정부에서 빅?빋? 데이터를 만들어 머에 쓴다던데. 이거 영 통 모르겟내요...',
      'subImages': [
        'assets/images/index_0.jpeg',
        'assets/images/index_1.jpeg',
        'assets/images/index_2.jpeg',
        'assets/images/index_3.jpeg',
      ],
    },
    {
      'mainImage': 'assets/images/index_0.jpeg',
      'writer': '이철수',
      'subTitle': 'AI 기술 적용 사례',
      'date': '2023-09-21',
      'mainContent':
          '우리 회사는 AI 기술을 적용하여 생산성을 크게 향상시켰습니다. 이로 인해 비용을 절감하고 고객 만족도를 높였습니다.',
      'subImages': [
        'assets/images/index_0.jpeg',
        'assets/images/index_1.jpeg',
        'assets/images/index_2.jpeg',
        'assets/images/index_3.jpeg',
      ],
    },
    // 추가 데이터를 원하는 만큼 추가할 수 있습니다.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
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
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            _buildTitle(),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildListView(),
              ),
            ),
          ],
        ),
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

// ListView를 생성하는 함수
  Widget _buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: dummyData.length, // 더미 데이터의 개수만큼 아이템 표시
      itemBuilder: (context, index) {
        final item = dummyData[index]; // 현재 인덱스에 해당하는 더미 데이터
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 400,
              child: Card(
                elevation: 5, // 그림자 효과
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      item['mainImage'], // 메인 이미지
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      item['subTitle'],
                      style: const TextStyle(
                        fontSize: 22,
                        fontFamily: 'BMHANNA',
                        color: Colors.black, // 텍스트 색상을 검정색으로 변경
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '작성자: ${item['writer']}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        fontFamily: 'BMHANNA',
                        color: Colors.black, // 텍스트 색상을 검정색으로 변경
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Text(
                      '작성 일자: ${item['date']}',
                      style: const TextStyle(
                        fontSize: 13,
                        fontFamily: 'BMHANNA',
                        color: Colors.black, // 텍스트 색상을 검정색으로 변경
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  const DetailScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
        child: SizedBox(
          height: 800,
          child: Card(
            elevation: 5, // 그림자 효과
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 가로로 스와이프 가능한 이미지 리스트
                SizedBox(
                  width: double.infinity,
                  height: 400,
                  child: PageView.builder(
                    itemCount: item['subImages'].length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        item['subImages'][index],
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    '작성자: ${item['writer']}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'BMHANNA',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    '서브 타이틀: ${item['subTitle']}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'BMHANNA',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    '작성 일자: ${item['date']}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'BMHANNA',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    item['mainContent'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'BMHANNA',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _showLoginRequiredDialog(context);
                      // 사용자가 로그인한 상태인지 확인
                      // bool isLoggedIn = true; // TODO: 실제 로그인 상태 확인 로직 추가

                      // if (isLoggedIn) {
                      //   //로그인한 경우 댓글 작성 화면으로 이동
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => CommentScreen(), // 댓글 작성 화면
                      //     ),
                      //   );
                      // } else {
                      //   // 로그인하지 않은 경우 로그인이 필요하다는 다이얼로그 표시
                      //   _showLoginRequiredDialog(context);
                      // }
                    },
                    child: const Text("질문하기"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 사용자가 댓글을 작성하려고 할 때 로그인이 필요하다는 다이얼로그 표시
  void _showLoginRequiredDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("로그인이 필요합니다"),
          content: const Text("관리자에게 기업 인증 후 로그인을 하세요."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 다이얼로그 닫기
              },
              child: const Text("확인"),
            ),
          ],
        );
      },
    );
  }
}
