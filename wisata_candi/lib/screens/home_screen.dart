import 'package:flutter/material.dart';
import 'package:wisata_candi/data/candi_data.dart';

import '../models/candi.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //todo 1 : buat appbar dengan judul wisata candi
      appBar: AppBar(title: Text('Wisata Candi'),),
      //todo 2 : buat body dengan gridview.builder
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context,index){
            Candi candi = candiList[index];
    },
      ),
      //todo 3 : buat itemcard sebagai return value dari gridview builder
    );
  }
}
