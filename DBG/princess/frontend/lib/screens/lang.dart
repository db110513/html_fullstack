import 'package:flutter/material.dart';

class Lang extends StatelessWidget {
  const Lang({Key? key}) : super(key: key);

  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),

    home: Scaffold(

      backgroundColor: Colors.black,

      appBar: AppBar(
        title: Text(
          'Hotels & Resorts Princess'
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 25),
            FlagItem(
              imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBSU1K_mmiMiFJd3Q7EnZgiBCUMz_P1diX6kcjYVbAz0JGJZAzSj36iqiGilgJ9I0xqnI&usqp=CAU',
              onPressed: () {

                // Handle button press for the first flag
              },
            ),
            SizedBox(height: 35),
            FlagItem(
              imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqagcnulZrOlsGkXV_ZJbONKNf8jxuLj3L6A&usqp=CAU',
              onPressed: () {
                // Handle button press for the second flag
              },
            ),
            SizedBox(height: 35),
            FlagItem(
              imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnmRXuSOJtJEiSfuhA9Q-168GMop_a0W3szg&usqp=CAU',
              onPressed: () {
                // Handle button press for the third flag
              },
            ),
            SizedBox(height: 35),
            FlagItem(
              imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ05ZPaWxCjGqwu9Kg7ZMc7FDbDJ13Zdq-6Yg&usqp=CAU',
              onPressed: () {
                // Handle button press for the fourth flag
              },
            ),
            SizedBox(height: 35),
            FlagItem(
              imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUfzMgEg3WLZib6IDYtbzuOZJxvT00bxPnaA&usqp=CAU',
              onPressed: () {
                // Handle button press for the fifth flag
              },
            ),
            SizedBox(height: 35),
            FlagItem(
              imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQytZUINdBet2-G2YLw34DwIvsDDupYqNTgng&usqp=CAU',
              onPressed: () {
                // Handle button press for the fifth flag
              },
            ),
          ],
        ),
      ),
    ),

  );

}
class FlagItem extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onPressed;

  const FlagItem({required this.imageUrl, required this.onPressed});

  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0), // Set border radius to zero
          ),
          padding: EdgeInsets.zero,
        ),
        child: Image.network(
          imageUrl,
          height: 80,
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
