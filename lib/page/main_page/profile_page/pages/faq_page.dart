import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flutter/material.dart';

import '../../../../model/widget_model/faq_model.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("FAQs"),),
      body:  SingleChildScrollView(
          padding:
          EdgeInsets.only(top: 8, left: 18, right: 18, bottom: 18),
          child: ExpansionTileGroup(
              toggleType: ToggleType.expandOnlyCurrent,
              children: [
                ...faqList
                    .map((faq) => ExpansionTileItem(

                  title: Text(
                    faq.question,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  tilePadding: EdgeInsets.zero,
                  childrenPadding: EdgeInsets.zero,
                   expendedBorderColor:
                  Colors.black.withOpacity(.2),
                  children: [
                    Text(
                      faq.answer,
                      style: TextStyle(
                          color: Colors.black.withOpacity(
                            .8,
                          ),
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 22,
                    )
                  ],
                ))
                    .toList(),
              ])),
    );

  }
}

