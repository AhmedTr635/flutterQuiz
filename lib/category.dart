import 'package:flutter/material.dart';

import 'arts.dart';
import 'science.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key? key, this.title=""}) : super(key: key);
  final String title;

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category"),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body:
      
       Container(
        child: Column(
         
          
          children: <Widget>[
            Container(
            margin: EdgeInsets.all(20),
                width: double.infinity,
                height: 205,
                 child: ElevatedButton(
                  child: Text('PLAY SCIENCE QUIZ'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SciencePage()),
                    );
                  },
                ),
                        ),



             Container(
            margin: EdgeInsets.all(20),
                width: double.infinity,
                height: 205,
                 child: ElevatedButton(
                  child: Text('PLAY ARTS QUIZ'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ArtsPage()),
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
