import 'package:flutter/material.dart';

class SliverTabBar extends StatefulWidget {
  const SliverTabBar({Key? key}) : super(key: key);

  @override
  State<SliverTabBar> createState() => _SliverTabBarState();
}

class _SliverTabBarState extends State<SliverTabBar>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int index = 0;
  String image =
      "https://raw.githubusercontent.com/BarriosRosalesJosue465/img_fluttterFlow_IOS_6J/main/act12NavBar_flutterFlow/marcket.jpg";

  List<String> miImages = [
    "https://raw.githubusercontent.com/BarriosRosalesJosue465/img_fluttterFlow_IOS_6J/main/act12NavBar_flutterFlow/marcket.jpg",
    "https://raw.githubusercontent.com/BarriosRosalesJosue465/img_fluttterFlow_IOS_6J/main/act12NavBar_flutterFlow/producto5.jpg",
    "https://raw.githubusercontent.com/BarriosRosalesJosue465/img_fluttterFlow_IOS_6J/main/act12NavBar_flutterFlow/descuentos.jpg",
    "https://raw.githubusercontent.com/BarriosRosalesJosue465/img_fluttterFlow_IOS_6J/main/act12NavBar_flutterFlow/distribuicion.jpg",
  ];

  void _tabListener() {
    setState(() {
      index = tabController!.index;
      image = miImages[index];
    });
  }

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController!.addListener(_tabListener);
    super.initState();
  }

  @override
  void dispose() {
    tabController!.removeListener(_tabListener);
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
            elevation: 0.0,
            pinned: true,
            backgroundColor: Colors.deepPurple,
            expandedHeight: 350.0,
            flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  "",
                  style: TextStyle(
                      fontSize: 25,
                      color: Color(0xff100b2b),
                      backgroundColor: Color(0x000b0a1f)),
                ),
                background: Image.network(
                  image,
                  fit: BoxFit.cover,
                ))),
        SliverAppBar(
          pinned: true,
          primary: false,
          elevation: 8.0,
          backgroundColor: const Color(0xffe2ed48),
          title: Align(
            alignment: AlignmentDirectional.center,
            child: TabBar(
              controller: tabController,
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              isScrollable: true,
              tabs: const [
                Tab(
                  text: "Inicio",
                ),
                Tab(
                  text: "productos",
                ),
                Tab(
                  text: "descuentos",
                ),
                Tab(
                  text: "distribucion",
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 800,
            child: Padding(
                padding: EdgeInsets.all(50.0),
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    Text(
                        "Barrios rosales josue gustavo\nBienvenido a Sabritas\n21308051280438"),
                    Text(
                        "Barrios rosales josue gustavo\nBienvenido a Sabritas\n21308051280438"),
                    Text(
                        "Barrios rosales josue gustavo\nBienvenido a Sabritas\n21308051280438"),
                    Text(
                        "Barrios rosales josue gustavo\nNosotros somos Sabritas\n21308051280438"),
                  ],
                )),
          ),
        )
      ],
    );
  }
}
