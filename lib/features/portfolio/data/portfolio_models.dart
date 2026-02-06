class Experience {
  final String company;
  final String role;
  final String duration;
  final String location;
  final String description;

  const Experience({
    required this.company,
    required this.role,
    required this.duration,
    required this.location,
    required this.description,
  });
}

class Skill {
  final String name;
  final double proficiency; // 0.0 to 1.0 (Optional usage)
  final String? category; // e.g., "Language", "Tool"

  const Skill({required this.name, this.proficiency = 1.0, this.category});
}

class ProjectModel {
  final String title;
  final String description;
  final String imagePath;
  final List<String> technologies;
  final String? link;
  final String?
  githubUrl; // Added to match constants usage if needed, or just keep as is if compatible

  const ProjectModel({
    required this.title,
    required this.description,
    required this.imagePath,
    this.technologies =
        const [], // Default empty list to match usage in constants if it's missing there
    this.link,
    this.githubUrl,
  });
}
