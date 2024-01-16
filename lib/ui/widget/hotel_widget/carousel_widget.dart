import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  final List<String> imageList;
  const CarouselWidget(this.imageList, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWidget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final imageList = widget.imageList;
    final List<Widget> imageSliders = [];
    final List<Widget> entryWidgetList = [];

    for (var item in imageList) {
      final indexOf = imageList.indexOf(item);
      final widget = ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        child: Image.network(
          item,
          fit: BoxFit.cover,
          errorBuilder: (context, exception, stackTrace) {
            return const Center(child: Text('Error when upload image'));
          },
        ),
      );

      final entry = GestureDetector(
        onTap: () => _controller.animateToPage(indexOf),
        child: Container(
          width: 7.0,
          height: 7.0,
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black)
                  .withOpacity(_current == indexOf ? 0.9 : 0.4)),
        ),
      );
      entryWidgetList.add(entry);
      imageSliders.add(widget);
    }

    return Stack(
      children: [
        SizedBox(
          width: 343,
          height: 257,
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 343 / 257,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: entryWidgetList,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
