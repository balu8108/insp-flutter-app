import 'package:inspflutterfrontend/widget/card/model/insp_card_model.dart';

import '../../apiservices/models/mycourses/all_subjects_response_model.dart';

const myCoursesDescriptions = [
  "Prepare for the Olympiad journey with our Foundation Course, meticulously designed to ignite curiosity and foster problem-solving skills. Dive into advanced topics and lay a strong foundation for competitive examinations.",
  "Prepare for the Olympiad journey with our Foundation Course, meticulously designed to ignite curiosity and foster problem-solving skills. Dive into advanced topics and lay a strong foundation for competitive examinations.",
  "Explore the advanced topics of Class 12th curriculum, delving deeper into the realms of physics, chemistry, and mathematics. Engage with complex concepts, tackle challenging problems, and prepare yourself for academic excellence.",
  "Dive into the core concepts of Class 11th curriculum, designed to provide a solid foundation in physics, chemistry, and mathematics. Explore fundamental principles, solve intriguing problems, and embark on a journey of discovery.",
  "Embark on a transformative learning journey with our Insp_Champ_Crash Course. Designed for those seeking an accelerated and focused learning experience, this crash course is your gateway to mastering key concepts in a short span of time.",
  "Explore the world of chemical reactions, elements, and compounds in this foundational science subject. Learn about the periodic table, bonding, and the fascinating properties of matter.",
  "Delve into the world of numbers, equations, and mathematical concepts. From algebra to calculus, discover the fundamental principles that underlie a wide range of scientific and practical applications.",
  "Physics is the study of the fundamental principles that govern the behavior of the physical universe. It encompasses a wide range of topics, including classical mechanics, electromagnetism, thermodynamics, and quantum mechanics.",
];

const subjectStatus = [
  "In Progress",
  "In Progress",
  "In Progress",
  "In Progress",
  "In Progress",
  "Upcoming",
  "Upcoming",
  "In Progress",
];

const myCoursePhysicsDescriptions = [
  "This chapter covers the basics of electromagnetism, including its principles and applications. Gain insights into the behavior of electric and magnetic fields.",
  "Learn about geometrical and wave optics in this chapter. Explore the fascinating world of light propagation and wave phenomena.",
  "Explore the fundamental principles of heat transfer and thermodynamics. Dive into the study of energy transfer and the laws governing thermal processes.",
  "Get a deep understanding of mechanics in this chapter. Study the motion, forces, and interactions of objects in the physical world.",
  "Discover modern physics in this comprehensive chapter. Uncover the latest advancements and theories shaping our understanding of the physical universe.",
];

const myAdditionalCourses = [
  AllSubjectsResponseModelResult('4', 'INSP Champ Crash Course'),
  AllSubjectsResponseModelResult('7', 'INSP Foundation Olympiad'),
  AllSubjectsResponseModelResult('5', 'Class 11th'),
  AllSubjectsResponseModelResult('6', 'Class 12th'),
  AllSubjectsResponseModelResult('8', 'INPHO / Olympiads')
];

const myCoursesData = [
  INSPCardModel(
    '4',
    'Insp champ crash course',
    'In Progress',
    "Embark on a transformative learning journey with our Insp_Champ_Crash Course. Designed for those seeking an accelerated and focused learning experience, this crash course is your gateway to mastering key concepts in a short span of time.",
  ),
  INSPCardModel('5', 'Insp foundation olympiad', 'In Progress',
      "Prepare for the Olympiad journey with our Foundation Course, meticulously designed to ignite curiosity and foster problem-solving skills. Dive into advanced topics and lay a strong foundation for competitive examinations."),
  INSPCardModel('6', 'Inpho / olympiads', 'In Progress',
      "Unlock your Olympiad potential with our curated solo video series, tailored for INPHO and other prestigious competitions. Dive deep into physics concepts, problem-solving, and exam strategies to propel your journey towards excellence. Embark on a path of mastery and prepare to shine on the international stage."),
  INSPCardModel(
    '7',
    'Class 11th',
    'In Progress',
    "Dive into the core concepts of Class 11th curriculum, designed to provide a solid foundation in physics, chemistry, and mathematics. Explore fundamental principles, solve intriguing problems, and embark on a journey of discovery.",
  ),
  INSPCardModel(
    '8',
    'Class 12th',
    'In Progress',
    "Explore the advanced topics of Class 12th curriculum, delving deeper into the realms of physics, chemistry, and mathematics. Engage with complex concepts, tackle challenging problems, and prepare yourself for academic excellence.",
  ),
  INSPCardModel('1', 'Physics', 'In Progress',
      'Explore the fascinating world of Physics with a collection of resources covering classical mechanics, electromagnetism, thermodynamics, and quantum mechanics. Dive into the fundamental principles that govern the physical universe.'),
  INSPCardModel('2', 'Mathematics', 'Upcoming',
      'Discover the power of Mathematics with a variety of topics that range from algebra to calculus. Explore the world of numbers, equations, and mathematical concepts that underlie a wide range of scientific and practical applications.'),
  INSPCardModel('3', 'Chemistry', 'Upcoming',
      'Delve into the realm of Chemistry, where you can learn about chemical reactions, the periodic table, bonding, and the intriguing properties of matter. Discover the secrets of the elements and compounds that make up our world'),
];

const assignmentCoursesData = [
  INSPCardModel('1', 'Physics', 'In Progress',
      'Explore the fascinating world of Physics with a collection of resources covering classical mechanics, electromagnetism, thermodynamics, and quantum mechanics. Dive into the fundamental principles that govern the physical universe.'),
  INSPCardModel('2', 'Mathematics', 'Upcoming',
      'Discover the power of Mathematics with a variety of topics that range from algebra to calculus. Explore the world of numbers, equations, and mathematical concepts that underlie a wide range of scientific and practical applications.'),
  INSPCardModel('3', 'Chemistry', 'Upcoming',
      'Delve into the realm of Chemistry, where you can learn about chemical reactions, the periodic table, bonding, and the intriguing properties of matter. Discover the secrets of the elements and compounds that make up our world'),
];
