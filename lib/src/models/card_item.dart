import 'package:appmovil_epmpolitecnico/src/models/RelatedTopic.dart';
import 'package:flutter/material.dart';

class CardItem {
  final String title;
  final String description;
  final String imagePath;
  final List<RelatedTopic> relatedTopics;

  CardItem({required this.title, required this.description, required this.imagePath, required this.relatedTopics});
}

List<CardItem> cardItems = [

  CardItem(
    title: 'Dietas Saludables',
    description: 'Esta sección incluye recomendaciones sobre el consumo de frutas, verduras y otros alimentos nutritivos, ayudándote a planificar tus comidas de manera efectiva.',
    imagePath: 'assets/images/dietas.png',
    relatedTopics: [
      RelatedTopic(
        title: 'Frutas y Verduras',
        icon: Icons.local_florist,
        shortDescription: 'Las frutas y verduras son esenciales para una dieta equilibrada.',
        longDescription: 'Las frutas y verduras son esenciales para una dieta equilibrada. Contienen una amplia variedad de vitaminas, minerales y fibra que son cruciales para mantener la salud general y prevenir enfermedades. Consumir una variedad de frutas y verduras de diferentes colores puede asegurar que obtengas una gama completa de nutrientes necesarios para tu cuerpo.',
        exercise: 'Intenta añadir una porción extra de frutas y verduras en cada comida. Por ejemplo, agrega una ensalada de espinacas y fresas a tu almuerzo. Para la ensalada: mezcla 2 tazas de espinacas frescas, 1/2 taza de fresas en rodajas, 1/4 taza de nueces, y adereza con una vinagreta ligera de aceite de oliva y vinagre balsámico.',
      ),
      RelatedTopic(
        title: 'Alimentos Nutritivos',
        icon: Icons.fastfood,
        shortDescription: 'Incluir alimentos ricos en nutrientes mejora la salud general.',
        longDescription: 'Incluir alimentos ricos en nutrientes, como granos enteros, proteínas magras y grasas saludables, es esencial para mantener una buena salud. Los granos enteros proporcionan energía duradera, las proteínas magras ayudan a construir y reparar tejidos, y las grasas saludables son vitales para la función cerebral y la absorción de vitaminas.',
        exercise: 'Cambia el pan blanco por pan integral y añade aguacate como grasa saludable en tu desayuno. Para un desayuno nutritivo: tuesta dos rebanadas de pan integral, machaca medio aguacate y úntalo sobre el pan, luego añade un huevo escalfado encima y espolvorea con sal y pimienta al gusto.',
      ),
      RelatedTopic(
        title: 'Hidratación',
        icon: Icons.local_drink,
        shortDescription: 'Beber suficiente agua es vital para mantener el cuerpo hidratado.',
        longDescription: 'Beber suficiente agua diariamente es vital para mantener el cuerpo hidratado y en funcionamiento óptimo. La hidratación adecuada ayuda a regular la temperatura corporal, mantener la función renal, y facilitar la digestión. Además, puede mejorar la concentración y el rendimiento físico.',
        exercise: 'Lleva una botella de agua contigo durante el día y trata de beber al menos 8 vasos de agua. Un consejo útil: establece recordatorios en tu teléfono para beber agua cada hora, y asegúrate de que tu botella de agua tenga marcas de medición para llevar un seguimiento de tu ingesta diaria.',
      ),
    ],
  ),

  CardItem(
    title: 'Mantente en Forma',
    description: 'Aquí encontrarás recursos y consejos para diferentes tipos de actividades, como entrenamiento con pesas, estiramiento y activación física.',
    imagePath: 'assets/images/ejercicio.png',
    relatedTopics: [
      RelatedTopic(
        title: 'Entrenamiento con Pesas',
        icon: Icons.fitness_center,
        shortDescription: 'El entrenamiento con pesas ayuda a aumentar la masa muscular y mejorar la fuerza.',
        longDescription: 'El entrenamiento con pesas es una forma eficaz de aumentar la masa muscular, mejorar la fuerza y acelerar el metabolismo. Levantar pesas regularmente puede mejorar la densidad ósea, reducir el riesgo de lesiones y aumentar la capacidad funcional. Es importante mantener una técnica adecuada para evitar lesiones.',
        exercise: 'Realiza una rutina de levantamiento de pesas tres veces por semana, enfocándote en todos los grupos musculares principales. Ejemplo de rutina: \n1. Sentadillas: 3 series de 12 repeticiones. \n2. Press de banca: 3 series de 10 repeticiones. \n3. Remo con mancuernas: 3 series de 12 repeticiones. \n4. Peso muerto: 3 series de 10 repeticiones. \n5. Press de hombros: 3 series de 12 repeticiones. Asegúrate de calentar antes de comenzar y estirar al finalizar.',
        audioPath: ['assets/audio/freccero.mp3', 'assets/audio/sportelectrobeat.mp3']
      ),
      RelatedTopic(
        title: 'Estiramiento',
        icon: Icons.accessibility_new,
        shortDescription: 'El estiramiento regular mejora la flexibilidad y reduce el riesgo de lesiones.',
        longDescription: 'El estiramiento regular es crucial para mantener y mejorar la flexibilidad, lo que puede reducir el riesgo de lesiones y mejorar el rendimiento en actividades físicas. Además, estirarse puede ayudar a aliviar el estrés y la tensión muscular, mejorar la postura y aumentar la circulación sanguínea.',
        exercise: 'Dedica 10 minutos al final de cada sesión de ejercicio para estiramientos completos del cuerpo, manteniendo cada estiramiento durante 30 segundos. Ejemplo de estiramiento: \n1. Estiramiento de cuádriceps: Mantén el pie derecho con la mano derecha y tira suavemente hacia los glúteos. \n2. Estiramiento de isquiotibiales: Siéntate en el suelo con una pierna extendida y la otra doblada, alcanza los dedos de los pies de la pierna extendida. \n3. Estiramiento del torso: Estira los brazos hacia arriba y luego inclínate hacia un lado, mantén la posición y luego cambia al otro lado.',
      ),
      RelatedTopic(
        title: 'Cardio',
        icon: Icons.directions_run,
        shortDescription: 'Los ejercicios cardiovasculares son esenciales para la salud del corazón.',
        longDescription: 'Los ejercicios cardiovasculares, como correr, nadar o andar en bicicleta, son esenciales para la salud del corazón y la quema de calorías. El cardio regular puede ayudar a mejorar la resistencia, aumentar la capacidad pulmonar, reducir la presión arterial y mejorar el estado de ánimo al liberar endorfinas.',
        exercise: 'Intenta realizar 30 minutos de cardio al menos 5 veces por semana. Esto puede incluir correr, nadar o andar en bicicleta. Plan de cardio: \n1. Lunes: 30 minutos de carrera moderada. \n2. Miércoles: 30 minutos de natación. \n3. Viernes: 30 minutos de ciclismo. Asegúrate de mantener un ritmo que te permita hablar pero no cantar, esto indica una intensidad moderada.',
      ),
    ],
  ),

  CardItem(
    title: 'Consejos de Salud',
    description: 'Encuentra valiosos consejos de salud y bienestar en esta sección.',
    imagePath: 'assets/images/salud.png',
    relatedTopics: [
      RelatedTopic(
        title: 'Salud Mental',
        icon: Icons.psychology,
        shortDescription: 'Mantener una buena salud mental es crucial para el bienestar general.',
        longDescription: 'Mantener una buena salud mental es crucial para el bienestar general. Practicar mindfulness y meditación puede ayudar a reducir el estrés, mejorar la concentración y promover un estado de ánimo positivo. Además, buscar apoyo social y profesional cuando sea necesario es vital para una salud mental óptima.',
        exercise: 'Dedica 10 minutos al día a la meditación mindfulness. Encuentra un lugar tranquilo, cierra los ojos y concéntrate en tu respiración. Técnica de meditación: \n1. Siéntate en una posición cómoda con la espalda recta. \n2. Cierra los ojos y enfócate en tu respiración, inhala profundamente por la nariz y exhala por la boca. \n3. Si tu mente divaga, simplemente vuelve a enfocarte en tu respiración. \n4. Haz esto durante 10 minutos cada día.',
      ),
      RelatedTopic(
        title: 'Bienestar General',
        icon: Icons.balance,
        shortDescription: 'El bienestar integral incluye una dieta balanceada y ejercicio regular.',
        longDescription: 'El bienestar integral incluye una dieta balanceada, ejercicio regular y técnicas de manejo del estrés. Además de estos pilares, es importante mantener relaciones saludables, dormir adecuadamente y encontrar tiempo para actividades que disfrutes. Todo esto contribuye a una vida equilibrada y satisfactoria.',
        exercise: 'Incorpora una actividad que disfrutes diariamente, como leer un libro, caminar al aire libre o escuchar música relajante. Plan de bienestar diario: \n1. Mañana: 15 minutos de lectura de un libro inspirador. \n2. Tarde: 30 minutos de caminata al aire libre. \n3. Noche: Escucha música relajante durante 20 minutos antes de dormir.',
      ),
      RelatedTopic(
        title: 'Prevención de Enfermedades',
        icon: Icons.healing,
        shortDescription: 'Realizar chequeos médicos regulares es crucial para la prevención de enfermedades.',
        longDescription: 'Vacunarse y realizar chequeos médicos regulares son prácticas importantes para la prevención de enfermedades. Mantener un estilo de vida saludable, incluyendo una buena alimentación y ejercicio, también juega un papel crucial en la prevención de enfermedades crónicas como la diabetes y las enfermedades cardíacas.',
        exercise: 'Programa tus chequeos médicos anuales y asegúrate de estar al día con todas tus vacunas. Consejos de prevención: \n1. Agenda una cita médica para un chequeo general una vez al año. \n2. Asegúrate de recibir todas las vacunas recomendadas según tu edad y estado de salud. \n3. Mantén un registro de tus citas y vacunas para estar al tanto de tu salud.',
      ),
    ],
  ),

  CardItem(
    title: 'Yoga para Todos',
    description: 'Aprende diferentes posturas y técnicas de yoga que te ayudarán a mantenerte en forma y relajado.',
    imagePath: 'assets/images/yoga.png',
    relatedTopics: [
      RelatedTopic(
        title: 'Posturas de Yoga',
        icon: Icons.self_improvement,
        shortDescription: 'Las posturas de yoga mejoran la fuerza, el equilibrio y la flexibilidad.',
        longDescription: 'Las posturas de yoga, como el árbol y el guerrero, mejoran la fuerza, el equilibrio y la flexibilidad. Practicar estas posturas regularmente puede ayudar a tonificar los músculos, mejorar la postura y aumentar la flexibilidad. Además, las posturas de yoga pueden ayudar a calmar la mente y reducir el estrés.',
        exercise: 'Practica la postura del Guerrero durante 5 minutos al día para mejorar tu fuerza y equilibrio. Cómo hacerlo: \n1. Da un paso hacia adelante con tu pie derecho y dobla la rodilla derecha a 90 grados, manteniendo la pierna izquierda estirada. \n2. Levanta ambos brazos hacia arriba, paralelos entre sí, y mira hacia adelante. \n3. Mantén esta posición durante 1 minuto y luego cambia de lado. Repite 5 veces para cada lado.',
      ),
      RelatedTopic(
        title: 'Técnicas de Respiración',
        icon: Icons.air,
        shortDescription: 'Las técnicas de respiración en yoga ayudan a reducir el estrés.',
        longDescription: 'Las técnicas de respiración en yoga, como Pranayama, ayudan a reducir el estrés y mejorar la concentración. La respiración controlada puede aumentar la capacidad pulmonar, mejorar la circulación y equilibrar el sistema nervioso. Incorporar estas técnicas en tu práctica diaria de yoga puede mejorar tu bienestar general.',
        exercise: 'Practica Pranayama durante 10 minutos cada mañana para empezar el día con calma y claridad. Técnica de Pranayama: \n1. Siéntate en una posición cómoda con la espalda recta. \n2. Inhala profundamente por la nariz durante 4 segundos. \n3. Mantén la respiración durante 7 segundos. \n4. Exhala lentamente por la boca durante 8 segundos. \n5. Repite este ciclo durante 10 minutos.',
      ),
      RelatedTopic(
        title: 'Yoga para Principiantes',
        icon: Icons.person,
        shortDescription: 'Consejos y posturas básicas para aquellos que están comenzando su práctica de yoga.',
        longDescription: 'Si eres nuevo en el yoga, es importante comenzar con posturas básicas y avanzar gradualmente. Posturas como el perro boca abajo y la postura del niño son excelentes para principiantes. Además, es útil aprender sobre la alineación correcta y la respiración adecuada para evitar lesiones y obtener el máximo beneficio de tu práctica de yoga.',
        exercise: 'Sigue una rutina de yoga para principiantes en YouTube, realizando sesiones de 20 minutos cada día. Ejemplo de rutina para principiantes: \n1. Postura del niño: Mantén durante 1 minuto. \n2. Perro boca abajo: Mantén durante 1 minuto. \n3. Gato-vaca: 10 repeticiones. \n4. Guerrero I: Mantén durante 1 minuto cada lado. \n5. Postura del cadáver: Relájate durante 5 minutos al final de la sesión.',
      ),
    ],
  ),

  CardItem(
    title: 'Meditación y Mindfulness',
    description: 'Descubre técnicas de meditación y prácticas de mindfulness para mejorar tu bienestar mental.',
    imagePath: 'assets/images/meditacion.png',
    relatedTopics: [
      RelatedTopic(
        title: 'Técnicas de Meditación',
        icon: Icons.spa,
        shortDescription: 'Diferentes técnicas de meditación, como la meditación guiada y la meditación trascendental, y sus beneficios.',
        longDescription: 'La meditación puede tomar muchas formas, desde la meditación guiada hasta la meditación trascendental. Cada técnica tiene sus propios beneficios, pero todas comparten el objetivo de calmar la mente y mejorar el bienestar mental. La práctica regular de la meditación puede reducir el estrés, mejorar la concentración y aumentar la sensación de bienestar.',
        exercise: 'Sigue una sesión de meditación guiada de 15 minutos cada noche antes de dormir para mejorar tu descanso. Pasos para la meditación guiada: \n1. Encuentra una meditación guiada que te guste en una aplicación o en YouTube. \n2. Siéntate o acuéstate en un lugar cómodo. \n3. Sigue las instrucciones de la meditación guiada, enfocándote en tu respiración y dejando que tu mente se relaje.',
        audioPath: ['assets/audio/meditation.mp3', 'assets/audio/yoganidra.mp3']
      ),
      RelatedTopic(
        title: 'Mindfulness',
        icon: Icons.self_improvement,
        shortDescription: 'Prácticas de mindfulness para aumentar la conciencia y vivir en el momento presente.',
        longDescription: 'El mindfulness es la práctica de estar presente y completamente involucrado en el momento actual. Puede ayudar a reducir el estrés, mejorar la concentración y aumentar la satisfacción general con la vida. Las técnicas de mindfulness incluyen la atención plena en la respiración, la alimentación consciente y la caminata consciente.',
        exercise: 'Realiza una caminata mindfulness de 20 minutos, prestando atención a cada paso y respiración. Pasos para la caminata mindfulness: \n1. Encuentra un lugar tranquilo para caminar. \n2. Camina a un ritmo lento y constante. \n3. Concéntrate en la sensación de tus pies tocando el suelo y en tu respiración. \n4. Si tu mente divaga, gentilmente vuelve a enfocarte en tus pasos y respiración.',
      ),
      RelatedTopic(
        title: 'Reducción del Estrés',
        icon: Icons.local_hospital,
        shortDescription: 'Cómo la meditación y el mindfulness pueden ayudar a reducir el estrés y mejorar la calidad de vida.',
        longDescription: 'La meditación y el mindfulness son herramientas poderosas para reducir el estrés y mejorar la calidad de vida. Al incorporar estas prácticas en tu rutina diaria, puedes aprender a manejar mejor las situaciones estresantes y a mantener una actitud más tranquila y positiva.',
        exercise: 'Practica la técnica de respiración 4-7-8: inhala durante 4 segundos, mantén la respiración durante 7 segundos y exhala durante 8 segundos. Pasos para la respiración 4-7-8: \n1. Siéntate o acuéstate en una posición cómoda. \n2. Cierra los ojos y respira profundamente por la nariz durante 4 segundos. \n3. Mantén la respiración durante 7 segundos. \n4. Exhala completamente por la boca durante 8 segundos. \n5. Repite este ciclo 4 veces.',
      ),
    ],
  ),

];
