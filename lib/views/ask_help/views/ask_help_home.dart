import 'package:flutter/material.dart';

import '../../../global_index.dart';

class AskHelpPage extends StatefulWidget {
  const AskHelpPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AskHelpPage> createState() => _AskHelpPageState();
}

class _AskHelpPageState extends State<AskHelpPage> {
  bool _isPolicyAccepted = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.thirdBg,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.only(
          top: 15.0,
          bottom: 15.0,
          left: 30.0,
          right: 30.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomBackbutton(
              title: 'Ask Help',
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: 20),
            CustomDropDownList(
              title: 'Select an option', // Initial title
              items: [
                CustomDropDownListElement(
                    name: 'Write hand writeen assignment'),
                CustomDropDownListElement(name: 'Cook Me AI Masala.'),
                CustomDropDownListElement(name: 'Create me a new logo'),
                // Add more options as needed
              ],
              backgroundColor: AppColors.secondaryBg, // Background color
              foregroundColor: AppColors.white50Opacity, // Foreground color
              onClick: () {
                // print('Dropdown clicked');
              },
              onSelect: (selectedElement) {
                // print('Selected: ${selectedElement.name}');
              },
              onReset: () {
                //  print('Reset option');
              },
            ),
            const SizedBox(height: 20),
            const CustomInfo(
              titleText: 'Write hand written assignment',
              subTitleText:
                  'Help me to write a hand written assignment on A4 paper  .Torto vel fames est posuere. Et suspendisse sem dui faucius.Pellentesque varius sit amet nunc. Quam gravida vitae sit ornare suscipit. In morbi scelerisque ultrices suspendisse cursus quis turpis amet ut. Volutpat sem lobortis diam phasellus sollicitudin amet. Enim malesuada bibendum vestibulum in mi mattis volutpat etiam. Accumsan diam felis fermentum nisi cras aliquet viverra. Posuere lacus massa porta tincidunt tincidunt et dictum. Nunc nisi bibendum elit ut. Enim sit proin odio condimentum. Ullamcorper enim egestas sit cursus eget. Pulvinar tortor non lorem et in auctor egestas. Facilisi aliquet elit aliquet in viverra enim elementum augue enim. Sapien egestas quis scelerisque adipiscing elementum tincidunt est orci.\n\nAc lobortis risus gravida vulputate et tristique morbi blandit morbi. Vulputate amet id metus magna. Ultricies maecenas morbi mattis eget varius nibh morbi montes scelerisque. Egestas massa sed quis ut lacus dui leo. Aliquam non purus ullamcorper lectus libero amet interdum velit. Maecenas phasellus lobortis ullamcorper eget integer.',
            ),
            const SizedBox(height: 30),
            const CustomTextField(
              hint: "Add Comment/Note",
              contentPadding: EdgeInsets.all(20),
              maxLine: 1, // Set the maximum number of lines to 3
              style: TextStyle(color: Colors.white), // Set text color to white
              backgroundColor: AppColors.secondaryBg, // Set background color
              hintStyle: TextStyle(
                  color: Colors.white), // Set hint text color to white
            ),
            const SizedBox(height: 20),
            CustomButton(
              radius: 10,
              verticalPadding: 12,
              horizontalPadding: 12,
              backgroundColor: AppColors.secondaryBg,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgIcon(
                        IconsAssets.mapIcon,
                        height: 13,
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        "volk street,Bengaluru",
                        style: TextStyle(
                            color: AppColors.green,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Text(
                    "Pick/change",
                    style: TextStyle(
                      color: AppColors.white50Opacity,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            CustomTextField(
              contentPadding: const EdgeInsets.all(20),
              maxLine: 3, // Set the maximum number of lines to 3
              style: const TextStyle(
                  color: Colors.white), // Set text color to white
              backgroundColor: AppColors.secondaryBg, // Set background color
              hintStyle: const TextStyle(
                  color: Colors.white), // Set hint text color to white
              textController: TextEditingController(
                  text:
                      '8963, Spencer Springs, 885 Lucas Highway\nBengaluru, Karnataka, India - 560085'),
            ),
            const SizedBox(height: 20),
            const CustomInfo(
              titleTextSize: 18,
              subTitleTextSize: 10,
              titleText: 'You have to Pay : ₹299',
              subTitleText:
                  "You have to pay this in advance. The amount will be safely added to their earnings once they marked the task  as “Done”.",
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Checkbox(
                  checkColor: AppColors.white,
                  value: _isPolicyAccepted,
                  onChanged: (value) {
                    setState(() {
                      _isPolicyAccepted = value!;
                    });
                  },
                ),
                Text(
                  'I accept the Privacy Policy',
                  style: TextStyle(
                    color: AppColors.white50Opacity,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomButton(
                    radius: 15,
                    verticalPadding: 15,
                    horizontalPadding: 15,
                    child: const Text(
                      textAlign: TextAlign.center,
                      "Confirm Asking Help",
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
