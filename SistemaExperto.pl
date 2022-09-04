:- use_module(library(pce)).
:-use_module(library(pce_style_item)).
:-pce_image_directory('./images').
resource(login,image,image('inicio.bmp')).
resource('1.JPG',image,image('1.bmp')).
resource('2.JPG',image,image('2.bmp')).
resource('3.JPG',image,image('3.bmp')).
resource('4.JPG',image,image('4.bmp')).
resource('5.JPG',image,image('5.bmp')).
resource('6.JPG',image,image('6.bmp')).
resource('7.JPG',image,image('7.bmp')).
resource('8.JPG',image,image('8.bmp')).
resource('9.JPG',image,image('9.bmp')).
resource('10.JPG',image,image('10.bmp')).
resource('prueba',image,image('prueba.bmp')).


:- new(VentanaE,dialog('SISTEMA EXPERTO ORGANICOOK')),
     %creacion de objetos
     new(Etiqueta,label(nombre,'SISTEMA EXPERTO')),
     new(Salir, button('SALIR',message(VentanaE,destroy))),
     new(Usuario, button('Solicitar Sugerencia',message(@prolog,usuario))),
     new(Figure, figure),
     new(Bitmap, bitmap(resource(login), @on)),
     %llamado de los objetos
     send(Etiqueta,font,font(arial,bold,20)),
     send(VentanaE,display,Etiqueta,point(190,0)),
     send(Bitmap, name, 1),
     send(Figure, display, Bitmap),
     send(Figure, status, 1),
     send(VentanaE, display,Figure, point(25,40)),
     send(VentanaE,display,Usuario,point(30,430)),
     send(VentanaE,display,Salir,point(400,430)),
     send(VentanaE,open).

usuario:-
    new(VentanaU,dialog('Organicook')),
    new(Etiqueta,label(nombre,'Sugerencia de Dietas: Cliente Organicook')),
    new(Salir, button('Regresar',message(VentanaU,destroy))),
    new(Genero,
        menu('1.-Selecciona tu genero')),
    send_list(Genero, append,['Femenino','Masculino']),
    new(Altura,
        menu('2.-¿En que rango de altura se encuentra?')),
    send_list(Altura, append,['menor a 1.55','1.55 a 1.76','mas de 1.76']),
    new(Edad,
        menu('3.-¿En que rango de edad se encuentra?')),
    send_list(Edad,append,['18 a 29 anos','30 a 60 anos','mayor a 60 anos']),
    new(Objetivo,
        menu('4.-¿Cual es su objetivo?')),
    send_list(Objetivo,append,['Bajar de peso','Mantener peso actual','Aumentar masa muscular']),
    new(Actividad,
        menu('5.-¿Como califica su actividad fisica?')),
    send_list(Actividad,append,['Baja','Media 1 a 3 por semana', 'Alta mas de 4 por semana']),
    new(Enfermedad,
        menu('6.-¿Tiene alguna de las siguientes condiciones medicas?')),
    send_list(Enfermedad,append,['Diabetes I','Diabetes II', 'Hipertension', 'Embarazo', 'Ninguna']),
    new(Prefproteina,
        menu('7.-Seleccione sus preferencias en proteina')),
    send_list(Prefproteina,append,['Cualquier proteina','Ninguna proteina de origen animal']),
    new(Carbohidratos,
        menu('8.-Seleccione sus preferencias en consumo de Carbohidratos')),
    send_list(Carbohidratos,append,['menor 20gr','20 a 50gr','50 a 100gr']),
    new(Proteina,
        menu('9.-Seleccione sus preferencias en consumo de Proteina')),
    send_list(Proteina,append,['90 a 100gr o 110 a 140gr','100 a 140gr o 130 a 180gr']),
    new(NumComida,
        menu('10.-¿Cuantas comidas tiene disponibilidad a consumir?')),
    send_list(NumComida,append,['2 almuerzo cena ','3 Desayuno Almuerzo Cena', '5 Desayuno media manana Almuerzo media tarde Cena']),

    new(Plan,text_item('Plan')),
    new(Desc,text_item('Descripcion')),
    new(Imagen,text_item('Imagen')),


    new(SugerenciaBtn, button('Solicitar Sugerencia',message(@prolog,planificar,
                                                             Objetivo?selection,
                                                             Actividad?selection,
                                                             Enfermedad?selection,
                                                             Prefproteina?selection,
                                                             Carbohidratos?selection,
                                                             Proteina?selection,
                                                             Plan,
                                                             Imagen
                                                             ))),

   new(JustBtn, button('Solicitar Descripcion',message(@prolog,jrobot,
                                                             Plan?selection,
                                                             Desc))),

    send(Etiqueta,font,font(arial,bold,20)),
    send(Plan,editable,false),
    send(Imagen,editable,false),
    send(Desc,editable,false),
    send(VentanaU,append,Etiqueta),
    send(VentanaU,append,Genero),
    send(VentanaU,append,Altura),
    send(VentanaU,append,Edad),
    send(VentanaU,append,Objetivo),
    send(VentanaU,append,Actividad),
    send(VentanaU,append,Enfermedad),
    send(VentanaU,append,Prefproteina),
    send(VentanaU,append,Carbohidratos),
    send(VentanaU,append,Proteina),
    send(VentanaU,append,NumComida),
    send(VentanaU,append,SugerenciaBtn),
    send(VentanaU,append,Plan),
    send(VentanaU,append,Imagen),
    send(VentanaU,append,JustBtn),
    send(VentanaU,append,Desc),

    send(VentanaU,append,Salir),
    send(VentanaU,open).

%------------------------------------------------------------------
%
%                    REGLA
%------------------------------------------------------------------


planificar(Objetivo,Actividad,Enfermedad,Prefproteina,Carbohidratos,Proteina,Plan,Imagen):-
                                      write(Objetivo),
                                      write(Actividad),
                                      write(Enfermedad),
                                      write(Prefproteina),
                                      write(Carbohidratos),
                                      write(Proteina),
                                      dieta(N,Objetivo,Actividad,Enfermedad,Prefproteina,Carbohidratos,Proteina),
                                      write(N),
                                      image(N,I),
                                      write('HOLIS AQUI LLEGAMOS'),
                                      new(VentanaU,dialog('Sugerencia de Plan de alimentacion')),
                                      new(Lie2,label(mentira,N,font('times','roman',17))),

                                      new(Figure, figure),
                                      new(Bitmap, bitmap(resource(I),@on)),
                                      send(Plan,selection,N),
                                      send(Imagen,selection,I),
                                      send(VentanaU,append,Lie2),
                                      send(Bitmap, name, 1),
                                      send(Figure, display, Bitmap),
                                      send(Figure, status, 1),
                                      send(VentanaU, display,Figure, point(20,50)),
                                      send(VentanaU,open)
                                      .


jrobot(Plan,Sug):-
                   justificacion(Plan,Sugerencia),
                   send(Sug,selection,Sugerencia).


%------------------------------------------------------------------
%
%                    Base de Conocimiento
%
%------------------------------------------------------------------

:-dynamic dieta/7.
dieta('Hipocalorico/proteico','Bajar de peso','Baja','Diabetes I','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Bajar de peso','Media 1 a 3 por semana','Diabetes I','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Bajar de peso','Alta mas de 4 por semana','Diabetes I','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Bajar de peso','Baja','Diabetes II','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso','Media 1 a 3 por semana','Diabetes II','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Bajar de peso','Alta mas de 4 por semana','Diabetes II','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso','Baja','Hipertension','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso','Media 1 a 3 por semana','Hipertension','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Bajar de peso','Alta mas de 4 por semana','Hipertension','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Bajar de peso','Baja','Embarazo','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Bajar de peso','Media 1 a 3 por semana','Embarazo','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Bajar de peso','Alta mas de 4 por semana','Embarazo','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Bajar de peso','Baja','Ninguna','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso','Media 1 a 3 por semana','Ninguna','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Bajar de peso','Alta mas de 4 por semana','Ninguna','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Bajar de peso','Baja','Diabetes I','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Bajar de peso','Media 1 a 3 por semana','Diabetes I','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Bajar de peso','Alta mas de 4 por semana','Diabetes I','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Bajar de peso','Baja','Diabetes II','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Bajar de peso','Media 1 a 3 por semana','Diabetes II','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Alta mas de 4 por semana','Diabetes II','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Bajar de peso','Baja','Hipertension','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Bajar de peso','Media 1 a 3 por semana','Hipertension','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Alta mas de 4 por semana','Hipertension','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Baja','Embarazo','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Bajar de peso','Media 1 a 3 por semana','Embarazo','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Bajar de peso','Alta mas de 4 por semana','Embarazo','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Baja','Ninguna','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Bajar de peso','Media 1 a 3 por semana','Ninguna','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Bajar de peso','Alta mas de 4 por semana','Ninguna','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Bajar de peso','Baja','Diabetes I','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Bajar de peso','Media 1 a 3 por semana','Diabetes I','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso','Alta mas de 4 por semana','Diabetes I','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Bajar de peso','Baja','Diabetes II','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso','Media 1 a 3 por semana','Diabetes II','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Bajar de peso','Alta mas de 4 por semana','Diabetes II','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso','Baja','Hipertension','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Bajar de peso','Media 1 a 3 por semana','Hipertension','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso','Alta mas de 4 por semana','Hipertension','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Bajar de peso','Baja','Embarazo','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Bajar de peso','Media 1 a 3 por semana','Embarazo','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Bajar de peso','Alta mas de 4 por semana','Embarazo','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Bajar de peso','Baja','Ninguna','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Bajar de peso','Media 1 a 3 por semana','Ninguna','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Bajar de peso','Alta mas de 4 por semana','Ninguna','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Bajar de peso','Baja','Diabetes I','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Bajar de peso','Media 1 a 3 por semana','Diabetes I','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Bajar de peso','Alta mas de 4 por semana','Diabetes I','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Bajar de peso','Baja','Diabetes II','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Bajar de peso','Media 1 a 3 por semana','Diabetes II','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Bajar de peso','Alta mas de 4 por semana','Diabetes II','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Bajar de peso','Baja','Hipertension','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Media 1 a 3 por semana','Hipertension','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Bajar de peso','Alta mas de 4 por semana','Hipertension','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Baja','Embarazo','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Bajar de peso','Media 1 a 3 por semana','Embarazo','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Alta mas de 4 por semana','Embarazo','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso','Baja','Ninguna','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Bajar de peso','Media 1 a 3 por semana','Ninguna','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Alta mas de 4 por semana','Ninguna','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Bajar de peso','Baja','Diabetes I','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Bajar de peso','Media 1 a 3 por semana','Diabetes I','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso','Alta mas de 4 por semana','Diabetes I','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso','Baja','Diabetes II','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso','Media 1 a 3 por semana','Diabetes II','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Bajar de peso','Alta mas de 4 por semana','Diabetes II','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Bajar de peso','Baja','Hipertension','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso','Media 1 a 3 por semana','Hipertension','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Bajar de peso','Alta mas de 4 por semana','Hipertension','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso','Baja','Embarazo','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Bajar de peso','Media 1 a 3 por semana','Embarazo','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Bajar de peso','Alta mas de 4 por semana','Embarazo','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Bajar de peso','Baja','Ninguna','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso','Media 1 a 3 por semana','Ninguna','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Bajar de peso','Alta mas de 4 por semana','Ninguna','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso','Baja','Diabetes I','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Media 1 a 3 por semana','Diabetes I','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso','Alta mas de 4 por semana','Diabetes I','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Bajar de peso','Baja','Diabetes II','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso','Media 1 a 3 por semana','Diabetes II','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso','Alta mas de 4 por semana','Diabetes II','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Baja','Hipertension','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso','Media 1 a 3 por semana','Hipertension','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/keto','Bajar de peso','Alta mas de 4 por semana','Hipertension','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Baja','Embarazo','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Bajar de peso','Media 1 a 3 por semana','Embarazo','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Bajar de peso','Alta mas de 4 por semana','Embarazo','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Bajar de peso','Baja','Ninguna','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso','Media 1 a 3 por semana','Ninguna','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Alta mas de 4 por semana','Ninguna','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Bajar de peso','Baja','Diabetes I','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso','Media 1 a 3 por semana','Diabetes I','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso','Alta mas de 4 por semana','Diabetes I','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Bajar de peso','Baja','Diabetes II','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Bajar de peso','Media 1 a 3 por semana','Diabetes II','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso','Alta mas de 4 por semana','Diabetes II','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Bajar de peso','Baja','Hipertension','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Bajar de peso','Media 1 a 3 por semana','Hipertension','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Bajar de peso','Alta mas de 4 por semana','Hipertension','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Bajar de peso','Baja','Embarazo','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Bajar de peso','Media 1 a 3 por semana','Embarazo','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Bajar de peso','Alta mas de 4 por semana','Embarazo','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso','Baja','Ninguna','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso','Media 1 a 3 por semana','Ninguna','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso','Alta mas de 4 por semana','Ninguna','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Bajar de peso','Baja','Diabetes I','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Bajar de peso','Media 1 a 3 por semana','Diabetes I','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso','Alta mas de 4 por semana','Diabetes I','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Bajar de peso','Baja','Diabetes II','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/keto','Bajar de peso','Media 1 a 3 por semana','Diabetes II','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Bajar de peso','Alta mas de 4 por semana','Diabetes II','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso','Baja','Hipertension','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/keto','Bajar de peso','Media 1 a 3 por semana','Hipertension','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Bajar de peso','Alta mas de 4 por semana','Hipertension','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso','Baja','Embarazo','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Bajar de peso','Media 1 a 3 por semana','Embarazo','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso','Alta mas de 4 por semana','Embarazo','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Baja','Ninguna','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso','Media 1 a 3 por semana','Ninguna','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/keto','Bajar de peso','Alta mas de 4 por semana','Ninguna','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual','Baja','Diabetes I','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Media 1 a 3 por semana','Diabetes I','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Mantener peso actual','Alta mas de 4 por semana','Diabetes I','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual','Baja','Diabetes II','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual','Media 1 a 3 por semana','Diabetes II','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Mantener peso actual','Alta mas de 4 por semana','Diabetes II','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual','Baja','Hipertension','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual','Media 1 a 3 por semana','Hipertension','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Mantener peso actual','Alta mas de 4 por semana','Hipertension','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual','Baja','Embarazo','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Mantener peso actual','Media 1 a 3 por semana','Embarazo','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Mantener peso actual','Alta mas de 4 por semana','Embarazo','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Mantener peso actual','Baja','Ninguna','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Mantener peso actual','Media 1 a 3 por semana','Ninguna','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Mantener peso actual','Alta mas de 4 por semana','Ninguna','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Mantener peso actual','Baja','Diabetes I','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Mantener peso actual','Media 1 a 3 por semana','Diabetes I','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Mantener peso actual','Alta mas de 4 por semana','Diabetes I','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual','Baja','Diabetes II','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Mantener peso actual','Media 1 a 3 por semana','Diabetes II','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Mantener peso actual','Alta mas de 4 por semana','Diabetes II','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual','Baja','Hipertension','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Mantener peso actual','Media 1 a 3 por semana','Hipertension','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Mantener peso actual','Alta mas de 4 por semana','Hipertension','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Mantener peso actual','Baja','Embarazo','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Mantener peso actual','Media 1 a 3 por semana','Embarazo','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Mantener peso actual','Alta mas de 4 por semana','Embarazo','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Mantener peso actual','Baja','Ninguna','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Mantener peso actual','Media 1 a 3 por semana','Ninguna','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Mantener peso actual','Alta mas de 4 por semana','Ninguna','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Mantener peso actual','Baja','Diabetes I','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Mantener peso actual','Media 1 a 3 por semana','Diabetes I','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Mantener peso actual','Alta mas de 4 por semana','Diabetes I','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Baja','Diabetes II','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Mantener peso actual','Media 1 a 3 por semana','Diabetes II','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Alta mas de 4 por semana','Diabetes II','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Mantener peso actual','Baja','Hipertension','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Media 1 a 3 por semana','Hipertension','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual','Alta mas de 4 por semana','Hipertension','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual','Baja','Embarazo','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Mantener peso actual','Media 1 a 3 por semana','Embarazo','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Mantener peso actual','Alta mas de 4 por semana','Embarazo','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Mantener peso actual','Baja','Ninguna','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Mantener peso actual','Media 1 a 3 por semana','Ninguna','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Alta mas de 4 por semana','Ninguna','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual','Baja','Diabetes I','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual','Media 1 a 3 por semana','Diabetes I','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual','Alta mas de 4 por semana','Diabetes I','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Mantener peso actual','Baja','Diabetes II','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual','Media 1 a 3 por semana','Diabetes II','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Mantener peso actual','Alta mas de 4 por semana','Diabetes II','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Mantener peso actual','Baja','Hipertension','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Mantener peso actual','Media 1 a 3 por semana','Hipertension','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Mantener peso actual','Alta mas de 4 por semana','Hipertension','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Mantener peso actual','Baja','Embarazo','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Mantener peso actual','Media 1 a 3 por semana','Embarazo','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Mantener peso actual','Alta mas de 4 por semana','Embarazo','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Mantener peso actual','Baja','Ninguna','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual','Media 1 a 3 por semana','Ninguna','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Mantener peso actual','Alta mas de 4 por semana','Ninguna','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Mantener peso actual','Baja','Diabetes I','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Media 1 a 3 por semana','Diabetes I','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Mantener peso actual','Alta mas de 4 por semana','Diabetes I','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual','Baja','Diabetes II','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Mantener peso actual','Media 1 a 3 por semana','Diabetes II','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Alta mas de 4 por semana','Diabetes II','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Baja','Hipertension','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Mantener peso actual','Media 1 a 3 por semana','Hipertension','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual','Alta mas de 4 por semana','Hipertension','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual','Baja','Embarazo','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual','Media 1 a 3 por semana','Embarazo','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Mantener peso actual','Alta mas de 4 por semana','Embarazo','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Mantener peso actual','Baja','Ninguna','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual','Media 1 a 3 por semana','Ninguna','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Mantener peso actual','Alta mas de 4 por semana','Ninguna','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Mantener peso actual','Baja','Diabetes I','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual','Media 1 a 3 por semana','Diabetes I','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Mantener peso actual','Alta mas de 4 por semana','Diabetes I','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Mantener peso actual','Baja','Diabetes II','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/keto','Mantener peso actual','Media 1 a 3 por semana','Diabetes II','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/keto','Mantener peso actual','Alta mas de 4 por semana','Diabetes II','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual','Baja','Hipertension','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Mantener peso actual','Media 1 a 3 por semana','Hipertension','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual','Alta mas de 4 por semana','Hipertension','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Mantener peso actual','Baja','Embarazo','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Mantener peso actual','Media 1 a 3 por semana','Embarazo','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual','Alta mas de 4 por semana','Embarazo','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual','Baja','Ninguna','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Mantener peso actual','Media 1 a 3 por semana','Ninguna','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Mantener peso actual','Alta mas de 4 por semana','Ninguna','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual','Baja','Diabetes I','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Mantener peso actual','Media 1 a 3 por semana','Diabetes I','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual','Alta mas de 4 por semana','Diabetes I','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Mantener peso actual','Baja','Diabetes II','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual','Media 1 a 3 por semana','Diabetes II','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Alta mas de 4 por semana','Diabetes II','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual','Baja','Hipertension','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Mantener peso actual','Media 1 a 3 por semana','Hipertension','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual','Alta mas de 4 por semana','Hipertension','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Mantener peso actual','Baja','Embarazo','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual','Media 1 a 3 por semana','Embarazo','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Alta mas de 4 por semana','Embarazo','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Mantener peso actual','Baja','Ninguna','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual','Media 1 a 3 por semana','Ninguna','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Mantener peso actual','Alta mas de 4 por semana','Ninguna','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual','Baja','Diabetes I','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Mantener peso actual','Media 1 a 3 por semana','Diabetes I','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual','Alta mas de 4 por semana','Diabetes I','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Mantener peso actual','Baja','Diabetes II','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual','Media 1 a 3 por semana','Diabetes II','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Mantener peso actual','Alta mas de 4 por semana','Diabetes II','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Mantener peso actual','Baja','Hipertension','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Mantener peso actual','Media 1 a 3 por semana','Hipertension','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/keto','Mantener peso actual','Alta mas de 4 por semana','Hipertension','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Mantener peso actual','Baja','Embarazo','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Mantener peso actual','Media 1 a 3 por semana','Embarazo','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Mantener peso actual','Alta mas de 4 por semana','Embarazo','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Mantener peso actual','Baja','Ninguna','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Mantener peso actual','Media 1 a 3 por semana','Ninguna','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Mantener peso actual','Alta mas de 4 por semana','Ninguna','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular','Baja','Diabetes I','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes I','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes I','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Aumentar masa muscular','Baja','Diabetes II','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes II','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes II','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Aumentar masa muscular','Baja','Hipertension','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Hipertension','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Hipertension','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Aumentar masa muscular','Baja','Embarazo','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Embarazo','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Embarazo','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular','Baja','Ninguna','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Ninguna','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular','Alta mas de 4 por semana','Ninguna','Cualquier proteina','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Aumentar masa muscular','Baja','Diabetes I','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes I','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes I','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Aumentar masa muscular','Baja','Diabetes II','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes II','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes II','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Aumentar masa muscular','Baja','Hipertension','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Aumentar masa muscular','Media 1 a 3 por semana','Hipertension','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Hipertension','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Aumentar masa muscular','Baja','Embarazo','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Aumentar masa muscular','Media 1 a 3 por semana','Embarazo','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Aumentar masa muscular','Alta mas de 4 por semana','Embarazo','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Aumentar masa muscular','Baja','Ninguna','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Aumentar masa muscular','Media 1 a 3 por semana','Ninguna','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Aumentar masa muscular','Alta mas de 4 por semana','Ninguna','Ninguna proteina de origen animal','menor 20gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular','Baja','Diabetes I','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes I','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes I','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Aumentar masa muscular','Baja','Diabetes II','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes II','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes II','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Aumentar masa muscular','Baja','Hipertension','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Hipertension','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Aumentar masa muscular','Alta mas de 4 por semana','Hipertension','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Aumentar masa muscular','Baja','Embarazo','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Embarazo','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular','Alta mas de 4 por semana','Embarazo','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Aumentar masa muscular','Baja','Ninguna','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Ninguna','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Ninguna','Cualquier proteina','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Aumentar masa muscular','Baja','Diabetes I','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes I','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes I','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Aumentar masa muscular','Baja','Diabetes II','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes II','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes II','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Aumentar masa muscular','Baja','Hipertension','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Aumentar masa muscular','Media 1 a 3 por semana','Hipertension','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Aumentar masa muscular','Alta mas de 4 por semana','Hipertension','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Aumentar masa muscular','Baja','Embarazo','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Aumentar masa muscular','Media 1 a 3 por semana','Embarazo','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Aumentar masa muscular','Alta mas de 4 por semana','Embarazo','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Aumentar masa muscular','Baja','Ninguna','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Aumentar masa muscular','Media 1 a 3 por semana','Ninguna','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Aumentar masa muscular','Alta mas de 4 por semana','Ninguna','Ninguna proteina de origen animal','20 a 50gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Aumentar masa muscular','Baja','Diabetes I','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes I','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes I','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Aumentar masa muscular','Baja','Diabetes II','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes II','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes II','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Aumentar masa muscular','Baja','Hipertension','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Hipertension','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Aumentar masa muscular','Alta mas de 4 por semana','Hipertension','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Aumentar masa muscular','Baja','Embarazo','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Aumentar masa muscular','Media 1 a 3 por semana','Embarazo','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Embarazo','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular','Baja','Ninguna','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular','Media 1 a 3 por semana','Ninguna','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Ninguna','Cualquier proteina','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Aumentar masa muscular','Baja','Diabetes I','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes I','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes I','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Aumentar masa muscular','Baja','Diabetes II','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes II','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes II','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Aumentar masa muscular','Baja','Hipertension','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/keto','Aumentar masa muscular','Media 1 a 3 por semana','Hipertension','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/keto','Aumentar masa muscular','Alta mas de 4 por semana','Hipertension','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Aumentar masa muscular','Baja','Embarazo','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Aumentar masa muscular','Media 1 a 3 por semana','Embarazo','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Aumentar masa muscular','Alta mas de 4 por semana','Embarazo','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Aumentar masa muscular','Baja','Ninguna','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Aumentar masa muscular','Media 1 a 3 por semana','Ninguna','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/keto','Aumentar masa muscular','Alta mas de 4 por semana','Ninguna','Ninguna proteina de origen animal','menor 20gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Aumentar masa muscular','Baja','Diabetes I','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes I','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes I','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular','Baja','Diabetes II','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes II','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes II','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Aumentar masa muscular','Baja','Hipertension','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Aumentar masa muscular','Media 1 a 3 por semana','Hipertension','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular','Alta mas de 4 por semana','Hipertension','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Aumentar masa muscular','Baja','Embarazo','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Embarazo','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular','Alta mas de 4 por semana','Embarazo','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Aumentar masa muscular','Baja','Ninguna','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Ninguna','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Ninguna','Cualquier proteina','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Aumentar masa muscular','Baja','Diabetes I','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/keto','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes I','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes I','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/keto','Aumentar masa muscular','Baja','Diabetes II','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/keto','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes II','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes II','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Aumentar masa muscular','Baja','Hipertension','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Aumentar masa muscular','Media 1 a 3 por semana','Hipertension','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/keto','Aumentar masa muscular','Alta mas de 4 por semana','Hipertension','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Aumentar masa muscular','Baja','Embarazo','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Embarazo','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/keto','Aumentar masa muscular','Alta mas de 4 por semana','Embarazo','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Aumentar masa muscular','Baja','Ninguna','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Aumentar masa muscular','Media 1 a 3 por semana','Ninguna','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Aumentar masa muscular','Alta mas de 4 por semana','Ninguna','Ninguna proteina de origen animal','20 a 50gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Bajar de peso','Baja','Diabetes I','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso','Media 1 a 3 por semana','Diabetes I','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso','Alta mas de 4 por semana','Diabetes I','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Bajar de peso','Baja','Diabetes II','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Bajar de peso','Media 1 a 3 por semana','Diabetes II','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Bajar de peso','Alta mas de 4 por semana','Diabetes II','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Bajar de peso','Baja','Hipertension','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Bajar de peso','Media 1 a 3 por semana','Hipertension','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Bajar de peso','Alta mas de 4 por semana','Hipertension','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso','Baja','Embarazo','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso','Media 1 a 3 por semana','Embarazo','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Bajar de peso','Alta mas de 4 por semana','Embarazo','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso','Baja','Ninguna','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Bajar de peso','Media 1 a 3 por semana','Ninguna','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Bajar de peso','Alta mas de 4 por semana','Ninguna','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso','Baja','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Bajar de peso','Media 1 a 3 por semana','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Bajar de peso','Alta mas de 4 por semana','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Bajar de peso','Baja','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Bajar de peso','Media 1 a 3 por semana','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Bajar de peso','Alta mas de 4 por semana','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Baja','Hipertension','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Media 1 a 3 por semana','Hipertension','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Alta mas de 4 por semana','Hipertension','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Baja','Embarazo','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Bajar de peso','Media 1 a 3 por semana','Embarazo','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso','Alta mas de 4 por semana','Embarazo','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Baja','Ninguna','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Bajar de peso','Media 1 a 3 por semana','Ninguna','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Bajar de peso','Alta mas de 4 por semana','Ninguna','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso','Baja','Diabetes I','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso','Media 1 a 3 por semana','Diabetes I','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Bajar de peso','Alta mas de 4 por semana','Diabetes I','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Bajar de peso','Baja','Diabetes II','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Bajar de peso','Media 1 a 3 por semana','Diabetes II','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Bajar de peso','Alta mas de 4 por semana','Diabetes II','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Bajar de peso','Baja','Hipertension','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Bajar de peso','Media 1 a 3 por semana','Hipertension','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso','Alta mas de 4 por semana','Hipertension','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Bajar de peso','Baja','Embarazo','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Bajar de peso','Media 1 a 3 por semana','Embarazo','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso','Alta mas de 4 por semana','Embarazo','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Bajar de peso','Baja','Ninguna','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Bajar de peso','Media 1 a 3 por semana','Ninguna','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Bajar de peso','Alta mas de 4 por semana','Ninguna','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Bajar de peso','Baja','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Media 1 a 3 por semana','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Alta mas de 4 por semana','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso','Baja','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Bajar de peso','Media 1 a 3 por semana','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso','Alta mas de 4 por semana','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Baja','Hipertension','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Bajar de peso','Media 1 a 3 por semana','Hipertension','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Bajar de peso','Alta mas de 4 por semana','Hipertension','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Bajar de peso','Baja','Embarazo','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Bajar de peso','Media 1 a 3 por semana','Embarazo','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Bajar de peso','Alta mas de 4 por semana','Embarazo','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Bajar de peso','Baja','Ninguna','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso','Media 1 a 3 por semana','Ninguna','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Bajar de peso','Alta mas de 4 por semana','Ninguna','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Bajar de peso','Baja','Diabetes I','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Bajar de peso','Media 1 a 3 por semana','Diabetes I','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Bajar de peso','Alta mas de 4 por semana','Diabetes I','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Bajar de peso','Baja','Diabetes II','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso','Media 1 a 3 por semana','Diabetes II','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Bajar de peso','Alta mas de 4 por semana','Diabetes II','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso','Baja','Hipertension','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso','Media 1 a 3 por semana','Hipertension','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso','Alta mas de 4 por semana','Hipertension','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Bajar de peso','Baja','Embarazo','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso','Media 1 a 3 por semana','Embarazo','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso','Alta mas de 4 por semana','Embarazo','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso','Baja','Ninguna','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Bajar de peso','Media 1 a 3 por semana','Ninguna','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso','Alta mas de 4 por semana','Ninguna','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso','Baja','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Media 1 a 3 por semana','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Alta mas de 4 por semana','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Bajar de peso','Baja','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Bajar de peso','Media 1 a 3 por semana','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Bajar de peso','Alta mas de 4 por semana','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Baja','Hipertension','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Bajar de peso','Media 1 a 3 por semana','Hipertension','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Bajar de peso','Alta mas de 4 por semana','Hipertension','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso','Baja','Embarazo','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Bajar de peso','Media 1 a 3 por semana','Embarazo','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/keto','Bajar de peso','Alta mas de 4 por semana','Embarazo','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/keto','Bajar de peso','Baja','Ninguna','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Media 1 a 3 por semana','Ninguna','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Alta mas de 4 por semana','Ninguna','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Bajar de peso','Baja','Diabetes I','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso','Media 1 a 3 por semana','Diabetes I','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Bajar de peso','Alta mas de 4 por semana','Diabetes I','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Bajar de peso','Baja','Diabetes II','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Bajar de peso','Media 1 a 3 por semana','Diabetes II','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Bajar de peso','Alta mas de 4 por semana','Diabetes II','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Bajar de peso','Baja','Hipertension','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso','Media 1 a 3 por semana','Hipertension','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Bajar de peso','Alta mas de 4 por semana','Hipertension','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Bajar de peso','Baja','Embarazo','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Bajar de peso','Media 1 a 3 por semana','Embarazo','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Bajar de peso','Alta mas de 4 por semana','Embarazo','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso','Baja','Ninguna','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso','Media 1 a 3 por semana','Ninguna','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso','Alta mas de 4 por semana','Ninguna','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Bajar de peso','Baja','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/keto','Bajar de peso','Media 1 a 3 por semana','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso','Alta mas de 4 por semana','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso','Baja','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso','Media 1 a 3 por semana','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso','Alta mas de 4 por semana','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso','Baja','Hipertension','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Bajar de peso','Media 1 a 3 por semana','Hipertension','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/keto','Bajar de peso','Alta mas de 4 por semana','Hipertension','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Bajar de peso','Baja','Embarazo','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Media 1 a 3 por semana','Embarazo','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Bajar de peso','Alta mas de 4 por semana','Embarazo','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Baja','Ninguna','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Media 1 a 3 por semana','Ninguna','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Bajar de peso','Alta mas de 4 por semana','Ninguna','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Baja','Diabetes I','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Mantener peso actual','Media 1 a 3 por semana','Diabetes I','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Mantener peso actual','Alta mas de 4 por semana','Diabetes I','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Baja','Diabetes II','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Media 1 a 3 por semana','Diabetes II','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Mantener peso actual','Alta mas de 4 por semana','Diabetes II','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Mantener peso actual','Baja','Hipertension','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Media 1 a 3 por semana','Hipertension','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual','Alta mas de 4 por semana','Hipertension','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual','Baja','Embarazo','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Mantener peso actual','Media 1 a 3 por semana','Embarazo','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Mantener peso actual','Alta mas de 4 por semana','Embarazo','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Mantener peso actual','Baja','Ninguna','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Mantener peso actual','Media 1 a 3 por semana','Ninguna','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Mantener peso actual','Alta mas de 4 por semana','Ninguna','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Mantener peso actual','Baja','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Mantener peso actual','Media 1 a 3 por semana','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Mantener peso actual','Alta mas de 4 por semana','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Mantener peso actual','Baja','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Mantener peso actual','Media 1 a 3 por semana','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Mantener peso actual','Alta mas de 4 por semana','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Mantener peso actual','Baja','Hipertension','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Mantener peso actual','Media 1 a 3 por semana','Hipertension','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual','Alta mas de 4 por semana','Hipertension','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Mantener peso actual','Baja','Embarazo','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual','Media 1 a 3 por semana','Embarazo','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual','Alta mas de 4 por semana','Embarazo','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Mantener peso actual','Baja','Ninguna','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual','Media 1 a 3 por semana','Ninguna','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Mantener peso actual','Alta mas de 4 por semana','Ninguna','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Mantener peso actual','Baja','Diabetes I','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Media 1 a 3 por semana','Diabetes I','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual','Alta mas de 4 por semana','Diabetes I','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual','Baja','Diabetes II','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual','Media 1 a 3 por semana','Diabetes II','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Alta mas de 4 por semana','Diabetes II','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Baja','Hipertension','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Media 1 a 3 por semana','Hipertension','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Mantener peso actual','Alta mas de 4 por semana','Hipertension','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Mantener peso actual','Baja','Embarazo','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Media 1 a 3 por semana','Embarazo','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Mantener peso actual','Alta mas de 4 por semana','Embarazo','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual','Baja','Ninguna','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual','Media 1 a 3 por semana','Ninguna','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual','Alta mas de 4 por semana','Ninguna','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Mantener peso actual','Baja','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Mantener peso actual','Media 1 a 3 por semana','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Mantener peso actual','Alta mas de 4 por semana','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Mantener peso actual','Baja','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual','Media 1 a 3 por semana','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Mantener peso actual','Alta mas de 4 por semana','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual','Baja','Hipertension','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual','Media 1 a 3 por semana','Hipertension','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Mantener peso actual','Alta mas de 4 por semana','Hipertension','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Mantener peso actual','Baja','Embarazo','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Mantener peso actual','Media 1 a 3 por semana','Embarazo','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Mantener peso actual','Alta mas de 4 por semana','Embarazo','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Mantener peso actual','Baja','Ninguna','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Mantener peso actual','Media 1 a 3 por semana','Ninguna','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Mantener peso actual','Alta mas de 4 por semana','Ninguna','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Mantener peso actual','Baja','Diabetes I','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Mantener peso actual','Media 1 a 3 por semana','Diabetes I','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Mantener peso actual','Alta mas de 4 por semana','Diabetes I','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual','Baja','Diabetes II','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Media 1 a 3 por semana','Diabetes II','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Mantener peso actual','Alta mas de 4 por semana','Diabetes II','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Baja','Hipertension','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Media 1 a 3 por semana','Hipertension','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Alta mas de 4 por semana','Hipertension','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Mantener peso actual','Baja','Embarazo','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Media 1 a 3 por semana','Embarazo','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual','Alta mas de 4 por semana','Embarazo','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Baja','Ninguna','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Mantener peso actual','Media 1 a 3 por semana','Ninguna','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual','Alta mas de 4 por semana','Ninguna','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual','Baja','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Mantener peso actual','Media 1 a 3 por semana','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Mantener peso actual','Alta mas de 4 por semana','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/keto','Mantener peso actual','Baja','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Mantener peso actual','Media 1 a 3 por semana','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Mantener peso actual','Alta mas de 4 por semana','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual','Baja','Hipertension','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Mantener peso actual','Media 1 a 3 por semana','Hipertension','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Mantener peso actual','Alta mas de 4 por semana','Hipertension','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Mantener peso actual','Baja','Embarazo','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Mantener peso actual','Media 1 a 3 por semana','Embarazo','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Mantener peso actual','Alta mas de 4 por semana','Embarazo','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Mantener peso actual','Baja','Ninguna','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Mantener peso actual','Media 1 a 3 por semana','Ninguna','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual','Alta mas de 4 por semana','Ninguna','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Baja','Diabetes I','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Media 1 a 3 por semana','Diabetes I','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Mantener peso actual','Alta mas de 4 por semana','Diabetes I','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Baja','Diabetes II','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual','Media 1 a 3 por semana','Diabetes II','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Mantener peso actual','Alta mas de 4 por semana','Diabetes II','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Mantener peso actual','Baja','Hipertension','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Media 1 a 3 por semana','Hipertension','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Mantener peso actual','Alta mas de 4 por semana','Hipertension','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Mantener peso actual','Baja','Embarazo','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Mantener peso actual','Media 1 a 3 por semana','Embarazo','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Mantener peso actual','Alta mas de 4 por semana','Embarazo','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Mantener peso actual','Baja','Ninguna','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Mantener peso actual','Media 1 a 3 por semana','Ninguna','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual','Alta mas de 4 por semana','Ninguna','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Mantener peso actual','Baja','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/keto','Mantener peso actual','Media 1 a 3 por semana','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Mantener peso actual','Alta mas de 4 por semana','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Mantener peso actual','Baja','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Mantener peso actual','Media 1 a 3 por semana','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Mantener peso actual','Alta mas de 4 por semana','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/keto','Mantener peso actual','Baja','Hipertension','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Mantener peso actual','Media 1 a 3 por semana','Hipertension','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Mantener peso actual','Alta mas de 4 por semana','Hipertension','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Mantener peso actual','Baja','Embarazo','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Mantener peso actual','Media 1 a 3 por semana','Embarazo','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual','Alta mas de 4 por semana','Embarazo','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual','Baja','Ninguna','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Mantener peso actual','Media 1 a 3 por semana','Ninguna','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Mantener peso actual','Alta mas de 4 por semana','Ninguna','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Aumentar masa muscular','Baja','Diabetes I','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes I','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes I','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Aumentar masa muscular','Baja','Diabetes II','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes II','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes II','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Aumentar masa muscular','Baja','Hipertension','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Hipertension','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular','Alta mas de 4 por semana','Hipertension','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Aumentar masa muscular','Baja','Embarazo','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Aumentar masa muscular','Media 1 a 3 por semana','Embarazo','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Embarazo','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular','Baja','Ninguna','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Ninguna','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Ninguna','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Aumentar masa muscular','Baja','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Aumentar masa muscular','Baja','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Aumentar masa muscular','Baja','Hipertension','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Aumentar masa muscular','Media 1 a 3 por semana','Hipertension','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Aumentar masa muscular','Alta mas de 4 por semana','Hipertension','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Aumentar masa muscular','Baja','Embarazo','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Aumentar masa muscular','Media 1 a 3 por semana','Embarazo','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Aumentar masa muscular','Alta mas de 4 por semana','Embarazo','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Aumentar masa muscular','Baja','Ninguna','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Aumentar masa muscular','Media 1 a 3 por semana','Ninguna','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Aumentar masa muscular','Alta mas de 4 por semana','Ninguna','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Aumentar masa muscular','Baja','Diabetes I','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes I','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes I','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular','Baja','Diabetes II','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes II','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes II','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Aumentar masa muscular','Baja','Hipertension','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Aumentar masa muscular','Media 1 a 3 por semana','Hipertension','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Hipertension','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Aumentar masa muscular','Baja','Embarazo','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Aumentar masa muscular','Media 1 a 3 por semana','Embarazo','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Embarazo','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Aumentar masa muscular','Baja','Ninguna','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Ninguna','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Ninguna','Cualquier proteina','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Aumentar masa muscular','Baja','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Aumentar masa muscular','Baja','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Aumentar masa muscular','Baja','Hipertension','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Hipertension','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Aumentar masa muscular','Alta mas de 4 por semana','Hipertension','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano','Aumentar masa muscular','Baja','Embarazo','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Aumentar masa muscular','Media 1 a 3 por semana','Embarazo','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Embarazo','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Aumentar masa muscular','Baja','Ninguna','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Aumentar masa muscular','Media 1 a 3 por semana','Ninguna','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Aumentar masa muscular','Alta mas de 4 por semana','Ninguna','Ninguna proteina de origen animal','50 a 100gr','90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Aumentar masa muscular','Baja','Diabetes I','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes I','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes I','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular','Baja','Diabetes II','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes II','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes II','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular','Baja','Hipertension','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Hipertension','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Aumentar masa muscular','Alta mas de 4 por semana','Hipertension','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular','Baja','Embarazo','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Embarazo','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Embarazo','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Aumentar masa muscular','Baja','Ninguna','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Ninguna','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Ninguna','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Aumentar masa muscular','Baja','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/keto','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/keto','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Aumentar masa muscular','Baja','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Aumentar masa muscular','Baja','Hipertension','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Aumentar masa muscular','Media 1 a 3 por semana','Hipertension','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Hipertension','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Aumentar masa muscular','Baja','Embarazo','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Embarazo','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Aumentar masa muscular','Alta mas de 4 por semana','Embarazo','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Aumentar masa muscular','Baja','Ninguna','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Aumentar masa muscular','Media 1 a 3 por semana','Ninguna','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Aumentar masa muscular','Alta mas de 4 por semana','Ninguna','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Aumentar masa muscular','Baja','Diabetes I','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes I','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes I','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Aumentar masa muscular','Baja','Diabetes II','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes II','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes II','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Aumentar masa muscular','Baja','Hipertension','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Hipertension','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular','Alta mas de 4 por semana','Hipertension','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular','Baja','Embarazo','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Embarazo','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Embarazo','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/Keto','Aumentar masa muscular','Baja','Ninguna','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Ninguna','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular','Alta mas de 4 por semana','Ninguna','Cualquier proteina','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Aumentar masa muscular','Baja','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/keto','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes I','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Aumentar masa muscular','Baja','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Aumentar masa muscular','Media 1 a 3 por semana','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Aumentar masa muscular','Alta mas de 4 por semana','Diabetes II','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Aumentar masa muscular','Baja','Hipertension','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Hipertension','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Aumentar masa muscular','Alta mas de 4 por semana','Hipertension','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico/vegetariano','Aumentar masa muscular','Baja','Embarazo','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Aumentar masa muscular','Media 1 a 3 por semana','Embarazo','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/proteico','Aumentar masa muscular','Alta mas de 4 por semana','Embarazo','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/vegetariano/Keto','Aumentar masa muscular','Baja','Ninguna','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/vegetariano/keto','Aumentar masa muscular','Media 1 a 3 por semana','Ninguna','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Aumentar masa muscular','Alta mas de 4 por semana','Ninguna','Ninguna proteina de origen animal','50 a 100gr','100 a 140gr o 130 a 180gr').


:-dynamic image/2.
image('Hipocalorico/proteico','1.JPG').
image('Hipocalorico/vegetariano/keto','2.JPG').
image('Hipocalorico/vegetariano/proteico','3.JPG').
image('Hipercalorico/Keto','4.JPG').
image('Hipercalorico/proteico/Keto','5.JPG').
image('Hipercalorico/vegetariano/Keto','6.JPG').
image('Hipercalorico/proteico/vegetariano','7.JPG').
image('Hipocalorico/proteico/vegetariano','8.JPG').
image('Hipocalorico/proteico/Keto','9.JPG').
image('Hipercalorico/proteico','10.JPG').

:-dynamic justificacion/2.
justificacion('Hipocalorico/proteico','Una dieta baja en calorias, consiste en aplicar una restriccion calorica diaria basada en la ingesta de proteinas').
justificacion('Hipocalorico/vegetariano/keto','Una dieta baja en calorias, basada en consumo de grasas y proteinas vegetales').
justificacion('Hipocalorico/vegetariano/proteico','Una diente baja en calorias, basada en nutrientes de origen vegetal con alto valor proteico').
justificacion('Hipercalorico/Keto','Regimen alimenticio que contiene una cantidad de calorias por encima de las que el cuerpo necesita').
justificacion('Hipercalorico/proteico/Keto','Dieta alta en calorias basada en la ingesta de proteinas como la carne magra, el pescado, los huevos y lacteos').
justificacion('Hipercalorico/vegetariano/Keto','Regimen alimenticio con alta cantidad de calorias, enfoca a la alimentación con verduras. Esto incluye frutas, verduras, guisantes y alubias secas, granos, semillas y nueces').
justificacion('Hipercalorico/proteico/vegetariano','Dieta calorica basada en fuentes proteicas fuertes, incluye todas las legumbres, frutos y semillas').
justificacion('Hipocalorico/proteico/vegetariano','Regimen alimenticio bajo en calorias basado en la mezcla de fuentes proteicas fuertes y con fuentes proteicas debiles como arroz, pasta, papa, etc.').
justificacion('Hipocalorico/proteico/Keto','Dieta baja en calorias basada en proteinas fuertes de origen animal y vegetal').
justificacion('Hipercalorico/proteico','Destinado a las personas con dificultades para ganar masa muscular, que poseen un metabolismo alto y con biotipo de una persona delgada.').






















