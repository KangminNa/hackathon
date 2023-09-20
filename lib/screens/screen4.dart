import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  Screen4({super.key});

  // 더미 데이터
  final List<Map<String, String>> dummyData = [
    {
      'title': '가온해 로운 나비잠.',
      'content':
          'eunoia twinkle way cresent stella requiem lucid twilight destiny haze illusion world flora blush baby flutter lucy illusion moonlight carnival droplet flora florence droplet miracle eunoia ice you cherish vanilla flutter like lovesick haze vanilla milky moonlight haze stella milky destiny flutter lovable eunoia lucy flora bijou aurora blossom honey.'
    },
    {
      'title': '달볓 소솜 그루잠.',
      'content':
          'milky flora twilight flutter seraphic apple girlish seraphic lucy apple adorable you bijou melody purity miracle eunoia honey masquerade kitten ice honey iris moonlight twilight heimish apple ideale masquerade laptop ice iris destiny carnival apple heimish grapes heimish requiem sunrise eunoia twilight blush banana purity flutter pure miracle flora grapes.'
    },
    {
      'title': '예그리나 포도 사과.',
      'content':
          'blossom like cherish cresent lucy eunoia ice melody blossom aurora melody aurora carnival lovable purity florence heimish vanilla ice vanilla droplet florence stella serendipity like illusion cherish apple hello bijou marshmallow milky flora seraphic honey melody honey kitten apple blush moonlight way flora cherish grapes moonlight twilight lucy blossom like.'
    },
    // Firebase에서 데이터를 가져와서 이와 유사한 형식으로 구성해야 합니다.
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTitle(),
              const SizedBox(
                height: 80,
              ),
              _buildListView(context),
            ],
          ),
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
            child: ListTile(
              title: Text(item['title']!),
              subtitle: _buildContent(context, item['content']!), // context를 전달
              trailing: const Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Icon(
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

  Widget _buildContent(BuildContext context, String content) {
    if (content.length <= 150) {
      // Content가 150자 이하인 경우 그대로 표시
      return Text(content);
    } else {
      // Content가 150자를 넘어갈 경우 ...더 보기 버튼 추가
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${content.substring(0, 150)}...'),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    item: {'title': '상세 내용', 'content': content},
                    parentContext: context, // context를 전달
                  ),
                ),
              );
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('더 보기'),
              ],
            ),
          ),
        ],
      );
    }
  }
}

class DetailScreen extends StatelessWidget {
  final Map<String, String> item;
  final BuildContext parentContext; // BuildContext를 추가

  const DetailScreen(
      {required this.item, required this.parentContext, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['title']!),
      ),
      body: Center(
        child: Text(item['content']!),
      ),
    );
  }
}
