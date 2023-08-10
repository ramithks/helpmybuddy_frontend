import 'package:flutter/material.dart';

import '../../global_index.dart';

class CustomDropDownList extends StatefulWidget {
  /// Title that will be displayed initially. Will be overriden by the chosen element's title.
  final String title;

  /// List of all DropDownElement for this DropDown.
  final List<CustomDropDownListElement> items;

  final Color backgroundColor;

  final Color foregroundColor;

  /// Function that will be called when the user clicks on the drop down.
  final VoidCallback onClick;

  /// Function that should be called when the user selects an element from the DropDown. The chosen element is passed to this function on User's tap.
  final void Function(CustomDropDownListElement) onSelect;

  /// Function that will be called if the user dismisses the element previously chosen.
  final VoidCallback onReset;

  /// Creates a themed DropDown for your App. See all the parameters for further documentation.
  const CustomDropDownList(
      {required this.title,
      required this.items,
      required this.backgroundColor,
      required this.foregroundColor,
      required this.onClick,
      required this.onSelect,
      required this.onReset,
      Key? key})
      : super(key: key);

  @override
  _CustomDropDownListState createState() => _CustomDropDownListState();
}

class _CustomDropDownListState extends State<CustomDropDownList> {
  CustomDropDownListElement? choice;

  double height = 60;
  final double heightMin = 60;
  final double heightMax = 240;

  double borderHeight = 0;
  final double borderHeightMin = 0;
  final double borderHeightMax = 2;

  BorderRadius borderRadius = BorderRadius.circular(15);
  final BorderRadius borderRadiusMax = const BorderRadius.only(
    topLeft: Radius.circular(15),
    topRight: Radius.circular(15),
  );
  final BorderRadius borderRadiusMin = BorderRadius.circular(15);

  final Duration animationDuration = const Duration(milliseconds: 400);

  final Curve animationCurve = Curves.easeInOut;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animationDuration,
      curve: animationCurve,
      height: height,
      color: AppColors.opaqueColor,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: borderRadiusMin,
            child: AnimatedContainer(
              duration: animationDuration,
              curve: animationCurve,
              height: height,
              child: Scrollbar(
                thumbVisibility: false,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      for (int i = 0; i < widget.items.length; i++)
                        InkWell(
                          onTap: () {
                            setState(() {
                              height = heightMin;
                              borderRadius = borderRadiusMin;
                              borderHeight = borderHeightMin;
                              choice = widget.items[i];
                            });
                            widget.onSelect(widget.items[i]);
                          },
                          child: Container(
                            height: heightMin,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                              color: widget.backgroundColor,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.01,
                                ),
                                const SizedBox(width: 23),
                                Text(
                                  '${widget.items[i].name.substring(0, (widget.items[i].name.length > 32) ? 32 : null)}${(widget.items[i].name.length > 32) ? '..' : ''}',
                                  style: TextStyle(
                                    color: widget.foregroundColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    if (height == heightMin) {
                      widget.onClick();
                      height = heightMax;
                      borderRadius = borderRadiusMax;
                      borderHeight = borderHeightMax;
                    } else {
                      height = heightMin;
                      borderRadius = borderRadiusMin;
                      borderHeight = borderHeightMin;
                    }
                  });
                },
                child: Container(
                  height: heightMin,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    color: Color.alphaBlend(
                        widget.backgroundColor, AppColors.secondaryBg),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                      const SizedBox(width: 23),
                      Text(
                        ((choice == null)
                            ? ('${widget.title.substring(0, (widget.title.length > 25) ? 25 : null)}${(widget.title.length > 10) ? '..' : ''}')
                            : ('${choice!.name.substring(0, (choice!.name.length > 25) ? 25 : null)}${(choice!.name.length > 10) ? '..' : ''}')),
                        style: TextStyle(
                          color: widget.foregroundColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      (choice == null)
                          ? Padding(
                              padding: const EdgeInsets.fromLTRB(0, 17, 0, 17),
                              child: SvgIcon(
                                IconsAssets.downArrow,
                                color: widget.foregroundColor.withOpacity(0.9),
                              ),
                            )
                          : FittedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Material(
                                    color: AppColors.opaqueColor,
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.restart_alt,
                                        color: AppColors.orangeLight,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          choice = null;
                                        });
                                        widget.onReset();
                                        widget.onClick();
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      (choice == null)
                          ? const SizedBox(width: 15)
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                duration: animationDuration,
                curve: animationCurve,
                height: borderHeight,
                color: widget.foregroundColor.withOpacity(0.1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomDropDownListElement {
  String name;

  CustomDropDownListElement({
    required this.name,
  });
}
