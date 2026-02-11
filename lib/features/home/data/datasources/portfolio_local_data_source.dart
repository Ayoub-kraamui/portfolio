import '../../data/models/project_model.dart';
import '../../data/models/skill_models.dart';
import '../../data/models/experience_models.dart';
import '../../../../core/constants/image_app.dart';

// استيراد الثوابت لأغراض التوافق فقط إلى حين إعادة هيكلة الكود بالكامل،
// ولكننا سننقل البيانات إلى هنا.

abstract class PortfolioLocalDataSource {
  Future<List<ExperienceModels>> getExperiences();
  Future<List<SkillModels>> getSkills();
  Future<List<ProjectModel>> getProjects();
}

class PortfolioLocalDataSourceImpl implements PortfolioLocalDataSource {
  @override
  Future<List<ExperienceModels>> getExperiences() async {
    // محاكاة تأخير طفيف محليًا عند الحاجة
    // await Future.delayed(const Duration(milliseconds: 300));
    return const [
      ExperienceModels(
        company: 'evorie-ksa.com',
        role: 'Digital Marketing',
        duration: '2025 - Present',
        location: 'Riyadh, Saudi',
        description:
            'Store and promotion management, customer service, and enhancing customer experience. Managing digital ad campaigns (Google, Meta, TikTok). SEO improvements.',
      ),
      ExperienceModels(
        company: 'Freelancer',
        role: 'Flutter Developer',
        duration: '2024 - Present',
        location: 'Ibb, YEM',
        description:
            'Member of a team of programmers and designers. Application development with clean architecture. Developing open source software as per customer request.',
      ),
    ];
  }

  @override
  Future<List<SkillModels>> getSkills() async {
    return const [
      // Information Technology
      SkillModels(name: 'Dart', category: 'Information Technology'),
      SkillModels(name: 'C++', category: 'Information Technology'),
      SkillModels(name: 'C#', category: 'Information Technology'),
      SkillModels(name: 'PHP', category: 'Information Technology'),
      SkillModels(name: 'Python', category: 'Information Technology'),
      SkillModels(name: 'Java', category: 'Information Technology'),
      SkillModels(name: 'html', category: 'Information Technology'),
      SkillModels(name: 'Css', category: 'Information Technology'),
      SkillModels(name: 'SQL', category: 'Information Technology'),
      SkillModels(name: 'PostgreSQL', category: 'Information Technology'),
      SkillModels(name: 'XMl view', category: 'Information Technology'),
      SkillModels(name: 'Firebase', category: 'Information Technology'),
      SkillModels(name: 'Windows Server', category: 'Information Technology'),
      SkillModels(name: 'Git', category: 'Information Technology'),
      SkillModels(name: 'GitHub', category: 'Information Technology'),
      SkillModels(name: 'VS Code', category: 'Information Technology'),
      SkillModels(name: 'Photoshop', category: 'Information Technology'),
      SkillModels(name: 'Illustrator', category: 'Information Technology'),
      SkillModels(name: 'Figma', category: 'Information Technology'),
      SkillModels(name: 'Adobe XD', category: 'Information Technology'),

      // State Management
      SkillModels(name: 'Bloc', category: 'State Management'),
      SkillModels(name: 'Cubit', category: 'State Management'),
      SkillModels(name: 'Provider', category: 'State Management'),
      SkillModels(name: 'GetX', category: 'State Management'),

      // Clean Architecture
      SkillModels(name: 'MVVM', category: 'Clean Architecture'),
      SkillModels(name: 'MVC', category: 'Clean Architecture'),
      SkillModels(name: 'SOLID Principles', category: 'Clean Architecture'),
      SkillModels(name: 'Dependency Injection', category: 'Clean Architecture'),

      // Agentic AI
      SkillModels(name: 'Cursor', category: 'Agentic Ai'),
      SkillModels(name: 'Google Antigravity', category: 'Agentic Ai'),
      SkillModels(name: 'Gloud', category: 'Agentic Ai'),
      SkillModels(name: 'ChatGPT', category: 'Agentic Ai'),
      SkillModels(name: 'Prompt Engineering', category: 'Agentic Ai'),

      // Digital Marketing
      SkillModels(name: 'SEO', category: 'Digital Marketing'),
      SkillModels(name: 'Google Ads', category: 'Digital Marketing'),
      SkillModels(name: 'Meta Ads', category: 'Digital Marketing'),
      SkillModels(name: 'TikTok Ads', category: 'Digital Marketing'),
      SkillModels(name: 'Google Search Console', category: 'Digital Marketing'),
      SkillModels(name: 'Tag Manager', category: 'Digital Marketing'),
      SkillModels(name: 'Google Analytics', category: 'Digital Marketing'),

      // Project Management
      SkillModels(name: 'Waterfall', category: 'Project Management'),
      SkillModels(name: 'Agile', category: 'Project Management'),
      SkillModels(name: 'Clarity', category: 'Project Management'),
      SkillModels(name: 'Diary Management', category: 'Project Management'),
      SkillModels(name: 'Budgeting', category: 'Project Management'),
      SkillModels(name: 'CRM', category: 'Project Management'),
      SkillModels(
        name: 'Scheduling Communication',
        category: 'Project Management',
      ),
      SkillModels(name: 'Risk Management', category: 'Project Management'),
      SkillModels(name: 'Leadership', category: 'Project Management'),
      SkillModels(name: 'Clarity', category: 'Project Management'),
      SkillModels(name: 'Feasibility Study', category: 'Project Management'),
      SkillModels(name: 'Supervision', category: 'Project Management'),
      SkillModels(name: 'Planning', category: 'Project Management'),
      SkillModels(name: 'Analysis', category: 'Project Management'),
      SkillModels(name: 'Follow Up', category: 'Project Management'),
      SkillModels(name: 'Agenda', category: 'Project Management'),
      SkillModels(name: 'Reporting', category: 'Project Management'),
    ];
  }

  @override
  Future<List<ProjectModel>> getProjects() async {
    return const [
      ProjectModel(
        title: 'Intelligent Measurements Extraction System',
        description:
            'Graduation project Private project, not open source. Collaborate with the research team to develop an application for clothing stores to browse products and extract body measurements from a two-dimensional image using a phone and from anywhere. Front-end is developed by Fluter and back-end is developed by Firebase. rtificial intellgence models have been developed to extract bodymeasurements and link them to the application.',
        imagePath: ImageApp.intelligentMeasurementsExtractionSystem,
        technologies: [],
        link:
            'https://github.com/Ayoub-kraamui/intelligent_measurements_extraction_system',
      ),
      ProjectModel(
        title: 'Yemeni Universities Application',
        description:
            'Front-end is developed by Flutter and back-end is developed by Firebase. Trial version but it did not give the desired results. Front-end is developed by Flutter and back-end is developed by Firebase. Am still developing the application in an advanced way and it will be launched according to the plan at the beginning of the new school year.',
        imagePath: ImageApp.yemeniUniversities,
        technologies: [],
        link: 'https://github.com/Ayoub-kraamui/universitys_yemen',
      ),
      ProjectModel(
        title: 'Inventory Management System',
        description:
            'Inventory Management System in windows-flutter - MVC - GetX-Sqflite. The system allows adding, modifying and deleting products - adding new sales - adding new purchases - managing inventory - brief reports - filtering sales or purchases on a daily, weekly or monthly basis.',
        imagePath: ImageApp.inventoryManagementSystem,
        technologies: [],
        link: 'https://github.com/Ayoub-kraamui/inventory_management_system',
      ),
      ProjectModel(
        title: 'E-Commerce Applications',
        description:
            'It consists of three applications. A users application, a admin application, and a delivery worker application. Front-end is developed by Flutter and back-end is developed by PHP. Google Maps, Order Tracking.r It features very easy and distinctive user interfaces.',
        imagePath: ImageApp.eCommerceApplication,
        technologies: [],
        link: 'https://github.com/Ayoub-kraamui/app_ecommerce',
      ),
      ProjectModel(
        title: 'Coffee App',
        description:
            'Coffee app enjoy an easy and attractive user interface. MVC Architecture - State Management GetX - Google Map- Tracking',
        imagePath: ImageApp.coffeeApp,
        technologies: [],
        link: 'https://github.com/Ayoub-kraamui/coffee-app',
      ),
      ProjectModel(
        title: 'Qayd',
        description:
            'Modular Flutter app (Android/iOS) for financial workflows with authentication, dashboard, settings, and transaction management. Uses Bloc for state management and Sqflite for local storage with platform plugin support.',
        imagePath: ImageApp.qaydApp,
        technologies: [],
        link: 'https://github.com/Ayoub-kraamui/qayd',
      ),
      ProjectModel(
        title: 'Note App',
        description:
            'learn GetX - sqflite - Architecture MVC -It allows users to create and manage their notes in an organized and simple way, with an attractive and attractive user interface.',
        imagePath: ImageApp.noteApp,
        technologies: [],
        link: 'https://github.com/Ayoub-kraamui/note_app',
      ),
    ];
  }
}
