PGDMP     *            	    	    v           biosip    10.5    10.4 S    m           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            n           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            o           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            p           1262    33197    biosip    DATABASE     �   CREATE DATABASE biosip WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Mexico.1252' LC_CTYPE = 'Spanish_Mexico.1252';
    DROP DATABASE biosip;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            q           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            r           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    33296    categoria_seq    SEQUENCE     v   CREATE SEQUENCE public.categoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.categoria_seq;
       public       postgres    false    3            �            1259    33198 	   categoria    TABLE     �   CREATE TABLE public.categoria (
    id integer DEFAULT nextval('public.categoria_seq'::regclass) NOT NULL,
    nombre character varying(45) NOT NULL,
    descripcion character varying(500) NOT NULL
);
    DROP TABLE public.categoria;
       public         postgres    false    208    3            �            1259    33210    kit    TABLE     �   CREATE TABLE public.kit (
    id bigint NOT NULL,
    usuario_id_autor bigint NOT NULL,
    fecha_de_expiracion timestamp without time zone NOT NULL,
    administrador_id_aprobador bigint
);
    DROP TABLE public.kit;
       public         postgres    false    3            �            1259    33219    kit_material    TABLE     �   CREATE TABLE public.kit_material (
    kit_id bigint NOT NULL,
    material_id bigint NOT NULL,
    num_elementos_requeridos integer NOT NULL
);
     DROP TABLE public.kit_material;
       public         postgres    false    3            �            1259    33302    material_seq    SEQUENCE     u   CREATE SEQUENCE public.material_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.material_seq;
       public       postgres    false    3            �            1259    33213    material    TABLE       CREATE TABLE public.material (
    id bigint DEFAULT nextval('public.material_seq'::regclass) NOT NULL,
    nombre character varying(200) NOT NULL,
    disponibles integer NOT NULL,
    ruta_imagen character varying(100),
    descripcion character varying(500) NOT NULL
);
    DROP TABLE public.material;
       public         postgres    false    210    3            �            1259    33222    material_categoria    TABLE     o   CREATE TABLE public.material_categoria (
    material_id bigint NOT NULL,
    categoria_id integer NOT NULL
);
 &   DROP TABLE public.material_categoria;
       public         postgres    false    3            �            1259    33231    material_subcategoria    TABLE     u   CREATE TABLE public.material_subcategoria (
    material_id bigint NOT NULL,
    subcategoria_id integer NOT NULL
);
 )   DROP TABLE public.material_subcategoria;
       public         postgres    false    3            �            1259    33308 
   perfil_seq    SEQUENCE     s   CREATE SEQUENCE public.perfil_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.perfil_seq;
       public       postgres    false    3            �            1259    33234    perfil    TABLE     �   CREATE TABLE public.perfil (
    id smallint DEFAULT nextval('public.perfil_seq'::regclass) NOT NULL,
    nombre character varying(45) NOT NULL,
    descripcion character varying(200) NOT NULL
);
    DROP TABLE public.perfil;
       public         postgres    false    212    3            �            1259    33249    prestamo    TABLE     A  CREATE TABLE public.prestamo (
    id bigint NOT NULL,
    usuario_id bigint NOT NULL,
    fecha_de_solicitud timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    fecha_de_aprobacion timestamp without time zone,
    administrador_id_aprobador bigint,
    fecha_de_devolucion timestamp without time zone
);
    DROP TABLE public.prestamo;
       public         postgres    false    3            �            1259    33252    prestamo_material    TABLE     �   CREATE TABLE public.prestamo_material (
    prestamo_id bigint NOT NULL,
    material_id bigint NOT NULL,
    elementos_prestados integer NOT NULL
);
 %   DROP TABLE public.prestamo_material;
       public         postgres    false    3            �            1259    33305    subcategoria_seq    SEQUENCE     y   CREATE SEQUENCE public.subcategoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.subcategoria_seq;
       public       postgres    false    3            �            1259    33225    subcategoria    TABLE     �   CREATE TABLE public.subcategoria (
    id integer DEFAULT nextval('public.subcategoria_seq'::regclass) NOT NULL,
    nombre character varying(45) NOT NULL,
    descripcion character varying(500) NOT NULL,
    categoria_id integer
);
     DROP TABLE public.subcategoria;
       public         postgres    false    211    3            �            1259    33299    usuario_seq    SEQUENCE     t   CREATE SEQUENCE public.usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.usuario_seq;
       public       postgres    false    3            �            1259    33204    usuario    TABLE     �  CREATE TABLE public.usuario (
    id bigint DEFAULT nextval('public.usuario_seq'::regclass) NOT NULL,
    nombre_completo character varying(210) NOT NULL,
    user_name character varying(50) NOT NULL,
    correo_ciencias character varying(150) NOT NULL,
    password character varying(100) NOT NULL,
    fecha_de_desbloqueo timestamp without time zone,
    ruta_imagen character varying(100)
);
    DROP TABLE public.usuario;
       public         postgres    false    209    3            �            1259    33255    usuario_perfil    TABLE     h   CREATE TABLE public.usuario_perfil (
    usuario_id bigint NOT NULL,
    perfil_id smallint NOT NULL
);
 "   DROP TABLE public.usuario_perfil;
       public         postgres    false    3            Z          0    33198 	   categoria 
   TABLE DATA               <   COPY public.categoria (id, nombre, descripcion) FROM stdin;
    public       postgres    false    196   �_       \          0    33210    kit 
   TABLE DATA               d   COPY public.kit (id, usuario_id_autor, fecha_de_expiracion, administrador_id_aprobador) FROM stdin;
    public       postgres    false    198   �_       ^          0    33219    kit_material 
   TABLE DATA               U   COPY public.kit_material (kit_id, material_id, num_elementos_requeridos) FROM stdin;
    public       postgres    false    200   `       ]          0    33213    material 
   TABLE DATA               U   COPY public.material (id, nombre, disponibles, ruta_imagen, descripcion) FROM stdin;
    public       postgres    false    199   7`       _          0    33222    material_categoria 
   TABLE DATA               G   COPY public.material_categoria (material_id, categoria_id) FROM stdin;
    public       postgres    false    201   T`       a          0    33231    material_subcategoria 
   TABLE DATA               M   COPY public.material_subcategoria (material_id, subcategoria_id) FROM stdin;
    public       postgres    false    203   q`       b          0    33234    perfil 
   TABLE DATA               9   COPY public.perfil (id, nombre, descripcion) FROM stdin;
    public       postgres    false    204   �`       c          0    33249    prestamo 
   TABLE DATA               �   COPY public.prestamo (id, usuario_id, fecha_de_solicitud, fecha_de_aprobacion, administrador_id_aprobador, fecha_de_devolucion) FROM stdin;
    public       postgres    false    205   �`       d          0    33252    prestamo_material 
   TABLE DATA               Z   COPY public.prestamo_material (prestamo_id, material_id, elementos_prestados) FROM stdin;
    public       postgres    false    206   �`       `          0    33225    subcategoria 
   TABLE DATA               M   COPY public.subcategoria (id, nombre, descripcion, categoria_id) FROM stdin;
    public       postgres    false    202   �`       [          0    33204    usuario 
   TABLE DATA               ~   COPY public.usuario (id, nombre_completo, user_name, correo_ciencias, password, fecha_de_desbloqueo, ruta_imagen) FROM stdin;
    public       postgres    false    197   a       e          0    33255    usuario_perfil 
   TABLE DATA               ?   COPY public.usuario_perfil (usuario_id, perfil_id) FROM stdin;
    public       postgres    false    207   a       s           0    0    categoria_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.categoria_seq', 1, false);
            public       postgres    false    208            t           0    0    material_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.material_seq', 1, false);
            public       postgres    false    210            u           0    0 
   perfil_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.perfil_seq', 1, false);
            public       postgres    false    212            v           0    0    subcategoria_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.subcategoria_seq', 1, false);
            public       postgres    false    211            w           0    0    usuario_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.usuario_seq', 1, false);
            public       postgres    false    209            �
           2606    33259    categoria pk_categoria 
   CONSTRAINT     T   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT pk_categoria PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.categoria DROP CONSTRAINT pk_categoria;
       public         postgres    false    196            �
           2606    33266 
   kit pk_kit 
   CONSTRAINT     H   ALTER TABLE ONLY public.kit
    ADD CONSTRAINT pk_kit PRIMARY KEY (id);
 4   ALTER TABLE ONLY public.kit DROP CONSTRAINT pk_kit;
       public         postgres    false    198            �
           2606    33272    kit_material pk_kit_material 
   CONSTRAINT     k   ALTER TABLE ONLY public.kit_material
    ADD CONSTRAINT pk_kit_material PRIMARY KEY (kit_id, material_id);
 F   ALTER TABLE ONLY public.kit_material DROP CONSTRAINT pk_kit_material;
       public         postgres    false    200    200            �
           2606    33270    material pk_material 
   CONSTRAINT     R   ALTER TABLE ONLY public.material
    ADD CONSTRAINT pk_material PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.material DROP CONSTRAINT pk_material;
       public         postgres    false    199            �
           2606    33275 (   material_categoria pk_material_categoria 
   CONSTRAINT     }   ALTER TABLE ONLY public.material_categoria
    ADD CONSTRAINT pk_material_categoria PRIMARY KEY (material_id, categoria_id);
 R   ALTER TABLE ONLY public.material_categoria DROP CONSTRAINT pk_material_categoria;
       public         postgres    false    201    201            �
           2606    33282 .   material_subcategoria pk_material_subcategoria 
   CONSTRAINT     �   ALTER TABLE ONLY public.material_subcategoria
    ADD CONSTRAINT pk_material_subcategoria PRIMARY KEY (material_id, subcategoria_id);
 X   ALTER TABLE ONLY public.material_subcategoria DROP CONSTRAINT pk_material_subcategoria;
       public         postgres    false    203    203            �
           2606    33285    perfil pk_perfil 
   CONSTRAINT     N   ALTER TABLE ONLY public.perfil
    ADD CONSTRAINT pk_perfil PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.perfil DROP CONSTRAINT pk_perfil;
       public         postgres    false    204            �
           2606    33287    prestamo pk_prestamo 
   CONSTRAINT     R   ALTER TABLE ONLY public.prestamo
    ADD CONSTRAINT pk_prestamo PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.prestamo DROP CONSTRAINT pk_prestamo;
       public         postgres    false    205            �
           2606    33291 &   prestamo_material pk_prestamo_material 
   CONSTRAINT     z   ALTER TABLE ONLY public.prestamo_material
    ADD CONSTRAINT pk_prestamo_material PRIMARY KEY (prestamo_id, material_id);
 P   ALTER TABLE ONLY public.prestamo_material DROP CONSTRAINT pk_prestamo_material;
       public         postgres    false    206    206            �
           2606    33278    subcategoria pk_subcategoria 
   CONSTRAINT     Z   ALTER TABLE ONLY public.subcategoria
    ADD CONSTRAINT pk_subcategoria PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.subcategoria DROP CONSTRAINT pk_subcategoria;
       public         postgres    false    202            �
           2606    33262    usuario pk_usuario 
   CONSTRAINT     P   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT pk_usuario PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.usuario DROP CONSTRAINT pk_usuario;
       public         postgres    false    197            �
           2606    33294     usuario_perfil pk_usuario_perfil 
   CONSTRAINT     q   ALTER TABLE ONLY public.usuario_perfil
    ADD CONSTRAINT pk_usuario_perfil PRIMARY KEY (usuario_id, perfil_id);
 J   ALTER TABLE ONLY public.usuario_perfil DROP CONSTRAINT pk_usuario_perfil;
       public         postgres    false    207    207            �
           1259    33263    correo_ciencias_unique    INDEX     \   CREATE UNIQUE INDEX correo_ciencias_unique ON public.usuario USING btree (correo_ciencias);
 *   DROP INDEX public.correo_ciencias_unique;
       public         postgres    false    197            �
           1259    33280    fk_categoria_idx    INDEX     Q   CREATE INDEX fk_categoria_idx ON public.subcategoria USING btree (categoria_id);
 $   DROP INDEX public.fk_categoria_idx;
       public         postgres    false    202            �
           1259    33276    fk_item_categoria_2_idx    INDEX     ^   CREATE INDEX fk_item_categoria_2_idx ON public.material_categoria USING btree (categoria_id);
 +   DROP INDEX public.fk_item_categoria_2_idx;
       public         postgres    false    201            �
           1259    33283    fk_item_subcategoria_2_idx    INDEX     g   CREATE INDEX fk_item_subcategoria_2_idx ON public.material_subcategoria USING btree (subcategoria_id);
 .   DROP INDEX public.fk_item_subcategoria_2_idx;
       public         postgres    false    203            �
           1259    33267    fk_kit_1_idx    INDEX     H   CREATE INDEX fk_kit_1_idx ON public.kit USING btree (usuario_id_autor);
     DROP INDEX public.fk_kit_1_idx;
       public         postgres    false    198            �
           1259    33268    fk_kit_2_idx    INDEX     R   CREATE INDEX fk_kit_2_idx ON public.kit USING btree (administrador_id_aprobador);
     DROP INDEX public.fk_kit_2_idx;
       public         postgres    false    198            �
           1259    33273    fk_kit_item_2_idx    INDEX     Q   CREATE INDEX fk_kit_item_2_idx ON public.kit_material USING btree (material_id);
 %   DROP INDEX public.fk_kit_item_2_idx;
       public         postgres    false    200            �
           1259    33288    fk_prestamo_1_idx    INDEX     L   CREATE INDEX fk_prestamo_1_idx ON public.prestamo USING btree (usuario_id);
 %   DROP INDEX public.fk_prestamo_1_idx;
       public         postgres    false    205            �
           1259    33289    fk_prestamo_2_idx    INDEX     \   CREATE INDEX fk_prestamo_2_idx ON public.prestamo USING btree (administrador_id_aprobador);
 %   DROP INDEX public.fk_prestamo_2_idx;
       public         postgres    false    205            �
           1259    33292    fk_prestamo_item_2_idx    INDEX     [   CREATE INDEX fk_prestamo_item_2_idx ON public.prestamo_material USING btree (material_id);
 *   DROP INDEX public.fk_prestamo_item_2_idx;
       public         postgres    false    206            �
           1259    33295    fk_usuario_perfil_1_idx    INDEX     W   CREATE INDEX fk_usuario_perfil_1_idx ON public.usuario_perfil USING btree (perfil_id);
 +   DROP INDEX public.fk_usuario_perfil_1_idx;
       public         postgres    false    207            �
           1259    33260    nombre_unique    INDEX     L   CREATE UNIQUE INDEX nombre_unique ON public.categoria USING btree (nombre);
 !   DROP INDEX public.nombre_unique;
       public         postgres    false    196            �
           1259    33279    nombre_unique1    INDEX     P   CREATE UNIQUE INDEX nombre_unique1 ON public.subcategoria USING btree (nombre);
 "   DROP INDEX public.nombre_unique1;
       public         postgres    false    202            �
           1259    33264    user_name_unique    INDEX     P   CREATE UNIQUE INDEX user_name_unique ON public.usuario USING btree (user_name);
 $   DROP INDEX public.user_name_unique;
       public         postgres    false    197            �
           2606    33341    subcategoria fk_categoria    FK CONSTRAINT     �   ALTER TABLE ONLY public.subcategoria
    ADD CONSTRAINT fk_categoria FOREIGN KEY (categoria_id) REFERENCES public.categoria(id);
 C   ALTER TABLE ONLY public.subcategoria DROP CONSTRAINT fk_categoria;
       public       postgres    false    202    196    2734            �
           2606    33331 &   material_categoria fk_item_categoria_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.material_categoria
    ADD CONSTRAINT fk_item_categoria_1 FOREIGN KEY (material_id) REFERENCES public.material(id);
 P   ALTER TABLE ONLY public.material_categoria DROP CONSTRAINT fk_item_categoria_1;
       public       postgres    false    2744    199    201            �
           2606    33336 &   material_categoria fk_item_categoria_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.material_categoria
    ADD CONSTRAINT fk_item_categoria_2 FOREIGN KEY (categoria_id) REFERENCES public.categoria(id);
 P   ALTER TABLE ONLY public.material_categoria DROP CONSTRAINT fk_item_categoria_2;
       public       postgres    false    196    201    2734            �
           2606    33346 ,   material_subcategoria fk_item_subcategoria_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.material_subcategoria
    ADD CONSTRAINT fk_item_subcategoria_1 FOREIGN KEY (material_id) REFERENCES public.material(id);
 V   ALTER TABLE ONLY public.material_subcategoria DROP CONSTRAINT fk_item_subcategoria_1;
       public       postgres    false    199    203    2744            �
           2606    33351 ,   material_subcategoria fk_item_subcategoria_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.material_subcategoria
    ADD CONSTRAINT fk_item_subcategoria_2 FOREIGN KEY (subcategoria_id) REFERENCES public.subcategoria(id);
 V   ALTER TABLE ONLY public.material_subcategoria DROP CONSTRAINT fk_item_subcategoria_2;
       public       postgres    false    203    202    2754            �
           2606    33311    kit fk_kit_1    FK CONSTRAINT     v   ALTER TABLE ONLY public.kit
    ADD CONSTRAINT fk_kit_1 FOREIGN KEY (usuario_id_autor) REFERENCES public.usuario(id);
 6   ALTER TABLE ONLY public.kit DROP CONSTRAINT fk_kit_1;
       public       postgres    false    198    197    2737            �
           2606    33316    kit fk_kit_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.kit
    ADD CONSTRAINT fk_kit_2 FOREIGN KEY (administrador_id_aprobador) REFERENCES public.usuario(id);
 6   ALTER TABLE ONLY public.kit DROP CONSTRAINT fk_kit_2;
       public       postgres    false    198    197    2737            �
           2606    33321    kit_material fk_kit_item_1    FK CONSTRAINT     v   ALTER TABLE ONLY public.kit_material
    ADD CONSTRAINT fk_kit_item_1 FOREIGN KEY (kit_id) REFERENCES public.kit(id);
 D   ALTER TABLE ONLY public.kit_material DROP CONSTRAINT fk_kit_item_1;
       public       postgres    false    200    198    2742            �
           2606    33326    kit_material fk_kit_item_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.kit_material
    ADD CONSTRAINT fk_kit_item_2 FOREIGN KEY (material_id) REFERENCES public.material(id);
 D   ALTER TABLE ONLY public.kit_material DROP CONSTRAINT fk_kit_item_2;
       public       postgres    false    200    199    2744            �
           2606    33356    prestamo fk_prestamo_1    FK CONSTRAINT     z   ALTER TABLE ONLY public.prestamo
    ADD CONSTRAINT fk_prestamo_1 FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);
 @   ALTER TABLE ONLY public.prestamo DROP CONSTRAINT fk_prestamo_1;
       public       postgres    false    205    2737    197            �
           2606    33361    prestamo fk_prestamo_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.prestamo
    ADD CONSTRAINT fk_prestamo_2 FOREIGN KEY (administrador_id_aprobador) REFERENCES public.usuario(id);
 @   ALTER TABLE ONLY public.prestamo DROP CONSTRAINT fk_prestamo_2;
       public       postgres    false    197    2737    205            �
           2606    33366 $   prestamo_material fk_prestamo_item_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.prestamo_material
    ADD CONSTRAINT fk_prestamo_item_1 FOREIGN KEY (prestamo_id) REFERENCES public.prestamo(id);
 N   ALTER TABLE ONLY public.prestamo_material DROP CONSTRAINT fk_prestamo_item_1;
       public       postgres    false    205    2763    206            �
           2606    33371 $   prestamo_material fk_prestamo_item_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.prestamo_material
    ADD CONSTRAINT fk_prestamo_item_2 FOREIGN KEY (material_id) REFERENCES public.material(id);
 N   ALTER TABLE ONLY public.prestamo_material DROP CONSTRAINT fk_prestamo_item_2;
       public       postgres    false    206    2744    199            �
           2606    33376 "   usuario_perfil fk_usuario_perfil_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_perfil
    ADD CONSTRAINT fk_usuario_perfil_1 FOREIGN KEY (perfil_id) REFERENCES public.perfil(id);
 L   ALTER TABLE ONLY public.usuario_perfil DROP CONSTRAINT fk_usuario_perfil_1;
       public       postgres    false    2759    204    207            �
           2606    33381 "   usuario_perfil fk_usuario_perfil_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario_perfil
    ADD CONSTRAINT fk_usuario_perfil_2 FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);
 L   ALTER TABLE ONLY public.usuario_perfil DROP CONSTRAINT fk_usuario_perfil_2;
       public       postgres    false    2737    197    207            Z      x������ � �      \      x������ � �      ^      x������ � �      ]      x������ � �      _      x������ � �      a      x������ � �      b      x������ � �      c      x������ � �      d      x������ � �      `      x������ � �      [      x������ � �      e      x������ � �     