PGDMP     (    2                x            sistema_compras_ventas    12.3    12.3 =    ]           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ^           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            _           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            `           1262    24576    sistema_compras_ventas    DATABASE     �   CREATE DATABASE sistema_compras_ventas WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Bolivia.1252' LC_CTYPE = 'Spanish_Bolivia.1252';
 &   DROP DATABASE sistema_compras_ventas;
                postgres    false            �            1259    24577 	   articulos    TABLE     �  CREATE TABLE public.articulos (
    id integer NOT NULL,
    idcategoria integer NOT NULL,
    codigo character varying(50),
    nombre character varying(100) NOT NULL,
    precio_venta numeric(11,2) NOT NULL,
    stock integer NOT NULL,
    descripcion character varying(256),
    condicion boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.articulos;
       public         heap    postgres    false            �            1259    24581    articulos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.articulos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.articulos_id_seq;
       public          postgres    false    202            a           0    0    articulos_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.articulos_id_seq OWNED BY public.articulos.id;
          public          postgres    false    203            �            1259    24583 
   categorias    TABLE       CREATE TABLE public.categorias (
    id bigint NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(256),
    condicion boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.categorias;
       public         heap    postgres    false            �            1259    24587    categorias_id_seq    SEQUENCE     z   CREATE SEQUENCE public.categorias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categorias_id_seq;
       public          postgres    false    204            b           0    0    categorias_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;
          public          postgres    false    205            �            1259    24589    failed_jobs    TABLE     �   CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.failed_jobs;
       public         heap    postgres    false            �            1259    24596    failed_jobs_id_seq    SEQUENCE     {   CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.failed_jobs_id_seq;
       public          postgres    false    206            c           0    0    failed_jobs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;
          public          postgres    false    207            �            1259    24598 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(191) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    postgres    false            �            1259    24601    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          postgres    false    208            d           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          postgres    false    209            �            1259    24603    password_resets    TABLE     �   CREATE TABLE public.password_resets (
    email character varying(191) NOT NULL,
    token character varying(191) NOT NULL,
    created_at timestamp(0) without time zone
);
 #   DROP TABLE public.password_resets;
       public         heap    postgres    false            �            1259    24606    personas    TABLE     �  CREATE TABLE public.personas (
    id bigint NOT NULL,
    nombre character varying(100) NOT NULL,
    tipo_documento character varying(20),
    num_documento character varying(20),
    direccion character varying(70),
    telefono character varying(20),
    email character varying(50),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.personas;
       public         heap    postgres    false            �            1259    24609    personas_id_seq    SEQUENCE     x   CREATE SEQUENCE public.personas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.personas_id_seq;
       public          postgres    false    211            e           0    0    personas_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.personas_id_seq OWNED BY public.personas.id;
          public          postgres    false    212            �            1259    24611    proveedores    TABLE     �   CREATE TABLE public.proveedores (
    id integer NOT NULL,
    contacto character varying(50),
    telefono_contacto character varying(50)
);
    DROP TABLE public.proveedores;
       public         heap    postgres    false            �            1259    24614    roles    TABLE     �   CREATE TABLE public.roles (
    id integer NOT NULL,
    nombre character varying(30) NOT NULL,
    descripcion character varying(100),
    condicion boolean DEFAULT true NOT NULL
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    24618    roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    214            f           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          postgres    false    215            �            1259    24620    users    TABLE       CREATE TABLE public.users (
    id integer NOT NULL,
    usuario character varying(191) NOT NULL,
    password character varying(191) NOT NULL,
    condicion boolean DEFAULT true NOT NULL,
    idrol integer NOT NULL,
    remember_token character varying(100)
);
    DROP TABLE public.users;
       public         heap    postgres    false            �
           2604    24624    articulos id    DEFAULT     l   ALTER TABLE ONLY public.articulos ALTER COLUMN id SET DEFAULT nextval('public.articulos_id_seq'::regclass);
 ;   ALTER TABLE public.articulos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202            �
           2604    24625    categorias id    DEFAULT     n   ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_id_seq'::regclass);
 <   ALTER TABLE public.categorias ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204            �
           2604    24626    failed_jobs id    DEFAULT     p   ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);
 =   ALTER TABLE public.failed_jobs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206            �
           2604    24627    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208            �
           2604    24628    personas id    DEFAULT     j   ALTER TABLE ONLY public.personas ALTER COLUMN id SET DEFAULT nextval('public.personas_id_seq'::regclass);
 :   ALTER TABLE public.personas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211            �
           2604    24629    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214            L          0    24577 	   articulos 
   TABLE DATA           �   COPY public.articulos (id, idcategoria, codigo, nombre, precio_venta, stock, descripcion, condicion, created_at, updated_at) FROM stdin;
    public          postgres    false    202   �F       N          0    24583 
   categorias 
   TABLE DATA           `   COPY public.categorias (id, nombre, descripcion, condicion, created_at, updated_at) FROM stdin;
    public          postgres    false    204   oG       P          0    24589    failed_jobs 
   TABLE DATA           [   COPY public.failed_jobs (id, connection, queue, payload, exception, failed_at) FROM stdin;
    public          postgres    false    206   QH       R          0    24598 
   migrations 
   TABLE DATA           :   COPY public.migrations (id, migration, batch) FROM stdin;
    public          postgres    false    208   nH       T          0    24603    password_resets 
   TABLE DATA           C   COPY public.password_resets (email, token, created_at) FROM stdin;
    public          postgres    false    210   ;I       U          0    24606    personas 
   TABLE DATA           �   COPY public.personas (id, nombre, tipo_documento, num_documento, direccion, telefono, email, created_at, updated_at) FROM stdin;
    public          postgres    false    211   XI       W          0    24611    proveedores 
   TABLE DATA           F   COPY public.proveedores (id, contacto, telefono_contacto) FROM stdin;
    public          postgres    false    213   LJ       X          0    24614    roles 
   TABLE DATA           C   COPY public.roles (id, nombre, descripcion, condicion) FROM stdin;
    public          postgres    false    214   vJ       Z          0    24620    users 
   TABLE DATA           X   COPY public.users (id, usuario, password, condicion, idrol, remember_token) FROM stdin;
    public          postgres    false    216   �J       g           0    0    articulos_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.articulos_id_seq', 4, true);
          public          postgres    false    203            h           0    0    categorias_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.categorias_id_seq', 15, true);
          public          postgres    false    205            i           0    0    failed_jobs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);
          public          postgres    false    207            j           0    0    migrations_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.migrations_id_seq', 9, true);
          public          postgres    false    209            k           0    0    personas_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.personas_id_seq', 6, true);
          public          postgres    false    212            l           0    0    roles_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.roles_id_seq', 1, false);
          public          postgres    false    215            �
           2606    24631 !   articulos articulos_nombre_unique 
   CONSTRAINT     ^   ALTER TABLE ONLY public.articulos
    ADD CONSTRAINT articulos_nombre_unique UNIQUE (nombre);
 K   ALTER TABLE ONLY public.articulos DROP CONSTRAINT articulos_nombre_unique;
       public            postgres    false    202            �
           2606    24633    articulos articulos_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.articulos
    ADD CONSTRAINT articulos_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.articulos DROP CONSTRAINT articulos_pkey;
       public            postgres    false    202            �
           2606    24635    categorias categorias_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categorias DROP CONSTRAINT categorias_pkey;
       public            postgres    false    204            �
           2606    24637    failed_jobs failed_jobs_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_pkey;
       public            postgres    false    206            �
           2606    24639    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public            postgres    false    208            �
           2606    24641    personas personas_nombre_unique 
   CONSTRAINT     \   ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_nombre_unique UNIQUE (nombre);
 I   ALTER TABLE ONLY public.personas DROP CONSTRAINT personas_nombre_unique;
       public            postgres    false    211            �
           2606    24643    personas personas_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.personas DROP CONSTRAINT personas_pkey;
       public            postgres    false    211            �
           2606    24645    roles roles_nombre_unique 
   CONSTRAINT     V   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_nombre_unique UNIQUE (nombre);
 C   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_nombre_unique;
       public            postgres    false    214            �
           2606    24647    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    214            �
           2606    24649    users users_usuario_unique 
   CONSTRAINT     X   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_usuario_unique UNIQUE (usuario);
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_usuario_unique;
       public            postgres    false    216            �
           1259    24650    password_resets_email_index    INDEX     X   CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);
 /   DROP INDEX public.password_resets_email_index;
       public            postgres    false    210            �
           2606    24651 '   articulos articulos_idcategoria_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.articulos
    ADD CONSTRAINT articulos_idcategoria_foreign FOREIGN KEY (idcategoria) REFERENCES public.categorias(id);
 Q   ALTER TABLE ONLY public.articulos DROP CONSTRAINT articulos_idcategoria_foreign;
       public          postgres    false    2746    202    204            �
           2606    24656 )   proveedores proveedores_create_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_create_id_foreign FOREIGN KEY (id) REFERENCES public.personas(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.proveedores DROP CONSTRAINT proveedores_create_id_foreign;
       public          postgres    false    2755    211    213            �
           2606    24661    users users_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_id_foreign FOREIGN KEY (id) REFERENCES public.personas(id) ON DELETE CASCADE;
 @   ALTER TABLE ONLY public.users DROP CONSTRAINT users_id_foreign;
       public          postgres    false    211    216    2755            �
           2606    24666    users users_idrol_foreign    FK CONSTRAINT     v   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_idrol_foreign FOREIGN KEY (idrol) REFERENCES public.roles(id);
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_idrol_foreign;
       public          postgres    false    2759    214    216            L   �   x�m���0E��Y d;	��p�B$P�B��_S*!>����``��W0�G���E*����8Lf��w^2,: T�L�(0��0��^_����̳zW�Я7m6����Q=Z�URyG�Kݐ�ا;�ͣ��I��3��o�kY��z-i�]Tbq���1lJD� 'FE0      N   �   x�m��n�0Dg�+�.(J����N��۪�#�v3��K#i8�A��{-��}�9�֒�Y�TL���$���g�8��AS<�����*�ZC.0w@�^f��,�coc��k��p�ߘq1��_�h���o�{�/����<NY�#������ZS1�`m`����
��?|wU�-�QܮŹ`[�0H��#��x��k��tےH�Dx|@��t[�      P      x������ � �      R   �   x�}��� ���0�-0ݻ�4�U3���M__4�E=����R�HV�X���g�%iL2�Ӥ�B���O�� Q�εż[:�������I��S�6sF���4v����\.!��jWuΌƭ��y�)���-8�G�l���K�[l`�k������C�{~�����3%v���tҟS�p��b�{�      T      x������ � �      U   �   x�m�A��0���_���a�nOnШ���7/�{��oaWB��syyߛ�ᠴ�*s+���1 B��w+΍y
δ�Ԫ�湩�������&�������fA�%_I����{��� ��_Ӹ��1V�?�Vz�RU�>�3g��8I!$S#h��mL_��t�b�1��y�É�NcԹ.5��}�;L?cl!.i9��lkUS�u��eH��
��pJc�9c�?�d�      W      x�3�442a.N����� )aD      X   X   x�3�tL����,.)JL�/B�+��*^X���Y�e�����
Rc@��R�J@*�9sr�S�R��PU���E��@u1z\\\ ��+P      Z   �   x�5�Mr�0 �u8E���gZX
Վ�Q0����@�+EZr{�x�(*���U���ll��M�R������F��rT�I��qp�gņ`]�I�ArO�AWf� ���C�V�k��X3�S�5�����׹��M3�8�Zo{�p< �d�V�b��BQ���m��8�b]O��d�����s$��E�q�J�6�iI]�eYw �F     