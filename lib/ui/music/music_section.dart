import 'package:acehornweb/ui/music/widgets/album_detail_widget.dart';
import 'package:flutter/material.dart';

class MusicSection extends StatefulWidget {
  const MusicSection({super.key});

  @override
  State<MusicSection> createState() => _MusicSectionState();
}

class _MusicSectionState extends State<MusicSection> {
     final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
   
   return Scaffold(
    backgroundColor: Colors.white,
    body: SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          AlbumDetailWidget(cover: 'assets/images/saviours.jpg', title: 'Saviours', year: '2025', tracks: [
            "Choices", "Digimon", "F.O.M.O", "Fortune Teller", "You Are (Not) Alone", "Your Name", "What I Love", "Away From Reality", "Heaven Into Hell", "Saviours"
          ], url: 'https://distrokid.com/hyperfollow/acehorn/saviours',
          
          )
        ],
      ),
    ),
   );
  }
}