import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';
import 'package:modern_ecommerce/static/backbutton_widget.dart';

class FullScreenView extends StatefulWidget {
  final List<dynamic> imagesList;
  const FullScreenView({Key? key, required this.imagesList}) : super(key: key);

  @override
  State<FullScreenView> createState() => _FullScreenViewState();
}

class _FullScreenViewState extends State<FullScreenView> {
  final CarouselController _controller = CarouselController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        leading: const BackButtonWidget(),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              '${_currentPage + 1}/${widget.imagesList.length}',
              style: const TextStyle(
                fontSize: 20,
                letterSpacing: 5,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.5,
            child: PageView(
              children: List.generate(
                widget.imagesList.length,
                (index) => CarouselSlider(
                  carouselController: _controller,
                  options: CarouselOptions(
                    height: 400.0,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    initialPage: 1,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                  ),
                  items: List.generate(
                    widget.imagesList.length,
                    (index) => InteractiveViewer(
                      child: Container(
                        width: size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(color: white),
                        child: Image.network(
                          widget.imagesList[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.imagesList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(index);
                  },
                  child: Container(
                    width: 120,
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2.0,
                        color: primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        widget.imagesList[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
