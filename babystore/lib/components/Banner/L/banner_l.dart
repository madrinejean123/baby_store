import 'package:flutter/material.dart';

import '../../network_image_with_loader.dart';

class BabyStoreBanner extends StatelessWidget {
  const BabyStoreBanner({
    super.key,
    this.image =
        "https://i.pinimg.com/236x/c5/56/f7/c556f7238584287e32c946aebd8cf628.jpg",
    required this.title,
    required this.press,
    this.subtitle,
    required this.discountPercent,
  });

  final String? image;
  final String title;
  final String? subtitle;
  final int discountPercent;

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.1,
      child: GestureDetector(
        onTap: press,
        child: Stack(
          children: [
            NetworkImageWithLoader(image!, radius: 0),
            Container(color: Colors.pink.withOpacity(0.3)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontFamily: "YourBabyFriendlyFont",
                      fontSize: 60,
                      height: 1.2,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: <Widget>[
                            Text(
                              discountPercent.toString(),
                              style: TextStyle(
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 1.4
                                  ..color = Colors.white38,
                              ),
                            ),
                            Positioned(
                              top: -4,
                              right: -4,
                              child: Text(discountPercent.toString()),
                            ),
                          ],
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "%",
                          style: TextStyle(
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 1.4
                              ..color = Colors.white38,
                          ),
                        )
                      ],
                    ),
                  ),
                  if (subtitle != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      color: Colors.white70,
                      child: Text(
                        subtitle!,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  const SizedBox(height: 16),
                  Text(
                    title.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: "YourBabyFriendlyFont",
                      fontSize: 31,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      height: 1,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Shop Baby Essentials Now  >",
                    style: TextStyle(
                      fontFamily: "YourBabyFriendlyFont",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
