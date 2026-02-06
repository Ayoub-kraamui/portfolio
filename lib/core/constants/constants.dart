import 'package:portfolio/core/constants/image_app.dart';
import 'package:portfolio/features/portfolio/data/portfolio_models.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

Future<void> launchUrl(String url) async {
  final uri = Uri.parse(url);
  if (await launcher.canLaunchUrl(uri)) {
    await launcher.launchUrl(uri);
  }
}

Future<void> openCv() async {
  final uri = Uri.parse('assets/cv/ayoub_karami.pdf');
  await launcher.launchUrl(uri, mode: launcher.LaunchMode.externalApplication);
}

const String githubUrl = 'https://github.com/Ayoub-kraamui';

const String linkedinUrl = 'https://linkedin.com/in/ayoub-karami-43807b314';

const projects = [
  ProjectModel(
    title: 'Intelligent Measurements Extraction System',
    description:
        '- Graduation project Private project, not open source. \n Collaborate with the research team to develop an application for clothing stores to browse products and extract body measurements from a two-dimensional image using a phone and from anywhere. \n - Front-end is developed by Fluter and back-end is developed by Firebase. \n - rtificial intellgence models have been developed to extract bodymeasurements and link them to the application.',
    imagePath: ImageApp.intelligentMeasurementsExtractionSystem,
    // link: intelligentMeasurementsExtractionSystemUrl,  <-- removed or commented out if not available
    technologies: [],
  ),
  ProjectModel(
    title: 'Yemeni Universities Application',
    description:
        '- Graduation project Private project, not open source. \n Collaborate with the research team to develop an application for clothing stores to browse products and extract body measurements from a two-dimensional image using a phone and from anywhere. \n - Front-end is developed by Fluter and back-end is developed by Firebase. \n - rtificial intellgence models have been developed to extract bodymeasurements and link them to the application.',
    imagePath: ImageApp.inventoryManagementSystem,
    // link: universitysYemenUrl,
    technologies: [],
  ),
  ProjectModel(
    title: 'Inventory Management System',
    description:
        'Inventory_management_system in windows-flutter - MVC - GetX-Sqflite. The system allows adding, modifying and deleting products - adding new sales - adding new purchases - managing inventory - brief reports - filtering sales or purchases on a daily, weekly or monthly basis.',
    imagePath: ImageApp.inventoryManagementSystem,
    // link: inventoryManagementSystemUrl,
    technologies: [],
  ),
  ProjectModel(
    title: 'Coffee App',
    description:
        'Coffee app enjoy an easy and attractive user interface. MVC Architecture - State Management GetX - Google Map- Tracking',
    imagePath: ImageApp.coffeeApp,
    // link: coffeeAppUrl,
    technologies: [],
  ),
  ProjectModel(
    title: 'Qayd',
    description:
        'Modular Flutter app (Android/iOS) for financial workflows with authentication, dashboard, settings, and transaction management. Uses Bloc for state management and Sqflite for local storage with platform plugin support..',
    imagePath: ImageApp.coffeeApp,
    // link: qaydUrl,
    technologies: [],
  ),
];
