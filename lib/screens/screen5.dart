import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Screen5 extends StatelessWidget {
  Screen5({Key? key}) : super(key: key);

  // 더미 데이터
  final List<Map<String, dynamic>> dummyData = [
    {
      'title': '샤인머스캣 포장 인력 3인 구합니다.',
      'sub_content': '샤인머스캣을 종이포장지에 감싸 포장하면 되는 간단한 일입니다.  ',
      'main_content':
          '아침 7시에 사무실에서 출발해서 점심 전까지 세종 근교에 있는 포도농장에서 포장해주실 분을 찾습니다. 아침 점심 다 제공하고 차량으로 집까지 데려다 드릴게요!',
      'current_man': 3,
      'max_man': 5,
      'writer': "김민지",
      'content': '010-8987-1619',
      'pay': "15000",
      'address': "서창리 204 - 2 대흥빌라 4층 주식회사 농부와함께",
    },
    {
      'title': '2023년 창업경진대회 나갈 팀원 구합니다.',
      'sub_content': '문체부주관 예술초기창업경진대회, 중소기업부주관 초기창업경진회',
      'main_content':
          '2023년 x월에 문체부에서 주관하는 예비창업경진대회에 우승하여 예술경영지원센터로 부터 창업교육과 멘토링, 지원을 받으며 성장해나갔습니다. 현재는 웹페이지를 구축하여 어플로 패키징하는 과정을 진행하고 있으며,2024년 하반기에는 베타서비스 런칭과 함께 초기창업패키지에 출전 할 예정입니다. (초기창업패키지는 최소 5000만원 부터 최대 1억원에 지원을 받아 지원 받은 금액과 함께 성장할 열정적인 초기 팀원을 모집합니다 :)',
      'current_man': 4,
      'max_man': 6,
      'writer': "나강민",
      'content': '010-0000-0000',
      'pay': "상금 최대 1억원",
      'address': "개인 이메일로 연락주세요 xxxxx@gmail.com",
    },
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
            _buildTitle(),
            const SizedBox(
              height: 40,
            ),
            Expanded(child: _buildListView()),
          ],
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
    return ListView.builder(
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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      item['title']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'BMHANNA',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildContent(item),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Content를 생성하는 함수
  Widget _buildContent(Map<String, dynamic> item) {
    final currentMan = item['current_man'];
    final maxMan = item['max_man'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 280,
          child: Text(
            '${item['sub_content']}',
            style: const TextStyle(
              fontSize: 15,
              fontFamily: 'BMHANNA',
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '참가자: $currentMan/$maxMan',
              style: const TextStyle(
                fontSize: 10,
                fontFamily: 'BMHANNA',
                color: Colors.white,
              ),
            ),
            const Icon(
              size: 10,
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ],
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    item['title'],
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BMHANNA',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  '부제 : ',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontFamily: 'BMHANNA',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  item['sub_content'],
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontFamily: 'BMHANNA',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      '작성자 : ',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'BMHANNA',
                      ),
                    ),
                    Text(
                      item['writer'],
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'BMHANNA',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      '전화번호 : ',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'BMHANNA',
                      ),
                    ),
                    Text(
                      item['content'],
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'BMHANNA',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      '시급 : ',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'BMHANNA',
                      ),
                    ),
                    Text(
                      item['pay'],
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'BMHANNA',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      '남은 지원자 : ',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'BMHANNA',
                      ),
                    ),
                    Text(
                      (item['max_man'] - item['current_man'])
                          .toString(), // 뺄셈 연산 후 문자열로 변환
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'BMHANNA',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '오시는 곳 : ',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontFamily: 'BMHANNA',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  item['address'],
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontFamily: 'BMHANNA',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '내용',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'BMHANNA',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  item['main_content'],
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'BMHANNA',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // 댓글 작성 버튼
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
                    child: const Text("지원하러가기"),
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
