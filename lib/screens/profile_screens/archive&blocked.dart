import 'package:flutter/material.dart';

class ArchiveAndBlocked extends StatefulWidget {
  const ArchiveAndBlocked({Key? key}) : super(key: key);

  @override
  State<ArchiveAndBlocked> createState() => _ArchiveAndBlockedState();
}

class _ArchiveAndBlockedState extends State<ArchiveAndBlocked> with SingleTickerProviderStateMixin {

  TabController? _tabController;


  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).backgroundColor,
          title: Text("Gradeboard",style: TextStyle(color: Color(0xffEFF0F2)),),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
          child: Column(
            children: [
              Container(
                height: size.height * 0.045,
                decoration: BoxDecoration(
                  color: Color(0xff22262B),
                  borderRadius: BorderRadius.circular(
                    6,
                  ),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      6,
                    ),
                    color: Color(0xff07BCD6),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white,
                  tabs: [
                    Tab(
                      text: 'Archived',
                    ),
                    Tab(
                      text: 'Blocked',
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.030,),
              Expanded(
                child: TabBarView(
                    controller: _tabController,
                    children: [
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.62,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                color: Color(0xff26292F),
                                borderRadius: BorderRadius.circular(8)
                            ),

                            child: Column(
                              children: [
                                Image.asset("image/Card 2 bottomcrop.png"),
                                Spacer(),
                                Row(mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(width: size.width * 0.020,),
                                    Text("28/08/22",style: TextStyle(color: Color(0xffEFF0F2),fontSize: 15),),
                                    Spacer(),
                                    InkWell(
                                        onTap: () {
                                        },
                                        child: Image.asset("image/Mailsend.png",scale:2.8,)),
                                    SizedBox(width: size.width * 0.020,),

                                  ],
                                ),
                                Spacer()
                              ],
                            ),
                          );
                        },),
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.62,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                color: Color(0xff26292F),
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: Column(
                              children: [
                                Image.asset("image/Card 2 bottomcrop.png"),
                                Spacer(),
                                Row(mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(width: size.width * 0.020,),
                                    Text("28/08/22",style: TextStyle(color: Color(0xffEFF0F2),fontSize: 15),),
                                    Spacer(),

                                  ],
                                ),
                                Spacer()
                              ],
                            ),
                          );
                        },),
                    ]),
              ),
            ],
          ),
        )
    );
  }
}
