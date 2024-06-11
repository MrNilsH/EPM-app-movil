import 'package:flutter/material.dart';
import 'package:appmovil_epmpolitecnico/src/models/RelatedTopic.dart';
import 'package:appmovil_epmpolitecnico/src/screens/detail_screen.dart';

class TopicDetailScreen extends StatelessWidget {
  final RelatedTopic topic;

  TopicDetailScreen({required this.topic});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
            topic.title,
            style: const TextStyle(
              color: Colors.white
            ),
        ),
        backgroundColor: Color(0xFF001528),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(topic.icon, color: Colors.teal, size: 100),
                    SizedBox(width: 10),

                    Text(
                      topic.title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      topic.longDescription,
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Recomendación:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.teal[50],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        topic.exercise,
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),

            ],
          ),
        ),
      ),
    );
  }
}
