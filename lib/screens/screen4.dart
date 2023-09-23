import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  Screen4({super.key});

  final List<Map<String, dynamic>> dummyData = [
    {
      'writer': '김민지',
      'title': '정부지원금이 궁금합니다.',
      'content':
          '안녕하세요. 당사는 판넬제조 중소 업체입니다. 2021년 12월 국토교통부가 고시한 건축자재 및 품질인정 관리기준 강화에 맞추어 한달에 한두번   판넬 화재 예비 시험을 하고 있습니다. 아래 기사내용을 확인해 보시면 알겠지만 시험에 통과한다는 것은  하늘의 별따기 처럼 어려운게 현실이라 계속해서 예비시험을 통해  문제점을 보안하고 다시 수정하여 예비시험을 하고 이런 상황이 반복적입니다. 하지만 예비시험에서도 100%로가 합격이라면,  전국 모든 판넬제조업체가 40%도 채우지 못하고  탈락하고 있는 실정입니다. 법이 잘못되어 현실적으로 합격한다는 것은 너무도 어려운 상황입니다. 그런데 문제는 제품판매도 못하고 있는 상황인데,  예비시험을 한번 할 때마다  건당 5백만원씩 비용이 발생하고 있는 상황입니다. 그렇다고 비용이 부담되어 예비시험을 하지 않고,  바로 본 시험을 하게 되어  본시험에서 탈락하게 된다면 6개월을 또 기다려야 하는 상황이기에,   어쩔수 없이  예비시험을 계속하면서 문제점을 보안해 가면서 하는 방법 밖에는 없습니다. 혹시 이러한 예비시험에 대한 중소기업지원 지원을 받을 수 있는 방법이 없을까요?',
    },
    {
      'writer': '김성환',
      'title': '공장문의',
      'content':
          '안녕하세요 저희는 해남군 영농조합법인 회사입니다. 저희가 해남 쌀을 활용하여 햇반을 제작하려고 하는데, 일단 1만개~1만 5천개 정도 생산하여 판매하고 반응을 살펴보고 싶은데 생산이 가능한 공장이 없을까하여 문의드립니다.',
    },
    {
      'writer': '박예원',
      'title': '사내용 DB 구축',
      'content':
          '회사 내부적으로 자료를 축적하고 향후 쉽게 찾을 수 있는 좋은 방법이 있는지 고민 중입니다. 업무 관련된 노하우 등을 분야별로 정리해서 축적해 놓고 필요시 검색(AND, OR 등)기능을 통해 바로바로 자료를 바로 찾을 수 있는 프로그램이면 될 것 같습니다. 엑셀, 워드, 아래아한글로 관리하기에는 좀 불편할 것 같습니다. 혹시 추천해주실 프로그램(또는사이트, 클라우드 서비스 등)이 있으면 부탁드립니다. 감사합니다.',
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTitle(),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildListView(context),
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
      '알려주세요',
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        fontFamily: 'BMHANNA',
        color: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }

  // ListView를 생성하는 함수
  Widget _buildListView(BuildContext context) {
    return SizedBox(
      width: 500,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: dummyData.length,
        itemExtent: null,
        itemBuilder: (context, index) {
          final item = dummyData[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    item: item,
                    parentContext: context,
                  ),
                ),
              );
            },
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item['title']!,
                        style: const TextStyle(
                            fontFamily: 'BMHANNA',
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      const Icon(
                        size: 15,
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildContent(context, item['content']!), // context를 전달
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, String content) {
    if (content.length <= 150) {
      // Content가 150자 이하인 경우 그대로 표시
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content,
            style: const TextStyle(
              fontFamily: 'BMHANNA',
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ],
      );
    } else {
      // Content가 150자를 넘어갈 경우 ...더 보기 버튼 추가
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 360,
            child: Text(
              '${content.substring(0, 150)}  ...더보기',
              style: const TextStyle(
                fontFamily: 'BMHANNA',
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
    }
  }
}

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> item;
  final BuildContext parentContext; // BuildContext를 추가

  const DetailScreen(
      {required this.item, required this.parentContext, super.key});

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Detail_Title(item: item),
            // 댓글 보기 및 작성 컨테이너 추가
            DetailComments(
              item: item,
            )
          ],
        ),
      ),
    );
  }
}

class DetailComments extends StatelessWidget {
  final Map<String, dynamic> item;
  const DetailComments({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        // 댓글 컨테이너 스타일 및 크기 설정
        width: double.infinity,
        height: 500,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '댓글',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'BMHANNA',
              ),
            ),
            const SizedBox(height: 16.0), // 댓글 목록과 입력창 사이의 간격 조절

            const Column(
              children: [
                SizedBox(
                  height: 100,
                ),
              ],
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
                child: const Text("댓글 작성"),
              ),
            ),
          ],
        ),
      ),
    );
  }
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

class Detail_Title extends StatelessWidget {
  const Detail_Title({
    super.key,
    required this.item,
  });

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item['title']!,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'BMHANNA',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                '작성자 : ',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'BMHANNA',
                ),
              ),
              Text(
                item['writer']!,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'BMHANNA',
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          const Text(
            '내용',
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
            item['content']!,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: 'BMHANNA',
            ),
          ),
        ],
      ),
    );
  }
}
