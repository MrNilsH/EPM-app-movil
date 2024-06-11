import 'package:flutter/material.dart';
import 'package:appmovil_epmpolitecnico/src/models/card_item.dart';
import 'package:appmovil_epmpolitecnico/src/screens/topic_detail_screen.dart';

class DetailScreen extends StatelessWidget {
  final CardItem cardItem;

  DetailScreen({required this.cardItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
            cardItem.title,
            style: const TextStyle(
              color: Colors.white
            ),
        ),
        backgroundColor: Color(0xFF001528),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(cardItem.imagePath),
            SizedBox(height: 16.0),
            Text(
              cardItem.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              cardItem.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: cardItem.relatedTopics.length,
                itemBuilder: (context, index) {
                  final topic = cardItem.relatedTopics[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TopicDetailScreen(topic: topic),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: Colors.teal,
                              size: 40,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    topic.title,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    topic.shortDescription,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.teal,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
