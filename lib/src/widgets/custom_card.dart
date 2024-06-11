import 'package:flutter/material.dart';
import '../models/card_item.dart';
import 'package:appmovil_epmpolitecnico/src/screens/detail_screen.dart';

class CardWidget extends StatelessWidget {
  final CardItem cardItem;

  CardWidget({required this.cardItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(cardItem.imagePath),
            SizedBox(height: 8.0),
            Text(
              cardItem.title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 8.0),
            Text(cardItem.description),
            SizedBox(height: 8.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(cardItem: cardItem),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF005c70),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'Ver más',
                  style: TextStyle(color: Colors.white), // Cambiar el color del texto a blanco
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
