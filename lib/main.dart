import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../api/api.dart';

void main() => runApp(MainCharacterScreen());
var appCardList =[AppCard(), AppCard(),AppCard()];
void press() {
  print('Pressed!');
  ApiConnect().getCharactersList();
}

class MainCharacterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          title: Text(
            'TEEEEEEEEST!',
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            IconButton(
                onPressed: press,
                icon: SvgPicture.asset(
                  'assets/icons/setting.svg',
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    Colors.black,
                    BlendMode.srcIn,
                  ),
                )
            )
          ],
        ),
        body: ListView(
          children: appCardList,
        ),
      ),
    );
  }
}

class AppCard extends StatelessWidget {
  String imageUrl = 'https://sun9-45.userapi.com/impg/JpUBHEschCdwLPDn1NyxtkxxX5uau0ySIvwKjQ/Y2tqR6QP9WY.jpg?size=480x480&quality=95&sign=69b3617019e1cadcb65ca55477a09a0c&type=album';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 2),
                blurRadius: 6,
                spreadRadius: 0,
                color: Colors.black.withOpacity(0.02)
            ),
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 30,
              spreadRadius: 0,
              color: Colors.black.withOpacity(0.08),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.network(
                  imageUrl,
                  width: 60,
                  height: 52,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Text(
                'Test Test Test Test Test Test Test Test Test',
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 22),
            SvgPicture.asset('assets/icons/favorite.svg')
          ],
        ),
      ),
    );
  }
}

