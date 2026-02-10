class SkillModels {
  final String name;
  final double proficiency; // من 0.0 إلى 1.0 (استخدام اختياري)
  final String? category; //على سبيل المثال، "اللغة"، "الأداة"

  const SkillModels({
    required this.name,
    this.proficiency = 1.0,
    this.category,
  });
}
