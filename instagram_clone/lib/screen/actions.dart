import 'dart:convert';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_999/models/notification.dart';

class ActionsPage extends StatefulWidget {
  const ActionsPage({Key? key}) : super(key: key);

  @override
  State<ActionsPage> createState() => _ActionsPageState();
}

class _ActionsPageState extends State<ActionsPage> {
  List<dynamic> notifications = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/notifications.json');
    final data = await json.decode(response);

    setState(() {
      notifications = data['notifications']
          .map((data) => InstagramNotification.fromJson(data))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Activity",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return Slidable(
              actionPane: const SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              child: notificationItem(notifications[index]),
              secondaryActions: <Widget>[
                Container(
                    height: 60,
                    color: Colors.grey.shade500,
                    child: const Icon(
                      Icons.info_outline,
                      color: Colors.white,
                    )),
                Container(
                    height: 60,
                    color: Colors.red,
                    child: const Icon(
                      Icons.delete_outline_sharp,
                      color: Colors.white,
                    )),
              ],
            );
          }),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/");
            },
            icon:
                const Icon(Icons.home_outlined, size: 32, color: Colors.black),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/search");
            },
            icon: const Icon(Icons.search, size: 32, color: Colors.black),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/actions");
            },
            icon: const Icon(Icons.favorite_border,
                size: 32, color: Colors.black),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/profil");
            },
            icon:
                const Icon(Icons.person_outline, size: 32, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

notificationItem(InstagramNotification notification) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              notification.hasStory
                  ? Container(
                      width: 50,
                      height: 50,
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.red, Colors.orangeAccent],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomLeft),
                          shape: BoxShape.circle),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(notification.profilePic)),
                      ),
                    )
                  : Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.grey.shade300, width: 1)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(notification.profilePic)),
                    ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: notification.name,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: notification.content,
                      style: const TextStyle(color: Colors.black)),
                  TextSpan(
                    text: notification.timeAgo,
                    style: TextStyle(color: Colors.grey.shade500),
                  )
                ])),
              )
            ],
          ),
        ),
        notification.postImage != ''
            ? SizedBox(
                width: 50,
                height: 50,
                child: ClipRRect(child: Image.asset(notification.postImage)),
              )
            : Container(
                height: 35,
                width: 110,
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                    child:
                        Text('Follow', style: TextStyle(color: Colors.white)))),
      ],
    ),
  );
}
