import 'package:ekilibra_spa/app/pages/home/model_service/service.dart';
import 'package:ekilibra_spa/app/pages/home/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<List<Service>> getServices() async {
    return [
      const Service(
        title:
            'Estudio del rostro Estudio del rostro Estudio del rostro Estudio del rostro',
        phrase: '¡Déjanos ayudarte a descubrir tu ceja perfecta!',
        description:
            'CuidaNuestro servicio de Diseño de Cejas en Ekilibra es más que una simple técnica de depilación, es una experiencia personalizada que resalta la belleza única de cada individuo. Con un enfoque meticuloso, realizamos un diseño previo basado en el estudio del rostro de cada cliente, teniendo en cuenta su morfología única. Entendemos que cada persona es diferente, por lo que nos esforzamos por definir la ceja más adecuada para realzar su belleza natural. En Ekilibra, no se trata solo de seguir tendencias, sino de crear una ceja que refleje la singularidad y la exclusividad de cada personados',
        duration: '10 - 20 min',
        images: [
          'https://picsum.photos/id/1/400/200',
          'https://picsum.photos/id/2/400/200',
          'https://picsum.photos/id/3/400/200',
          'https://picsum.photos/id/4/400/200'
        ],
        observation: '',
      ),
      const Service(
        title: 'Microblading o Cejas Pelo a Pelo',
        description:
            'Experimenta la transformación con nuestro servicio de Microblading en Ekilibra, una técnica de vanguardia en estilo de hiperrealismo que redefine tus cejas de manera natural y precisa. Con Microblading, cada pelo se dibuja meticulosamente, siguiendo el patrón de crecimiento natural de tus cejas, para lograr un aspecto realista y definido. Recomendado para reconstruir y rediseñar la forma de las cejas, así como para cejas poco pobladas, claras o pieles maduras y secas. Esta técnica también es una solución efectiva para la reconstrucción de cejas en casos de alopecia total.',
        phrase:
            '¡Descubre la belleza de unas cejas perfectamente diseñadas con Microblading en Ekilibra!',
        duration: '15 min',
        images: [
          'https://picsum.photos/id/5/400/200',
          'https://picsum.photos/id/6/400/200',
          'https://picsum.photos/id/7/400/200',
          'https://picsum.photos/id/8/400/200'
        ],
        observation: '',
      ),
      const Service(
        title: 'MICROshading O Efecto Sombra',
        description:
            'Descubre la belleza y la definición duradera con nuestro servicio de Microshading de Cejas en Ekilibra. Con la técnica de Microshading o efecto Sombreado, logramos una apariencia de sombra ligera que añade volumen y un efecto 3D natural a tus cejas, realzando cualquier mirada de manera favorecedora. Esta técnica es perfecta para corregir la forma y color de las cejas, aumentar su densidad visualmente y brindar un efecto lifting que abre la mirada. En Ekilibra, te ayudamos a lograr unas cejas impecables y definidas que resalten tu belleza natural.',
        phrase:
            '¡Agenda tu cita hoy mismo y descubre el poder de la Microshading de Cejas en Ekilibra!',
        duration: '60 - 90 min',
        images: [
          'https://picsum.photos/id/9/400/200',
          'https://picsum.photos/id/10/400/200',
          'https://picsum.photos/id/11/400/200',
          'https://picsum.photos/id/12/400/200'
        ],
        observation: 'Ropa o vestimenta',
      ),
      const Service(
        title: 'Hibridas',
        description:
            'Experimenta lo mejor de ambos mundos con nuestro servicio de Micropigmentación Híbrida. Esta técnica innovadora combina lo mejor de las técnicas de pelo a pelo y efecto sombra para ofrecerte resultados sorprendentes y naturales. Las cejas híbridas logran un equilibrio perfecto entre definición y suavidad, proporcionando un aspecto realista y lleno de volumen. Con Micropigmentación Híbrida en Ekilibra, puedes disfrutar de unas cejas impecables y perfectamente diseñadas que realzarán tu belleza natural.',
        phrase: '¡Agenda tu cita hoy mismo y descubre la diferencia!',
        duration: '60 - 90 min',
        images: [
          'https://picsum.photos/id/13/400/200',
          'https://picsum.photos/id/14/400/200',
          'https://picsum.photos/id/15/400/200',
          'https://picsum.photos/id/16/400/200'
        ],
        observation: 'Ropa o vestimenta',
      ),
      const Service(
        title: 'Lifting de pestañas',
        description:
            'El Lifting de Pestañas es un tratamiento que eleva y ennegrece tus pestañas de forma natural. Consiste en realzar la curvatura de tus pestañas, resaltando la expresión de tu mirada y alargando las pestañas desde la raíz, sin necesidad de utilizar pelo sintético. Este procedimiento se realiza con almohadillas de silicona que se ajustan al párpado, estirando y elevando las pestañas hacia la punta, hasta su máximo punto de curvatura. El resultado es unas pestañas visiblemente más largas, curvadas y definidas. Además, el proceso es cómodo, rápido, sin olores y completamente indoloro.   Descubre cómo el Lifting de Pestañas puede resaltar tu belleza natural y transformar tu mirada.',
        phrase: '¡Agenda tu cita hoy mismo en Ekilibra!',
        duration: '60 - 90 min',
        images: [
          'https://picsum.photos/id/17/400/200',
          'https://picsum.photos/id/18/400/200',
          'https://picsum.photos/id/19/400/200',
          'https://picsum.photos/id/20/400/200'
        ],
        observation: 'Ropa o vestimenta',
      ),
      const Service(
        title: 'Delineado de Labios',
        description:
            'Descubre la sensualidad y definición que añade nuestro servicio de Delineado de Labios en Ekilibra. Esta técnica estética consiste en dibujar el contorno de los labios, realzando su forma natural y brindando un aspecto más definido y atractivo. Además, si tus labios están deslavados, ofrecemos la técnica de difuminar el contorno hacia adentro, resaltando esa zona despintada y proporcionando un efecto rejuvenecedor. Con nuestra segunda sesión, realizada dentro del periodo de 21 a 28 días, garantizamos que el delineado se fije adecuadamente, proporcionando resultados duraderos y hermosos. En Ekilibra, te ayudamos a resaltar la belleza de tu sonrisa con nuestro servicio de Delineado de Labios.',
        phrase:
            '¡Agenda tu cita hoy mismo y descubre el poder de unos labios perfectamente delineados en Ekilibra!',
        duration: '60 - 90 min',
        images: [
          'https://picsum.photos/id/21/400/200',
          'https://picsum.photos/id/22/400/200',
          'https://picsum.photos/id/23/400/200',
          'https://picsum.photos/id/24/400/200'
        ],
        observation: 'Ropa o vestimenta',
      ),
      const Service(
        title: 'Hyaluron Pen',
        description:
            '¿Qué es exactamente Hyaluron Pen? Es un dispositivo innovador que utiliza una presión controlada para administrar ácido hialurónico en la dermis, sin embargo, nuestro enfoque no es lograr resultados artificiales, sino más bien proporciones naturales. En Ekilibra, buscamos realzar tu belleza de manera sutil y armoniosa, utilizando el Hyaluron Pen para brindar volumen y definición a tus labios de forma natural.',
        phrase:
            '¡Descubre una apariencia fresca y rejuvenecida con nuestro servicio de Hyaluron Pen!',
        duration: '60 - 90 min',
        images: [
          'https://picsum.photos/id/25/400/200',
          'https://picsum.photos/id/26/400/200',
          'https://picsum.photos/id/27/400/200',
          'https://picsum.photos/id/28/400/200'
        ],
        observation: 'Ropa o vestimenta',
      ),
      const Service(
        title: 'PEELING ULTRASONICO',
        description:
            'Experimenta una limpieza facial profunda y rejuvenecedora con nuestro servicio de Peeling Ultrasónico en Ekilibra. Este tratamiento revolucionario desobstruye los poros, elimina las impurezas y reduce una variedad de imperfecciones para lograr una piel más joven, radiante y con un tono homogéneo. La técnica se basa en la vibración mecánica de una espátula de acero quirúrgico, la cual elimina células muertas y residuos de la superficie de la piel, mientras que las ondas sonoras del ultrasonido estimulan la regeneración del colágeno y la elastina. Esto no solo mejora la apariencia de la piel, sino que también aumenta la oxigenación y nutrición de los tejidos.',
        phrase:
            'Descubre una piel revitalizada y radiante con nuestro servicio de Peeling Ultrasónico en Ekilibra.',
        duration: '60 - 90 min',
        images: [
          'https://picsum.photos/id/29/400/200',
          'https://picsum.photos/id/30/400/200',
          'https://picsum.photos/id/31/400/200',
          'https://picsum.photos/id/32/400/200'
        ],
        observation: 'Ropa o vestimenta',
      ),
      const Service(
        title: 'HydraFacial',
        description:
            'HydraFacial en Ekilibra representa la más avanzada tecnología para revitalizar tu piel de manera indolora y sin tiempo de recuperación.Los resultados son visibles y palpables desde la primera sesión. Este tratamiento mejora significativamente una variedad de problemas cutáneos, incluyendo el acné, líneas de expresión, manchas solares, deshidratación, y más. Además, deja la piel limpia y radiante instantáneamente, proporcionando una apariencia rejuvenecida y saludable. HydraFacial es adecuado para pieles jóvenes o maduras.',
        phrase: '¡Descubre una piel transformada con HydraFacial en Ekilibra!',
        duration: '60 - 90 min',
        images: [
          'https://picsum.photos/id/33/400/200',
          'https://picsum.photos/id/34/400/200',
          'https://picsum.photos/id/35/400/200',
          'https://picsum.photos/id/36/400/200'
        ],
        observation: 'Ropa o vestimenta',
      ),
      const Service(
        title: 'REFRESCAMIENTO FACIAL INTEGRAL',
        description:
            'Descubre nuestro nuevo paquete de Refrescamiento Facial Integral, diseñado para brindarte una piel más joven, luminosa, tersa y de mejor calidad sin necesidad de cirugía. Este tratamiento integral, aplicado por un médico con amplia experiencia, combina dos poderosos procedimientos: Peeling: Este tratamiento ayuda a mejorar el aspecto de la piel al eliminar capas de la epidermis, lo que promueve una renovación celular y hace que la piel luzca más joven, con menos arrugas y sin manchas. Plasma Rico en Plaquetas: Con esta avanzada técnica de regeneración celular, basada en las propiedades beneficiosas de las plaquetas, se promueve la formación de nuevo tejido en la dermis. Esto resulta en una piel más joven, luminosa, tersa y de mejor calidad. No te pierdas la oportunidad de obtener una cita de valoración gratuita para descubrir cómo nuestro paquete de Refrescamiento Facial Integral puede revitalizar tu piel y rejuvenecer tu aspecto.',
        phrase:
            '¡Agenda tu cita hoy mismo y da el primer paso hacia una piel más hermosa!',
        duration: '60 - 90 min',
        images: [
          'https://picsum.photos/id/37/400/200',
          'https://picsum.photos/id/38/400/200',
          'https://picsum.photos/id/39/400/200',
          'https://picsum.photos/id/40/400/200'
        ],
        observation: 'Ropa o vestimenta',
      ),
      const Service(
        title: 'BB GLOW',
        description:
            '"Experimenta una transformación total de tu piel con nuestro tratamiento de BB Glow. Este innovador procedimiento te permite revertir el envejecimiento celular y lograr una piel rejuvenecida y radiante. Con BB Glow, disfrutarás de una serie de beneficios Aumento de la producción de colágeno en un 400%, lo que mejora la firmeza y elasticidad de la piel. Recuperación de la hidratación, incluso en las capas más profundas, para una piel suave y nutrida. Restauración de la luminosidad perdida, dejando el rostro radiante y revitalizado. Efecto de iluminación instantánea, que mejora la apariencia de la piel al instante. Ayuda a difuminar arrugas y líneas finas, para una apariencia más juvenil.  Produce un efecto gradual de Piel de Porcelana, suavizando imperfecciones y dejando una tez impecable.',
        phrase:
            'Descubre el secreto para una piel perfecta con nuestro tratamiento de BB Glow. ¡Agenda tu cita hoy mismo y dale a tu piel el cuidado que se merece!',
        duration: '60 - 90 min',
        images: [
          'https://picsum.photos/id/41/400/200',
          'https://picsum.photos/id/42/400/200',
          'https://picsum.photos/id/43/400/200',
          'https://picsum.photos/id/44/400/200'
        ],
        observation: 'Ropa o vestimenta',
      ),
      const Service(
        title: 'Masaje terapéutico',
        description:
            'Disfruta de un alivio instantáneo del estrés y la tensión con nuestro Masaje Terapéutico de Rostro, Cuello, Hombros y Espalda. Este tratamiento específico y eficaz se enfoca en las zonas donde comúnmente se acumula la tensión y el estrés, brindándote una sensación de relajación profunda y bienestar. Experimenta cómo tus hombros y cuello se liberan de la tensión mientras tus músculos son masajeados con una presión semi-profunda. Ya sea como complemento a otros servicios o como un tratamiento breve por sí mismo, este masaje te dejará renovado y revitalizado.',
        phrase:
            '¡Agenda tu sesión y regálate un momento de pura relajación en Ekilibra!',
        duration: '60 - 90 min',
        images: [
          'https://picsum.photos/id/45/400/200',
          'https://picsum.photos/id/46/400/200',
          'https://picsum.photos/id/47/400/200',
          'https://picsum.photos/id/48/400/200'
        ],
        observation: 'Ropa o vestimenta',
      ),
      const Service(
        title: 'Acupuntura',
        description:
            'Experimenta el alivio natural del dolor y el bienestar completo con nuestro servicio de Acupuntura en Ekilibra. La Acupuntura, una técnica terapéutica ancestral, ha demostrado ser eficaz para reducir diversos tipos de dolor al estimular puntos específicos del cuerpo. Además, este tratamiento potencia la liberación de endorfinas, los analgésicos naturales del cuerpo, proporcionando alivio inmediato y duradero. Al calmar el cerebro y el sistema nervioso central, la Acupuntura ofrece un alivio efectivo para los síntomas de la fibromialgia, ayudándote a gestionar el dolor y mejorar tu calidad de vida.',
        phrase:
            'Descubre el poder curativo de la Acupuntura y encuentra el equilibrio físico y emocional que mereces en Ekilibra.',
        duration: '60 - 90 min',
        images: [
          'https://picsum.photos/id/49/400/200',
          'https://picsum.photos/id/50/400/200',
          'https://picsum.photos/id/51/400/200',
          'https://picsum.photos/id/52/400/200'
        ],
        observation: 'Ropa o vestimenta',
      ),
      const Service(
        title: 'Iridología y Biomagnetismo',
        description:
            'Explora las raíces de tu salud con nuestro exclusivo servicio de Iridología y Biomagnetismo en Ekilibra.Esta práctica milenaria de diagnóstico examina detalladamente los patrones y características del iris para identificar posibles desequilibrios y trastornos en el cuerpo. Desde artritis reumatoide y afectaciones cardíacas hasta dolores musculares y patologías digestivas, la Iridología ofrece una ventana única hacia tu salud integral. Nuestros expertos en Iridología están capacitados para detectar señales sutiles que pueden indicar problemas como problemas de presión, afecciones en órganos reproductivos o de la vesícula, entre otros. Descubre cómo el Biomagnetismo puede mejorar tu bienestar en todos los niveles. ¡Sigue leyendo para aprender más! Esta terapia no invasiva utiliza imanes para equilibrar el campo magnético del cuerpo y promover la salud en todos los niveles. El Biomagnetismo se basa en la premisa de que muchas enfermedades y dolencias se deben a desequilibrios energéticos en el cuerpo, y mediante la colocación estratégica de imanes, se pueden restaurar estos equilibrios.',
        duration: '60 - 90 min',
        images: [
          'https://picsum.photos/id/53/400/200',
          'https://picsum.photos/id/54/400/200',
          'https://picsum.photos/id/55/400/200',
          'https://picsum.photos/id/56/400/200'
        ],
        observation: 'Ropa o vestimenta',
      ),
    ];
  }

  @override
  Future<List<String>> getPlaces() async {
    return ['Sogamoso', 'Duitama', 'Tunja'];
  }
}
