import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class BuyFullKit extends StatefulWidget {
  const BuyFullKit({super.key, required this.images});

  final List<String> images;

  @override
  State<BuyFullKit> createState() => _BuyFullKitState();
}

class _BuyFullKitState extends State<BuyFullKit> {
  bool _isCopied = false;
  final Uri _url = Uri.parse(
      'https://app.gumroad.com/checkout?_gl=1*1j1owy*_ga*Nzc0MTA1NTYwLjE3MjAwMTA3MzM.*_ga_6LJN6D94N6*MTcyMDA0MjQzMC41LjEuMTcyMDA0MjQzMS4wLjAuMA..&product=uxznc&option=B3wWhE6QH46cfm31C7jEmQ%3D%3D&quantity=1&referrer=App');

  Future<void> buyLink() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_currentPage < widget.images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the primary color from the theme
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return Image.asset(
                widget.images[index],
                fit: BoxFit.cover,
              );
            },
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(defaultPadding / 2),
                  margin: const EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: primaryColor
                          .withOpacity(0.4), // Adjusted transparency
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(4, 10),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Get the full template",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: defaultPadding),
                      const Text(
                        "Thank you for using The Flutter Way shop template. You're currently using the free version. Please get the full kit to use this screen.",
                      ),
                      const SizedBox(height: defaultPadding),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                await Clipboard.setData(const ClipboardData(
                                        text:
                                            "https://app.gumroad.com/checkout?_gl=1*1j1owy*_ga*Nzc0MTA1NTYwLjE3MjAwMTA3MzM.*_ga_6LJN6D94N6*MTcyMDA0MjQzMC41LjEuMTcyMDA0MjQzMS4wLjAuMA..&product=uxznc&option=B3wWhE6QH46cfm31C7jEmQ%3D%3D&quantity=1&referrer=App"))
                                    .then((value) {
                                  setState(() {
                                    _isCopied = true;
                                  });
                                  Future.delayed(const Duration(seconds: 2),
                                      () {
                                    setState(() {
                                      _isCopied = false;
                                    });
                                  });
                                });
                              },
                              label:
                                  Text(_isCopied ? "Link Copied" : "Copy link"),
                              icon: SvgPicture.asset(
                                "assets/icons/world_map.svg",
                                colorFilter: ColorFilter.mode(
                                  primaryColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: defaultPadding),
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: buyLink,
                              label: const Text("Get full code"),
                              icon: SvgPicture.asset(
                                "assets/icons/Bag.svg",
                                colorFilter: ColorFilter.mode(
                                  primaryColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
