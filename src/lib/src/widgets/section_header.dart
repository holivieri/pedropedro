import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../utils/font.dart';
import '../utils/text_style.dart';

class SectionHeader extends StatefulWidget {
  const SectionHeader({
    required this.title,
    this.isFirst = false,
    this.seeAll = false,
    super.key,
  });

  final bool isFirst;
  final bool seeAll;
  final String title;

  @override
  State<SectionHeader> createState() => _SectionHeaderState();
}

class _SectionHeaderState extends State<SectionHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: widget.isFirst ? 0 : 19,
      ),
      Row(
        children: [
          Text(
            widget.title,
            style: homeTitleTextStyle,
          ),
          const SizedBox(
            width: 8,
          ),
          InkWell(
            onTap: () {},
            child: widget.seeAll
                ? Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.seeAll,
                        style: seeAllTextStyle,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: fontColorBlue,
                        size: 15,
                      )
                    ],
                  )
                : Container(),
          )
        ],
      ),
      const SizedBox(
        height: 19,
      )
    ]);
  }
}
