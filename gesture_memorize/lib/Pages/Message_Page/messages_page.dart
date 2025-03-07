import 'package:flutter/material.dart';
import 'package:gesture_memorize/Components/chatbox_messages.dart';
import 'package:gesture_memorize/Infomations/message_list_info.dart';
import 'package:gesture_memorize/Pages/Message_Page/chat_page.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);
  static const String id = '/messages';

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      backgroundColor: Color(0xff1B202D),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Messages',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: ('Quicksand'),
                        fontSize: 30,
                        color: Colors.white),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 36,
                      ))
                ],
              ),
              SizedBox(
                height: screenHeight / 45,
              ),
              const Text(
                'R E C E N T',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: screenHeight / 45,
              ),
              SizedBox(
                height: screenHeight / 6.5,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  for (int i = 0; i < MessageListInfo.recentpeople.length; i++)
                    Row(children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: Image.asset(
                                    MessageListInfo.recentpeople[i]["image"])
                                .image,
                          ),
                          SizedBox(
                            height: screenHeight / 71.6,
                          ),
                          Text(
                            MessageListInfo.recentpeople[i]["name"],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          )
                        ],
                      ),
                      SizedBox(
                        width: screenWidth / 14.4,
                      ),
                    ]),
                ]),
              ),
              SizedBox(
                height: screenHeight / 35.7,
              ),
              SingleChildScrollView(
                child: Container(
                  height: screenHeight / 1.65,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color(0xff292F3F),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )),
                  child: Expanded(
                    child: ListView(
                      children: [
                        for (int i = 0; i < MessageListInfo.people.length; i++)
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatboxPage(
                                            name: MessageListInfo.people[i]["name"],
                                            image: MessageListInfo.people[i]["image"],
                                          )));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: screenWidth / 13.85,
                                  top: screenHeight / 35.7,
                                  right: screenWidth / 36),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: Image.asset(
                                            MessageListInfo.people[i]["image"])
                                        .image,
                                  ),
                                  SizedBox(
                                    width: screenWidth / 36,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: screenWidth / 3,
                                            child: Text(
                                              MessageListInfo.people[i]["name"],
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: ('Quicksand'),
                                                  fontSize: 17),
                                            ),
                                          ),
                                          SizedBox(width: screenWidth / 6
                                              // width: 100,
                                              ),
                                          Text(
                                            MessageListInfo.people[i]["date"],
                                            style: const TextStyle(
                                                color: Colors.white70),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: screenHeight / 143.2,
                                      ),
                                      Text(
                                        MessageListInfo.people[i]["gmail"],
                                        style: const TextStyle(
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
