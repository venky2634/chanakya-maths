class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'WelCome to Chanakya Learning Platform',
      image: 'Assets/onbording/Group 661.png',
      discription:
          "Learning technologies to personalize the learning path for each student,to understand their strengths and weaknesses in mathematics."),
  UnbordingContent(
      title: 'Real-time Interaction',
      image: 'Assets/onbording/Frame.png',
      discription:
          "Enabling real-time collaboration between studentsand teachers, that allowing to interactive discussions, pee r-to-peer learning, and group activitie"),
  UnbordingContent(
      title: 'Enhanced Communication',
      image: 'Assets/onbording/Frame2.png',
      discription:
          "Better communication Improves the relationships between students, educators, and parents, fostering acollaborative learning community."),
];
