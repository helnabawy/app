part of '../home.imports.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset('assets/images/mojLogo@3x.png', height: 30),
                const SizedBox(width: 16),
                Image.asset('assets/images/2030-vision@3x.png', height: 30),
              ],
            ),
            InkWell(
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
                child:
                    Image.asset('assets/images/menuLand@3x.png', height: 40)),
          ]),
    );
  }
}
