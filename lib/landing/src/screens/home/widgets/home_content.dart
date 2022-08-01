part of '../home.imports.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 100,
                child:
                    Image.asset('assets/images/najizLogo@3x.png', width: 200)),
            const SizedBox(height: 10),
            Text(translate( 'services'), style: const TextStyle(fontSize: 22)),
            Text(translate( 'electronic_justice'),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
          ]),
    ));
  }
}
