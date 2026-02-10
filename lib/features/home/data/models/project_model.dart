class ProjectModel {
  final String title;
  final String description;
  final String imagePath;
  final List<String> technologies;
  final String? link;
  final String?
  githubUrl; // تمت إضافتها لمطابقة استخدام الثوابت عند الحاجة، أو يمكن تركها كما هي إذا كانت متوافقة.

  const ProjectModel({
    required this.title,
    required this.description,
    required this.imagePath,
    this.technologies =
        const [], // قائمة فارغة افتراضية لتتوافق مع الاستخدام في الثوابت إذا كانت مفقودة هناك
    this.link,
    this.githubUrl,
  });
}
