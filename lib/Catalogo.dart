import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:venus/tonalidade.dart';

class CatalogoWidget extends StatefulWidget {
  const CatalogoWidget({super.key});

  @override
  State<CatalogoWidget> createState() => _CatalogoWidgetState();
}

class _CatalogoWidgetState extends State<CatalogoWidget> {
  var _continuar = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("imagens/mulher.jpg"),
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
                    TypewriterAnimatedText('Olá'),
                    TypewriterAnimatedText(
                        'Estou muito feliz de ver você por aqui.'),
                    TypewriterAnimatedText(
                        'Posso lhe ajudar a escolher uma base para o seu rosto?'),
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
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TonalidadeWidget(),
                          ));
                        },
                        child: Row(
                          children: [
                            Icon(Icons.sim_card_alert),
                            Text("Sim. Vamos lá!")
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
