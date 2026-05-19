import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key, required this.images});

  final List<dynamic> images;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: PageView.builder(
            controller: controller,
            itemCount: widget.images.length,
            itemBuilder: (_, index) {
              return ClipRRect(
                child: Image.network(
                  widget.images[index].url,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 10),

        SmoothPageIndicator(
          controller: controller,
          count: widget.images.length,
          effect: const WormEffect(dotHeight: 8, dotWidth: 8, spacing: 8),
        ),
      ],
    );
  }
}
