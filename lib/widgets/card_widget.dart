import 'package:first_app/models/card_model.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  CardWidget({super.key, required this.card});

  CardModel card;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      //padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 8)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              card.image,
              width: double.infinity,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  card.title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  card.sub_title,
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),

                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 16),
                    SizedBox(width: 4),
                    Text('4.7', style: TextStyle(fontSize: 13)),
                    SizedBox(width: 12),
                    Icon(Icons.delivery_dining, color: Colors.orange, size: 16),
                    SizedBox(width: 4),
                    Text('Free', style: TextStyle(fontSize: 13)),
                    SizedBox(width: 12),
                    Icon(Icons.timer, color: Colors.orange, size: 16),
                    SizedBox(width: 4),
                    Text('20 min', style: TextStyle(fontSize: 13)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
