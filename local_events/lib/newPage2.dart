import 'package:flutter/material.dart';

class MyNewPage2 extends StatelessWidget {
  final Function onBackButtonPressed;

  MyNewPage2({required this.onBackButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My New Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('İçerik buraya gelecek.'),
            ElevatedButton(
              onPressed: () {
                // Geri butonuna basıldığında onBackButtonPressed fonksiyonunu çağır
                if (onBackButtonPressed != null) {
                  onBackButtonPressed();
                }
                // Geri git
                Navigator.pop(context);
              },
              child: Text('Geri Git 2'),
            ),
          ],
        ),
      ),
    );
  }
}
