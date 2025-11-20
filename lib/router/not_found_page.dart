import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "404",
              style: TextStyle(
                fontFamily: "Old London",
                fontSize: 90,
                color: Color.fromARGB(255, 255, 0, 102),
                letterSpacing: 4,
              ),
            ),
            const SizedBox(height: 20),

            // FRASE ESTILIZADA
            const Text(
              "You've met with a terrible fate,\nhaven't you?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 22,
                color: Colors.white,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 40),

            // BOTÓN PARA VOLVER
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: const Text(
                "Return Home",
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 255, 0, 102),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
