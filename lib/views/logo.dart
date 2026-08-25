import 'package:flutter/material.dart';

class ScreenLogo extends StatelessWidget {
  ScreenLogo({super.key});

  final List<String> logoList = [
    'https://i.pinimg.com/736x/3f/0f/62/3f0f62870ce1ba127ad3f20ed697543c.jpg', 
    'https://i.pinimg.com/736x/5b/03/28/5b03283789019eff73bc0338e46d92d3.jpg',
    'https://i.pinimg.com/1200x/f4/3d/34/f43d34bbb135c7c0a61ed374c819a903.jpg',
    'https://i.pinimg.com/736x/6b/be/96/6bbe962fa4bccceb3768e6a183d549da.jpg',
    'https://i.pinimg.com/1200x/2f/4b/ca/2f4bca4042ae96943aa2870943c6a92c.jpg',
    'https://i.pinimg.com/1200x/39/19/0d/39190d47c2d168b622c9396cb30acb51.jpg',
    'https://i.pinimg.com/1200x/45/21/1d/45211d93dc5f79e83b99d0021282744d.jpg',
    'https://i.pinimg.com/1200x/05/8f/0b/058f0bb7bd00475ab4667e0a054b7917.jpg',
    'https://i.pinimg.com/736x/24/14/57/2414578e9d693397011e282cf4e3bb80.jpg',
    'https://i.pinimg.com/1200x/b5/4a/6d/b54a6d9eb9f67f896523ed8f7a930a80.jpg',
    'https://i.pinimg.com/736x/64/92/a8/6492a8ec215d8060ff1220f14156ce37.jpg',
    'https://i.pinimg.com/1200x/c5/49/d5/c549d55601f36203e65ee4969d639e98.jpg',
    'https://i.pinimg.com/1200x/e2/6f/e2/e26fe2a4a25cbebb014334b223a27618.jpg',
    'https://i.pinimg.com/1200x/a0/c7/f8/a0c7f877c7fb00de5f22fa2ef3a93d45.jpg',
    'https://i.pinimg.com/736x/96/cc/4f/96cc4f35c22abbc84c48cc992d2f16d2.jpg',
    'https://i.pinimg.com/736x/96/ef/5b/96ef5bce563746b02126b465786de68c.jpg',
    'https://i.pinimg.com/1200x/61/d0/eb/61d0eb5954cbe43180ff2581d63b8453.jpg',
    'https://i.pinimg.com/1200x/39/61/93/3961935156ce33332848c8a98249a33d.jpg',
    'https://i.pinimg.com/736x/e0/a0/8f/e0a08fe27797d2a9a2adce85a95c4390.jpg',
    'https://i.pinimg.com/736x/50/2b/f6/502bf6ae1be69015eb081579a25a6038.jpg',
    'https://i.pinimg.com/736x/b4/6b/5b/b46b5bcf66107d23f9342a7ef24efe21.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Brand Logos"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.builder(
          itemCount: logoList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, 
            crossAxisSpacing: 12,
            mainAxisSpacing: 12, 
            childAspectRatio: 1, 
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                
              },
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Image.network(
                  logoList[index],
                  fit: BoxFit.contain, 
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}