import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnimatedAppBar extends StatefulWidget {
  const AnimatedAppBar({super.key});

  @override
  _AnimatedAppBarState createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {
  final TextEditingController stateController = TextEditingController();
  final FocusNode stateFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innnerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 120.0,
                floating: false,
                pinned: true,
                backgroundColor: Colors.green,
                automaticallyImplyLeading: false,
                titleSpacing: 0.0,
                toolbarHeight: 50.0, //タブバーの高さ
                centerTitle: true,
                elevation: 0.0,
                leadingWidth: 0.0,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [],
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://images.ctfassets.net/hrltx12pl8hq/2TRIFRwcjrTuNprkTQHVxs/088159eb8e811aaac789c24701d7fdb1/LP_image.jpg?fit=fill&w=632&h=354&fm=webp"), //NetworkImage
                                    radius: 16.0,
                                  ),
                                  Icon(
                                    Icons.flutter_dash_rounded,
                                    size: 35,
                                  ),
                                  SizedBox()
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Builder(
            builder: (BuildContext context) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      itemCount: 100,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text("Index value: $index"),
                        );
                      },
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
