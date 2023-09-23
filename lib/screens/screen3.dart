import 'package:flutter/material.dart';

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              _buildTitle(),
              const SizedBox(
                height: 30,
              ),
              _buildCardGrid(context), // 카드 그리드 추가
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
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 40,
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
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }

  // 카드 그리드를 생성하는 함수
  Widget _buildCardGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        final item = _getCardInfo(index);
        return InkWell(
          onTap: () {
            // 클릭한 카드 정보를 전달하며 DetailScreen으로 이동
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(item: item),
              ),
            );
          },
          child: _buildCard(item, index),
        );
      },
    );
  }

  Widget _buildCard(Map<String, dynamic> item, int index) {
    final String imagePath =
        'assets/images/index_$index.jpeg'; // 인덱스에 따른 이미지 파일 경로 생성
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(
              top: 4.0, bottom: 32.0, right: 8.0, left: 8.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage(imagePath), // 이미지 경로 지정
              fit: BoxFit.cover, // 이미지를 가득 채우도록 설정
            ),
          ),
        ),
        // 흐림 효과를 위한 Container
        Container(
          margin: const EdgeInsets.only(
              top: 4.0, bottom: 32.0, right: 8.0, left: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.black.withOpacity(0.5), // 흐림 효과를 위한 색상 및 불투명도 조절
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item['title'],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'BMHANNA',
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                item['subtitle'],
                style: const TextStyle(
                  fontSize: 10,
                  fontFamily: 'BMHANNA',
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                item['tag'],
                style: const TextStyle(
                  fontSize: 8,
                  fontFamily: 'BMHANNA',
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 각각의 카드 정보를 반환하는 함수
  Map<String, dynamic> _getCardInfo(int index) {
    String cardTitle;
    String cardSubTitle;
    String cardTag;
    List educationaList;
    List educationSubList;

    if (index == 0) {
      cardTitle = '제조업';
      cardSubTitle = '공정 개선 및 생산 효율성 향상 교육';
      cardTag = '#Lean Six Sigma #자동화 #웹 #프로그램';
      educationaList = <String>[
        "공정 개선 및 생산 효율성 향상을 위한 Lean Six Sigma",
        "제조 공정 자동화 및 로봇 기술 교육",
        "품질 관리 및 품질 인증 관련 교육",
      ];
      educationSubList = <String>[
        "Lean Six Sigma Green Belt",
        "Lean Six Sigma Black Belt",
        "Lean Six Sigma Mater Black Belt",
      ];
    } else if (index == 1) {
      cardTitle = '서비스업';
      cardSubTitle = '고객 서비스 향상을 위한 고객 경험 관리 교육';
      cardTag = '#Voc #KPIS #웹/앱개발 ';
      educationaList = <String>[
        "고객 서비스 향상을 위한 고객 경험 관리 교육",
        "Customer Journey Mapping 교육",
        "Voice of Coustomer(Voc) 분석 교육",
        "고객 서비스 핵심 지표(KPIS) 교육",
        "서비스 디자인 및 혁신을 위한 디자인 교육",
        "디자인 워크샵 : 문제 해결 및 혁신을 위해 디자인 생각 접근법을 사용하는 방법",
        "프로토타입 및 사용자 테스트 교육",
        "디지털 마케팅 및 온라인 프로모션 전략 교육",
        "디지털 마케팅 및 온라인 프로모션 전략 교육",
        "디지털 마케팅 기초 교육",
        "콘텐츠 마케팅 교육",
        "소셜 미디어 마케팅 교육",
      ];
      educationSubList = <String>[
        "Lean Six Sigma Green Belt",
        "Lean Six Sigma Black Belt",
        "Lean Six Sigma Mater Black Belt",
      ];
    } else if (index == 2) {
      cardTitle = '농업';
      cardSubTitle = '지속 가능한 농업, 환경 친화적인 교육';
      cardTag = '#자동화 #드론 #유기농 #품질인증 #질병';
      educationaList = <String>[
        "지속 가능한 농업 관리를 위한 환경 친화적인 농업 및 어업 교육",
        "지속 가능한 농업 및 어업 관리 교육",
        "유기농 재배 교육",
        "새로운 재배 기술과 수산업 관리 방법에 대한 교육",
        "유기농 재배 기술 교육",
        "지속 가능한 농업 관리 교육",
      ];
      educationSubList = <String>[
        "Lean Six Sigma Green Belt",
        "Lean Six Sigma Black Belt",
        "Lean Six Sigma Mater Black Belt",
      ];
    } else if (index == 3) {
      cardTitle = '수산업';
      cardSubTitle = '수산업 관리를 위한 어업 교육';
      cardTag = '#장소 #판매처 #유통 #어업관리 #자동화';
      educationaList = <String>[
        "수산물 가공 및 보관 기술 교육",
        "수산업 보건 및 질병 관리 교육",
        "농업 및 어업 자동화 기술 교육",
        "농산물 품질 관리 및 품질 인증 교육",
        "농산물 마케팅 및 유통 전략 교육",
        "농산물 마케팅 기초 교육",
        "농산물 유통 및 로지스틱스(물류 효율적으로 운영하는 시스템) 교육",
        "농산물 온라인 판매 및 전자 상거래 교육",
        "농산물 수출 및 국제 시장 진출 교육",
        "농산물 가치 추가 및 혁신 교육",
      ];
      educationSubList = <String>[
        "Lean Six Sigma Green Belt",
        "Lean Six Sigma Black Belt",
        "Lean Six Sigma Mater Black Belt",
      ];
    } else if (index == 4) {
      cardTitle = '스타트업';
      cardSubTitle = '창업 및 경영을 위한 역량강화 교육';
      cardTag = '#창업 #비즈니스모델 #플랜 #투자유치 #성장전략';
      educationaList = <String>[
        "스타트업 창업과 경영을 위한 스타트업 역량 강화 교육",
        "스타트업 창업 및 경영 교육",
        "비즈니스 플랜 작성 교육",
        "투자 유치 및 기업 성장 전략 교육",
        "스타트업 자금 조달 및 투자 유치 전략 교육",
        "투자 유치 전략 교육",
        "연석자금 조달 및 창업자금 확보 교육",
        "투자 판단 및 투자자 커뮤니케이션 교육",
        "크라우드펀딩 및 엔젤 투자 교육",
        "디지털 비즈니스 모델과 혁신을 위한 스타트업 교육",
        "디지털 비즈니스 모델 개발 교육",
        "스타트업 혁신 전략 교육",
        "데이터 분석 및 인공 지능 (AI) 활용 교육",
        "디지털 마케팅 및 온라인 전략 교육",
      ];
      educationSubList = <String>[
        "Lean Six Sigma Green Belt",
        "Lean Six Sigma Black Belt",
        "Lean Six Sigma Mater Black Belt",
      ];
    } else if (index == 5) {
      cardTitle = '축산업';
      cardSubTitle = '동물 복지 및 보건관리 교육';
      cardTag = '#동물복지 #질병관리 #사료구입처 #유통';
      educationaList = <String>[
        "축산업의 동물 복지 및 보건 관리 교육",
        "동물 복지 원칙 교육",
        "축산업 보건 및 질병 관리 교육",
        "축산업의 환경 친화적인 운영 및 지속 가능성을 위한 교육",
        "지속 가능한 축산업 관리 교육",
        "친환경 축산 기술 교육",
        "동물 복지와 생태학 교육",
        "유기 축산과 풀효과 양식 교육",
        "축산 제품 마케팅과 유통 전략 교육",
        "축산 제품 마케팅 및 브랜딩 교육",
        "농산물 유통 및 물류 관리 교육",
        "디지털 마케팅 및 온라인 판매 교육",
        "농산물 가격 및 시장 분석 교육",
      ];
      educationSubList = <String>[
        "Lean Six Sigma Green Belt",
        "Lean Six Sigma Black Belt",
        "Lean Six Sigma Mater Black Belt",
      ];
    } else if (index == 6) {
      cardTitle = '요식업';
      cardSubTitle = '서비스 품질 향상을 위한 조리기술 및 식품안전교육';
      cardTag = '#식품안전 #위생교육 #품질개선 #앱/웹 홍보';
      educationaList = <String>[
        "음식 서비스 품질 향상을 위한 조리 기술 및 식품 안전 교육",
        "식품 안전 및 위생 교육",
        "푸드 스타일링과 음식 품질 개선 교육",
        "요식업의 영업 관리 및 경영 전략 교육",
        "음식 서비스 경영 교육",
        "마케팅 및 브랜딩 교육",
        "음식점 운영 및 서비스 관리 교육",
        "온라인 및 소셜 미디어 마케팅 교육",
        "음식 메뉴 혁신과 트렌드에 따른 교육",
        "음식 메뉴 개발 및 혁신 교육",
        "식재료 선택 및 조리 기술 교육",
        "음식 트렌드 및 소비자 선호도 분석 교육",
        "식품 안전 및 위생 교육",
      ];
      educationSubList = <String>[
        "Lean Six Sigma Green Belt",
        "Lean Six Sigma Black Belt",
        "Lean Six Sigma Mater Black Belt",
      ];
    } else if (index == 7) {
      cardTitle = '유통업';
      cardSubTitle = '유통 채널 분석을 위한 소매업 및 유통 관련 교육';
      cardTag = '#소비자행동 #마케팅 #유통 #웹/앱관리';
      educationaList = <String>[
        "소비자 행동 및 유통 채널 분석을 위한 소매업 및 유통 관련 교육",
        "소비자 행동 및 마케팅 분석 교육",
        "물류 및 재고 관리 최적화를 위한 교육",
        "물류 및 공급망 관리 교육",
        "재고 최적화와 예측 분석 교육",
        "물류 기술 및 소프트웨어 교육",
        "지속 가능한 물류 및 재고 관리 교육",
        "온라인 및 옴니채널 판매 전략 개발을 위한 교육",
        "디지털 판매 및 옴니채널 전략 교육",
        "온라인 마케팅 및 전자상거래 교육",
        "고객 경험 관리 교육",
        "데이터 분석 및 성과 측정 교육",
      ];
      educationSubList = <String>[
        "Lean Six Sigma Green Belt",
        "Lean Six Sigma Black Belt",
        "Lean Six Sigma Mater Black Belt",
      ];
    } else {
      cardTitle = '다른 카테고리';
      cardSubTitle = '다른 이야기';
      cardTag = '다른 해쉬태그';
      educationaList = [];
      educationSubList = <String>[];
    }

    return {
      'title': cardTitle,
      'subtitle': cardSubTitle,
      'tag': cardTag,
      'list': educationaList,
      'subList': educationSubList,
    };
  }
}

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  const DetailScreen({super.key, required this.item});

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
      body: Center(
        child: Column(
          children: [
            DetailScreen_Title(item: item),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: DetailScreen_Education_List_Listview(item: item),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen_Education_List_Listview extends StatelessWidget {
  const DetailScreen_Education_List_Listview({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    final List<String> educationList = item['list'];
    final List<String> educationSubList = item['subList'];

    return ListView.builder(
      shrinkWrap: true,
      itemCount: educationList.length,
      itemBuilder: (context, index) {
        return SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      educationList[index],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'BMHANNA',
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                      child: Image.asset(
                        'assets/images/test_video_image.png',
                        width: 80,
                        height: 80,
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

class DetailScreen_Title extends StatelessWidget {
  const DetailScreen_Title({
    super.key,
    required this.item,
  });

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          item['title'],
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            fontFamily: 'BMHANNA',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 35,
        ),
        Text(
          item['subtitle'],
          style: const TextStyle(
            fontSize: 20,
            fontFamily: 'BMHANNA',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          item['tag'],
          style: const TextStyle(
            fontSize: 10,
            fontFamily: 'BMHANNA',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
