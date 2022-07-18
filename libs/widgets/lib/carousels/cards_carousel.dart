import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:widget_library/cards/card_details_holder.dart';

Widget buildCrayonPaymentCardsCarousel({
  required List<CrayonPaymentCardDetailsHolder> listOfCards,
  CarouselOnPageChanged? onPageChanged,
  CarouselControllerImpl? carouselController,
}) {
  return CarouselSlider(
    key: Key('CrayonPaymentCardsCarousel'),
    carouselController: carouselController,
    items: listOfCards,
    options: CarouselOptions(
      onPageChanged: (index, changed) {
        if (onPageChanged != null) {
          onPageChanged(index, changed);
        }
      },
      viewportFraction: 0.8,
      initialPage: 0,
      enableInfiniteScroll: false,
      reverse: false,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
    ),
  );
}

typedef CarouselOnPageChanged = void Function(
  int index,
  CarouselPageChangedReason reason,
);
