import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  //todo 1 deklarasikan variabel yang dibutuhkan dan pasang pada konstruktor
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      //todo 2 tetapkan parameter shape  margin dan elevations dari cari
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(4),
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              candi.imageAsset,
              width: double.infinity,
            ),
          ))

        ],
      ),
    );
  }
}
