import '../../../global_index.dart';

class OnbordingContent {
  String image;
  String title;
  String discription;

  OnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<OnbordingContent> contents = [
  OnbordingContent(
      title: 'Helpmybuddy: Friends Helping Friends',
      image: IconsAssets.onboardingScreenIll1,
      discription:
          "Find trustworthy buddy to help with daily tasks. Our screened helpers are ready to lend a hand. It's like having a reliable friend without the mess."),
  OnbordingContent(
      title: 'Book a helper buddy in minutes',
      image: IconsAssets.onboardingScreenIll2,
      discription:
          "Book a helper in minutes. Your helper arrives on time, ready to work. Relax while your chores get done."),
  OnbordingContent(
      title: 'Book a task and get help today',
      image: IconsAssets.onboardingScreenIll3,
      discription:
          "After finding a helper, you can quickly book a task and receive confirmation. Your helper will then contact you to arrange a meeting time."),
];
