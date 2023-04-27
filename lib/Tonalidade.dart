import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:venus/cor_foto.dart';

class TonalidadeWidget extends StatefulWidget {
  const TonalidadeWidget({super.key});

  @override
  State<TonalidadeWidget> createState() => _TonalidadeWidgetState();
}

class _TonalidadeWidgetState extends State<TonalidadeWidget> {
  var _continuar = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("imagens/fotografa.jpg"),
            Card(
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Agne',
                  color: Colors.black
                ),
                child: AnimatedTextKit(
                  isRepeatingAnimation: false,
                  animatedTexts: [
                    TypewriterAnimatedText('Para te ajudar'),
                    TypewriterAnimatedText('Posso tirar um foto sua?'),
                  ],
                  onFinished: () => setState(() {
                    _continuar = true;
                  }),
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
            Visibility(
                visible: _continuar,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          final ImagePicker picker = ImagePicker();
                          final XFile? photo = await picker.pickImage(
                              source: ImageSource.camera);
                              if (photo!=null) {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CorFoto(foto: photo.path)));
                              }
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              color: Colors.green,
                            ),
                            Text("Tudo bem."),
                          ],
                        )),
                    ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.not_interested_rounded,
                              color: Colors.red,
                            ),
                            Text("Por enquanto não."),
                          ],
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
