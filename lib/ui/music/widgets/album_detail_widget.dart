import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AlbumDetailWidget extends StatelessWidget {
  final String cover;
  final String title;
  final String year;
  final List<String> tracks;

  final String url;


  const AlbumDetailWidget({
    super.key,
    required this.cover,
    required this.title,
    required this.year,
    required this.tracks,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 900;

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: isMobile ? 80 : 60, vertical: 40),
      child: isMobile ? _buildMobile() : _buildDesktop(),
    );
  }

  // DESKTOP LAYOUT ------------------------------------------------------------
  Widget _buildDesktop() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // COVER
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            cover,
            width: 280,
            height: 280,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 40),

        // TEXT + TRACKLIST
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: "Old London",
                  fontSize: 50,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                year,
                style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
              ),
              const SizedBox(height: 30),
              _tracklist(),
              const SizedBox(height: 40),
              _streamingIcons(),
            ],
          ),
        ),
      ],
    );
  }

  // MOBILE LAYOUT -------------------------------------------------------------
  Widget _buildMobile() {
    return Column(
      children: [
        SizedBox(height: 30,),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            cover,
            width: 220,
            height: 220,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 20),

        Text(
          title,
          style: const TextStyle(
            fontFamily: "Old London",
            fontSize: 40,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),

        Text(
          year,
          style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
        ),
        const SizedBox(height: 25),

        _tracklist(),
        const SizedBox(height: 35),

        _streamingIcons(),
      ],
    );
  }

  // TRACKLIST -----------------------------------------------------------------
  Widget _tracklist() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        tracks.length,
        (i) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            "${i + 1}. ${tracks[i]}",
            style: const TextStyle(fontSize: 18, color: Color.fromRGBO(239, 151, 201, 1),),

          ),
        ),
      ),
    );
  }

  // STREAMING ICONS -----------------------------------------------------------
  Widget _streamingIcons() {
    return 
      GestureDetector(
        onTap: () => openExternalLink(url),
        child: Text(
                  'Listen Here',
                  style: const TextStyle(
                    fontFamily: "Old London",
                    fontSize: 32,
                    color: Colors.black,
                  ),
                ),
      );
    
  }

  void openExternalLink(String url) {
  launchUrl(
    Uri.parse(url),
    mode: LaunchMode.externalApplication, // Fuerza nueva pestaña en Web
  );
}


}
