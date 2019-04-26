import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trakref_app/main.dart';

class TopicItem extends StatelessWidget {
  final String image = "";
  int index = -1;
  final String title = "";
  Function onPressed;

  TopicItem(this.index, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(5, 10, 0, 10),
            child: Image.asset(TopicItem.getImagePath(this.index),
                width: 160,
                alignment: Alignment.centerLeft,
                fit: BoxFit.fitHeight),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Container(
                child: Text(getTitle(this.index),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.display1.copyWith(
                      color: Colors.black),
                )
            ),
          )
        ],
      ),
    );
  }

  static String getImagePath(int index) {
    switch (index) {
      case 0:
        return "assets/images/feature-request.png";
        break;
      case 1:
        return "assets/images/usage-training.png";
        break;
      case 2:
        return "assets/images/security-account.png";
        break;
      case 3:
        return "assets/images/something-else.png";
        break;
    }
    return "assets/images/security-account.png";
  }

  static String getTitle(int index) {
    switch (index) {
      case 0:
        return "Feature Request";
        break;
      case 1:
        return "Usage, Training";
        break;
      case 2:
        return "Security, Your account";
        break;
      case 3:
        return "It is something else";
        break;
    }
    return "Feature Request";
  }
}

class PageTopicsBloc extends StatefulWidget {
  @override
  _PageTopicsBlocState createState() => _PageTopicsBlocState();
}

class _PageTopicsBlocState extends State<PageTopicsBloc> {
  static const platform = const MethodChannel('flutter.native/zendesk');

  // To show the ticket creation
  showTicketRequest(String subject) async {
    try {
      final List<String> result = await platform.invokeListMethod('showZDTicket', {"Subject":"Subject 01", "Message":"Message 01"});

      print("result of 'showZDChat'");
    } on PlatformException catch (e) {
      print("Failed to Invoke: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: new Icon(Icons.arrow_back, color: AppColors.gray),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Column(
                  children: <Widget>[
                    new Container(
                      width: double.infinity,
                        child: new Text("What's the topic?",
                          style: Theme.of(context).textTheme.title,
                          textAlign: TextAlign.left,
                        )
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text("Give us some information to help us to treat your demand quickly.",
                        style: Theme.of(context).textTheme.body1
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    GridView.count(crossAxisCount: 2,
                      shrinkWrap: true,
                      children: List.generate(4, (index) {
                        return TopicItem(index,
                          onPressed: () {
                            showTicketRequest(TopicItem.getTitle(index));
                          },
                        );
                      }),
                    )
                  ],
                ),
              ),
            )
        )
    );
    /* Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          new Container(
            child: new Text("What's the topic?",
                style: Theme.of(context).textTheme.title,
              textAlign: TextAlign.left,
            )
          ),
          SizedBox(
            height: 50,
          ),
          Text("Give us some information to help us to treat your demand quickly.",
          style: Theme.of(context).textTheme.body1
          ),
          GridView.count(crossAxisCount: 2,
            shrinkWrap: true,
            children: List.generate(4, (index) {
              return TopicItem(index);
            }),
          )
        ],
      ),
    ); */
  }
}
