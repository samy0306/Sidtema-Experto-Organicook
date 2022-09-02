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
resource('11.JPG',image,image('11.bmp')).
resource('12.JPG',image,image('12.bmp')).
resource('13.JPG',image,image('13.bmp')).
resource('14.JPG',image,image('14.bmp')).
resource('15.JPG',image,image('15.bmp')).
resource('16.JPG',image,image('16.bmp')).
resource('17.JPG',image,image('17.bmp')).
resource('18.JPG',image,image('18.bmp')).
resource('19.JPG',image,image('19.bmp')).
resource('20.JPG',image,image('20.bmp')).
resource('21.JPG',image,image('21.bmp')).
resource('22.JPG',image,image('22.bmp')).
resource('23.JPG',image,image('23.bmp')).
resource('24.JPG',image,image('24.bmp')).
resource('25.JPG',image,image('25.bmp')).
resource('26.JPG',image,image('26.bmp')).
resource('27.JPG',image,image('27.bmp')).
resource('28.JPG',image,image('28.bmp')).
resource('29.JPG',image,image('29.bmp')).
resource('30.JPG',image,image('30.bmp')).
resource('31.JPG',image,image('31.bmp')).
resource('32.JPG',image,image('32.bmp')).
resource('33.JPG',image,image('33.bmp')).
resource('34.JPG',image,image('34.bmp')).
resource('35.JPG',image,image('35.bmp')).
resource('36.JPG',image,image('36.bmp')).
resource('prueba',image,image('prueba.bmp')).


:- new(VentanaE,dialog('Robot 1997')),
     %creacion de objetos
     new(Etiqueta,label(nombre,'SISTEMA EXPERTO')),
     new(Salir, button('SALIR',message(VentanaE,destroy))),
     new(Usuario, button('Solicitar Sugerencia',message(@prolog,usuario))),
     new(Experto, button('Agregar Conocimiento',message(@prolog,experto))),
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
     send(VentanaE,display,Experto,point(220,430)),
     send(VentanaE,display,Salir,point(400,430)),
     send(VentanaE,open).

usuario:-
    new(VentanaU,dialog('Organicook')),
    new(Etiqueta,label(nombre,'Sugerencia de Dietas: Cliente Organicook')),
    new(Salir, button('Regresar',message(VentanaU,destroy))),
    new(Genero,
        menu('1.-Selecciona tu género')),
    send_list(Genero, append,['Femenino','Masculino']),
    new(Altura,
        menu('2.-¿En que rango de altura se encuentra?')),
    send_list(Altura, append,['menor a 1.55','1.55 a 1.76','mas de 1.76']),
    new(Edad,
        menu('3.-¿En que rango de edad se encuentra?')),
    send_list(Edad,append,['18 a 29 años','30 a 60 años','mayor a 60 años']),
    new(Objetivo,
        menu('4.-¿Cúal es su objetivo?')),
    send_list(Objetivo,append,['Bajar de peso','Mantener peso actual','Aumentar masa muscular']),
    new(Actividad,
        menu('5.-¿Cómo califica su actividad fisica?')),
    send_list(Actividad,append,['Baja','Media 1 a 3 por semana', 'Alta mas de 4 por semana']),
    new(Enfermedad,
        menu('6.-¿Tiene alguna de las siguientes condiciones médicas?')),
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
    send_list(NumComida,append,['2 almuerzo cena ','3 Desayuno Almuerzo Cena', '5 Desayuno media mañana Almuerzo media tarde Cena']),

    new(Plan,text_item('Plan')),
    new(Desc,text_item('Descripción')),
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

   new(JustBtn, button('Solicitar Sugerencia',message(@prolog,jrobot,
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
dieta('Hipocalorico/proteico','Bajar de peso', 'Baja', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Mantener peso actual', 'Baja', 'Diabetes I','Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Mantener peso actual', 'Baja', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto', 'Mantener peso actual', 'Baja', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Mantener peso actual', 'Baja', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/keto','Mantener peso actual', 'Alta mas de 4 por semana', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/keto','Mantener peso actual', 'Alta mas de 4 por semana', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/keto','Mantener peso actual', 'Alta mas de 4 por semana', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano ','Mantener peso actual', 'Alta mas de 4 por semana', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/keto','Mantener peso actual', 'Baja', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/keto','Mantener peso actual', 'Alta mas de 4 por semana', 'Diabetes I', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/keto','Mantener peso actual', 'Alta mas de 4 por semana', 'Diabetes II', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/keto','Mantener peso actual', 'Alta mas de 4 por semana', 'Hipertension', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/keto','Mantener peso actual', 'Alta mas de 4 por semana', 'Embarazo', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/keto','Mantener peso actual', 'Alta mas de 4 por semana', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '90-100g4ñr').
dieta('Hipercalorico/proteico/vegetariano ','Mantener peso actual', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Mantener peso actual', 'Baja', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual', 'Baja', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/keto','Mantener peso actual', 'Baja', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/keto','Mantener peso actual', 'Baja', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/keto','Mantener peso actual', 'Alta mas de 4 por semana', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/keto','Mantener peso actual', 'Alta mas de 4 por semana', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/keto','Mantener peso actual', 'Alta mas de 4 por semana', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/keto','Mantener peso actual', 'Alta mas de 4 por semana', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/keto','Mantener peso actual', 'Alta mas de 4 por semana', 'Diabetes I', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Alta mas de 4 por semana', 'Diabetes II', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/keto','Mantener peso actual', 'Alta mas de 4 por semana', 'Hipertension', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/keto','Mantener peso actual', 'Alta mas de 4 por semana', 'Embarazo', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual', 'Baja', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual', 'Baja', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico','Mantener peso actual', 'Baja', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico','Mantener peso actual', 'Baja', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Alta mas de 4 por semana', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Alta mas de 4 por semana', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico','Mantener peso actual', 'Alta mas de 4 por semana', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico','Mantener peso actual', 'Alta mas de 4 por semana', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual', 'Alta mas de 4 por semana', 'Diabetes I', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Alta mas de 4 por semana', 'Diabetes II', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Alta mas de 4 por semana', 'Hipertension', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Alta mas de 4 por semana', 'Embarazo', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Mantener peso actual', 'Baja', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Mantener peso actual', 'Baja', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Mantener peso actual', 'Baja', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Mantener peso actual', 'Baja', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Alta mas de 4 por semana', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Alta mas de 4 por semana', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Alta mas de 4 por semana', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Alta mas de 4 por semana', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Alta mas de 4 por semana', 'Diabetes I', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Alta mas de 4 por semana', 'Diabetes II', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Alta mas de 4 por semana', 'Hipertension', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Alta mas de 4 por semana', 'Embarazo', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual', 'Baja', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual', 'Baja', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual', 'Baja', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual', 'Baja', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Alta mas de 4 por semana', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Alta mas de 4 por semana', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Alta mas de 4 por semana', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Alta mas de 4 por semana', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Alta mas de 4 por semana', 'Diabetes I', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Alta mas de 4 por semana', 'Diabetes II', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Alta mas de 4 por semana', 'Hipertension', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Alta mas de 4 por semana', 'Embarazo', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual', 'Baja', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual', 'Baja', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual', 'Baja', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual', 'Baja', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Alta mas de 4 por semana', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Alta mas de 4 por semana', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Alta mas de 4 por semana', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Alta mas de 4 por semana', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Alta mas de 4 por semana', 'Diabetes I', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Alta mas de 4 por semana', 'Diabetes II', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Alta mas de 4 por semana', 'Hipertension', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Alta mas de 4 por semana', 'Embarazo', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico','Mantener peso actual', 'Alta mas de 4 por semana', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '90-100g').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Alta mas de 4 por semana', 'Diabetes II', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Alta mas de 4 por semana', 'Hipertension', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Alta mas de 4 por semana', 'Embarazo', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso', 'Baja', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Baja', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico','Bajar de peso', 'Baja', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso', 'Baja', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Alta mas de 4 por semana', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Alta mas de 4 por semana', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico','Bajar de peso', 'Alta mas de 4 por semana', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Alta mas de 4 por semana', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Alta mas de 4 por semana', 'Diabetes I', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Alta mas de 4 por semana', 'Diabetes II', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico','Bajar de peso', 'Alta mas de 4 por semana', 'Hipertension', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Alta mas de 4 por semana', 'Embarazo', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico /proteico','Bajar de peso', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso', 'Baja', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Baja', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico','Bajar de peso', 'Baja', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso', 'Baja', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Alta mas de 4 por semana', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Alta mas de 4 por semana', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico','Bajar de peso', 'Alta mas de 4 por semana', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Alta mas de 4 por semana', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Alta mas de 4 por semana', 'Diabetes I', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Alta mas de 4 por semana', 'Diabetes II', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico','Bajar de peso', 'Alta mas de 4 por semana', 'Hipertension', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Alta mas de 4 por semana', 'Embarazo', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico /proteico','Bajar de peso', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso', 'Baja', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Baja', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico','Bajar de peso', 'Baja', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso', 'Baja', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Alta mas de 4 por semana', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Alta mas de 4 por semana', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Alta mas de 4 por semana', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Alta mas de 4 por semana', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Alta mas de 4 por semana', 'Diabetes I', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Alta mas de 4 por semana', 'Diabetes II', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Alta mas de 4 por semana', 'Hipertension', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Alta mas de 4 por semana', 'Embarazo', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico /proteico','Bajar de peso', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Baja', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Baja', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso', 'Baja', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Baja', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Alta mas de 4 por semana', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Alta mas de 4 por semana', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Alta mas de 4 por semana', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Alta mas de 4 por semana', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Alta mas de 4 por semana', 'Diabetes I', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Alta mas de 4 por semana', 'Diabetes II', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Alta mas de 4 por semana', 'Hipertension', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Alta mas de 4 por semana', 'Embarazo', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Baja', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Baja', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso', 'Baja', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Baja', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Alta mas de 4 por semana', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Alta mas de 4 por semana', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Alta mas de 4 por semana', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Alta mas de 4 por semana', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Alta mas de 4 por semana', 'Diabetes I', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Alta mas de 4 por semana', 'Diabetes II', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Alta mas de 4 por semana', 'Hipertension', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Alta mas de 4 por semana', 'Embarazo', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico /proteico','Bajar de peso', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes I', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes II', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Hipertension', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Embarazo', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes I', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes II', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Hipertension', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Embarazo', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr. ').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes I', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes II', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Hipertension', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Embarazo', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes I', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes II', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Hipertension', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Embarazo', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico /proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes I', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes II', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Hipertension', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Embarazo', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').|
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes I', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes II', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Hipertension', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Embarazo', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Baja', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Baja', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Alta mas de 4 por semana', ' ninguna', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes I','Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto', 'Mantener peso actual', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/proteico','Mantener peso actual', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/keto','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/keto','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/keto','Mantener peso actual', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/vegetariano ','Mantener peso actual', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/keto','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/keto','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes I', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/keto','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes II', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/keto','Mantener peso actual', 'Media 1 a 3 por semana', 'Hipertension', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/vegetariano/keto','Mantener peso actual', 'Media 1 a 3 por semana', 'Embarazo', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/keto','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '90-100g4ñr').
dieta('Hipercalorico/proteico/vegetariano ','Mantener peso actual', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/vegetariano/keto','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/keto','Mantener peso actual', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/keto','Mantener peso actual', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/keto','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/keto','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/keto','Mantener peso actual', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/keto','Mantener peso actual', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/keto','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes I', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes II', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/keto','Mantener peso actual', 'Media 1 a 3 por semana', 'Hipertension', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico/keto','Mantener peso actual', 'Media 1 a 3 por semana', 'Embarazo', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico','Mantener peso actual', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico','Mantener peso actual', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes I', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes II', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Media 1 a 3 por semana', 'Hipertension', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Media 1 a 3 por semana', 'Embarazo', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Mantener peso actual', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico','Mantener peso actual', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes I', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes II', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Media 1 a 3 por semana', 'Hipertension', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Media 1 a 3 por semana', 'Embarazo', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes I', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes II', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Media 1 a 3 por semana', 'Hipertension', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Media 1 a 3 por semana', 'Embarazo', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Mantener peso actual', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes I', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Media 1 a 3 por semana', 'Diabetes II', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Media 1 a 3 por semana', 'Hipertension', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Media 1 a 3 por semana', 'Embarazo', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Mantener peso actual', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico','Mantener peso actual', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '90-100g').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes II', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Media 1 a 3 por semana', 'Hipertension', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Media 1 a 3 por semana', 'Embarazo', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico','Bajar de peso', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico','Bajar de peso', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes I', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes II', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico','Bajar de peso', 'Media 1 a 3 por semana', 'Hipertension', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Embarazo', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico','Bajar de peso', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico','Bajar de peso', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes I', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes II', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico','Bajar de peso', 'Media 1 a 3 por semana', 'Hipertension', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Media 1 a 3 por semana', 'Embarazo', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico /proteico','Bajar de peso', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico','Bajar de peso', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes I', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes II', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Hipertension', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Media 1 a 3 por semana', 'Embarazo', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico /proteico','Bajar de peso', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes I', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes II', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Media 1 a 3 por semana', 'Hipertension', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Embarazo', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/Keto','Bajar de peso', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes I', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipocalorico/proteico/vegetariano','Bajar de peso', 'Media 1 a 3 por semana', 'Diabetes II', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Media 1 a 3 por semana', 'Hipertension', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Bajar de peso', 'Media 1 a 3 por semana', 'Embarazo', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico /proteico','Bajar de peso', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', 'menor 20gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', '20 a 50gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr. ').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', '50 a 100gr', '90 a 100gr o 110 a 140gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico /proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', 'menor 20gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', '20 a 50gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes I', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Diabetes II', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Hipertension', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', 'Embarazo', 'Cualquier proteina', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').
dieta('Hipercalorico/proteico ','Aumentar masa muscular', 'Media 1 a 3 por semana', ' ninguna', ' ninguna', '50 a 100gr', '100 a 140gr o 130 a 180gr').

:-dynamic image/2.
image('Hipocalorico/proteico','30.JPG').
image('Hipocalorico/vegetariano/keto','30.JPG').
image('Hipocalorico/vegetariano/proteico','30.JPG').
image('Hipercalorico/Keto','30.JPG').
image('Hipercalorico/proteico/Keto','30.JPG').
image('Hipercalorico/vegetariano/Keto','30.JPG').
image('Hipercalorico/proteico/vegetariano','30.JPG').
image('Hipocalorico/proteico/vegetariano','30.JPG').
image('Hipocalorico/proteico/Keto','30.JPG').
image('Hipercalorico/proteico','30.JPG').

:-dynamic justificacion/2.
justificacion('Hipocalorico/proteico','xD').
justificacion('Hipocalorico/vegetariano/keto','x').
justificacion('Hipocalorico/vegetariano/proteico','x').
justificacion('Hipercalorico/Keto','x').
justificacion('Hipercalorico/proteico/Keto','x').
justificacion('Hipercalorico/vegetariano/Keto','x').
justificacion('Hipercalorico/proteico/vegetariano','x').
justificacion('Hipocalorico/proteico/vegetariano','x').
justificacion('Hipocalorico/proteico/Keto','x').
justificacion('Hipercalorico/proteico','x').






















