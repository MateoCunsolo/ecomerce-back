CREATE DATABASE ecomerce;
use ecomerce;

CREATE TABLE TIPO_USUARIO (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL
);

CREATE TABLE USUARIO (
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_tipo_usuario INT NOT NULL DEFAULT 2,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    correo_electronico VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_tipo_usuario) REFERENCES TIPO_USUARIO(id)
);

INSERT INTO USUARIO (id_tipo_usuario, nombre, apellido, correo_electronico, contrasena)
values(1,"ADMIN","ADMIN","ADMIN@GMAIL.COM","$2a$08$H9qjVfGPrlQuevt5cH43n.iNbC3GkXH3nwxZfzntMGC.g.G4RGIvW");


CREATE TABLE COMPRA (
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    monto_total float NOT NULL,
    fecha varchar(20),
	FOREIGN KEY (id_usuario) REFERENCES USUARIO(id)
);

CREATE TABLE CATEGORIA (
	id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL        
);

CREATE TABLE PRODUCTO (
	id INT AUTO_INCREMENT PRIMARY KEY,
	id_categoria INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(500) NOT NULL,
    precio FLOAT,
    stock INT,
    imagen_url VARCHAR(2083),
	FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id)
);

CREATE TABLE COMPRA_X_PRODUCTO(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_compra INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
	FOREIGN KEY (id_compra) REFERENCES COMPRA(id),
	FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id)
);


USE ecomerce;
-- Insertar tipos de usuario
INSERT INTO TIPO_USUARIO (tipo) VALUES ('admin');
INSERT INTO TIPO_USUARIO (tipo) VALUES ('cliente');

USE ecomerce;
-- Insertar categorías
INSERT INTO CATEGORIA (tipo) VALUES ('ROPA');
INSERT INTO CATEGORIA (tipo) VALUES ('CALZADO');
INSERT INTO CATEGORIA (tipo) VALUES ('ACCESORIOS');
INSERT INTO CATEGORIA (tipo) VALUES ('TECNOLOGIA');
INSERT INTO CATEGORIA (tipo) VALUES ('SUPLEMENTOS');



USE ecomerce;
ALTER TABLE PRODUCTO MODIFY COLUMN descripcion VARCHAR(1000);

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(1, 'Shorts Adicolor Firebird', 
'Estos shorts son una versión moderna de un modelo original de adidas. Reinventados para el mundo de hoy e inspirados en los archivos icónicos, son una mezcla moderna y un ícono de estilo clásico. Con un corte holgado cómodo y confección en tejido de tricot liviano, te permiten moverte con libertad mientras rinden homenaje a la marca que comenzó todo. Los bolsillos laterales añaden practicidad mientras que el cordón de ajuste en la cintura elástica te brinda un ajuste personalizado. Este producto está hecho con un mínimo de 70% de materiales reciclados. Utilizando materiales reciclados reducimos los residuos, nuestra dependencia de los recursos finitos y la huella que generan los productos que fabricamos.', 
69999, 
100, 
'https://ibb.co/0VCzVd2');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(1, 'Remera Adizero Running', 
'Una remera de running ligera diseñada para ayudarte a llegar lejos. Mantene la concentración y superá tus límites con esta remera de running adidas. La tecnología AEROREADY absorbe la humedad de tu cuerpo para mantener tu cuerpo seco y cómodo mientras corrés cualquier distancia. Su diseño liviano con malla te brinda transpirabilidad incluso cuando aumentás el ritmo.', 
79999, 
150,  -- Inventé un stock de 150 unidades
'https://ibb.co/JskF2JP');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(1, 'Pantalón Aniversario 50 Años Selección Argentina', 
'Unos pantalones al estilo de la selección Argentina, cuyo legado persiste en el tiempo. Animá a Argentina desde la tribuna o las calles con estilo deportivo. La colección que conmemora los 50 años vuelve a lo grande con estos pantalones de la selección Argentina, conllevando un diseño que evoca el eterno legado futbolístico de Argentina. Este producto está hecho con materiales 100% reciclados. Utilizando materiales reciclados reducimos los residuos, nuestra dependencia de los recursos finitos y la huella que generan los productos que fabricamos. Este producto se ha fabricado con una mezcla de materiales reciclados y renovables. Su objetivo es plantear otra solución más que ayude a acabar con los residuos plásticos.', 
139999, 
80,  -- Inventé un stock de 80 unidades
'https://ibb.co/3RSk3nL');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(1, 'Remera Adicolor Trifolio', 
'Una remera atemporal con el estilo del Trifolio en algodón suave. Estilo clásico, redefinido. Esta remera adidas reinventa el estilo casual con un toque contemporáneo. Serigrafiado con el icónico logo del Trifolio, destaca tu conexión con la marca que dio forma al deporte. Diseñada para uso diario, luce un corte clásico en un tejido de algodón suave que crea un look descomplicado. Una prenda esencial para completar cualquier outfit. El algodón de este producto fue obtenido a través de Better Cotton. Better Cotton se obtiene a través de un modelo de cadena de custodia llamado balance de masas. Esto significa que Better Cotton no es físicamente rastreable hasta los productos finales.', 
49999, 
120,  -- Inventé un stock de 120 unidades
'https://ibb.co/X857kvz');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(1, 'Camiseta Titular Arsenal 24/25', 
'Un jersey Arsenal versión seguidor en los famosos colores de local, hecho con materiales reciclados. Un look sencillo para un equipo joven que mira hacia lo más alto. Esta camiseta del Arsenal de adidas luce un escudo bordado que resalta sobre los colores atemporales de titular. La tecnología de absorción AEROREADY y el tejido de teINSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)EnVALUES nt(1, 'Camiseta Titular Arsenal 24/25', en'Un jersey Arsenal versión seguidor en los famosos colores de local, hecho con materiales reciclados. Un look sencillo para un equipo joven que mira hacia lo más alto. Esta camiseta del Arsenal de adidas luce un escudo bordado que resalta sobre los colores atemporales de titular. La tecnología de absorción AEROREADY y el tejido de tejido entrelazado suave se combinan para mantener a las hinchas de fútbol cómodos mientras disfrutan del viaje. Este producto está hecho con 100% materiales reciclados. Utilizando materiales reciclados disminuimos los residuos, nuestra dependencia de los recursos finitos y la huella que generan los productos que fabricamos.', ló119999, n 150,  -- Inventé un stock de 150 unidades. 'https://ibb.co/99h3LKw');  -- URL de la imagen del productos mpo de entrenamiento trae los premios más grandes al alcance. Con un corte ajustado y estilizado, este pantalón deportivo de Argentina forma parte de la línea de entrenamiento de la selección. El tejido absorbente AEROREADY y el refuerzo en la malla te mantienen cómodo en la cancha sin importar la intensidad del entrenamiento. Hecho con materiales 100% reciclados, este producto representa solo una de nuestras soluciones para acabar con los residuos plásticos.', 
119999, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/qBtdxqH');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(1, 'Campera Anthem Argentina', 
'Mostrá tus colores con una campera reversible hecha con materiales reciclados. Ya sea que vayas a apoyar a tu equipo en el partido o simplemente a pasear por la ciudad, esta campera reversible de adidas te permite lucir con orgullo los colores de tu país. Por un lado hace referencia al uniforme titular de Argentina y por el otro al de suplente, para que puedas expresar tu pasión por el fútbol de la forma que quieras. El tejido resistente antidesgarre asegura comodidad sin importar cuál de los lados escojas. Este producto está hecho con materiales 100% reciclados. Utilizando materiales reciclados disminuimos los residuos, nuestra dependencia de los recursos finitos y la huella que generan los productos que fabricamos.', 
189999, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/sHPx2CY');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(1, 'Rompevientos Terrex Multi', 
'Un rompevientos ligero hecho parcialmente con Parley Ocean Plastic. Llegá más lejos en los senderos. Este rompevientos versátil es una capa ligera que te permite esforzarte al máximo en los senderos de montaña a pesar de los cambios de clima. La tecnología adidas WIND.RDY aleja el viento y resiste a la lluvia ligera para que puedas avanzar con comodidad. Los paneles de ventilación bajo los brazos favorecen el flujo de aire en los momentos más intensos, y su diseño permite plegarlo y guardarlo en su propio bolsillo para que lo puedas tener siempre a mano.', 
161999, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/t3ZsbbK');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(1, 'Campera Deportiva Adicolor Cuello Alto', 
'Un clásico moderno para crear el tuyo propio. Esta campera deportiva adidas se mantiene como una prenda esencial reinventada gracias a su llamativo diseño de cuello alto. El tejido de tejido entrelazado cómodo y las emblemáticas 3 Tiras en los brazos rinden homenaje a la legendaria silueta que inspiró el look. Perfecta para relajarse en días tranquilos, su horma clásica y detalles acanalados aseguran comodidad duradera.', 
126999, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/qr41KSL');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(1, 'Pantalón Z.N.E. Tejido', 
'Pantalones tejidos hechos parcialmente con una mezcla de materiales reciclados y renovables. Encontrá tu ritmo con estos pantalones Z.N.E de adidas. Su diseño suave y elástico te permite desconectarte de la presión de tu día a día y liberarte de las rutinas. Los bolsillos ocultos con cierre mantienen tus objetos esenciales seguros pero fuera de la vista, dejando que tu mente vuele tan libremente como tus piernas. Sin importar a donde te lleve el día, la tecnología de absorción AEROREADY ayuda a mantener tu cuerpo seco y cómodo. Usalos con una remera holgada para un look relajado o con una camisa de botones para tomar una copa con amigos.',
114999, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/qMrMXLL');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(1, 'Remera 3 Tiras', 
'Una remera cómoda y elástica que no puede faltar en ningún clóset. Diseñada para moverse, esta remera suave y esencial se trata de expresar tu pasión por el deporte. Inspirada en los archivos de adidas pero diseñada para el mundo de hoy, celebra nuestro legado de originalidad. El acanalado crea una silueta clásica mientras que las emblemáticas 3 Tiras en las mangas evocan el legado de los atletas y creadores que han formado adidas. Sola o en capas, esta remera está lista para todo lo que tengás planeado. El algodón de este producto fue obtenido a través de Better Cotton. Better Cotton se obtiene a través de un modelo de cadena de custodia llamado balance de masas. Esto significa que Better Cotton no es físicamente rastreable hasta los productos finales.',
50999, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/D4DW472');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(1, 'Buzo con Capucha adidas x FARM Rio', 
'Un buzo con capucha de felpa francesa diseñado con la marca brasilera FARM Rio. Sin importar si vas al estudio de yoga o a descansar en casa, el buzo con capucha de entrenamiento adidas x FARM Rio te envuelve con comodidad. Inspirado en los vibrantes patrones de la selva tropical de Brasil, este buzo con capucha holgado le inyecta energía a tu estilo. Las mangas tipo murciélago te permiten moverte con fluidez, mientras que el tejido de felpa francesa suave te mantiene cómodo.', 
90999, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/pPGgvrh');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(1, 'ADIZERO GEL SHORT', 
'Adizero Gel Sho es un nuevo producto para Mujer de adidas. Te invitamos a ver las imágenes para apreciar más detalles desde diferentes ángulos. Si ya conocés Adizero Gel Sho podés dejar una reseña abajo; siempre nos encanta conocer tu opinión.', 
74999, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/ZKzrMKn');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(1, 'Calzas Essentials 3 Tiras', 
'Calzas elásticas con un clásico estilo deportivo. La versatilidad para el día a día se combina con el estilo clásico. Estas calzas adidas lucen un look deportivo con las 3 Tiras y un logo adidas Badge of Sport en la cadera. Elásticas y cómodas, estas calzas están hechas de algodón suave.', 
47999, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/MsP43mH');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(1, 'Pantalón Future Icons 3 Tiras', 
'Un pantalón suave hecho parcialmente con una mezcla de materiales reciclados y renovables. Al trabajar desde casa o mientras ves tu serie favorita, este pantalón adidas te acompaña en cualquier momento de tu día. Su corte ajustado envuelve tu figura y el dobladillo abierto les da una vibra moderna y relajada. Las icónicas 3 Tiras le ponen el toque final al look.', 
109999, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/QFDKYj3');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(1, 'Buzo con Capucha Z.N.E. Tejido Cierre Frontal', 
'Un buzo con capucha con cierre frontal hecho parcialmente con una mezcla de materiales reciclados y renovables. Diseñado para quienes tienen una perspectiva Zen, este buzo con capucha adidas te permite marcar tu propio ritmo. Confeccionado en tejido de punto doble de poliéster elástico, este buzo con capucha con cierre frontal te ayuda a mantener la paz interior. La tecnología AEROREADY mantiene tu cuerpo seco sin importar si estás en movimiento o disfrutando de un descanso. Los bolsillos frontales con cierre y los puños acanalados ofrecen un lugar seguro para tus llaves y teléfono. El logo adidas Badge of Sport en silicona mate te recuerda que debes mantenerte enfocado. Usalo solo o en capas, este buzo con capucha te ayuda a definir estilo y comodidad a tu manera.', 
149999, 
120,  -- Stock inventado: 120 unidades
'https://ibb.co/Fh4YdTT');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(1, 'Camiseta Titular River Plate 24/25 (Mujer)', 
'La nueva camiseta de River Plate mantiene el clásico paladar del hincha riverplatense. Inspirada en la mítica camiseta de 1986 con la que el Millonario ganó todo. Esta nueva camiseta oficial de River Plate adidas muestra elegancia en su nuevo diseño con una banda roja que le cruza simulando aquel uniforme utilizado en la Intercontinental de 1986. Un diseño que recuerda la gloria del pasado para un equipo que se supera cada día. El tejido absorbente AEROREADY y los paneles en la malla se encargan de mantenerte cómodo.', 
99999, 
100,  -- Stock inventado: 100 unidades
'https://ibb.co/DRVtDF5');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(1, 'Remera LOUNGEWEAR Essentials 3 Tiras Ajuste Ceñido', 
'Remera deportiva con un look adidas llamativo. Dejá que tu lado deportivo brille con esta remera de ajuste ceñido. Las 3 Tiras adornan ambas mangas en un color contrastante que resalta. La remera tiene un look clásico que combina con casi todo, desde jeans hasta polleras de tenis y calzas de entrenamiento.', 
32999, 
150,  -- Stock inicial sugerido: 150 unidades
'https://ibb.co/XYhG9Gy');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(1, 'Calzas Optime Power 7/8', 
'Calzas elásticas con mayor sujeción y estabilidad durante el entrenamiento de fuerza. Diseñadas con una tecnología específica en la cintura de talle alto que aporta estabilidad y sujeción extra mientras realizas tus ejercicios. Están confeccionadas en tejido Adimove con elasticidad en cuatro direcciones para que se muevan contigo cuando haces sentadillas y otros ejercicios de pierna. La tecnología AEROREADY ayuda a reducir el sudor al mínimo. Es tu momento de dominar tu fuerza.', 
138999, 
120,  -- Stock inicial sugerido: 120 unidades
'https://ibb.co/jb4brv0');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(5, 'Proteina Whey Protein Gentech vainilla 500grs', 
'Las proteínas de Gentech son de la más alta calidad, con un delicioso sabor y una excelente disolución. Con su propia versión de whey protein, Gentech se posiciona como una marca líder en el mercado de suplementos deportivos. Si buscas una proteína de calidad y pureza, Gentech whey protein es una excelente opción para ti. ¡Prueba su sabor y siente la diferencia en tu recuperación y crecimiento muscular!', 
13543, 
20,  -- Inventé un stock de 20 unidades
'https://ibb.co/VSNFk6K');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(5, 'Proteina Whey Protein Gentech frutilla 500grs', 
'Las proteínas de Gentech son de la más alta calidad, con un delicioso sabor y una excelente disolución. Con su propia versión de whey protein, Gentech se posiciona como una marca líder en el mercado de suplementos deportivos. Si buscas una proteína de calidad y pureza, Gentech whey protein es una excelente opción para ti. ¡Prueba su sabor y siente la diferencia en tu recuperación y crecimiento muscular!', 
13543, 
20,  -- Inventé un stock de 20 unidades
'https://ibb.co/N3Bt0mV');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(5, 'Proteina Gold Nutrition Whey Protein Chocolate 5lb', 
'¿Quieres una proteína de alta calidad que te ayude a construir y reparar tus músculos después de entrenar? ¡Entonces 100% Whey Protein® de Gold Nutrition es el suplemento perfecto para ti! Con 28 gramos de proteína concentrada, hidrolizada y aislada por servicio, junto con una gran cantidad de aminoácidos BCAA y L-glutamina, esta fórmula premium es ideal para apoyar tus objetivos de fitness y nutrición.', 
84575, 
30,  -- Inventé un stock de 30 unidades
'https://ibb.co/YRvwks0');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(5, 'Proteina Gold Nutrition Whey Protein frutilla 5lb', 
'Si buscas un suplemento proteico multifuncional y nutritivo que te brinde las bases necesarias para la construcción y reparación muscular, no busques más. 100% Whey Protein de Gold Nutrition es el Blend Premium que necesitas. Con una fórmula de proteína concentrada, hidrolizada y aislada, cada porción de 35 gramos te brinda un aporte de 28 gramos de proteína de alta calidad, 5,9 gramos de BCAAs y 4,6 gramos de L-Glutamine. Además, no contiene grasas trans y es baja en carbohidratos y calorías.', 
84575, 
25,  -- Inventé un stock de 25 unidades
'https://ibb.co/yQtXNXH');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(5, 'Proteina Ena Vegana Plant Protein 375Gr Vegetal', 
'Si buscas una proteína en polvo de alta calidad y completamente vegana, nuestra Proteína Vegana Ena Plant Protein es la elección perfecta para ti. Elaborada con proteína de arvejas, esta proteína es ideal para quienes siguen una dieta vegana o vegetariana, o para aquellos que necesitan complementar su dieta con una fuente de proteína de calidad. Con cada porción de nuestra Proteína Vegana Ena Plant Protein, obtendrás 20 gramos de proteína de alta calidad, ayudándote a mantener tus niveles de energía y fuerza durante todo el día.', 
20150, 
30,  -- Inventé un stock de 30 unidades
'https://ibb.co/q9kGY9T');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(5, 'Raptor Whey Protein 1 KG - Denmark', 
'Raptor Whey Protein no es solo otra proteína en el mercado. Cada porción te proporciona 25 gramos de proteína de alta calidad, procedente de Dinamarca, lo que asegura su pureza y efectividad. Además, contiene 5,6 gramos de BCAA, esenciales para reducir la fatiga y prevenir la pérdida de masa muscular durante tus entrenamientos intensos.', 
28500, 
10,  -- Inventé un stock de 10 unidades
'https://ibb.co/CWy1cLc');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(5, 'Suplemento Gentech Creatina monohidrato x 250 grs', 
'La incorporación de creatina en tus entrenamientos puede ser muy beneficiosa, ya que es una potente fuente de energía que acelera la recuperación entre series y prolonga la duración del ejercicio intenso. Además, permite entrenar más duro, aumentar la fuerza y promover el crecimiento de masa muscular, retrasando la aparición del ácido láctico y soportando mejor sus efectos.', 
21155, 
20,  -- Inventé un stock de 20 unidades
'https://ibb.co/rcWpd74');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(5, 'Suplemento Gold Nutrition Creatine monohidrato 300gr', 
'La creatina monohidrato sirve para aumentar la energía y la fuerza muscular, lo que permite entrenar con mayor intensidad y durante más tiempo. También ayuda a mejorar la recuperación muscular después del ejercicio intenso, lo que se traduce en una reducción de la fatiga y la posibilidad de entrenar con mayor frecuencia.', 
31124, 
30,  -- Inventé un stock de 30 unidades
'https://ibb.co/C5wGg2F');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(5, 'Barritas Proteicas Ena coco dulce de leche 16 unidades', 
'Protein Bar es una excelente opción de snack saludable para consumir todos los días y obtener más energía y una mejor definición muscular. Es una fuente muy buena de proteínas y carbohidratos, perfecta para complementar una rutina de ejercicios larga, ya que viene en un formato fácil de transportar y consumir. Dos barritas de Protein Bar proporcionan 30 gramos de proteína pura por día, lo que la convierte en un alimento funcional muy efectivo. Además, está reforzada con vitaminas y minerales, lo que ayuda a formar masa muscular y aporta energía.', 
24579, 
5,  -- Inventé un stock de 5 unidades
'https://ibb.co/BVJQZCT');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(5, 'Barritas Proteicas Ena frutillas 16 unidades', 
'Protein Bar es una excelente opción de snack saludable para consumir todos los días y obtener más energía y una mejor definición muscular. Es una fuente muy buena de proteínas y carbohidratos, perfecta para complementar una rutina de ejercicios larga, ya que viene en un formato fácil de transportar y consumir. Dos barritas de Protein Bar proporcionan 30 gramos de proteína pura por día, lo que la convierte en un alimento funcional muy efectivo. Además, está reforzada con vitaminas y minerales, lo que ayuda a formar masa muscular y aporta energía.', 
24579, 
5,  -- Inventé un stock de 5 unidades
'https://ibb.co/4KvcrzH');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(5, 'Barritas Proteicas Ena limon 16 unidades', 
'Protein Bar es una excelente opción de snack saludable para consumir todos los días y obtener más energía y una mejor definición muscular. Es una fuente muy buena de proteínas y carbohidratos, perfecta para complementar una rutina de ejercicios larga, ya que viene en un formato fácil de transportar y consumir. Dos barritas de Protein Bar proporcionan 30 gramos de proteína pura por día, lo que la convierte en un alimento funcional muy efectivo. Además, está reforzada con vitaminas y minerales, lo que ayuda a formar masa muscular y aporta energía.', 
24579, 
5,  -- Inventé un stock de 5 unidades
'https://ibb.co/jrkLkj1');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(5, 'Barritas Proteicas Ena chocolate 16 unidades', 
'Protein Bar es una excelente opción de snack saludable para consumir todos los días y obtener más energía y una mejor definición muscular. Es una fuente muy buena de proteínas y carbohidratos, perfecta para complementar una rutina de ejercicios larga, ya que viene en un formato fácil de transportar y consumir. Dos barritas de Protein Bar proporcionan 30 gramos de proteína pura por día, lo que la convierte en un alimento funcional muy efectivo. Además, está reforzada con vitaminas y minerales, lo que ayuda a formar masa muscular y aporta energía.', 
24579, 
5,  -- Inventé un stock de 5 unidades
'https://ibb.co/Hq0qQ6F');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(5, 'Pre entreno Gold Nutrition Raspeberry 195gr', 
'Gold Nutrition es una marca reconocida en el mundo del deporte por ofrecer suplementos de alta calidad para mejorar el rendimiento. Su producto de pre-entrenamiento contiene una fórmula única con ingredientes como la cafeína anhidra, L-taurina, B-alanina, L-citrulina, L-arginina, creatina monohidrato, inositol y las vitaminas B3, B6 y B12. Estos ingredientes pueden ayudar a mejorar la energía, la concentración, la resistencia muscular y la producción de energía. Además, la combinación de ingredientes puede aumentar el flujo sanguíneo, reducir la fatiga y mejorar el rendimiento durante el entrenamiento.', 
18945, 
15,  -- Inventé un stock de 15 unidades
'https://ibb.co/4NcZGV5');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(5, 'Bebiba Isotonica Ena Carbo Energy 540 Gr Fruit punch', 
'CARBO ENERGY destaca por su exclusiva combinación de carbohidratos simples y complejos, fundamentales para proveer energía tanto inmediata como sostenida durante largos periodos de actividad física. Los carbohidratos simples actúan como una fuente rápida de energía, brindándote ese impulso necesario para enfrentar tus desafíos deportivos con éxito. Por otro lado, los carbohidratos complejos proporcionan un suministro constante de energía a lo largo del tiempo, permitiéndote mantener un ritmo óptimo y prolongado.', 
12290, 
10,  -- Inventé un stock de 10 unidades
'https://ibb.co/vjnChhP');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(5, 'Multivitaminico Ena 60 comprimidos', 
'Con su aporte de vitaminas del complejo B, MULTIVITAMIN te ayudará a reducir la sensación de cansancio y mejorar tu resistencia al estrés físico y mental. Además, con 11 vitaminas y 4 minerales, este suplemento complementa tu nutrición y salud inmunológica.', 
12500, 
20,  -- Inventé un stock de 20 unidades
'https://ibb.co/tZdc3rc');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(5, 'Barras Proteicas Veggie Gentech cacao 10u', 
'Si eres vegano y estás buscando una opción deliciosa y nutritiva para complementar tu alimentación, las barras proteicas VeggieBar de Gentech son la solución perfecta. Con 18 gramos de proteína de arveja y vitamina B12 agregada, estas barras son una opción saludable y deliciosa para aquellos que buscan mantener un estilo de vida vegano.', 
13388, 
5,  -- Inventé un stock de 5 unidades
'https://ibb.co/NxBxmfv');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(5, 'Aminoacidos Gold Nutriton Amino gold sabor grapefruit 280gr', 
'Al tomar Amino Gold después del ejercicio intenso, se obtiene un balance necesario para el crecimiento y recuperación muscular óptimo, ideal para todo tipo de atletas. Amino Gold tiene mejor asimilación que otros aminoácidos combinando una proporción óptima de aminoácidos de absorción rápida (BCAA 8.1.1) con Glutamina, Alanina, Taurina e ingredientes potenciadores del Óxido Nítrico para ayudarte a alcanzar tus objetivos.', 
18945, 
15,  -- Inventé un stock de 15 unidades
'https://ibb.co/0FwZLBm');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(5, 'Barritas Proteicas Iron bar coco chocolate x 20 unid', 
'Las Barritas Proteicas IRON BAR GENTECH son un complemento nutricional esencial para aquellos que buscan aumentar su masa muscular y mejorar su rendimiento deportivo. Estas barritas están elaboradas con una combinación perfecta de proteínas de suero lácteo e hidratos de carbono, que brindan una nutrición óptima para fortalecer los músculos durante el entrenamiento.', 
18270, 
5,  -- Inventé un stock de 5 unidades
'https://ibb.co/x12z49P');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(5, 'Barritas Proteicas Iron bar frutilla chocolate x 20 unid', 
'Las Barritas Proteicas IRON BAR GENTECH son un complemento nutricional esencial para aquellos que buscan aumentar su masa muscular y mejorar su rendimiento deportivo. Estas barritas están elaboradas con una combinación perfecta de proteínas de suero lácteo e hidratos de carbono, que brindan una nutrición óptima para fortalecer los músculos durante el entrenamiento.', 
18270, 
5,  -- Inventé un stock de 5 unidades
'https://ibb.co/7CYHQ8P');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(5, 'Creatina Gentech Cds Frutas tropicales 800 grs', 
'El CDS Creatine Delivery System es un suplemento nutricional de alta calidad que se compone de una combinación única de ingredientes, incluyendo creatina monohidrato, taurina, glutamina y vitamina C. Esta fórmula avanzada ha sido diseñada para proporcionar una importante fuente de energía para el cuerpo, lo que la convierte en una opción popular entre los atletas y culturistas que buscan mejorar su rendimiento físico.', 
16235, 
10,  -- Inventé un stock de 10 unidades
'https://ibb.co/zV3n8w3');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(3, 'Riñonera Adicolor', 
'Una riñonera adidas Adicolor hecha parcialmente con materiales reciclados. Esta riñonera te permite guardar tus artículos esenciales con estilo. El logo del Trifolio en contraste en la parte frontal y las 3 Tiras en la correa son el sello de nuestro legado deportivo Su diseño versátil te permite llevarlo en la cintura o como bolso cruzado. Cuenta con un compartimento principal con cierre para tener las llaves, la billetera y el teléfono siempre a la mano.', 
39999, 
80,  -- Inventé un stock de 80 unidades
'https://ibb.co/Czwsqgq');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(3, 'Guantes de Arquero Predator Training', 
'Pred Gl Trn es un nuevo producto para Unisex de adidas. Te invitamos a ver las imágenes para apreciar más detalles desde diferentes ángulos. Si ya conocés Pred Gl Trn podés dejar una reseña abajo; siempre nos encanta conocer tu opinión. Aún estamos trabajando para tener más información de Pred Gl Trn, así que volvé pronto. Mientras tanto, tomá nota del número de artículo que identifica el producto IX3870 para que lo puedas encontrar de nuevo fácilmente. Está categorizado como: Guantes.', 
49999, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/8MfFwNf');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(3, 'Medias de Fútbol adi 24 AEROREADY', 
'Medias de fútbol con tecnología de absorción hechas parcialmente con materiales reciclados. Alcanzá tus objetivos con estas medias de fútbol adidas diseñadas para impulsar tu rendimiento. El tejido transpirable AEROREADY mantiene los pies cómodos y secos, mientras que el acolchado suave reduce la presión de los tacos para que puedas concentrarte en dominar el terreno de juego. Diseñadas tanto para principiantes como para profesionales, estas medias largas sacan a relucir tus mejores habilidades.', 
15999, 
150,  -- Inventé un stock de 150 unidades
'https://ibb.co/XVyh6Y7');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(3, 'Medias al Tobillo Delgadas y Livianas 3 Pares', 
'Medias livianas hechas con una mezcla de materiales reciclados y renovables. Con soporte en el arco, una punta sin costuras y un poco de elasticidad, estas medias al tobillo livianas son perfectas para tus necesidades diarias. Un logo adidas Badge of Sport en contraste se destaca en el tobillo. Vienen en un empaque de tres pares para que puedas lavar un par y mientras tanto, usar otro. Al menos un 50% de este producto está hecho de una mezcla de materiales reciclados y renovables.', 
16999, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/MC6g69S');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(3, 'Mochila Clásica Badge of Sport', 
'Una mochila apta para todo con mucho espacio, hecha parcialmente con materiales reciclados. La mochila está de vuelta. Este modelo adidas clásico ofrece una manera moderna de guardar todas tus cosas. Desde tu taza de café reutilizable hasta tu notebook y tu ropa de running. También tiene un bolsillo lateral para esa botella de agua tan importante.', 
44999, 
120,  -- Inventé un stock de 120 unidades
'https://ibb.co/8MVVpSD');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(3, 'Mochila Classic Badge of Sport 3 Tiras', 
'Una mochila sencilla y práctica, hecha parcialmente con materiales reciclados. Echale un vistazo a esta mochila adidas. Está hecha de un tejido plano de poliéster resistente que la hará lucir como nueva, incluso si la usás a diario. El compartimiento principal con cierre cuenta con espacio suficiente para llevar todo lo necesario para un día de trabajo duro, ya sea en la oficina o en el gimnasio. En el bolsillo frontal con cierre podés llevar tu teléfono y billetera a la mano, y en los bolsillos laterales de malla podés cargar tu botella de agua.', 
44999, 
130,  -- Inventé un stock de 130 unidades
'https://ibb.co/SwDGDgy');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(3, 'Gorra Plegable HEAT.RDY X-City para Running', 
'Una gorra de running para días de mucho calor, hecha parcialmente con materiales reciclados. Mantené la frescura mientras corrés en días de calor con esta gorra plegable de running de adidas. Los paneles de malla favorecen la ventilación y la tecnología HEAT.RDY mantiene tu cuerpo cómodo y seco en los momentos más intensos. El cierre elástico ajustable en la parte trasera tiene un hueco oculto para que puedas prevenir que tu cuello se sobrecaliente a causa del cabello. Este producto, hecho con una serie de materiales reciclados y al menos un 40 % de contenido reciclado, representa solo una de nuestras soluciones para acabar con los residuos plásticos.', 
48999, 
150,  -- Inventé un stock de 150 unidades
'https://ibb.co/cQXrJ5y');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(3, 'Gorra Running x Adizero HEAT.RDY Liviana', 
'Una gorra de running ligera hecha parcialmente con materiales reciclados. Competí como nunca con esta gorra de running adidas HEAT.RDY. Su estructura liviana no se interpone en tu camino, y la ventilación cortada a láser se encarga de que el sudor no interrumpa tu rutina. La correa en la parte posterior ayuda a conseguir un ajuste perfecto. Podés subir la visera o bajarla para protegerte de los rayos del sol. Hecho con al menos un 70 % de contenido reciclado, este producto representa solo una de nuestras soluciones para ayudar a ponerle fin a la contaminación por plástico. ', 
53999, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/4p9Mx6W');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(3, 'Pala de Pádel Metalbone Team Ligera', 
'Una pala de pádel de forma redonda para jugadores avanzados. Esta pala ligera para pádel es una opción altamente competitiva. Esta pala está diseñada para jugadores de nivel intermedio que optan por menos gramos en su brazo para lograr el máximo rendimiento. La tecnología de estructura octogonal integra una estructura tubular en el corazón y marco de la pala para proporcionar máxima resistencia a la torsión. El refuerzo estructural en el perímetro también aumenta la rigidez. La pala favorece los tiros potentes, así como los que tienen efecto, gracias a la rugosidad del Spin Blade Grit en la superficie. La superficie de fibra de vidrio con el interior de EVA suave de alto rendimiento garantiza el más alto nivel de comodidad al jugar.', 
506999, 
80,  -- Inventé un stock de 80 unidades
'https://ibb.co/7WCHbyH');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(3, 'Pala de Pádel Metalbone Carbon CTRL', 
'Una pala de pádel de forma redonda para jugadores avanzados. Esta pala para jugadores de alto nivel está orientada hacia el control sin sacrificar el poder. Combina materiales de alta calidad con tecnologías de vanguardia. La estructura octogonal, un esqueleto tubular en el corazón y marco de la pala, aumenta la rigidez. El refuerzo estructural aumenta la resistencia a la alta torsión. El Spin Blade en la superficie asegura máxima eficiencia en tiros con efecto.', 
701999, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/fM5nZ00');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(3, 'Pelota Argentum 24 Club', 
'Una pelota recreacional con un diseño basado en la pelota oficial de la primera división de Argentina. Luciendo gráficos que celebran dos décadas de la pelota adidas Argentum oficial para partidos, esta pelota Club resistente es ideal para partidos casuales y entrenamientos. La cámara de butilo se encarga de que siempre esté lista para dominar los partidos en el parque. Su llamativo diseño representa el color y la pasión del fútbol argentino.', 
49999, 
50,  -- Inventé un stock de 50 unidades
'https://ibb.co/DzsHpR7');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(3, 'Pelotas Speed Rx', 
'Pelotas de padel livianas con máxima durabilidad. Estas pelotas adidas Speed Rx para padel se destacan por su gran durabilidad. Están confeccionadas en caucho de alta densidad y se sienten livianas para prolongar su resistencia al desgaste. Estas pelotas vienen en un paquete de tres.', 
14999, 
120,  -- Inventé un stock de 120 unidades
'https://ibb.co/gmfZZ9S');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(3, 'Pelota Argentum 23 Club', 
'Una pelota inspirada por un ícono argentino y hecha parcialmente con material reciclado. De 1978 al futuro. Los llamativos gráficos difuminados de esta pelota adidas Argentum 23 se inspiran en la icónica pelota Tango Rosario que protagonizó la coronación de Argentina como campeón del mundo en suelo local. Su estructura de TPU cosida a mano y su cámara de butilo hacen que esta pelota esté siempre lista para cualquier encuentro.', 
27999, 
160,  -- Inventé un stock de 160 unidades
'https://ibb.co/ZN1Wf1J');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(3, 'Guantes Tiro League', 
'Guantes de fútbol en tejido suave que funcionan con pantallas táctiles. Sentí abrigo dentro y fuera de la cancha. Estos guantes de fútbol adidas Tiro League te mantienen cómodo gracias a sus puños ajustados acanalados y su tejido suave. Las yemas de los dedos están diseñadas para funcionar con pantallas táctiles para que puedas estar atento a las últimas puntuaciones cuando no eres parte de la acción.', 
35999, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/ZWtqRnC');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(3, 'Pelota Île-De-Foot 24 Pro', 
'La pelota oficial en Francia, esta pelota está hecha con materiales naturales. Con los colores de la bandera francesa y anillos inspirados en las pistas de running, esta pelota de fútbol adidas Île-De-Foot 24 Pro está lista para protagonizar el escenario más importante del deporte. La pelota oficial de los torneos masculino y femenino, tiene una estructura sin costuras y una cámara de butilo de alta calidad que la ayudan a ofrecer un desempeño sin igual. La certificación FIFA Quality Pro es garantía de excelencia.', 
179999, 
70,  -- Inventé un stock de 70 unidades
'https://ibb.co/TctL47B');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(3, 'Canilleras Tiro Club', 
'Canilleras de fútbol de perfil bajo hechas parcialmente con material reciclado. Defendete sin sacrificar la movilidad. Estas canilleras adidas Tiro Club fueron diseñadas para los jugadores que prefieren la comodidad de las almohadillas que se incorporan a sus medias. Ligeras y flexibles, su placa protectora rígida incorpora un refuerzo interior de EVA que absorbe los impactos y perforaciones para una mayor ventilación.', 
19999, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/sVNjBJB');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(3, 'Canilleras Tiro League', 
'Canilleras con mangas de compresión, hechas parcialmente con material reciclado. Despliega tus mejores jugadas. Estas canilleras Tiro League de adidas fueron diseñadas para futbolistas audaces que nada ni nadie los detiene. Su diseño incorpora una placa protectora flexible y unas mangas de compresión que te garantizan un ajuste cómodo y seguro. El refuerzo interior de EVA moldeada absorbe los impactos mientras demostrás quién manda en el campo.', 
45999, 
120,  -- Inventé un stock de 120 unidades
'https://ibb.co/ct96yBg');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(3, 'Medias Uniforme Alternativo River Plate 24/25', 
'Medias de fútbol. Demostrá tus habilidades, completá tu uniforme con estas medias. Su tejido con tecnología de absorción AEROREADY mantiene tus pies secos y su diseño garantiza un ajuste perfecto. Son acolchadas en las zonas donde más lo necesitás, así mantenés tus pies cómodos del primer al último minuto del partido.', 
17999, 
140,  -- Inventé un stock de 140 unidades
'https://ibb.co/HHD7TPF');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(3, 'Medias Uniforme Titular Boca Juniors 24/25', 
'Medias para el campo de fútbol. Cuando llega el momento de mostrar tus habilidades, completá tu uniforme con estas medias de fútbol. Su tejido con tecnología de absorción AEROREADY mantiene tus pies secos y su diseño específico para el pie derecho y el izquierdo garantiza un ajuste perfecto. El acolchado en las zonas donde más lo necesitás se encarga de mantener tus pies cómodos del primer al último minuto del partido.', 
17999, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/pnNKMr8');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(3, 'Medias Alternativas Selección Argentina 1994', 
'Medias de la Selección Argentina. Evocá los vibrantes recuerdos de un icónico equipo de Argentina. Las medias alternativas de Argentina 1994 traen de vuelta la estética icónica de los 90 para elevar tu estilo personal. La tecnología de absorción AEROREADY, el talón y la zona de los dedos acolchonados son los encargados de mantenerte cómodo a cada paso.', 
21999, 
160,  -- Inventé un stock de 160 unidades
'https://ibb.co/Tbxh4H2');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(4, 'Smartwatch Nictom Nt06 Negro Bluetooth Llamadas', 
'El Smartwatch NT06 tiene una pantalla de 1,28”, reproduce audio y podés intercambiarle la malla para disfrutar de varios estilos. Ideal para acompañarte en todo momento, ya que podés recibir notificaciones, controlar la cámara y la música de tu Smartphone y medir tu frecuencia cardíaca y presión arterial.', 
26999, 
80,  -- Inventé un stock de 80 unidades
'https://ibb.co/ySXFZpj');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(4, 'Smartwatch - Amazfit Bip 3 - Azul', 
'Contenido del paquete: 1X Reloj Amazfit BIP 3. 1X Cable de carga. 1X Manual de usuario. Especificaciones: Tamaño de pantalla: 1.69” Tipo de visualización: TFT Resolución de la pantalla: 240x280. Bluetooth: 5.0 Capacidad de la batería: 280mAh. Duración de la batería: Hasta 14 días dependiendo el uso. Tiempo de carga: 2.5hs Método de carga: Base magnética. Contestar mensajes: No. Gestión de llamadas: No. GPS: No. Modo de entrenamiento: 60 modos. Almacenamiento de música: No. Monitor de sueño: Sí. Monitor de estrés: Sí. Monitor de ciclo menstrual: Sí.', 
83673, 
50,  -- Inventé un stock de 50 unidades
'https://ibb.co/Lnx7t2y');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(4, 'Smartwatch Reloj Inteligente Fitband Amazfit Band 7 Negro', 
'¡Descubre la innovación y el rendimiento excepcionales con el Amazfit Band 7! Este sofisticado smartband de la reconocida marca Amazfit, fabricado por Huami, lleva tu estilo de vida activo al siguiente nivel al ofrecer una combinación impresionante de características avanzadas y diseño elegante.', 
62999, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/sFwL7mm');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(4, 'Smartwatch Xiaomi Mi Band 8 Reloj Inteligente Global Sp02', 
'Xiaomi ha decidido darle una vuelta de tuerca a su pulsera más famosa. Llega oficialmente la Xiaomi Smart Band 8, la octava generación de la popular Mi Band. n esta ocasión tenemos un diseño renovado. No es que haya cambiado radicalmente su estética, pero sí que permite por primera vez acoplar distintos accesorios que permitirán llevarla no solo en la muñeca, sino también en el cuello como un colgante o en la zapatilla como un complemento. Seguimiento preciso de tu entrenamiento. Registrá todos tus recorridos en tiempo real gracias al módulo GPS incorporado en el smartwatch.', 
65999, 
150,  -- Inventé un stock de 150 unidades
'https://ibb.co/M1MHxNB');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(4, 'Reloj Inteligente Smartwatch SB04 Azul Bluetooth Android Notificaciones Smartband', 
'En Dx Electrónica somos apasionados por la tecnología, acercándote junto a Frávega las últimas tendencias en las mejores marcas. Con el SmartWatch M4 vas a poder seguir la actividad de tu día completo: pasos, calorías quemadas, kilometraje y frecuencia cardíaca. Además, cuenta con recordatorio de llamada, notificaciones de mensajes y recordatorio de sedentarismo. Y lo más Importante: incluye la función de cámara remota para que puedas tomar las mejores selfies!', 
12999, 
90,  -- Inventé un stock de 90 unidades
'https://ibb.co/Ntg8KVY');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(4, 'SmartWatch Reloj Inteligente NG-SW09 Actividad Fisica Notificaciones', 
'El Noga Watch NG-SW09 es un Smartwatch de Tecnología Superior compatible con Android e iOS. Descargando la App "Fit Pro" a tu Celular podrás sincronizar tu Noga Watch a través de Tecnología Bluetooth y recibir las notificaciones de tu Celular o Tablet, y también poder detectar, registrar y evaluar tu rendimiento corporal, activar las notificaciones y mucho más.', 
26999, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/j8M5rSt');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(4, 'Reloj Inteligente Smartwatch Deporte Pantalla 2.10” Gris', 
'Compatible con cualquier teléfono móvil que posea Bluetooth 5.2 y sistemas operativos Android 6 o superior - IOS 10 o superior. Excelente para recibir notificaciones de llamadas, WhatsApp, texto entre otras tantas funciones de tu Smartphone cuando tu teléfono está cerca.', 
31343, 
130,  -- Inventé un stock de 130 unidades
'https://ibb.co/mhNK1qT');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(4, 'Smartwatch JD Hawai Negro 1.43 Bluetooth Llamadas Spo2', 
'El Smartwatch JD Hawai es un reloj inteligente de última generación con una pantalla AMOLED de 1.43 pulgadas y una impresionante resolución de 466x466 píxeles. Diseñado para la vida activa, ofrece una gama de características excepcionales, incluyendo 100 modos deportivos para seguir y mejorar tus actividades físicas. Con una clasificación de resistencia al agua y polvo IP68, este reloj es capaz de soportar diversas condiciones, lo que lo convierte en un compañero confiable para tus aventuras al aire libre. Además, el Smartwatch JD Hawai cuenta con avanzadas capacidades de seguimiento de la salud, como la medición de oxígeno en sangre, la presión arterial, la frecuencia cardíaca y el monitoreo del sueño.', 
51999, 
120,  -- Inventé un stock de 120 unidades
'https://ibb.co/x5Z8Kwx');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(4, 'Smartwatch Huawei Watch GT5 46mm Blue', 
'El reloj está fabricado cuidando hasta el último detalle, con revestimientos ultraduros en el cuerpo y la pantalla, así como un acabado uniforme de nanopelícula impermeable en todo el dispositivo, para duplicar la resistencia a los rayones, al agua y a la corrosión. Presiona el botón para quitar la correa, con el innovador diseño HUAWEI EasyFit, y elige un color que combine con tu atuendo o se adapte a tu estado de ánimo. Pulsa el botón superior e inferior al mismo tiempo para hacer una captura de pantalla del reloj y ve a la Galería de tu teléfono para compartirla. Navega con facilidad por una interfaz optimizada, con aplicaciones codificadas por colores, tarjetas simplificadas y transiciones fluidas.', 
449999, 
70,  -- Inventé un stock de 70 unidades
'https://ibb.co/DRvhTnZ');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(4, 'Auriculares Inalambricos Bluetooth Vincha JBL Tune 510BT Blanco', 
'Los auriculares JBL Tune 510BT ofrecen comodidad y calidad de sonido en un diseño inalámbrico de vincha. Su batería proporciona hasta 40 horas de reproducción continua y su carga rápida permite obtener 2 horas de autonomía con solo 5 minutos de carga. Están diseñados para quienes buscan disfrutar de música sin interrupciones, con conectividad Bluetooth y un diseño ergonómico. Están equipados con un diafragma de 32 mm que ofrece una respuesta de frecuencia de 20 Hz a 20 kHz y una sensibilidad de 103,5 dB, ideal para un sonido nítido y equilibrado. Aunque no cuentan con cancelación activa de ruido, su diseño cerrado contribuye a aislar el sonido externo.', 
71999, 
90,  -- Inventé un stock de 90 unidades
'https://ibb.co/DWLrLKS');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(4, 'Auriculares Jbl Tune 520bt Black', 
'Auriculares inalámbricos supraaurales con sonido JBL Pure Bass Los auriculares JBL Tune 520BT transmiten el potente sonido JBL Pure Bass gracias a la última tecnología 5.3 BT. Estos auriculares, muy fáciles de usar, ofrecen hasta 57 horas de puro placer auditivo y 3 horas adicionales de batería con solo 5 minutos de carga. Descarga la aplicación gratuita JBL Headphones y personaliza tu sonido a través del ecualizador, las indicaciones de voz te ayudarán a conocer las prestaciones de los auriculares. Gestiona las llamadas, el sonido y el volumen desde el auricular, todo ello con el cómodo control de botones.', 
75099, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/PNMYkZP');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(4, 'Auriculares Sony Bluetooth Inalámbricos WH-CH520 beige', 
'ESPECIFICACIONES » Peso: Aprox. 147 g » Tipo de auriculares: Cerrado » Unidad de diafragma: 30 mm » Respuesta en frecuencia (comunicación Bluetooth®): 20 Hz-20.000 Hz (muestreo de 44,1 kHz) » Control de volumen: Sí » Entradas: No » DSEE Extreme: No » DSEE HX: No » DSEE: Sí » S-Master HX: No » Funcionamiento pasivo: No » MODO SONIDO AMBIENTE: No » Tiempo de carga de batería: Aprox. 3 h » Método de carga de batería: USB (Type-C) » DURACIÓN DE LA BATERÍA (TIEMPO DE COMUNICACIÓN CONTINUA): Máx. 40 h » Duración de la batería (tiempo en espera): Máx. 200 h » Versión de Bluetooth®: Especificación Bluetooth® versión 5.2 » Alcance efectivo: 10 m » Rango de frecuencia: Banda de 2,4 GHz.', 
76999, 
70,  -- Inventé un stock de 70 unidades
'https://ibb.co/QM5hj6Z');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(4, 'Auriculares Inalambricos Xiaomi Redmi Buds 4 Lite Bluetooth Negro', 
'Especificaciones - Número de modelo del producto: M2231E1 - Colores del producto: Negro Tamaño y peso - Peso de un auricular: 3,92 g - Tamaño de un auricular: 32,24 x 18,22 x 19,63 mm - Peso del estuche de carga: Unos 26,7 g - Tamaño del estuche de carga: 55,6 x 47,3 x 22,2 m - Peso total: 35 g Carga - Batería: 35+320 mAh - Auriculares: 90 min - Estuche de carga: 120 min Puerto de carga - Tipo C - Parámetros de entrada de los auriculares: 5 V - 50 mA - Parámetros de entrada del estuche de carga: 5 V - 350 mA - Parámetros de salida del estuche de carga: 5 V - 150 mA Conexión - Conectividad inalámbrica: Bluetooth® 5.3 - Protocolos Bluetooth: A2DP, AVRCP, HFP.', 
51599, 
120,  -- Inventé un stock de 120 unidades
'https://ibb.co/Z1H2tKc');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(4, 'Auriculares Inalambricos Earfun Air Cancelacion de Sonido Negro', 
'EarFun Air se adapta a la perfección y de forma segura a los oídos humanos según el tanque mejorado impreso en 3D de modelos de oídos masivos, asi como los resultados de las pruebas de modelado, que se analizaron miles de formas de oídos humanos. Controle su música, llamadas y asistente de voz simplemente a través de la tecnología táctil intuitiva integrada en ambos auriculares. La función de diseño inteligente significa que puede activar el Asistente de Google o Siri con un cómodo toque triple en el auricular derecho/izquierdo. Gracias a la tecnología mejorada de llamada de 4 micrófonos, que filtra el ruido molesto a tu alrededor.', 
94999, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/HTFJjCZ');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(4, 'Auriculares Inalambricos Stromberg Warpbuds In Ear Rojo', 
'Los auriculares inalámbricos Stromberg Warpbuds In-Ear son la mejor opción para disfrutar de tu música, podcasts y llamadas en cualquier lugar. Con su diseño elegante y ergonómico, se adaptan perfectamente a tu oído para ofrecerte una experiencia de escucha cómoda y envolvente.', 
49990, 
130,  -- Inventé un stock de 130 unidades
'https://ibb.co/m9W36Rx');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(4, 'Auriculares Inalambricos Stromberg Warpbuds In Ear Verde', 
'Los auriculares inalámbricos Stromberg Warpbuds In-Ear son la mejor opción para disfrutar de tu música, podcasts y llamadas en cualquier lugar. Con su diseño elegante y ergonómico, se adaptan perfectamente a tu oído para ofrecerte una experiencia de escucha cómoda y envolvente.', 
49990, 
130,  -- Inventé un stock de 130 unidades
'https://ibb.co/tzNTxTV');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(4, 'Smartband Suono M7 Rosa', 
'El área de visualización de la pantalla se ha aumentado en un 25%, haciendo más fácil ver la pantalla. Ya sea viendo el ritmo cardíaco mientras corres o leyendo noticias en el viaje, es una cuestión trivial de levantar la mano. Al mismo tiempo, el diseño único de la pantalla de la pista sigue siendo ligero y sin sentido de peso, y cada imagen se presenta delicadamente.', 
7999, 
150,  -- Inventé un stock de 150 unidades
'https://ibb.co/mD6WCJk');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(4, 'Smartband pulsera inteligente Smart Kassel SK-FB2401', 
'Tené un registro de tu actividad deportiva con la smartband Kassel SK-2401. Desde su pantalla podrás tener acceso al monitoreo del sueño, ver la cantidad de pasos hechos, calorías quemadas y mucho más. Además, te permitirá ver las notificaciones de tu smartphone para que estés siempre conectado y no te pierdas de nada.', 
18509, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/XxwQH7S');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(4, 'Smart Band Huawei Band 9 Rosa Claro', 
'Con un diseño elegante y confiable, la Band 9 de Huawei se presenta como una de las mejores opciones para tu muñeca. El área de visualización de la pantalla es de 1,47 pulgadas y cuenta con tecnología MAOLED y una resolución de 194 x 368 px. Gracias a las esferas temáticas y Always on Display (AOD) la relación con tu Band 9 va a ser súper fluida y sencilla. La nueva galería de esferas del reloj ofrece estilos personalizables y vas a poder elegir entre los innumerables diseños de la tienda para lucir cada día una esfera diferente que combine con tu look.', 
77999, 
80,  -- Inventé un stock de 80 unidades
'https://ibb.co/r2J6XJy');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(4, 'Smartband Suono M6 Negro', 
'Alcance: 2 metros. Tiempo de Carga inicial: 8/10 horas por única vez. Tiempo de Carga de mantenimiento: 4 horas. App: Fit Here. Pantallas: 3 modos de pantallas.', 
7299, 
150,  -- Inventé un stock de 150 unidades
'https://ibb.co/17L46RF');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(2, 'Zapatillas SL 72 Sporty & Rich Originals', 
'Zapatillas adidas SL 72 diseñadas con Sporty & Rich. Lanzadas por primera vez en 1971 con un exterior suave y suela de caucho resistente, estas zapatillas adidas SL 72 se adelantaban a su época. Casi 50 años después, su diseño atemporal sigue inspirando. Este par creado con Sporty & Rich luce una estética que evoca los archivos de running de los 70, con colores contrastantes y detalles retro.', 
189999, 
150,  -- Inventé un stock de 150 unidades
'https://ibb.co/K0fPjmY');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(2, 'Zapatillas Gazelle Argentina', 
'Zapatillas atemporales que destacan tu amor por Argentina. Tu amor por el fútbol corre por tus venas y por estas zapatillas adidas Gazelle. Regresando a sus raíces deportivas, estas clásicas zapatillas con las 3 Tiras lucen colores y un logo que demuestran tu apoyo por Argentina. El toque final lo ponen la parte superior de cuero y su famoso diseño de corte bajo.', 
189999, 
120,  -- Inventé un stock de 120 unidades
'https://ibb.co/gSCtp88');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(2, 'Zapatillas Samba OG', 
'Samba Originals. Nacidos en las canchas de fútbol, los Samba son un ícono atemporal de la moda urbana. Esta silueta se mantiene fiel a su legado con un discreto y elegante exterior de cuero suave, revestimientos de gamuza y una suela de caucho natural, convirtiéndose en un par indispensable para cualquier armario.', 
189999, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/9V81rCC');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(2, 'Zapatillas Everyset Trainer', 
'Zapatillas cómodas para el gimnasio, hechas parcialmente con materiales reciclados. Si vas a comenzar tu viaje en el mundo del fitness, estas zapatillas adidas son perfectas para vos. Presentan un diseño estable para que te sientas seguro en el gimnasio, ya sea probando nuevas máquinas o aprendiendo a ejercitarte con las pesas. El tejido del exterior es suave, transpirable y muy cómodo. La mediasuela de doble densidad con espuma EVA más firme en el exterior y un interior de EVA más suave te ofrecen el equilibrio perfecto sin renunciar a la comodidad. La forma plana crea una sensación de estabilidad, para que puedas concentrarte en tu ejercicio.', 
139999, 
160,  -- Inventé un stock de 160 unidades
'https://ibb.co/tPJ0rdp');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(2, 'Botines Copa Pure 2 League moqueta', 
'La conexión que se genera entre tu cerebro y tus tacos. Conectá con la pelota en todos los niveles con los adidas Copa Pure 2. El cómodo exterior de estos botines League muestra detalles vintage, asegurando que luzcás y te sintás tan elegante como tu fútbol. Su empeine en cuero vacuno ofrece un toque refindo. La suela de caucho con tachones agrega estilo en el juego en canchas de pasto sintético. Este producto contiene al menos un 20 % de material reciclado. Utilizando materiales reciclados disminuimos los residuos, nuestra dependencia de los recursos finitos y la huella que generan los productos que fabricamos.', 
159999, 
120,  -- Inventé un stock de 120 unidades
'https://ibb.co/6Ff9rw3');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(2, 'Zapatillas de Running Supernova Rise', 
'El mejor calzado de runnign. Galardonadas con el premio Womens Health al mejor calzado de running en todos los niveles, hemos diseñado las Supernova Rise para mantenerte cómoda kilómetro tras kilómetro. Con tecnología Dreamstrike+, la mediasuela está amortiguada con una espuma especializada. Nuestro sistema de varillas de soporte de espuma más densa proporciona una trasición sin preoupaciones del talón a la punta.', 
169999, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/Wf8Gbcq');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(2, 'Botines F50 Club Cancha Cubierta', 
'Botines veloces con un histórico legado hechos parcialmente con materiales reciclados. Liberá tu velocidad con los adidas F50. Creados para desblquear todo el potencial de tu aceleración, movimiento y velocidad. Estos botines adidas Club presentan una parte superior Fiberskin texturizada y una lengüeta perforada que te ofrecen una comodidad extraordinaria. La suela de caucho de gran agarre te ayuda a marcar la diferencia en cancha cubierta.', 
109999, 
150,  -- Inventé un stock de 150 unidades
'https://ibb.co/540M88C');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(2, 'Zapatillas de Running Pureboost 5', 
'Zapatillas de running para uso diario hechas parcialmente con materiales reciclados. Salí a correr de mañana y a hacer mandados en la ciudad con estas zapatillas de running adidas. Nuestra amortiguación BOOST más ligera a la fecha mantiene tus pasos energizados y el exterior de malla está optimizado para una máxima transpirabilidad y soporte. Caminá con seguridad sobre cualquier terreno con la suela Adiwear de gran agarre.', 
189999, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/PGTL6X2');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(2, 'Zapatillas VL Court 3.0', 
'Zapatillas de cuero con amortiguación que son fáciles de combinar. Estas zapatillas adidas lucen líneas definidas y una parte superior de cuero revestido suave sobre una suela vulcanizada estilo skater. Usalas con un pantalón corto o con una pollera holgada. De cualquier manera, querrás mostrar cada ángulo. La amortiguación ligera y el forro interno suave mantienen tus pies cómodos de la mañana a la noche.', 
129999, 
150,  -- Inventé un stock de 150 unidades
'https://ibb.co/Z2D4GR6');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(2, 'Zapatillas de Running Galaxy 7', 
'Zapatillas de running con sujeción y amortiguación. Cada carrera es un viaje de descubrimiento. Ponete estas zapatillas de running adidas y liberá tu potencial. La mediasuela con amortiguación Cloudfoam te ofrece una pisada más cómoda mientras aumentás tu resistencia. La parte superior textil es resistente al desgaste y te ofrece soporte desde tu primera vuelta hasta tu primera carrera de 5K.', 
79999, 
120,  -- Inventé un stock de 120 unidades
'https://ibb.co/yPcW1Sh');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(2, 'Tenis Ultraboost 5', 
'Zapatillas de running receptivas hechas parcialmente con materiales reciclados. Ya sea corriendo en la pista de atletismo o por las calles de la ciudad, siente un impulso extraordinario en cada zancada con estas zapatillas de running Ultraboost creadas por adidas. La mediasuela con tecnología BOOST, nuestra amortiguación más ligera hasta la fecha, proporciona un retorno de energía increíble. Combinadas con el sistema Torsion System para una estabilidad del talón a la punta, ofrecen una pisada suave y cómoda que tienes que sentir para creer.', 
249999, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/8KYK67n');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(2, 'Zapatillas X_PLR Path', 
'Zapatillas livianas hechas parcialmente con una mezcla de materiales reciclados y renovables. Sin importar si estás explorando las calles de la ciudad o paseando por tu vecindario, estas zapatillas X_PLR Path de adidas brindan estilo y comodidad a cada paso del camino. La ligera mediasuela Cloudfoam brinda amortiguación en todo momento, mientras que la suela de caucho te permite explorar con confianza. La parte superior textil y las 3 Tiras de TPU le inyectan actitud adidas al look.', 
94999, 
150,  -- Inventé un stock de 150 unidades
'https://ibb.co/9h9pTHH');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(2, 'Zapatillas Country OG SFTM', 
'Zapatillas prémium hechas en cuero y gamuza con detalles modernos. Desde los puristas de la moda urbana hasta los amantes del calzado deportivo, todos encontrarán alguna razón para enamorarse de estas Country OG SFTM de adidas Originals. Presentan un exterior de nylon con detalles de cuero brillante y gamuza que le confieren un look clásico tan sofisticado como actual. Los cordones bicolor se entrelazan a través de unos ojales metálicos brillantes y cuentan con un tope en los extremos para que sean más fáciles de amarrar.', 
183999, 
120,  -- Inventé un stock de 120 unidades
'https://ibb.co/6YMnBFJ');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(2, 'Botines Predator Elite Terreno Firme', 
'Botines para goleadores hechos parcialmente con una mezcla de materiales reciclados y renovables. Cuando tenés la portería en la mira, adidas Predator convierte la presión en una precisión milimétrica. Estos botines Elite presentan elementos Strikeskin que se adhieren a la pelota para golpes precisos, estratégicamente situados en el exterior flexible HybridTouch 2.0. El cuello en adidas PRIMEKNIT ofrece sujeción y la suela Controlframe 2.0 te permite dominar en terreno firme.', 
399999, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/MZ3X0c1');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(2, 'Botines Copa Pure 2 League Césped Artificial', 
'Crea una conexión con botines hechos parcialmente con materiales reciclados. La conexión que se genera entre tu cerebro y tus tacos. Conectá con la pelota en todos los niveles con los adidas Copa Pure 2. El cómodo exterior de estos botines League muestra detalles vintage, asegurando que luzcás y te sintás tan elegante como tu fútbol. Su empeine en cuero vacuno ofrece un toque refindo. La suela de caucho con tachones agrega estilo en el juego en canchas de pasto sintético.', 
159999, 
120,  -- Inventé un stock de 120 unidades
'https://ibb.co/Hq7n7rv');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(2, 'Zapatillas Crazychaos 2000', 
'Zapatillas cómodas con una onda retro. Regresá a principios de los 2000. Estas zapatillas adidas recuperan el espíritu descomplicado del milenio con curvas llamativas y una rica mezcla de materiales. La amortiguación Cloudfoam hace que cada paso se sienta como caminar sobre las nubes. La suela de caucho resistente con agarre superior brinda soporte en tus aventuras de la punta del momento.', 
119999, 
150,  -- Inventé un stock de 150 unidades
'https://ibb.co/FDwk905');  -- URL de la imagen del producto

-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(2, 'Zapatillas de Running Galaxy 7', 
'Zapatillas de running con sujeción y amortiguación. Cada carrera es un viaje de descubrimiento. Ponete estas zapatillas de running adidas y liberá tu potencial. La mediasuela con amortiguación Cloudfoam te ofrece una pisada más cómoda mientras aumentás tu resistencia. La parte superior textil es resistente al desgaste y te ofrece soporte desde tu primera vuelta hasta tu primera carrera de 5K.', 
79999, 
180,  -- Inventé un stock de 180 unidades
'https://ibb.co/WKsRCWL');  -- URL de la imagen del producto


-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(2, 'Free Hiker 2.0 Gore-Tex', 
'Colinas, arroyos, terrenos rocosos: disfruta cada momento de libertad. Llegá más lejos con total comodidad con las Free Hiker 2.0 GORE-TEX. El verdadero recorrido va mucho más allá del camino que tenés por delante. Se trata de descubrir tus verdades, alcanzar nuevas cimas y escapar del ruido de la vida diaria. El recorrido se trata de vos. De estar presente en el momento.', 
322999, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/Kq8NB19');  -- URL de la imagen del producto


-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(2, 'Runfalcon 5 TR', 
'Runfalcon 5 Tr es un nuevo producto para Hombre de adidas. Te invitamos a ver las imágenes para apreciar más detalles desde diferentes ángulos. Si ya conocés Runfalcon 5 Tr podés dejar una reseña abajo; siempre nos encanta conocer tu opinión. Aún estamos trabajando para tener más información de Runfalcon 5 Tr, así que volvé pronto. Mientras tanto, tomá nota del número de artículo que identifica el producto JI4084 para que lo puedas encontrar de nuevo fácilmente. Está categorizado como: Zapatillas', 
99999, 
120,  -- Inventé un stock de 120 unidades
'https://ibb.co/xGPSJjg');  -- URL de la imagen del producto


-- Insertamos el producto en la tabla PRODUCTO
INSERT INTO PRODUCTO (id_categoria, nombre, descripcion, precio, stock, imagen_url)
VALUES 
(2, 'Zapatillas Response', 
'Zapatillas de running cómodas hechas parcialmente con materiales reciclados. Ya sea para completar una serie de vueltas suave o para lograr tu mejor marca personal, estas zapatillas de running adidas te ofrecen la sujeción que necesitás para cumplir tus objetivos. La mediasuela de EVA ofrece comodidad y amortiguación, mientras que la suela de gran agarre mantiene tu ritmo estable. Su diseño versátil se adapta a la perfección a tus actividades del día a día.', 
99999, 
100,  -- Inventé un stock de 100 unidades
'https://ibb.co/QFt8jgK');  -- URL de la imagen del producto