PGDMP      .                }           gamification    17.3    17.3 Z    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    41330    gamification    DATABASE     r   CREATE DATABASE gamification WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en-US';
    DROP DATABASE gamification;
                     postgres    false                        2615    41613    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                     postgres    false            �           0    0    SCHEMA public    COMMENT         COMMENT ON SCHEMA public IS '';
                        postgres    false    5            �           0    0    SCHEMA public    ACL     +   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
                        postgres    false    5            �           1247    42415    RecommendationStatus    TYPE     c   CREATE TYPE public."RecommendationStatus" AS ENUM (
    'NON_FIT',
    'PARTIAL_FIT',
    'FIT'
);
 )   DROP TYPE public."RecommendationStatus";
       public               postgres    false    5            �            1259    41636    SavedGeneralisedRecommendation    TABLE     �   CREATE TABLE public."SavedGeneralisedRecommendation" (
    "generalisedRecommendationId" integer NOT NULL,
    "savedResultId" integer NOT NULL,
    "selectionStatus" public."RecommendationStatus"
);
 4   DROP TABLE public."SavedGeneralisedRecommendation";
       public         heap r       postgres    false    5    908            �            1259    41692 $   SavedNotSuitableGamificationElements    TABLE     �   CREATE TABLE public."SavedNotSuitableGamificationElements" (
    "notSuitableGamificationElementsId" integer NOT NULL,
    "savedResultId" integer NOT NULL,
    selected boolean DEFAULT false NOT NULL
);
 :   DROP TABLE public."SavedNotSuitableGamificationElements";
       public         heap r       postgres    false    5            �            1259    41712    SavedResult    TABLE     �   CREATE TABLE public."SavedResult" (
    id integer NOT NULL,
    name text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
 !   DROP TABLE public."SavedResult";
       public         heap r       postgres    false    5            �            1259    41711    SavedResult_id_seq    SEQUENCE     �   CREATE SEQUENCE public."SavedResult_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."SavedResult_id_seq";
       public               postgres    false    5    237            �           0    0    SavedResult_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."SavedResult_id_seq" OWNED BY public."SavedResult".id;
          public               postgres    false    236            �            1259    41650 !   SavedSuitableGamificationElements    TABLE     �   CREATE TABLE public."SavedSuitableGamificationElements" (
    "suitableGamificationElementsId" integer NOT NULL,
    "savedResultId" integer NOT NULL,
    selected boolean DEFAULT false NOT NULL
);
 7   DROP TABLE public."SavedSuitableGamificationElements";
       public         heap r       postgres    false    5            �            1259    41664    SavedUsabilityCharacteristics    TABLE     �   CREATE TABLE public."SavedUsabilityCharacteristics" (
    "usabilityCharacteristicsId" integer NOT NULL,
    "savedResultId" integer NOT NULL
);
 3   DROP TABLE public."SavedUsabilityCharacteristics";
       public         heap r       postgres    false    5            �            1259    41678 7   SavedUsabilityRecommendationsForGamificationElementsIso    TABLE     �   CREATE TABLE public."SavedUsabilityRecommendationsForGamificationElementsIso" (
    "usabilityRecommendationsForGamificationElementsIsoId" integer NOT NULL,
    "savedResultId" integer NOT NULL,
    "selectionStatus" public."RecommendationStatus"
);
 M   DROP TABLE public."SavedUsabilityRecommendationsForGamificationElementsIso";
       public         heap r       postgres    false    908    5            �            1259    41706 :   SavedUsabilityRecommendationsForGamificationElementsWcag22    TABLE        CREATE TABLE public."SavedUsabilityRecommendationsForGamificationElementsWcag22" (
    "usabilityRecommendationsForGamificationElementsWcag22Id" integer NOT NULL,
    "savedResultId" integer NOT NULL,
    "selectionStatus" public."RecommendationStatus"
);
 P   DROP TABLE public."SavedUsabilityRecommendationsForGamificationElementsWcag22";
       public         heap r       postgres    false    908    5            �            1259    41614    _prisma_migrations    TABLE     �  CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);
 &   DROP TABLE public._prisma_migrations;
       public         heap r       postgres    false    5            �            1259    41628    generalised_recommendations    TABLE     8  CREATE TABLE public.generalised_recommendations (
    id integer NOT NULL,
    rule_idx integer NOT NULL,
    "usabilityGoal" text,
    "usabilityPrinciple" text,
    "ageGroup" text,
    "applicationDomain" text,
    disorder text,
    "gamificationGoal" text,
    "genRecommendation" text,
    example text
);
 /   DROP TABLE public.generalised_recommendations;
       public         heap r       postgres    false    5            �            1259    41627 "   generalised_recommendations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.generalised_recommendations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.generalised_recommendations_id_seq;
       public               postgres    false    219    5            �           0    0 "   generalised_recommendations_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.generalised_recommendations_id_seq OWNED BY public.generalised_recommendations.id;
          public               postgres    false    218            �            1259    41684 "   not_suitable_gamification_elements    TABLE     .  CREATE TABLE public.not_suitable_gamification_elements (
    id integer NOT NULL,
    rule_idx integer NOT NULL,
    "ageGroup" text,
    "applicationDomain" text,
    disorder text,
    "usabilityGoal" text,
    "gamificationGoal" text,
    duration text,
    "notSuitableGamificationElement" text
);
 6   DROP TABLE public.not_suitable_gamification_elements;
       public         heap r       postgres    false    5            �            1259    41683 )   not_suitable_gamification_elements_id_seq    SEQUENCE     �   CREATE SEQUENCE public.not_suitable_gamification_elements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.not_suitable_gamification_elements_id_seq;
       public               postgres    false    5    231            �           0    0 )   not_suitable_gamification_elements_id_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.not_suitable_gamification_elements_id_seq OWNED BY public.not_suitable_gamification_elements.id;
          public               postgres    false    230            �            1259    41642    suitable_gamification_elements    TABLE     T  CREATE TABLE public.suitable_gamification_elements (
    id integer NOT NULL,
    rule_idx integer NOT NULL,
    "ageGroup" text,
    "applicationDomain" text,
    disorder text,
    "gamificationGoal" text,
    "usabilityGoal" text,
    "usabilityCharacteristic" text,
    "gamificationElement" text,
    "usabilityRecommendation" text
);
 2   DROP TABLE public.suitable_gamification_elements;
       public         heap r       postgres    false    5            �            1259    41641 %   suitable_gamification_elements_id_seq    SEQUENCE     �   CREATE SEQUENCE public.suitable_gamification_elements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.suitable_gamification_elements_id_seq;
       public               postgres    false    5    222            �           0    0 %   suitable_gamification_elements_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.suitable_gamification_elements_id_seq OWNED BY public.suitable_gamification_elements.id;
          public               postgres    false    221            �            1259    41656    usability_characteristics    TABLE     �   CREATE TABLE public.usability_characteristics (
    id integer NOT NULL,
    rule_idx integer NOT NULL,
    "usabilityGoal" text,
    "ageGroup" text,
    disorder text,
    "applicationDomain" text,
    "usabilityCharacteristic" text
);
 -   DROP TABLE public.usability_characteristics;
       public         heap r       postgres    false    5            �            1259    41655     usability_characteristics_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usability_characteristics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.usability_characteristics_id_seq;
       public               postgres    false    5    225            �           0    0     usability_characteristics_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.usability_characteristics_id_seq OWNED BY public.usability_characteristics.id;
          public               postgres    false    224            �            1259    41670 8   usability_recommendations_for_gamification_elements_iso_    TABLE       CREATE TABLE public.usability_recommendations_for_gamification_elements_iso_ (
    id integer NOT NULL,
    rule_idx integer NOT NULL,
    "gamificationElement" text,
    "ISOrecommendation" text,
    "elementUsabilityRecommendation" text,
    example text
);
 L   DROP TABLE public.usability_recommendations_for_gamification_elements_iso_;
       public         heap r       postgres    false    5            �            1259    41669 ?   usability_recommendations_for_gamification_elements_iso__id_seq    SEQUENCE     �   CREATE SEQUENCE public.usability_recommendations_for_gamification_elements_iso__id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 V   DROP SEQUENCE public.usability_recommendations_for_gamification_elements_iso__id_seq;
       public               postgres    false    228    5            �           0    0 ?   usability_recommendations_for_gamification_elements_iso__id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.usability_recommendations_for_gamification_elements_iso__id_seq OWNED BY public.usability_recommendations_for_gamification_elements_iso_.id;
          public               postgres    false    227            �            1259    41698 =   usability_recommendations_for_gamification_elements_wcag_2_2_    TABLE       CREATE TABLE public.usability_recommendations_for_gamification_elements_wcag_2_2_ (
    id integer NOT NULL,
    rule_idx integer NOT NULL,
    "gamificationElement" text,
    disorder text,
    "WCAGrecommendation" text,
    "elementUsabilityRecommendation" text,
    example text
);
 Q   DROP TABLE public.usability_recommendations_for_gamification_elements_wcag_2_2_;
       public         heap r       postgres    false    5            �            1259    41697 ?   usability_recommendations_for_gamification_elements_wcag_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usability_recommendations_for_gamification_elements_wcag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 V   DROP SEQUENCE public.usability_recommendations_for_gamification_elements_wcag_id_seq;
       public               postgres    false    5    234            �           0    0 ?   usability_recommendations_for_gamification_elements_wcag_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.usability_recommendations_for_gamification_elements_wcag_id_seq OWNED BY public.usability_recommendations_for_gamification_elements_wcag_2_2_.id;
          public               postgres    false    233            �           2604    41715    SavedResult id    DEFAULT     t   ALTER TABLE ONLY public."SavedResult" ALTER COLUMN id SET DEFAULT nextval('public."SavedResult_id_seq"'::regclass);
 ?   ALTER TABLE public."SavedResult" ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    236    237    237            �           2604    41631    generalised_recommendations id    DEFAULT     �   ALTER TABLE ONLY public.generalised_recommendations ALTER COLUMN id SET DEFAULT nextval('public.generalised_recommendations_id_seq'::regclass);
 M   ALTER TABLE public.generalised_recommendations ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    219    218    219            �           2604    41687 %   not_suitable_gamification_elements id    DEFAULT     �   ALTER TABLE ONLY public.not_suitable_gamification_elements ALTER COLUMN id SET DEFAULT nextval('public.not_suitable_gamification_elements_id_seq'::regclass);
 T   ALTER TABLE public.not_suitable_gamification_elements ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    231    230    231            �           2604    41645 !   suitable_gamification_elements id    DEFAULT     �   ALTER TABLE ONLY public.suitable_gamification_elements ALTER COLUMN id SET DEFAULT nextval('public.suitable_gamification_elements_id_seq'::regclass);
 P   ALTER TABLE public.suitable_gamification_elements ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    222    222            �           2604    41659    usability_characteristics id    DEFAULT     �   ALTER TABLE ONLY public.usability_characteristics ALTER COLUMN id SET DEFAULT nextval('public.usability_characteristics_id_seq'::regclass);
 K   ALTER TABLE public.usability_characteristics ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    225    224    225            �           2604    41673 ;   usability_recommendations_for_gamification_elements_iso_ id    DEFAULT     �   ALTER TABLE ONLY public.usability_recommendations_for_gamification_elements_iso_ ALTER COLUMN id SET DEFAULT nextval('public.usability_recommendations_for_gamification_elements_iso__id_seq'::regclass);
 j   ALTER TABLE public.usability_recommendations_for_gamification_elements_iso_ ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    227    228    228            �           2604    41701 @   usability_recommendations_for_gamification_elements_wcag_2_2_ id    DEFAULT     �   ALTER TABLE ONLY public.usability_recommendations_for_gamification_elements_wcag_2_2_ ALTER COLUMN id SET DEFAULT nextval('public.usability_recommendations_for_gamification_elements_wcag_id_seq'::regclass);
 o   ALTER TABLE public.usability_recommendations_for_gamification_elements_wcag_2_2_ ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    234    233    234            �          0    41636    SavedGeneralisedRecommendation 
   TABLE DATA           }   COPY public."SavedGeneralisedRecommendation" ("generalisedRecommendationId", "savedResultId", "selectionStatus") FROM stdin;
    public               postgres    false    220   c�       �          0    41692 $   SavedNotSuitableGamificationElements 
   TABLE DATA           �   COPY public."SavedNotSuitableGamificationElements" ("notSuitableGamificationElementsId", "savedResultId", selected) FROM stdin;
    public               postgres    false    232   %�       �          0    41712    SavedResult 
   TABLE DATA           >   COPY public."SavedResult" (id, name, "createdAt") FROM stdin;
    public               postgres    false    237   B�       �          0    41650 !   SavedSuitableGamificationElements 
   TABLE DATA           z   COPY public."SavedSuitableGamificationElements" ("suitableGamificationElementsId", "savedResultId", selected) FROM stdin;
    public               postgres    false    223   ˖       �          0    41664    SavedUsabilityCharacteristics 
   TABLE DATA           h   COPY public."SavedUsabilityCharacteristics" ("usabilityCharacteristicsId", "savedResultId") FROM stdin;
    public               postgres    false    226   G�       �          0    41678 7   SavedUsabilityRecommendationsForGamificationElementsIso 
   TABLE DATA           �   COPY public."SavedUsabilityRecommendationsForGamificationElementsIso" ("usabilityRecommendationsForGamificationElementsIsoId", "savedResultId", "selectionStatus") FROM stdin;
    public               postgres    false    229   d�       �          0    41706 :   SavedUsabilityRecommendationsForGamificationElementsWcag22 
   TABLE DATA           �   COPY public."SavedUsabilityRecommendationsForGamificationElementsWcag22" ("usabilityRecommendationsForGamificationElementsWcag22Id", "savedResultId", "selectionStatus") FROM stdin;
    public               postgres    false    235   �       �          0    41614    _prisma_migrations 
   TABLE DATA           �   COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
    public               postgres    false    217   ��       �          0    41628    generalised_recommendations 
   TABLE DATA           �   COPY public.generalised_recommendations (id, rule_idx, "usabilityGoal", "usabilityPrinciple", "ageGroup", "applicationDomain", disorder, "gamificationGoal", "genRecommendation", example) FROM stdin;
    public               postgres    false    219   ��       �          0    41684 "   not_suitable_gamification_elements 
   TABLE DATA           �   COPY public.not_suitable_gamification_elements (id, rule_idx, "ageGroup", "applicationDomain", disorder, "usabilityGoal", "gamificationGoal", duration, "notSuitableGamificationElement") FROM stdin;
    public               postgres    false    231         �          0    41642    suitable_gamification_elements 
   TABLE DATA           �   COPY public.suitable_gamification_elements (id, rule_idx, "ageGroup", "applicationDomain", disorder, "gamificationGoal", "usabilityGoal", "usabilityCharacteristic", "gamificationElement", "usabilityRecommendation") FROM stdin;
    public               postgres    false    222   N      �          0    41656    usability_characteristics 
   TABLE DATA           �   COPY public.usability_characteristics (id, rule_idx, "usabilityGoal", "ageGroup", disorder, "applicationDomain", "usabilityCharacteristic") FROM stdin;
    public               postgres    false    225   9      �          0    41670 8   usability_recommendations_for_gamification_elements_iso_ 
   TABLE DATA           �   COPY public.usability_recommendations_for_gamification_elements_iso_ (id, rule_idx, "gamificationElement", "ISOrecommendation", "elementUsabilityRecommendation", example) FROM stdin;
    public               postgres    false    228   �      �          0    41698 =   usability_recommendations_for_gamification_elements_wcag_2_2_ 
   TABLE DATA           �   COPY public.usability_recommendations_for_gamification_elements_wcag_2_2_ (id, rule_idx, "gamificationElement", disorder, "WCAGrecommendation", "elementUsabilityRecommendation", example) FROM stdin;
    public               postgres    false    234    =      �           0    0    SavedResult_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."SavedResult_id_seq"', 5, true);
          public               postgres    false    236            �           0    0 "   generalised_recommendations_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.generalised_recommendations_id_seq', 727, true);
          public               postgres    false    218            �           0    0 )   not_suitable_gamification_elements_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.not_suitable_gamification_elements_id_seq', 19, true);
          public               postgres    false    230            �           0    0 %   suitable_gamification_elements_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.suitable_gamification_elements_id_seq', 152, true);
          public               postgres    false    221            �           0    0     usability_characteristics_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.usability_characteristics_id_seq', 30, true);
          public               postgres    false    224            �           0    0 ?   usability_recommendations_for_gamification_elements_iso__id_seq    SEQUENCE SET     p   SELECT pg_catalog.setval('public.usability_recommendations_for_gamification_elements_iso__id_seq', 1523, true);
          public               postgres    false    227            �           0    0 ?   usability_recommendations_for_gamification_elements_wcag_id_seq    SEQUENCE SET     o   SELECT pg_catalog.setval('public.usability_recommendations_for_gamification_elements_wcag_id_seq', 232, true);
          public               postgres    false    233            �           2606    41640 B   SavedGeneralisedRecommendation SavedGeneralisedRecommendation_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."SavedGeneralisedRecommendation"
    ADD CONSTRAINT "SavedGeneralisedRecommendation_pkey" PRIMARY KEY ("generalisedRecommendationId", "savedResultId");
 p   ALTER TABLE ONLY public."SavedGeneralisedRecommendation" DROP CONSTRAINT "SavedGeneralisedRecommendation_pkey";
       public                 postgres    false    220    220            �           2606    41696 N   SavedNotSuitableGamificationElements SavedNotSuitableGamificationElements_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."SavedNotSuitableGamificationElements"
    ADD CONSTRAINT "SavedNotSuitableGamificationElements_pkey" PRIMARY KEY ("notSuitableGamificationElementsId", "savedResultId");
 |   ALTER TABLE ONLY public."SavedNotSuitableGamificationElements" DROP CONSTRAINT "SavedNotSuitableGamificationElements_pkey";
       public                 postgres    false    232    232            �           2606    41720    SavedResult SavedResult_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."SavedResult"
    ADD CONSTRAINT "SavedResult_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."SavedResult" DROP CONSTRAINT "SavedResult_pkey";
       public                 postgres    false    237            �           2606    41654 H   SavedSuitableGamificationElements SavedSuitableGamificationElements_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."SavedSuitableGamificationElements"
    ADD CONSTRAINT "SavedSuitableGamificationElements_pkey" PRIMARY KEY ("suitableGamificationElementsId", "savedResultId");
 v   ALTER TABLE ONLY public."SavedSuitableGamificationElements" DROP CONSTRAINT "SavedSuitableGamificationElements_pkey";
       public                 postgres    false    223    223            �           2606    41668 @   SavedUsabilityCharacteristics SavedUsabilityCharacteristics_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."SavedUsabilityCharacteristics"
    ADD CONSTRAINT "SavedUsabilityCharacteristics_pkey" PRIMARY KEY ("usabilityCharacteristicsId", "savedResultId");
 n   ALTER TABLE ONLY public."SavedUsabilityCharacteristics" DROP CONSTRAINT "SavedUsabilityCharacteristics_pkey";
       public                 postgres    false    226    226            �           2606    41682 t   SavedUsabilityRecommendationsForGamificationElementsIso SavedUsabilityRecommendationsForGamificationElementsIso_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."SavedUsabilityRecommendationsForGamificationElementsIso"
    ADD CONSTRAINT "SavedUsabilityRecommendationsForGamificationElementsIso_pkey" PRIMARY KEY ("usabilityRecommendationsForGamificationElementsIsoId", "savedResultId");
 �   ALTER TABLE ONLY public."SavedUsabilityRecommendationsForGamificationElementsIso" DROP CONSTRAINT "SavedUsabilityRecommendationsForGamificationElementsIso_pkey";
       public                 postgres    false    229    229            �           2606    41710 z   SavedUsabilityRecommendationsForGamificationElementsWcag22 SavedUsabilityRecommendationsForGamificationElementsWcag22_pkey 
   CONSTRAINT       ALTER TABLE ONLY public."SavedUsabilityRecommendationsForGamificationElementsWcag22"
    ADD CONSTRAINT "SavedUsabilityRecommendationsForGamificationElementsWcag22_pkey" PRIMARY KEY ("usabilityRecommendationsForGamificationElementsWcag22Id", "savedResultId");
 �   ALTER TABLE ONLY public."SavedUsabilityRecommendationsForGamificationElementsWcag22" DROP CONSTRAINT "SavedUsabilityRecommendationsForGamificationElementsWcag22_pkey";
       public                 postgres    false    235    235            �           2606    41622 *   _prisma_migrations _prisma_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public._prisma_migrations DROP CONSTRAINT _prisma_migrations_pkey;
       public                 postgres    false    217            �           2606    41635 <   generalised_recommendations generalised_recommendations_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.generalised_recommendations
    ADD CONSTRAINT generalised_recommendations_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.generalised_recommendations DROP CONSTRAINT generalised_recommendations_pkey;
       public                 postgres    false    219            �           2606    41691 J   not_suitable_gamification_elements not_suitable_gamification_elements_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.not_suitable_gamification_elements
    ADD CONSTRAINT not_suitable_gamification_elements_pkey PRIMARY KEY (id);
 t   ALTER TABLE ONLY public.not_suitable_gamification_elements DROP CONSTRAINT not_suitable_gamification_elements_pkey;
       public                 postgres    false    231            �           2606    41649 B   suitable_gamification_elements suitable_gamification_elements_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.suitable_gamification_elements
    ADD CONSTRAINT suitable_gamification_elements_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.suitable_gamification_elements DROP CONSTRAINT suitable_gamification_elements_pkey;
       public                 postgres    false    222            �           2606    41663 8   usability_characteristics usability_characteristics_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.usability_characteristics
    ADD CONSTRAINT usability_characteristics_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.usability_characteristics DROP CONSTRAINT usability_characteristics_pkey;
       public                 postgres    false    225            �           2606    41677 v   usability_recommendations_for_gamification_elements_iso_ usability_recommendations_for_gamification_elements_iso__pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.usability_recommendations_for_gamification_elements_iso_
    ADD CONSTRAINT usability_recommendations_for_gamification_elements_iso__pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.usability_recommendations_for_gamification_elements_iso_ DROP CONSTRAINT usability_recommendations_for_gamification_elements_iso__pkey;
       public                 postgres    false    228            �           2606    41705 }   usability_recommendations_for_gamification_elements_wcag_2_2_ usability_recommendations_for_gamification_elements_wcag_2_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.usability_recommendations_for_gamification_elements_wcag_2_2_
    ADD CONSTRAINT usability_recommendations_for_gamification_elements_wcag_2_pkey PRIMARY KEY (id);
 �   ALTER TABLE ONLY public.usability_recommendations_for_gamification_elements_wcag_2_2_ DROP CONSTRAINT usability_recommendations_for_gamification_elements_wcag_2_pkey;
       public                 postgres    false    234            �           2606    41771 _   SavedUsabilityRecommendationsForGamificationElementsWcag22 FK_UsabilityRecForGamificationWcag22    FK CONSTRAINT     Q  ALTER TABLE ONLY public."SavedUsabilityRecommendationsForGamificationElementsWcag22"
    ADD CONSTRAINT "FK_UsabilityRecForGamificationWcag22" FOREIGN KEY ("usabilityRecommendationsForGamificationElementsWcag22Id") REFERENCES public.usability_recommendations_for_gamification_elements_wcag_2_2_(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 �   ALTER TABLE ONLY public."SavedUsabilityRecommendationsForGamificationElementsWcag22" DROP CONSTRAINT "FK_UsabilityRecForGamificationWcag22";
       public               postgres    false    234    235    4838            �           2606    41721 ^   SavedGeneralisedRecommendation SavedGeneralisedRecommendation_generalisedRecommendationId_fkey    FK CONSTRAINT       ALTER TABLE ONLY public."SavedGeneralisedRecommendation"
    ADD CONSTRAINT "SavedGeneralisedRecommendation_generalisedRecommendationId_fkey" FOREIGN KEY ("generalisedRecommendationId") REFERENCES public.generalised_recommendations(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 �   ALTER TABLE ONLY public."SavedGeneralisedRecommendation" DROP CONSTRAINT "SavedGeneralisedRecommendation_generalisedRecommendationId_fkey";
       public               postgres    false    4818    219    220            �           2606    41726 P   SavedGeneralisedRecommendation SavedGeneralisedRecommendation_savedResultId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."SavedGeneralisedRecommendation"
    ADD CONSTRAINT "SavedGeneralisedRecommendation_savedResultId_fkey" FOREIGN KEY ("savedResultId") REFERENCES public."SavedResult"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 ~   ALTER TABLE ONLY public."SavedGeneralisedRecommendation" DROP CONSTRAINT "SavedGeneralisedRecommendation_savedResultId_fkey";
       public               postgres    false    220    4842    237            �           2606    41761 d   SavedNotSuitableGamificationElements SavedNotSuitableGamificationElements_notSuitableGamificati_fkey    FK CONSTRAINT     %  ALTER TABLE ONLY public."SavedNotSuitableGamificationElements"
    ADD CONSTRAINT "SavedNotSuitableGamificationElements_notSuitableGamificati_fkey" FOREIGN KEY ("notSuitableGamificationElementsId") REFERENCES public.not_suitable_gamification_elements(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 �   ALTER TABLE ONLY public."SavedNotSuitableGamificationElements" DROP CONSTRAINT "SavedNotSuitableGamificationElements_notSuitableGamificati_fkey";
       public               postgres    false    4834    231    232            �           2606    41766 \   SavedNotSuitableGamificationElements SavedNotSuitableGamificationElements_savedResultId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."SavedNotSuitableGamificationElements"
    ADD CONSTRAINT "SavedNotSuitableGamificationElements_savedResultId_fkey" FOREIGN KEY ("savedResultId") REFERENCES public."SavedResult"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 �   ALTER TABLE ONLY public."SavedNotSuitableGamificationElements" DROP CONSTRAINT "SavedNotSuitableGamificationElements_savedResultId_fkey";
       public               postgres    false    4842    237    232            �           2606    41736 V   SavedSuitableGamificationElements SavedSuitableGamificationElements_savedResultId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."SavedSuitableGamificationElements"
    ADD CONSTRAINT "SavedSuitableGamificationElements_savedResultId_fkey" FOREIGN KEY ("savedResultId") REFERENCES public."SavedResult"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 �   ALTER TABLE ONLY public."SavedSuitableGamificationElements" DROP CONSTRAINT "SavedSuitableGamificationElements_savedResultId_fkey";
       public               postgres    false    237    4842    223            �           2606    41731 a   SavedSuitableGamificationElements SavedSuitableGamificationElements_suitableGamificationElem_fkey    FK CONSTRAINT       ALTER TABLE ONLY public."SavedSuitableGamificationElements"
    ADD CONSTRAINT "SavedSuitableGamificationElements_suitableGamificationElem_fkey" FOREIGN KEY ("suitableGamificationElementsId") REFERENCES public.suitable_gamification_elements(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 �   ALTER TABLE ONLY public."SavedSuitableGamificationElements" DROP CONSTRAINT "SavedSuitableGamificationElements_suitableGamificationElem_fkey";
       public               postgres    false    222    223    4822            �           2606    41746 N   SavedUsabilityCharacteristics SavedUsabilityCharacteristics_savedResultId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."SavedUsabilityCharacteristics"
    ADD CONSTRAINT "SavedUsabilityCharacteristics_savedResultId_fkey" FOREIGN KEY ("savedResultId") REFERENCES public."SavedResult"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 |   ALTER TABLE ONLY public."SavedUsabilityCharacteristics" DROP CONSTRAINT "SavedUsabilityCharacteristics_savedResultId_fkey";
       public               postgres    false    237    4842    226            �           2606    41741 [   SavedUsabilityCharacteristics SavedUsabilityCharacteristics_usabilityCharacteristicsId_fkey    FK CONSTRAINT       ALTER TABLE ONLY public."SavedUsabilityCharacteristics"
    ADD CONSTRAINT "SavedUsabilityCharacteristics_usabilityCharacteristicsId_fkey" FOREIGN KEY ("usabilityCharacteristicsId") REFERENCES public.usability_characteristics(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 �   ALTER TABLE ONLY public."SavedUsabilityCharacteristics" DROP CONSTRAINT "SavedUsabilityCharacteristics_usabilityCharacteristicsId_fkey";
       public               postgres    false    226    225    4826            �           2606    41756 w   SavedUsabilityRecommendationsForGamificationElementsIso SavedUsabilityRecommendationsForGamificationElementsIso_sa_fkey    FK CONSTRAINT       ALTER TABLE ONLY public."SavedUsabilityRecommendationsForGamificationElementsIso"
    ADD CONSTRAINT "SavedUsabilityRecommendationsForGamificationElementsIso_sa_fkey" FOREIGN KEY ("savedResultId") REFERENCES public."SavedResult"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 �   ALTER TABLE ONLY public."SavedUsabilityRecommendationsForGamificationElementsIso" DROP CONSTRAINT "SavedUsabilityRecommendationsForGamificationElementsIso_sa_fkey";
       public               postgres    false    4842    229    237            �           2606    41751 w   SavedUsabilityRecommendationsForGamificationElementsIso SavedUsabilityRecommendationsForGamificationElementsIso_us_fkey    FK CONSTRAINT     a  ALTER TABLE ONLY public."SavedUsabilityRecommendationsForGamificationElementsIso"
    ADD CONSTRAINT "SavedUsabilityRecommendationsForGamificationElementsIso_us_fkey" FOREIGN KEY ("usabilityRecommendationsForGamificationElementsIsoId") REFERENCES public.usability_recommendations_for_gamification_elements_iso_(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 �   ALTER TABLE ONLY public."SavedUsabilityRecommendationsForGamificationElementsIso" DROP CONSTRAINT "SavedUsabilityRecommendationsForGamificationElementsIso_us_fkey";
       public               postgres    false    229    228    4830            �           2606    41776 z   SavedUsabilityRecommendationsForGamificationElementsWcag22 SavedUsabilityRecommendationsForGamificationElementsWcag22_fkey    FK CONSTRAINT       ALTER TABLE ONLY public."SavedUsabilityRecommendationsForGamificationElementsWcag22"
    ADD CONSTRAINT "SavedUsabilityRecommendationsForGamificationElementsWcag22_fkey" FOREIGN KEY ("savedResultId") REFERENCES public."SavedResult"(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 �   ALTER TABLE ONLY public."SavedUsabilityRecommendationsForGamificationElementsWcag22" DROP CONSTRAINT "SavedUsabilityRecommendationsForGamificationElementsWcag22_fkey";
       public               postgres    false    235    237    4842            �   �   x�U�K
�0D��aJdY�,�)JZJ����E�L �yi��%H8�(!�h�$(k@�C��,P�}C��7������"�P7�}�rs}.��T[\R���y��� �N+�N�3ޱMY��-�<!��s;�Xg��r��{�9'�%��~�m}��\�v��>�}���ܘ٩�#����[�      �      x������ � �      �   y   x�U�1
�0k�+�'�.�]�'Ҹ0�������b�ac8��\�MH�t���D\�a,U)�ǵ��w�%:�gpE!�y`u�gc-��Ֆ?�����Ō�{c<�8��K6z2} �s&�      �   l  x�5�A�� ��cV���e����v���2tK��h����p�UYu�[�1����l]���O�ei)����>{WP��ZF):�P.��0��[c ,���R�]�M�M/��O{N-��Ҳ�,?ZZ��m��s;�ֹi;K{�h��������W���jFW4}�+�{����jZO�����g1mğ��_����l0�������t�n��\�����#�X�VX���t_-��%d	�F�)D
�B�)D
�B�)D
�B��yi����Mg���Z��eiY~�l�tn�۞��ֹun�NvF #��`0� F #��`0� F #��`0� F #�h�[������f      �      x������ � �      �   �  x�E�;n�0D��a~��	�0`������Ѩ_M�[E�߸�����Zk�X���u�km-7��BPx�X��ZRPR�3��q�P
�#�c�%V�)D��.���ںP(.�m��joVQQG���x�l5���J��yS��&�<?F:w���csa��t�11c;L>"��m V�Ӹ�ӥ.1��P��K�̝Y2ФesP"�d�k7�)�n������N���^݌�R�HyMGDGA�y�������稧���ߟ����F�y��kp׺�����_�/�������_�/�����+o.�ќ'�΄'�J��R@)�P
(�J��R@)�P
(e(e(e(e(��d�	�%�}*�~�8���|�߷�8�����      �   v   x�]��
�0D��cĦ���� Hq����5ɠ�y�;�@pD50��ؔ�jf�0��q.�z�ˉ����=���%m�ZG�h+�7��L�Ov"F�@يo��h0��A��k��2�      �   �   x�m�MjC1��y��8H#ɶr�� �g�H
MJ�ߗv�
��᛬R[xNEҩ��s$�1�UbV���
W�R�w��)�1V�<[i���2:���ʭ��:�j�%�~�DF��Jf�$�-$jt�����t����;���7��T皔HRբi:�&O�].^bΡ%�si�Z	P�ƴ���KW����DW�~[�݂q0�S�!� ��������n�/����no׿w~�	���˲| ��`z      �      x���ێ+G�%�L}ET�P`��L�]URI��)�HU��'�$�2�sSOz��y�>��|����`>al��G3y	���y	���v��p_f�nfn����4~L�0�'�u�4	�`�q�?s���D���>1���ֳ`՘.]oi��g�T%n�7<�"���̝��i�%�����H�Xg�o|�����p��	�`�8vT�$K�FN��;�����S/�i��$uw�_�����-�����������k����	~z:���H�� ���ױ��&� ��+���8����g������	���1�U��Ln��� ��PVzD�W�0���5i͠0u�&��&������k҈Q0���c|e<^�n�5���`$�Y^�'*�8�_��^i?��ȵ��)E��S����'ׁ;sV�`�v�B��!
l	 '������	�sg�0A)-C���KM���;	��)ϣ�hH-N����yM1h�����N�JDh�+����e�&�s���t�t��DM�wcW�o�i+Z*I�S�V���u�"`�iI�S����l937�ޏAӤ�%}9��4a�К2�"��):�m��)�uѾ;�{���iK���5zN�h& ����e6?~ ���9�1��/:�k tp�y�0�J���J�Kg��M�30a�P|�4�ٛW����z{
6(��QD��I{:�x�4����2�R�|����4�`ỿhR��q�b���^2���р��{�����)�]) ��O�pS_#$�v%��9U�3��A�f#'c�ηn9�46oOyz�~�kzU�o�!��V:����4a�D�S���xa�=��.��G��g���H�-z��׊��v�TyqKB3x����9��9���Fj�`ʈs8.d�?�f�1h��H�Y.>�Epʄ�^>B���wR�"$�U!�6c�|�"fC��=�?z�L�Y��U��
U�Z*B9r�QX�)�d\3⦑�-4F��Q�)	��jn7_t�UN�������1l\w-��?Q޿��4	0xg����U�T1<w����G�J~���Xz����1��Qx-]�~�p�>�B�g�_��e�x�*���4FW�d��Ϥ�S�=\��q�Z)ڥ����D����?�q+G�/m�W�iv�A���RL�1��LB[��8������x�	��+�a��/z�2��L�/�^cL'm	S��ү���r|Ѧ�� 乐گ����I�$tܴ�ԑ�j�Ht��0��LM<�-��?{�J���wW\�_����)�:��+..�H%v�^f�Z�5��c��4<�a�Q^nUC5:���q�tn�؋����j�]�3g��0��:M�7��Tz�F�,:6�Zuh�~О�3��Q5���Ӻkt:� (���a�<�/�/Ԧ�p�b�-L���8����ɇ��o��P��Դ��{^����2x�'�ŗg����K͸A��iw��3�q�';7{��8CXG�A!��R�n��h��F���KF��KLO���I����P+ͻo�_jX�Y��m����2�"�Dk�OL�>Y�d���e'�lx2�Vz�В�uj���3�)>�ڞ��l2�l2��z����&�aE�ײK��&7*5��h�g�����x��90����]hfEh|mk��#oxH ��������]ܶ�0�b�eD3}����揉����	l�V�ڥ&}�"�̙�Qp͸�G��
:M�IJ��<,�ԷGg�	���G���Ep�ې��7L���(��?4�*4�n�	^&��?K2CF6�U��x��џ�:�_XE҃�I�V���aD��+މ��|�w����Yr����n�QP��x�*��1R/oĵ��%�GD��*�2E|<��햽1��k�m"lc����g��ҝ͐��T���
C"��aݯ��� >��ǭ�S��g@;<�ZuK�K��Yu.6��h���Z�bc>�k�P�1	gf�W���H�ڐC$��)��Ĥ~)�"�I\ύG�]�q�����'��@�O:�B'��PLc�0R9"�$��Da�H`���6�i���#v������/�띪ؐ����.��)hL�sk�1cg��ĸ0��O�37����=ص�H���^o�k���@og3�V�4�<d*p����M��|k�܊�"�+!Kv���V��5θi�`8zU�q`��2M�?#4�E]%19�{e2�.�E)FU��v���3@�Z���m7�� �� �PxS�͕��?���g��	�y@��֙8yjkMIip �Ed\y�|[}<��C^fC�×Z��s��4��o��S�{�|�`0��A��1��z�;e�Yl�
C�,�/F��@u@�^7^�F�c㰊����8SOE|ߋ�;2^0yr�/pL�Sy��83��l;ڌ�g�p�N%ɗ�4.'�g�6��γ�o�B|W���Q��3yb!��,�9|�#����X ���{eH��Kƥw
.l���}��"�F�j`�V�4��2������觫	AJ�;�?�9����,��(��y��m�/.N]�lA��0��$C�>��O
�~NP͖�D�hS��ןܤI�V8�C��s��{u��KDa|=^�Bܕ������ܾ��_��ɤ�5�x��e��DB������f�=U�6��N���)�a����&s���f�
"S���Y��/-�O�hn��Uʷg=[�b�NO��43 Д��O��>�Ȥ�[+f3	�Kq�EW)��Kw��24�~����[XC3�C��gIL�����{'^����'����7�'}1�_>�Cb��s#3kp�q)&�f�;T�к��X�).�c'&��!�u��d��j���w͔�>Ȝ���=d�w�a�pz���dh�1˳��/��!ɽ�)��4�"OQ��.��u��N�SZ�3٢�jE���T�b��!�8���Y���%~�4�V�)G����a�я:�_�S`\�4�I��ϕ̞Q���bC�(�4ج�ݐ�*�ʁ��KԼ@���<���OKR����"�$y�ޔ&k���/��'�鐘^���<7.�B������&zε�d��9�x�9��U���qI(	�}�4?ү6A��^��x0ɒx�v~�̜.�"~�Q�X�����]��$I�%̤�3���E̤�L^�`�и�"\|��yq�;�Lش�3̂i�MU�(:�����E_�|��t�"��[��7�k����ư��*y��L�ؒ��p�fwg�Qw� t��T
*	I��7xmê8$��¨�k8Ԍ�7��8E�Kz��,?4ho��X�s9�(�o�k��)�{����c�K��,�3��憇��f����9Č%I,�̏�n��"�_)I����pT��Cox*
<�3jɆ|�
�X��߸"�vϼI��#�����M�r� ��U!�n����0f[�2��v����#��=���Ŏ�ֿ�w�]�F�S���]`�[�j��N�S$�Vt�%�M.�S�@��f1[ۂ�;�q��:�Esub8��\,JNPD�'��	��W^5�|���m�mߧ�����}*�`��v�⇚V4�	�Q���apPX�(�*��"'�����p�	$�$P�,�$Q��(�	e�)�MnLז���(E�-��I��ؙƛRk������hs}�3pbڲ�'r���w*!����$�`(D��Q��QT�h�w��Xz
��w^J3θ��軇6�6�߷�B_��I��_o��!̊����Zݲh����q��'֜��Hu�<�Һf.��P7Z�)��يc��	�5�,���(�S��ddr�i�/uc�f�����0NW�jfT�9���j��k���p��f�cn��D�u?�C�a��B�XNۀ60?���N�M� 'Sz&rk��mɔ�4'�h�q�N�k>�Ն��?S^嵽X�#߭�8hӔ^J;Zd���e���g�	&4�s�!Dz�t%5؞}� ��ؓ5�c͎��)���T�LW��&����-'Q` ����|�2�Ơ����G�M�C���7���(�巍w���
a��3���a-�m    ��E�"�NG�@�����I׻k	H�W�����C|~��kg�B�j-̠솲�$K`7��Z3,�+:��h�e�w������}w���{�^�Y �5:\����ޱ�v/��־��S�m�n�Kp��/�Q���UH�6x�a�����9:�g�1� p\	��Ff���3�R%�&M?Xm���(�Jǔ�%�����ڜ�X^�N҄3
t��#
�%� \��֚T��L�,���[����˅�x�7<xgʹATx=�+�āOs\D�C��bi�aSh�,���|l��i�����������3ܛqu���Vc��	r3��%zVrnI�$� <D��v���1��7�3��F_%�Ӎ9�d���YǷ�4���`;��9����ѷ2wr+F%V���c���	p
u�7�"�%Ќ�����|�r��䝼Z��3Q�3�S�ڏ�}����	�U�P C�B�ik_��ɬ��v�������� 6K_?`�5�g���mю��yʹe�l��P*xl/N�d�fL���Mv��~���O�?��ds��$���\��:(�ؾ{�͡pO����V���ȁ �Cv~�b�.B��LP�O�-�$X	
`�Yi��4�%�3�W�*��}3"b�'ޏ��G�$�UOB��	�����?Nl|IqD���$V�8�S3M�6K/�ehb
���MC�!S��&T|-�K�G��jȯ�s1�q����zp��ɯ��L�8�� 9��:Q3ґ���fA�`Q��&���3;j��%/NL���t/� _Ќ��g�g�}g���Qv�	�
�t�Y��sa�3�;Y��](����Բ��E��3x�i��|-���
����02)��M o�\o�HSdS3m4�-�`m{	�S�ހV��i�<�:���{9	�M
d�4����Ǵ�Xos�"6N.w=2Jna(y��uRd�P���h#M/4*�焚��kk�C�yr��B'�o�A�g�{.�Al*�1�?�2��8�m��s�r�ҥu��M܈�S�������k
��fi9y��8���I���@�EJ_J}�uCS4Ȇ�������Ԅ���?�<����5�@��jo�K�}l�Ҍ\����2� �Gvbt܏K����T(��E\ϼu
�[Ll(4��&�;��ᬸr(�#W4
�Q��*n�LN�Ѓ���]�ޒћ^���x�Dt�|7�C�����������b�K\u���~fxD��Ֆm�I��n�\�Sy3#��4�{U#k�=�ꈁJs��m|���J��d" �#D*6Zk�S\Jl�(�l�rIy�D�
1$��Nv=�1�30�+�h�k7r�f����Af����9�1̾'�+j�5������Cih��ɱ�Ωr���=�9͓�d
L�һ�9͔,R�3��I .#ԧ���klg� r�!������%,��CX�m/�t����ƠZ;��!{̸�d��[k97�h��Ѹ�`��f����\�2|l�eF����(1q�\1�ncP� /�q휷=�#��W��P$��l[iM�=��?G )���?��~��U���|�)��temӖD-��Ö��n�E��c`�\͵�Ԓ70x�4�@^p�B$+�~�N!��8��k*7�wB�h-�O�f�k�L��Zy)�t�����*e����NI�c�X�/\�������ե,"�����Kcnmb,Hٙ�%&IG�Aé~�'~!�C����܅�p`��K���U�{1�6�f�wp\"!�T&��_���Cp� !5!!��O����b� te0΃�%��o��f0:4�C.����1�t���������ۊ'�\1�27�cy����i8��5�����cv�s���aȞ�����N0�_�$G�C�ܥt/z6�C�9/S��O�{h�[Yg/}&�C3ٝ&�ҧD��һ���|EC_Ѐ�M�c���jsx��g&�a��XR�H���.�@�����,�VY�	ܚ��׮~pfb�/��N"z��g�d�:���tD����r5 �ɖ)N���W��uJ�� ^��o����.���6�ţ�d�I�^a?*0�azd���5!��¤V�:�������r����=7�6>/���Į1�A@�$�u��h��5�>�DL��'8��ȍ�I��B��!,��(��رa�>{�$��'-�J���z�iXK�V��I5s�	� �7j�%t��S�ن�Q�P��A��r�j��A�&G�|$�y�a�	�|�P�����}%��qMl���xs%��'˛O��0�95�ӧ�QMƌY�1w���y�Vچ�����H��WߍN�R�� ��ưL�a�IB&��2��b��DL<b��^�zh�����&�y�a�^D��|���yc/^��}���	���
m}w���ϩ;n��������3�-��y1m1$k�X��З!u�{��3q��=GH9Z��1Oۦ�mp�yV���9M{ւS�Շ\��]9��uj�=����r�;��������<v�%ۋ>k��j�s(�\:�	�^��╬cl�A��*,���^����z���k/:�4�����D�4.h/Ծ0�����j�N.���~��O����7�֝�j}���V��ޏ��W������B�`���o�E��"�7�ݣ��3��W8i��D��g���O�!�(>3`g�l�����0������a�7�]šҠ���9CQAwn?j֞	_BoT>B������YS5�c���q�����q��0�O�T�Gl4X��sj��l����yd�l�^))�JM�e����kƃ+
�$	z-�S�6,#����z]U$���DT��+�l\FdG��zU$��J�Q����]j��*����5ҩH ������et�[����ӻ�p�t%a��j�8��>�Iڰԭ�=s�aD�U�jdPH�}�[l:�8���#c��;g	�ܵ;K���
�3��d��iD�u!��T��g.S�N��F���b�C��h-�G����}��'q�:�Q(��2i�f�%G��ݠ���[o�(�Ű1�_6w(ɤ�y����J�c�$a�!Γ�8J��%+*E!�OI!*�)��o�"��T\ ��P$U��H�}$3h]�.*&
�ۏp��r̭"1;���|�Ot�����pJx�I�*�G��/��YK�I�I�ɕey�������Z.˥�n��Vnwpw��;K�ƽ����_�R�ٛWn%���n��Cr���sg&e��9.�ݪ�r!N>
�C�y@$�t�͖ȳ)L�}
����P�H�ā�L��B��+lj7�X����'�t�7�f��c�n�w���W5��0��xV��;sp̳γ��9�ÌS!���>[����<�ی��X�����yC�[�TJx���4�b,C%Y嫀eA�@'ЌWE�:���2tj�B�R	 �4XT�\H+�[� y����6F�$H�r���9C��zH���GU��t��ýLA�j��[+?a	C�0>I2`��#$5�/��t�2|>��Ȑc7[l����]Hw����!C-�gM��_4�ݨZF�.#rvː�z*��w �Y��K�3_O�� �o]���s�y�L'.�H���pXݲ,¢*W��j='uӳ�l�8�x:�H�Wkwa�a
������+�k)��}0�-Si�2�B�f̴`|���ަ��X�Ӌ?hd&̨j�U�b/��b0�p���N�r9ڇ��@�m%VK\����+'��7��:}�_O���}����Ӵ^��Cv�JdW/� �Q9Qn�W���eo\����dyw�_�3S�^�/B��v�����k�1_�J	�Ү�dLy����n�P�,V�L�%��C�L8�����f��>���"<̴��׹�y��`p����d�$O�x�S��y!�8Grêo�Ì�j�'���O.$�VF6�8���8Z�څ�����i����|GARk�1'K�A�F!�4��E, ��Q�����6\n��D�\�p����)L�Q0_ފ�3w����L7ݺTD�C�J�?2/��    Hڞ=P�q��njӈ>9�l����;W>qF��w�R-�#��)}��]����A��P������>E��"�Z�/F��Т�K���^�,��dY[;�@z�}ҫ-��+��>��V���s� �wc'=-H�%:�.� �<��S	�1p��m?��{!/������;_�Ax����XW�H1낽a.���-QSM�����_����	S/V�����6nHO���6�^�Rv{�ƨ]�c��PzI"�8H%5HO�h�.��)�5!��%�I�U,��� �y�� ��yb����60�#�d��(p1w�f)�N�w�LY5�t�xh���H�x[c*k~/�XM\`���4�O�,�'�����K?T��!�:nTNpX׵�.�q9!�1�ji]]Zw�U67��Ե$�o��T�+�Zd�Y�1�<ǭ�qQ���kE�N�ɉ�i�Ӭ� �R�� ��%�Ew+����D��wjB�Mn0���Sy<E�������,U#6��c[<���쨬p"T��n��d_�K7��&Apoڸ{�$Rц<���䕨B�Kf6{��ռ��i�Fd�~�	�*�%��$�;E�g���2}n���n����.r��2��{�#�Y��0�N^�X�YGc�܍�K�㉞����8w��븼Yl1���~�i��q+``�Bӏe�t��ɯ��:T�e�i�d��T�l���2TGӕ�0���0��c��w�����M$��1oh��Uś��xI-/�9��� =�?z\�䉩a��/���o��3#�����0AL�����J��ʙ��y����"��EJ�m�U�lw���,�WX�C��xw�s��ދ��U#��q�9�ڗw�t�KPz�
F^G�(��I	O
s��ݝa�/Ŋ��j�I��H��z�G.	�8A?j;�TZ�K,S�a|'�4�,�V��yBh*9����u��1�dDz�e���Aq�|#Y3�
���v܄B8d#!���\��U��B�c�iޟ���$�u����sщ@�J�r�fy�}�YM�[mL<�]M�+�en'q�8���5ʵ�O�vw0(#�#���(*Ű�(.+U�s�`�\��h1y�
�q�V��T$I��B!$�n�\H3��Ȥ�V�)�<���Ь�G�Q�u��\ Q��[�h�{����햢��(7d��&��M�͵C��x$ݙ=%h4�ZĭN��>�0˴Mr�:3d��]`�ķ��x��G��ǃ*Z[yx̸�a 
Ǘ���Ev$����e�H-��)�r"��˨�g��]NԧZ5�P?�P;'�g�G��?������R�Z`�I�m�z���/�ڞz�b��kmC�~������^� �G��Vz�b5F�jcR�1�e���*�}eS�����(���p-��G�HI6Y�H��n'V�<u�j��1��4/��*�P��HCRG�72�m��Ų�"щS��e�`X����������?%����k~KOk�:�R��Olڭa��l�rk����ܻa^K�4/���t�䌕i�H��\1��.3͵�\�񸜌�9nka�4aߕ��÷����.&��E.��Z��oHpr����G�N|h��%U7,d�v1�Z.: '�;����Is��U��R����L׉�J�A�Egd����LP���rJe��D�lr����.~��`fd��6{���Q$u��k䌇pI��d{k�\)��,�Q���i�euYuO��Q˶��u��k�ƍ�6�zU�|�O������fe*����o��%���Xfr���V��N���jC�<��>}�
�Ћǔ�O�Z���!��c&���t�u,:
x(��k�+hƏ �1��U��HAD�V�4� �ۋ�ig!H5׹��]nb:ꗄ�ă��� 惒�_v~�"8 �aI���?�QY�ߕ
[~:�c ~,G�>\���]�듵2���2���������>S+F�[J�����a���a��6we�����x�9}g�r��"�����m|��mL�92#��.V��%�_���BK8��S/��ӭc�F�u�u8VE��L9�>���?-)ݞЅ�\0��_t�3���ʄs�YH�u�22�w<~f�GY�������+Hm{���P\���:�,�ڵ%7�����v5��J��|��^fו٨�it��9Ps��K�Η�K2�	e	4�#�����c�;]�p�~(ؓ$����/ÙE���W ݧ�w���"��L�tŜ�q��V�W�� �*�G��pe�ݵ�Y���&�NY�F�K[�b������+#�ڼ}9�W+�zi]MR��!g��#��a(�,�d�Qc�d�O&	6/	(�H�����А�H�H'���&	 �#��5�3Ԗ��R����k��o�-]�$$�- �KC��1)���v
�lA(1�m�)��}H�"���=��>pw�O�؞��x��n�5�{��k�;U'���(O1�5c���$����G]:A
d_I�)��)f7��&��+����iO��"�F&�4�Γcr�~�[��t�
��D�������J�#�4�Oм�"c�ܕ�Z|�E��.�e���#�;e0?'��F���R�}B2A��#�{�q��B��m�T[���4�PV�c�AL�����}�63> w5iY��̳��<&�u���%vHy*;5�8�҄�b�a��%�oX���JK�"Q���)�"
>	�J|C�%����tֺN z�%������N�heX,��W���6�H��%�qAn�rr;d0֢zQ�S��e������>�3�&Qf6'����뮂����xЦd~X�4��s��s��+lE�"�A��񱯞?Q6��P��d�D��ҝB2!��v)S�X�	��:?��z\(D��!|���������z�7��{� ������>L��5 )i���R�X����P�t��fJL%l�1����H�ﴁ�G���&�`���N�۴Li&�<\��$3�Q��'I�.�"�m�)�D¥�a�8�ރ	*:<���Z����R��� �xvA�|xRy��2{w���x|��~��Ntɡ��E��#�T�V`qO�\�^�
C ��t�#,lB߂5�35i$����|n����<z~�q�-���p��1�7)�\�Lr�C��Ġ����	�a懙el&�o��v����rdr�k�&�m�;�c�Ћ8{�D��y=�[@���Yo U�`���q@_~"���3�HX��!a��T���sHt���+��!�������Ty���ӕ��o���$Q��vp	����]4�wr��7~#�����@%�C�����6��D�o�u��{�5F�c'^�k���i�����==����g�#�_���f�������1�81'����0����K�rP�S!����U�]!�C��p`��B��9���}�nޑ��=�P�)��:��{��8_&�e�O�Sg���V��=$�Z��V&�#qJr����,!����a�S�y�<JkI�,�ّr>���>�h�2����>�$~��Ȏ9~�&{���l�<$�:�/Iz�
|>jI!�Fox*Atϗ+ʻw��}�$@?)�@j�J���ì�Z-���]9����^��*�n��¬��3K�SN�[�`��WF�3dT/�gR�1��{ܟ�\zm���ꗗ�'�I/T��H'=���Hj�nm��������:�b����<� ��Xn����(N Z��۝�7��͏�n"���n�q��5�	a����V�(��jp/�^j���)��w~�P�ó����T�G�`]�Z}"��s����T��N�z�D����kW�{��On�e���U};��[w���B��I��7�S�HN�����ɖ]�����6>�O�{�>@Y��(#L=~�&iN~R�8}�/>*hPP��7��k6����W��i��U�@�P��Z��cTeP=��T��#T�U�Z+�cXɅ��Y;&
Ȕ^e�J멍���S�=�
��aCXS5I=n�\^&\�H�vP�@6�]{�Ũi*���J��]<��̘�2Y��R�:�]�K ��Ѕ    
�u�N5.d ��B�+����n��,h��ɠժ��w��Vى�v��	]�v�~ov�E��.N�28�
5�v�qg��M�~�|�t�]����ʝ�s.��Lh���֔CN�(.Ts�!�Yb,`�r$��%�
E�biJl��*�tr�ҭW2�oHԃ�]�D�v%��C7��E��T��R��/�f\�|3Q18b�Ol�w���3R1`$��l�?H��4�"X��^c�!aHq%8��1�!���B� �f�&�=z똲��I��z�|��Uj�cI�'�s��d�&�?���X���%UM�E-�c��U��]-�K�6�Vj�b{�ݕۓ��zU=�x�3�S/��O��|>c�{-�c2�^S��B|!��	����Z4�D�?C4��yٔ`�f���ϳȨd�b����<B5�:�m^��>n�.F:��l���$������n�E�9'@#�(���6>2���ޫl��wә*_b�����\(����qio��	XBɒ�0@6���T��bvW��2��J���(�Ce��z9�{��O�I�B=��dԳL�|��1Ig|ŃY"h&��W*Y:a��/�6@�M1�ףM�[s�����n�-7�#K�N�\�^�B�/�����ӻHP�P&�6�a�Q�NVn"*�c���KzM���:���Н�I��R�!7�^���q�����Y�~������\ P�r@]p��A������pT�c1�7�̸2���7Yz�=�����vAt4���L�<b[.�9���OJx��.y�M���I8�L��9mhÜŖ��<�P�D��B�<�r��3=�ي]%��6Fd٩*{	a5j�����zðt�ò�=��p!�pP�)t�����'���^!��"'lV`<�-��|+�	� 37�{47O�*���+|Ѣ̈�&����oB���ӫx+�1w�8an�Xr��Vk�l<;Th���ax�d����e�j�
?�6,ĝs��<�ʃ�
S���tn,�E�s-�]�0������̓����!CzX������Gm�U9����!a�iO:�l`zCU��}��VDMPP����{n�\P�I/�K-�a��� ��fA�+)) �6U�$9,�g��p��v$~;܅ϝ�-��:р-��l��(,8h�CC�`&�80��Y�°6�� �B��1���År �	��� ���j���6c'�7v���kA�g�^�oЯ?�ӡ�e��ܧ=���BC*��)Q;1[/��v)Z�l���ؕ�V���7E<�0"��Ebr�)�J�*��*�WL�4�bK�ɡի�n�H�x!��G4����������{����y���ݎ�swZٺ�{�"2��(��v!���H����Z�m�����L_ 5�ek�'�!�Yl3��刁磷
b�E�w�O0!��ۯ��i�dB����h���
~>r�T���!
@1͛?,�غ"Y]��@<���֒ʸ�P.���:[@w�T&����ْ�KK��Z-����)-���G-����--���Zg������!�k�=�r#��"|HHA�(~�������{�
ǃk�||W*8���U�Y��b�w�D?��3�{��_�m�S�F��`r���#?�o����kv��Y�a"��f7�m��A�i�=Oc�j�%7�_H%�i��^�C_� @���(���k���V	��ƕ��>����X�g��Z(�޵��w��w���n�,����>����5� w��?���j�F��.s|�k�y*��PWD�{cK��5A�
C��q�,�<�������J��s�id{-m.��8MT��w������|u�����f��|~b&G[d/�#R�1�<�>�;����;*�~�Zy�;�&��Wm���g	�lgQ���C�eyG�Дr��������6�FF'�DI�6?���>�<��,A��qb���:��4k�+���dЋM�#?'��sz�&t	/�}�44|�v��_��T��|��)��'M�&�;��]��9��~��Z�O�[1е"o��;�oE��w�o�|k�݆up �#,������h�*��� ��X�k�>�Qw`o
���9���Kkb�|�(�g��P=�p�+�w1S׺,Nz>I������*�P����?�L=�3'Y��mS���=f�f�3�]|.�g�l��+�9�&�����u�EWpˣ[��d�y�yN��$���S�ﴯ�Q�|�uJb��׽���g���_�$t\�6h��B���S�L���+Xn�`:�|wK)�x��̀)��e^N�e��;ڻ�,1���|�]
��_!SN�Gw�7���$�l�u<���K҄��G�b(cz�M�͠&)J����t|qN���eK&�A�=�G�V �[���)�#���c�����5��r��@f�1y�4OM�xe�X�:q�W8&AN��}-�x�H@3n0����p�Se����zUx�Kȸd�����@�a<�m#�"�26��,��I��`_�O�(��Rf�������X���	z��9�cu�(�`P�	'����F.}��<=[p"���v[	�x����]�3�<�, �n�E�-N��1z���	�]�tc'�Y�7?؊�,�P۴���s�|�~�e$CRP\�2��O�o���;=?"��OA�"¹[�G���/���VW�[z�s��u�
'R�;k�R��9����Gdx���W=}՚� ��\?��(�ڪ�R�zbGSHZ{����SAa�ׯ ����գ6؇Z�I�o�aU�?���ạ�:���W
�qU�?��;]���׮�w��=�0����98LS(��@厓	��GƩ�gzV��CE�k{��?�v�)��U^l*K�Ov���M� �k	��"V��TXΧ4��R�j����̂����F������KsÐ���lg@�=�J�N��1n|�����EJ�jd�?�j�z�Bzu�B��ȏW&���`�D����o.�:LbKhV$a����iz;��`��k2�K��@�=����z�!���P�"
X<���6	�|��4H&�qԌ6����q��B��@�n�tK%�cP�ܝLRY͍OM���XQH�ϫS^5����N���enX�H_��jFH���qI�+Y�y��P�J��Y �,����J���GCd�|}�Qi�+���HI�iq;);�\�������n�d�c7�2D���IM��"��潓��v�bA��_��W���a���[�{���`�J}i8~�7[��;����ҙ	��d&���ڳ��e���m�Y02c�ږ��v���2OB���ˌ�HzMSz�vWt���׈�����2t�y|λ�Bkx��K�_�s�Xk�O\��g�ws嘔��[��G3��1��'[��*��Ue����u4�$k�
���n��]�΁�{�¦i�ǡus̋o�q�̵����%����������]��t��� �}�_%q���ait+�F�$NBo��SGP��8�Ջ�^'Ka�O
Up���~x!�����h�����_��e���~2������ծ�3�c�)��Q\YI��}���ԅ7�C��t�.�zɜ,�^Y�����O�����R��J��_]ÊeQ/��E0*+��ٿ�(�Պ�^'K �wo�n�l�&O��샑����xj�	wv�4��JZ�,��}k������c)w�96��L������b��s�>r��Ŷ��)�NU�yo���ͼ:	BΝ![��h���N�`#�=շ�/��v��R�wl� �U�2��n��
�X�bY�u�1�W�i���� ����="<��ZuX�p�+w�C��n��'!�ZB�h�)$,�6ٔ��TL8��PI��h(N�~�S�O��'�яIh�,>��7�
.x2�%2q:�0x�m�BXb3d�b4�����AV낉��v���U6"�U��o_u�����p�B�q�� w��8o�Q�*��?�u Ye��[Ǳ[!��P{���ֿj�ۅ_��ޡ�l�My�q~�̸6O@rX)��PG��M�s�_�w��w����p����    ���r�)��k3�(���`|�J'�o�˂�Δ�HX�e-H�	��7�41�x�Qġ�����)X�Z�2])��	[��}+�@~�FА#�Z$�Ȫ��\�Yy��'�0��f��A4ԧ��yKU<��O�r�"�|�q��1�>s�N��:�o���@���ut�W��(��g�����I�V���ր�k_����w���,����ؽ��H�*�y�cp[��B�6�U��쟶ڼm�DCG��C�N���3��-r~	X*�?�bq�6Μ��Y�A�ۯ��TqN7����P�P�Ҽ�_&T�5AWd����t��\F�&�vB����Id��u��HlڈX�:o����,u-��iUC4'�z詚��ظ����BP@U�#�j@�Z���B4> �6ԫ��� ���A�}h]p2�Z@: �*I�Ղ�x����K{/L�M�����k���M����=w�
k?l_���fh�U��6��/���cЯA����+�������Z;2��H�p�>'�oa�Om/���uf�H	!�;�~��G�S�Q��7�_���"t�5����y��~>s�j����N������lk���ܠHu��A^���I�Y^2.�O�\���ɭ@n;�ZD�-���>8k=���@�IF� ���Ѷ6�hå�#��Nu=�
3�_������U��õ�YI)́�\OZ`('\n'�0\��7IW��y4�</���f��5�cG�	�u" �7�6s0�$#ă������n"�sT������<�eYq�%�w�q<��|àu���k|��C��yN�l����s�z��	Z� h�>w ��A������nQ��]k�3ӎi2C�tzdQ��TJ��)�1�7��V� ��%�_�|�ئ8ʙG�Q�<n��)����Kr�¦-ט�Ӏ���Gw%�T?j�B35!�u$�q��BE�e�q���Ys7sB�鎸6\�L��|�}�q�D��]� I-� ����j
�$i�ƙ�5�9�Ã�bH�R�ȍ�!W~�{Wx���u�Ġ�\�n;K���^������x����h��vx��/ma���f���f"�6}���*z���d�^�ĩ�p�=�"8�i�{���@���X���=���?7q�or��8��@\7���0���+�MA6W��&�[��0�@ �ˁ}�s�C.��)b8�q�q�Ĺ��V����+��'`ss�a����bB\�Wx��<��At��L�1������?���Xe$r#\�ԍA��/R�b�Vι�[έ��)s����f Gb1�2M�������Cv�^p�7^y�'
��G�N�h�����X����� 2�HO'��4Z��ߙ� !��pJ�㲒�u	��̝AS��� �+����R�kI�i�F`�|��}���U���ӑ�u���}Ȟq���>��&�������~��+�w&(�W���d2ch�d�`⊿�%��O2gt������!�}��z�o}���e
�A�_	�aZf6d"�	��R���_'A�����{os��8O�w�F�T��{�1�ͤ��������͌L�w:mR��,���m~�b�8�c�Ւ��_nߏ�&�4	nh�+�^=��#����H� �������=Z7Ѓ�5�`�Z���E����r��"=�H���~5��;(��a�Z�/Q����W�o�x�p1k9�H9w/�s��_��-���)�_�id�`uxI�
���sr��R�݅���n�ucS�]��%$B��.a�R���\��fd���r�\�E7�����HqB([��e�z�����7��vp-(h���������۵F�p���]Xk�.V�����AO(J~h��A����������?��0s�ԣ�p:n퀛HB��kw�ls��#b�=ND0�(�V��h'���$K:�,.R��S%
ZE!,"���o#�g�Q��:��	����qް�H���H�8&�1K5V_��Pܩ����A��Z�`�3 {��;�)'�{A�b�Z��1��.���Q�כ�0�����pi�z.U���iD_B�.�ၾf�n�-�vU���-x/�>l��Z����s���Q��@�@���@�1X���}J���!a����eڎ8_fr �`j�0����V'�]*^��|ьJ��"N�Z<�g\�x��S�x���&�\���1h�,HC5MߓSޖ�ܣ�e��5���$�����rK�ш��s�^��Þ�U���ۿ�Kj&c�̘fϥ���-'�P�ў9j+�ͩ��vI8v��[�~��<�h����5�1/5��<F���E��&�����o�L�Vv%��H`6�M�4ėz�BvB����(m[�.W,f�gB� u�Q�;����A��9�Y9���k�.��W5���A����N���X/lπl�|_��>�����u�I �D���p��&"kŗ�$��A�Y�9�b��a��������e�m:����|���cU��̬9�HV5K����,/��G�� �1��.-����0�߃'6}3R�Ȑ���ֳ�^o����_t��,:��G.4BA7�<8Ɂ����i�-g�F�v���G����`n���fǥ�Dz\r����r���;_6��B�ϳ�-��+�Y�It_����|qX�Km�i���K2�4z�i��gb��Ҩ��1�w1>#�z'У�%@�]h�z�ӈ�%���]���L���+���9�-����1H)6��i��m���W����k?�*?��@w/�m�%NJs2��@8B�h��X����B"�]T~��(q��V�?fJ��_H|o~`�na��P"nI�:���<�Md��nv��A
	e��z�=(�ߙw ��k��LǠ�A}���G�	���C1�ДcD.�jKwf�Z�_ÅcӃ_�U����m��R�7 4od��J����χN`Դ��MM�w@ڣ��4;M��6���4u�%���; a�vS5�E@� -���/~�߁����.���8��
?��q\�~Fr�zݪ�|�@P�|��Kc����������G�k4B��,��{,@�vdڧ�r3�����I`L����p�� �U�uBV)�T�� �����Uo�q�@R��f��睪��^u�/v����ɯ3�7��Bjn �j@�r������d?��[޸4cI� ����L�/8�[��̼���9���#�~��� �� �8��D���O� <�3�6H�� ��mD`��+j{�w��!�1"&��CDY`�=l�AA\k��].�i$�!i�)�u )G��$�'qιZ�w�(n���>z�>}���{g���̕l�&��&h�"{���6)2�4�2E��pȈ��[�0�/vF[Y0��(���j�K�?> ��[�y��`~��_K����$p��P���:�Dp�[T^p8]��w+4�ŀT%����޸���؂ v�L$r��縃BȵMf5��S&��Fb�e��]%9ǲ%W�-�8n�M��R!��{:	���ןt&�&~��W�_�ŤD��ie[Rd�Q��9s���VS͂Ó A�ȝ�����)���+�4f�u�:��i�>y��>� �L"���yvQ-�+��WH'�O�l� ��^�\`gՒ����{%u�=V��
���><��1-)`�5�|㢌T����F(yK<+=�����2�WV����krHo6Q�sä8�	����
�������dK�{Ȩ��� m��p�D�"��~?�Ѹ�2
x�/-T�s� ��8p��qW����ۅ���ؐ`%C��-�ta�����/4��*���\53��ܦ�ҵ��/���!��⥵��,Y��,�-L#���)�L�	���]�~ڭ�=
��:bf�D|��/����N�L�b��]`/�����7 ��_�R���̵�aC�Ld�&�/Y���ڝa��q��ty3Q1���.�p'��9����H��
��2�@^�-l�G����ܢcd�DF� �E��A�:���ۀ)q�    ��O��Y�{�6�zG��!��D/��@&�2�`S�Eq�(Dq��Y��tY��������� �א����>>�������?��ȟ�/�R8Y
��wW�>BB�dA�f�qk�7�PJ�j���'llg__�D�X��r��^�`��kzꅛ��Ry��@E3�,��T�4i��*���Z{A��;V����{�y��D���M1D4�3Пh�v�A��A�ə�(�;��
�\�2A��JA%��Ñ�j,9ij�ص��:{v~RM-�JE��+�K�jAU*��^A��uk�T.r����]D�ȸ�������+�Ʒ��<,�.���ĊC_���573[�+4C�G��_��Փ�L��w�-3��C����
�@n����҆#c�_mB���$�)O+��<��Η�^���U���T�Y)�,R��͌�F��STHsvO����Eg�^����H%�gA�h��fsq�,��l��au"[�_�g�]0��۝���S�i����w�j>A�I���D;��V�ZE>G�Z��~�_�Cd��T��^��@�Ǖ�<#�V�r���:'&xTg.,��Z����խ�p��x�蝘���͏��������H?#U�i��}�`N�V���d��9�ί�6d7qB���8tY��!�����٧�Ȅ�a���A6`:ڋi����0��!��=��~���=h�M��^n|����b@q��)�L��\}�F '��h�q�4��p��3����y�%���C�0ī��������F|�sc��<
��,�ҙo� �"��:�3���9�������{ �K��7Z� h�lqo,8���7/�U�	�n;#��
Ք�hcN���� ����?����"�!J�%'��d��6E(Mг������YC����Ȥ�x"�	�ze��dN�� ��Tcܽn|��hKzը�i�9{ΫF���U�Of���~�YwN�6���P�*�2,X��e� RzSy�����9���aT:��f���р-<���\[��U��7�r�R�@�&¸?�����i�1j0b<V��ܠ���,#������y�Sr��B0��[�@>z� f�H����k.Cv_�B��m��Bv�i��q�Q����ߎ�-n4�$!_a����nIӞv�&#��/P_�_��r(Z����l�^��2w�r�� aZX�i��\yo!���vt3i�~��r	���L�5Ci���ظ$I�L��C���Z]�pO�iLû�q���$��$� �yG�\�����f�i����X+[,���BGY&
I�ϸ\0O$�"!{���m�����Ԑ)G���F�����!��A��P��~��C3j�h��\>~������ۿ��,��X�7񱿧��+�I��޸K7k��i�H�7�A��dr��X��n�ti�{j��8B��i�ڭ7΃����������N%r	����yZ��b�5&-|��n�y�f4)t#�1�^0��ϵ�{��4���#a!i���F�F����������XG%�Z\е$+��7p�8��0C��4���k:�1���antd/���?n���?��/���+�S�)��x�<k��Q��gvH���8 �E�Œ\�'ڌ$����M(|Ks�e�O��75ɎL���t��m��W�T��i�fs;X����T��$�����{2��>қ�)���F	�fFG-_�Q��bwBs>f��G�s�ݙ���x��0�RE�só|���k��5#��3�D񜕚����P����bޫY��V�?�����!m��e4���p�yApoZ�yvA�0N�풤M�gr,��(����>m�v�J�]�1)���gqJ��=z����W��**Ґ�@��?��k4�v9:��7��ZK�Hl(�ia֢����h����p^�pƅig^h-��!(rx��AQeM�鵾�����f��3��P���ԍ]�o|i����@�UfE��p�R�3�������ĸ⥔ pnG�1z���H���IK��5��XbL@Բ�S��D��&ʓV�̽ _�*ެ����q�&^�5^�x��$70�Z4)O}�3tj��A��e�1G�p�T��B$� ��2|�2�O�2j�}���LB;=LtB���VpFqd��¡&y�O����N(n#��Ԅ^��_8�����!?G���
����B����6����$�	z;��؎��p	\�֓�]�Z����S�ZH��t��.S�*77������Mu�ʹ�E6��K_��O=.�h;�b$6~�oA���Y�kW!(3�o%|�j�j%�?XZ��˔rܪ�B�� _��scd��lW�}i�?q�d��X	Mp%�"�[O���Ͳ��<�$i��%��]�C������3(Xslz�!a�dn~<2�)�����B���'2'dk��&�(QJp���o���4�>�`7V;�X'	
}�|����*S��p�������[+`��;p���Q�ԇ����o��Z6�F��U�25t��#���L7Ro�2l��(��RO�v���j�m7�J��Q�+�����%�}�:�A|���
?��\�D��Ύ�k�#)�d��� K���i*�_<V%�p0,�
K^�֋�^tw��%�Vo��Ν�scҹޕ���:���M-��r=�C�,�P�3�J���Y����$Wʷ�I^1�#fZmBK�H$�#�-��h��of�MpDSH���ʸ�a������V:Y3�'79sm3�<�E�QL���ͼrQ9a�Fdo@i��esWR6%ϟZ�c�`_���nd�xjb)�e�Y&(�ɒK��<����i��g(6�B��?f�e��.�t�N%��ϩ������J92˧Dj�tJ�J���3�h�L�/نI:�0�#�~&��6��8�	����6V��IY�rv<���D���
>�H��#��?1�K��}�Ʊ�;��o�C+�3�N�j�?�R�ūыnI�8-a���˗|��כ�PD�e��v�k�t$�yS��Q+��`&`R��&�-LKj&����] K �n�'7���Å�C�io�*�q�2���_�g���}Ŗ�Xm��aN7?Y���>�J	�LZ"�j�����fq��g�"�b�O���cVz5��	,[�[��B��DuX-��h8��D�R��Tk��s�'��9����^��Ƚg����%K�C�˙h_�G�<w��Y�6)!b_f��^�XxV�=ǩ1Y��}���������wx�^d#Ƅ.	2�*{9*O�Z$\x���o����N� qГ
z�_��&����[Gh#|�7�LLB�/�d3�m�
�n_� �����nM�3��/%��Θ��5��I�G~8(��{s�$N.�`���K3�GW�3�C�.f�'�i$ڴ;��V�Zq�)�a�Jh�O,���� �Y�+�r�Hߛ��U���������9����l�Kz5�~�>��F�xT`}��ލ�@|�悸y����naJd�11���P�-H�L�&����l;��^'�s��o���C��^!Fik��.,(� }��b�&�Ǟ&�󜖦��w4V�,w{%z���ዐᨽW�e��kI�I�@�:����ƥcR���c�QOi�����Z�;�Qg�j����%��p��+��ZV/LVo�߃X	ؒIE���5��j��C�4I��dƱ!�^���"�eSG��D3�9ͮ�2`%^e�p6��n�>~tP,��o�V�K�و6{�,�l�4g���b[YN�r�L����|�,;6��+�	t����{�=���XV��!؆ea;Lg�n����܃�a���p=Se�Y���܆.GnEl�rt-`��	d2����B�R�f�LK���oN�.\f���o�o����T�,eV�WL��_q����7FJ��N �nlፂ7nxW�:�JA�<΍�"�]��r��� ���gJ���5i�S���=&��P�v�g��·C�r��$o��qٓ�F�k�������z�����|�a��k�����/� H�!)K E  ��F�@���[���q<�� �ql��P&{&��������w7�7Sp����L$�]��.����6�?c��Mb�I�߂�3��bV3Z�$h1�&M'ĥ-�$���_X��.�0�Fפ0�[aI z'�����<��]�@����w�,�s �]Ļ5������Js��<B[��p���7�QMq�����Hu�*vc��l�r��6!������h�C?z\�5"�ݴ�%��*vK�r��D."]�7R�����=�����R��y��gNF���\���P���، 6B�*�H��΋!C��5��h�ڔ校��bI��s�̨����9�#�'�D1�����%)�r�g�H�n2M��Ԧ\�����[Y���_�i�����#�%��vPV��j�U#�aY�U��B�Fhp�6����6��O�]�\�Q�X��gz�r7���@���(��f�-���(������o^�Cߗr]i;g�i����.�rӱ�	n&E���|�0���	M�=��C3�!7C������N�3> �
L�Z'���<*	��9I"�6���5%�Wl�$�2x����?�Xɑ/��!c,�`&��B��v�0Ml�4|���rנ�%��������k��tgȴ϶},'��EÚŜ�$�,�8�%!kw!f<�]�S���?)�K-�"�����!�~A_ ���q�Dn���7I�Dx�i� ���G��o����D` �r�-ń&���!˺�@�𳇗� _���ِ@���8S��{D@R.%'`���=KrAc�?���n�c�߯�*�6N�����r�?��:��G��ˋ��A+ywX۬�K��뱢�ɰz�8�!	�C�c�H�(L���9s� D�o�"�)a�,����]Ĵ��Ѱ4I�nIE��Ĭe��d�#ُ�i`�H����w���raJh�)[�����3v��^Bjb�����찞�}����ʏ��!�ݴBy& a���f�G���B��D�Q����6�� \��>�]�a�e�Z
��Y��DEv��q��?\�� �ƿ�����v�ѷ��g�ܠ��e��Ŵ_L���Zun&��f1O�&U�%����0Ss�Z,�۱P�cɪ�C�K��Hd8�����yT����Ěi�c���P�
��JJ8	z�6���|n��9�F ��\dh+�)C��0�74m$����*\-�*$4	]����B����t�lv3M��ox������)&r0����sc�i\�+����be�˯\�rcj�lw�G%�o��ͳ�<)dz�L�CX�y����ōP���S:�8� �}m�r=���t�Q�Ҧ�����Υ��o�_|���T���      �   7  x��TKo�0>˿��e-�s�4�y�݆�v�%�&"K�$3���Qqː��%��ER�Mml��	Cnk1s�J�Ё�e���)GV��]��;�)@��`�Ɣ'��#e.|���C�I��;�&����5�G�C��pHlA�������������)�Q������L�|i����B�`q���v���ږl���&�H�F0h+�I}(s��Z��,�'
���ߑ��v�<Jk#�Q�\X:T��@!���t����_�X�����/�@R�O�^H��37����V�K���4WF�����b���]zh�\�vS:���r�,l3	�t�W�U#����W��9d�@�?uzYJ��k!��� ���Xt!��Æ(�lu��ks�@��������7iǱ��Bu�v���^�\/~ǖ��ю|�&��"E�!t�B����n�����g{�U�4�����(.�wp8�+Ӡ�H	o�ݩ��'�^�1_8m�##�����g�-H�N���|Kg�B?�z=c?>�W<�?�����b��$}�����~��`�      �   �  x��[�v�8r]C_�ը�I�2�to�����{�D"3a1	@J�������|�o�J5�-eM�T���t�B<����b)��)r�K��&S���(�r�)�27��ɚ�6�SfN+��.�j������`]-k埼|1�AV֔��7�����c�K��,��4�\����4�|��D�Ѻӻw]/��ۈ��K}��r91�\�쵲��=����`�Z;���J������ӌ����rq=��v[.��������]��Z��4�
��f]���~�4�w{xู��e5�}ە�G[k�3�7�ď�ӣ��}iH�,�ʅ�Yw�vb�T+]�������G�>�^�{�r�@��������O$o,�S����Ίn���ʷ��j�n����\-E��}�bO�zz,��Q�Z�i���ߠ�Zl�n2����(�^�h�xfc�9�"y���,-�7~Eԛi�y��,��K��P�)� ������8l�V��8�T���>�GS���}�v�I�
?j�J�a�X��V"�Q'Y����TYfy��_����	�S��NV��!Se�G�|��F�ȵ+NߋJKl�=X�ɞ��I��H���X�5CK���dB G�Ҵ��Ӂ��5��� @��l�vx�)r�-ys�
}'��UQ��(�`{�Q:��6|��})��2:v��A�[�G�O�,ɟ|���^�T��K�9M�Κ�����=�#Ū?�w�꜃��i�{�����י-s�;��Nd�Ls��Րʳ�w�v^ڹfRA�OV�f��&:�/$�l��M�ź��j+y���Qf�Q��E��𭋈V���B�d�-�TO�#ϗ{8�*��6�����:��"8����Z�k���v��W;�QeO⿜}6����K����H��GU)�%A��@�h��PiC*]�_O�D���L�7c�
�Ԇ�ٗ�ٜ2^����'oi��G�A�sw�7��.Ѷ�۰!�����������@�nG�'^�&H�Yo�7�����M� ������dM�/~w5g%�2�w]2�w����#a8ÚHȝ��q�a���u(/�_I ���+�c�S$_Y�����	EK�,���?��*�!��v�9��۵����؞��Q�ZA	����Tb�#����#��\	�Զ���`w;H��CQ#�k�-�A��2k+���v_�\�����w�Q֓�@o=k �T���C���p���X����8D��I[��ahoC�H�h��Κ�]6����hvF�h����A�w^��R����ʤ�����5� wP�0��q�W�w�W��O� ��!����|�/%48���%�Z��7��q$V�wH%�x$�X���%wԣm����$���)ճ2���~y�37�z, 	8%�I��c���1��h�o*֋�/�n�L!d@��ry���X/�׏�?b=���UQN�0��
{����,g�2��k��X��*�Q�a+��,� g���:z��~r��g�9�F���Q \"�4�%;#CLN���a�/}��mi�Sc>ns�(<:,L9�F�\�zH�U��I��0p�_4@4�� �`�y4P�C��U�N�9��*D�w�d=�w�	&��7��uP"=�{U�ț�<gٔ�<Iᮉ�3Z@B����C�袸G�D-WN������?�#?�9�3�����]���ԬP�;k�m	�C���,�ipV�F����L��v�1-(d�2?��h����-ݓ,f��V#��G��GP=&��s&P����:���R��T0��~�?����L���
�ߓ	�h���8���)�#���-ʎ���w���]+rl,Oړ�o���q�t��?��v9u��M�4,�
[L-5M���z%��~eM>�=�� 2�����w;�B{M�7�D���}7�"�ڃa.7`T:_�ѡ�o�g��mj��]m9e���/��,?��u�P"��J��<z֗�؈���! k�P蠕���n ���ӑ^��B��6�\S������HS4(5i:#@*Y{d��I��hE���?!�؊��]��+�Qp���*2->��8<t�W~���d*����HS�
�}���s!~v�������S�/sʴ5����i�Y���f��Ȧa��
`�����kj�>�$��VS��Q]��h��ù�Δ��&o����M^튮 ��;�d�b�:F~h`�3�M��8��;B7ڇq;-���tM��V"�.�������fnvӵ�.�~~�S�SpKe}��ޡO����J�Klh�H;d��{m�����D �tm"j��tK�K���*^�z�\�;I��w��&ߩ�>38�<_h�QE5M�[/��֝F9�KQ��4qu��1N�xN��b��/��*M�ug�(|-Z������,�T���N'`�#$Kr,���MM��|�j�h�wM���{Uɝ#��c��q�s���P�n��h'o�����v!�g����!���q������M�S�ܟUѠ�䖴��{p#�BUd�	Ԅ�JJ��)�{�P����RīWڡ�Z�i-i����r ��c�QV��la���/�#vC��V�²u���v%��+�Bq��w�ᦛ��C@�'����%�s7U�4 (yߠ��T�fr=��r�:´U���n-H�I.�����4�B�{�3E���v8�&o�K֎���:��ن*�\���F�q�AEg��(��=@����Р�i�(��M���v�G���!��r����Ӂ��>�|��(Aw�1]��=�y�2K�aR��������V��i���$�R��6h�t�:�^�.Y�H�� :���c��8]�n`�+1Kc�����U�9��*���Sie�����z�q�ņs��I�W"; �y�Fl��
��8��?`J���0���/Iˣ�O���i��u�Yg�>�a�ι��8��t{��&��" ϟ���0�n:�}gWG��z�
 @��ٛH;��P}p�-'γ���<nm���9��R��T�D4�˳���ůĆ�qW?^�QG]b?�^.�b��C{��t���o����T��i��G�G�&`o/��`��̲�>/0�a��%�	�������/��̉F_��ц�Z"q��#�!���~�X�+��ͥ-F�d�F� ��~��	����hri�����D��n�׳����~E{���a�����չh��?�<�����-W(ӓѯ#��m�Z]���5ͫF����X������v�{��+���OĻKHͯ)uW�h �É)b�,f(�"�f�	=�_�,�j��`�=$"Y�`���]c(�CL��d=�����V$�A��N�k]�ѵI<C�>j��.>)�H6s4];�uMß��D�̙�T�l-�t�Xco�#��yUr�� W� �}%ʔ�H�^ku�u�ι��T൉H�<��k�\k�NE:��� ����a8���,�it�T�z���"��V7��hG�K�1�R���F+�&3+_y.Z�4�c����(�v��EHY�+�<_�8�f�<}���p���b�]�~����#?T=�2��~�,�7��)sP���	"7b;�g�|4�'b;�W��N��k1?ӤbT�����ip:%�'?�>�����^Dl�6�
Y�s��1�Bl��Փ����Rl7���WC4�i��&/S���k�n��� ��_=wKt[�t�>�:��>��������]���      �   �  x��U�n�0</���%�y��R��^hr%�H����_�%��n �M��!�f��ᲀ��=o�w�"���:�r��j�<Z0(�ն�J׵����ꥈ�Y�3B"�QiK,6zgX	�'j�"�������V�AVA��V4Hʑ�-�H��^Ʌ��:S����)at��Uy�K(ǦCS�A{
Ӌh��
c�֞���+�"�Q��s�_����C�ő�I[��(r|�������q^9���ǹZ�򳅮0�#픰�w���"���H��忡�f���k��ǲF��(Ll��?���&��@8UvM����
��V���e �*{X��S �.�΀p��F���)��b��J�����w��"G.��#���C����V(��@�S�m�������l5+�P,������j?�3�Q�:V��0z��'�Qq"�9���׈`];YY ��45"�6j�w�9?����A@�Л���_`�tЩMCM��p�o��Ng�D�Q�����{���GZ��E.�)��9s�XY��:���F�')a:W:
W�K�� |\);+���_��B�r?�>�ќ^,F��}�z�Q�|����0�0�2K��������sd?txY3-�,P�}`���9�s!X �����@8Ǒ�y�K���Cu8%#��+c���L]      �      x��[�\ǖ&����7R�Sʓ��� s@���Hd�I�F���LE�e��%��a�mCfుi��EØ�h>��/���?r���'x}k�m�eg��"�q.���;b����N����j6��8k|��o��n��I�Ӿ�mw�Ѡ�iu*��4ב^<Mҹz������R�QV����x}�y�E���xN?�z�͊,�iDO��$�Y���x���͏��Tݼ\ϕ�A�y����'uiV�yg���Q�ft_g�N�fN}��c�Mö́�n�x�^kFSOW:^�����U�1��;��hJI��ZE*�a��h����h�2�6��S����<&5l���LT:֋�މ=Pŕ��Y�P�8ɓ+E?/>�V�����S��&j��1MJ�^p�D��tgMoD��\��(-f��Y�߸Hh�}S�:��T�7/�)L~+9�7Ep�����+�����$Sӛ����GO�4~ko���\���u�ç.�{�ꅴ1���mN��l�'��ńX\���+5��L��h����T�Nʦ:�/B���:x�J/U��iH��~�����F�ׯN�AA"sy�C/�i�-�͇^�T�ݥEW��ۂ{��w����>-��Jz��;`��Ϟ}0�xhw�$գƐ.�4U�^U�J�>��ҼkR�:NK+�J��GtE�2sE�t��e튖D��>�zCz��2�+R��x:�~N7�X�Y2�s���9�I?��y<���|nݼ�iޟ���Mu�&�m[bӛ�	�v��cM�g�����Yw_��ޙY��uɌu�i�j��G���Sz�삩���߹�!�T�X�i��I-J�9�E�Ǘ1��IԼ��߽��i7�NZ�G�̪`0�l�iy�4�Xш9Y�*������8y�|U�������p��Gݮ%�2�����K?tJ�gǨ����d�v�@��ӈVH��a����;D�Fr�N	=}F��YSDcu���_�B6�)�A�O�[[B�1��b��e���t(��e���AU�LvH��Vo�LG,���m�뙕�wB�獋8�Km�λ\Un���jX���Ĩz��$�~u�S���"=.]߼��f���}�L4;�h�/� ?Kc��Yh	2���z퍉>���R=��ƹv�v�"M&��~��Y<�y��y,��D��KC]�f`O3�X��]lKu�b�����Y+��?�7%Y�P/e�ItE3�e����jqG�z�jr�.)R]�1~�Df��$Z�te4��S���Z0[���慂�Z]?��t�y�>1Mr
qV���^d}DJߠuה��(�c�N�l�i\y�֔�9���?�I?�O��+�K�	��eJG�B��5�%����"Z"C��\����M&?8��Ud`L��"��g�xRR�����(���>��ϱ�4�J�gc�q��i���c�$���g���t3���E��+�5A1������+�}�c���D�̽:ht����ë���~Y���Lj]y;�z��ej���Ӽ>bW�xɉtEB@S*߼L@F�z����$:���	�c,7��nN�$�q���"�1sI,RDC���c!����Ļ�@�!�Si,|���2l��6g�M�)���\�S�������v'M�����q.�g����?TҐ�=� q���2N�?����0O��� jB������Q U�n����5\�H��&z��[1��c7����Z�}��kI�fC�nI��a85V)G��ZCL�C����#��͂�X��{�ځcoE@�Y-)���Ø>�{�X���d�+���4g����{\H��j2��b	�i�ɄV��������
����=�R���>l��Ʃ�b�o�[��;�n�k��`H����a��[��L�����ɩ�B�Q��i�0��ά���V�y�BP ;7?�@�0�B��2�"aY ����Yмpo��Q�A���-����9Y�1殟�a���$�JIҧ�Ś�NO�8��?��,LՓ<��UI�A��Z���#������Y%�H�q��nC�XʊQ�T�<j�tF[���*����-⛗�)5#�9�G��L"���潔�Ii	��ъ�Md�v1��λ[0[Ґ�Uٸ�|PSI���ڥ2S�L���֘O#��(M�3MzcD�7V �����2:2dݕ2'�噹TD�~��[��tw��$�#�-i���ɽ̓�b����4���Ͼ;���dB[&Eٯ����+�C�n��X�U�d�w������ľ�(N���#(p��p�o8@�Eo8�kحe����t�ʰ)o��h=��z����"��~�TzRȇ�6J�����3:nb�t�N�Ӥv���T����mtۍ{T=쳣�ly�@�۰�ƴ�R��a8E4��5cIpIW0��m/I�W'�C�t6��OW\ɍ��u�EnSy�kL")N0�f����fMti�lzp?�V-�p�k�U�=���
�Ƴ����Zv�~\��R�7����"u���/��G�n�P���k\�|�"�؀�G����=�M3N�L�Xld�'�]�m&`Jӳ���P�x�<�g;_ƹ�����c��y�;�ǎ��~�o#7eY��Y�FI�d����@
m>h�7��C�?�+�߇&��96ipVQ| ��4���vE0ϭͯ2k�4���du1d4hb��}�S�=b�o�v ��Ț'��B��Q	�6ɵRdV����B�\�EB��K뺑M���&G
������˳e*Ϲ��ո�g�C�3=�R2}�Reh��ʔD�*���ݤ�/P|�K����kF_��?!1�<��1Q鞜��/i�ƽ��Y�ÿ��Nf���B���h��r��d��>�5A9�s�i��?=�h,���ʂE'�2��2�L�_4h���#�=��R�	���4�r	��89SB�������=C�Sd��Y���/ε&�O��;�����:ִSD&b�i�H��G�6��"�[Kz-�w ���Z�kY?d�YߟoQz-��D}ٟ?S�z-����^+0�����>��W�բ^���!��F���T��}��+〛"�$;��w��n�2ΎZ���Z$W�7��)Ѽ�a��Á�r�v�C ��n�`ߩ�ARQ<E�=�T�4g��л_2!���h�Y<�~5o��s��hr		�/�%��xj�HaCHh(���pΨ>q�/  �v�
ζ���	&����˵�Q�9W�"�����y�<%Q���=F��
	"��\;�@F�<�u�L�ǅ�LN�4�\X�H�*ETH8F�{O���3�j�EdCD� "��qU��S8:�A��'+��ן)1�I)��,�[#��Y\�xE�L���3P���>�hx�!��x��e���/£I�q���?��:L2�OI3h�g$M\��W-�����?DM��/����������Bg`-ീ�����_�r�����3T�(V�,K֊��K��4V:��ɜW�ˡrZV��xYUު�[�|Y_�B���j3��T�8vJL�wHzt���rC�Ush��FuiX�2du��.M^Ĉ
�8�zE�����_ơ�[��i��B�a���q�Bq�z��y�4b���l�W�i�@
� �@�<�P� N�q��Y���[Lj�8|�6�3z��/,���K���*��7�1���L���Ӡ�"��6���z��ڊl�d��u�b�r�dX�|Y�� AvrM��WC��q~��u9���P+�XgD�^�;:�۵����f>No��lM?� m>
�V:�$�e���Ϲ���3��Q�W.\1b��93�����A0��R���j�	b�x��ǋ�l�Y�q�HF+X��2���b4���j�@���f��g'��O-ǆ>��'��o,W��`r���ì���p\����p�<<"������������5�n-�F��فJ�r����}-1K*Zcp2��nu���*Xb\�[��"jXo0���7/�E|����TM��jc2&�5���Q1��IK���K��4�M�)t��S��[�H@�ܗAy�Hdrl�{J��o�ےTu%Q��cQ$I�h�]��B���񷮿k~tv>�q�YuXuVUW��|���t    �v[j/�@ͧ[��N�{~L1B����d�U�Y_�y���KWCU���X՘) ���F��J���,��x�=L�`��o<�>&Y����p ��N����8t�x�y=�,����s<k��Gh�Ƥ?[j�'���Z6Ya"0�U������ �]�5'�������zv7j>�e e*��f+���+9J����!�
�9�f�K�g�����*Ǹ�X�|+����<I�xd}�M�c��;�e�8��f<�ONm����c���|N+�E�����q�S�.��nw�N�o�ٌf0�Z��>pԒ�WiB΍�M��Зg+R�F�;v�GsVM�VL�ΕD�x�4I�-�,�?i���1��џ%qv}94:9uX�7J�K`$�[��|������=`�(\�c˧1B���8t ��b!5�O�Df��E���]Aw�66TLB��^�r������v�Y����� \��0m�QB�%
��]6(����Ep,��H[Ē>Xrl�~͗�Ɨ�rK���[�Ȱ�;�ms�%����ô<qs��''�/?������T��1k��w!8�\1YD�Gtz�P ֖ν���0J�p/�]�/ h���-�l�N%��4�6!I��1�OY}��<q���蚴�m�8�DA�w\�n��yq�|վ�P�#b���|E���U,`�D��5��H!�J&y��$.p�"��=`iפ}�v� �AAM��"nĭ�lԔ}-�v�D���Դ}-��@�C>����E[2&��^��F�\�Hj3w����I����1��BR��q���>��<f7�d����;���5D�T�άZ���8�ڧ`�I&���J
皕IAF����#,J
�"n�ohIѕ`��c�OI�d��ψ^8��GPp 
URӱ��C��@EM�*
�@��I�5�hH����A�
=e-d;�Ō��ǵ3���$���A�0�o�8�;�^��}��+�I�9��$D��o��nP(�ZR|\��Wg'pw�yc��Z0��Pz�,\�2�W�3�e;�~�M_�c�����S�� S���ZK�b��-YM���d�X\}��� ӄX1f�k*��t�{� ��I�i,�=��䩞I��uy��5���%Q�������Kr�2{�1�HH\�r�/bvMw�X��X�((�Ԣ�Z8;��;*�%��!VJ
Ybv/�7�
�4)a�o֊^�V�7�������y���Dz��"��' �}�I���~�T�$Y$��.r���֯����3��u��y~�wn�d���+>����)����-��K��V�j��Lњ�jr&��ғ�V�2�^E���y<ϬÎ~���#|��҆�~�q����.:�?�a��٤f͜�:A�#��J���]��RPjx~�[͗�z\K]����4�7��<�|Z8�G&�5�ڿ��x�AfseG��8�=I��Q��K<���xo�w���i��s�X�1B�!EЮ:��"s�d�+R��_���U/�e04	1Z�;^H�:���L5hP�'+q������ٸ��q��}�L��\��0�)�+��iAGJL7�J��Y{�p&���J�o�? �{m��%^�W#v�>�$������rW��kZ�j���9R�H����Q��N��$y���ա��ڿ��V�V7Bb��A@$�q$TD����
 :�g�!��/]px��Ȕ,�\g^�$Q��@���~�ڊ��ۮ�ʮ*�Yb�&U��ief���x�}�EW�ޫ�c�|��ӂ�J�����)-:D��sA0+B � r!:[:�LEs�J�Ø��&�w��u���j͹�H�E�-�6��Ke�$�����.Q&�E��Z�D��8�I�:Ҍ������u��|��!��_O�㢵��ڸ�=sӼͭ��w`��R٬����[��m�+zc`,��(\��|��(�"�Kз�����͇6]7�����;IN�DR�� GJ����h4��5��*��CS-�t\p_Pn��?�7l;�-i�*��t=������U�O���Ԍ�R:uL;���:d�I�5U������'��Di�3��d?�ry�q�����s�ӯ���a��Z�R�E�Da l%����_#�Ԭy��0k�Ԭy��!�~x��%8�e2�`��/r�舯̛�"y�Ƚ"��P�apn�Q��:E2S�=�eh�n�ķ�cͧ��ӊz�(k2&���H�s_7�ϴ|9���ƪ�%�~�r Br$'� �/D��#с��4�Ȇ@b��ѨX̒'���jT���I��1޶��'6W!ɤ&��ƽ���=7��u��n�/90 �̨��*�t/��h������t.{��6���һ#Ct�;�9�d\i'��j���N�1rV	jZM6S}�8���bE3$�Q,m7g�S��2����{z;� ZN�9���+�[�Ӕ^Hcv��sdܜl��Ȯ�PI&8;]�K���CKR�f��C�}��R'��N3����p8弪�\����eh�.O��y�S��Ｚl�=ܘ)�[��s�h�Ձ�d�ѥ�T0/q����\����Q\��z���O���9�^z�i�&��uR�g
�����ł`�L`�y]|D�i2��R*���}2kG`�-���KƬ�cQ�Q7���5�g��r�@�{t�_�,{D,�51�"����l��"l۞��͇�(G�O j���\�_�3��̔��� �;���8O��7X%��X�4X[�o|��6>��/3�[��;�Z5g��=ȫ�Is!�����x$c�#b	��30x�2�ڣǜXg(�soT��)���*�O:����Y@�O�<S�]��gǠz��X��o��=�fQS�סz�A���d6��		���q�ң��4�����,J�K��8q�R{�������m>i��Ҧ|���d�y-S��1Җ����w�I�cJ27�����㉆@>Z�ztRH�Dv�w�^�f�7Q�A;�@�Q����2 ����f��m�|�LגY��㍇Ki�Td�*���-+˛Fl	%@+V�?�3�G�w��
�k�y-�e8��ҍ�<^*ѶC3k�]�܂��c�K��zg����< ���j"�R"A���¿�£���T.�M�ENᲞ{�J���Z�:�ء�7]]�kM�~\pE�e��Z*��$�BWvY����9ʗ.j#�;�_��Gw]�sx�qO�h�U��ʤ���qw�َ�.,ta�y,F��{T�������4>ݬ�����A݃�Ԛ��K_����n+i|�8�J�D-w�Nh\칥¥_09)e`{��8��]�Q�ǆ�vx�Uf�2.Ԉ�8Qn^b v?� pj��.n=H��縲ۣ�L�d�XC���Q&{d?�I�+������hs%�-�o~̴}#4�g��
����r�2NK��@H�H�+������3�'�9�%^C2��
�T�]� ��LA��,.�
��F��ŷ� ��H}��)�x�${�Ƀ����E��S��#|Ya&�~I(������G�|~~���6w�ʳ�.���N}�������h1Ӳ�8���Dr�����`�����e��C]��|�	!��oG6�����*�і��y\0��-͇Z����OS�,�K��� u�»0:�u&3����S�nd���?Oq3�3���Ԃ�I]z�<a��4�#�v�1K�zveH�$3=
?=2S�bÅ���#֐5wv�-��L����0&��w�%�s����H��w�f2���b�'l�Ef��ͭ��v;/?�3�¾Q�{P��9ׇc#X��\Ү&
��4]�h�gY���{H�lVY���A��蜵����V��.�D��c�t+��pvtqδJ�yB[��iyB�B��^� )�^�S��д�w��^� K��;�f��4�@������8��12.w%* x1<���L���NgH��y�#��2ÈP��Zk�V�
��Ӝ�^n�����O\Z�T��?�RC��)����8��f�I�Z+�3��o.J��    7.B˭���W�0� "24*��UO�Q~! '5+Zh���q��Ie5yig�/��3j�t���5��R���q��d�K�nc�>T+�{TI�B�#�hgZ��q��8gƎ1�K�f�Ыq.JF꣏!<��7?�j:�.6����aRR�您�{�aE}kM�j��A�ʒ՚������Pk�U�o(xaiM�j��	Xo��$�HXU�Y����a�*��Z�Op�)��W�YMB{����VEY7��o+~xrv�p�+8.h�lE�p�Y�9np�-�i�p�p��)����F�����I:Uܒ��!gL��6xx0n\s��s�NVD�k�~v���x����E�N��#��r��#8)]!]p)�kcC��Dpα��
y�Kq�����p;���e���[K5�3��00Qj��WT���bK�6#ۦ��`g�����Ѧ$���2H<6�Lz���-rm}��Ρ�}����>�W��9w;9G6y�*��Zg���9C�?���r�J�V8%(�7��@���`�qUn�m���=I�����0L��A�{N=wo�K����s*l1d�'3l�x	���	�̕=JOK</v����1�0�����VH�i�fX��A����I�gŌk�Om�F"��8��MH	vți���+�1
�
��l�׭�k)Z�6�RM��A��m��VĻ?s�U|T�$���]�.P7�;�2��z���V�K����Ag���c��� ��hS+!�k��M%�sv���8��wp�>�����J��p�jr��!Ւ�Mq�\��7n��hH��
������u�`�#�9�'̫�L��&��S� ���+h��r�c~|��[,���K5��t?��Q�����ͤ?��Q��M������>@��oY��T,ye��Q:�O�U��'��8UŤлʉ�t��9%��͏8M��,
}����S� �ӛ�k7)���� ��a��J����޹fvI4O��
-3�_ؼ�����Y�M���{7�͙��q���a���0I��q!�|��ϻ��Ɇ��%&ĩˁ �Jiz&��$c����3̀S�v�v�v\9�Х��L!,��E�8��+����)�=7 �}��#���SX�t��\��0�u�7[;���p��Vg%��	䊹,1n�#���]ϛ�ϱ~��zG��T�u�UR��N��m���L]�\�3��V)kU)k��7��l�X~?�eJ��� �
�o�|xn���0'��ד�t�zs��BЇ�3�E���Acx���=�]3dS�e%���J�a�b��X:��"}#5ę�ł!Z���'lϑL_�2 ����;��Aa��f���ݘ�tq�*��i��g.��,09U��C��(��6���ir�]I��y�!3��>~��j���\�������5=�8:뜘:S�s����1u���Z��c��[��:Qz��>N�����Z��}�ܾmáb���{�_�^Ӎ���S�=����P�����7E��)����Yv�p�L�Q۶y��䔨�J��]y�Z�/b�2F���T��`����f��Ep/ekLIGB@�+8�sr�&��X76�̻|C{�8�<���:�r����Z���7M�8�b'1N:�<I��#4�I��_l��X/��80 C®)H_�q�>B;�|�X��hiϥ �x$� �_�-������;�Q�P�2��hZp�ҥ�P(�:	�\�p�C&w��D�s!��b����h�m���1	�һҍ�4��P�� 0�?���Tc�� �����@�"��l9NR	��Z"��+tj~�oW@��Y�u�E��`5R�ߍ�t���I���ZzXKu:򻱐��Wub𻱔��)�^u������=c������U�zѢ�.ɬ疴֙"�>^�����D�˨�X�\��M������#������p�rY��@��c���#C 03BWY�e*Gj���)4�5�u<���͠�����Ljj2�Oqt��,2�3��D��_U�V�����[�VS��Q����a�	p��{�MfJ��T%��⼶�b�Sj��Kh��5O�e�[H!�E%#���d��3��j\�N��׌zk^�HK��,~�/��;g9��
��Z� _*LV���$$
Ϣ3G�h�L$x����a=hK�J�z��@���-M��Ȅ��k:��]�M7J��V*�5c�I�v��zu��w��]���̨��N�'gq��Us���l�ݲ�i���v �V�֜}'9;l�Օ�%���.]���`AP�Ud�Z�gJ/�Z3f�'����g�z^��{%�)�<��*�a?K�y�u���&��d���&��͌y���[D'�J�E2��<6Q�r�Q�,[����\�0~F�O�d*5�ʹLͅ
�e�^~�C��_L�r �6t�\D�V/�U�l1F0�5��qn�v"1��hK���౶��i��Z���M6��0GF�9IsG�;M��d�Zk	|3x	��d�e���7#{琽ص����F���n���T�C�ڬ�͌�ɒ�X̂%�����qe:��35,[�Qb$-�>��06���~~U*2ی0v(�;&.R�d�ˌי-9�u�h�WL3�.�˔%�2Mϸpx������"����&�m�.�� �>����vŨf94D^̖1#��+�N���C�<�CA�f�1M�,u]�]7Uڌ>ϴ(��F��_/�$A����}�����T=�#b���?�WH�/���f�����jSy�[�rf�Y`��	J,2nW�<dܐ
�i3�bE�@Ĵ[L�+j��YAS�'��&��1ƻ^�i��u�����I�u���Ө{B���G?�1�=<O[	�=���f%"�h��˂�nH{JK�)�Y��`{(��������nc4��(��Ҙ��V�^L��]s%�'��!��v*3�������N��y�(\$:��dOx��2�0���r�%p$8�r�#��(1��ԭ8�6|�C�����?X����m���6b�����d��t�/#�>�������c����W<�"�m#��^ctv�x3�oDx!�3�����6Gn�dz����p��z�-;OVH�:�+�Iz�'�?�PB��.{�-R��B]�t��xY05�Pu��z�eR"�p�R�p'�sa꤃�k"Q{����B�l4Ϩ WS��":t��t�3	�y��D�hw	�b!���7�V,�n§h�8��+)�-Ӈ�m�E��C�4`Q:X�]�R-J�DihO�cSk!��hS�F��9)�i�r��Q��1$�B#Sq���aۘ6�Ev�+$�X�\?�qi��̒	�E�iE?K4���ѡ�6�W����>V��2����(.=��C�L��̮���H����s[k��L�py�܎�q�P�f��֬)]�S	�SҊ���diA��X�l�)�k5#o��^��	���,T�A��H��+�j%n��{V�6�OQvjl��DH��y۹*U����b�"�܊C`�joZ�\b�9w�����X  �H��Do]�1;�_P\�z��;�;@��8.>R�-�������U��O-���w��n�?�;g���A�Ȃ-ђ���HHd����̜�$[hfqΑ*�|)�6HD��Li�fҋ�����`̏iNf|���~f����$H�&�Z,��w�}�r�NR��QFlz0�V�+�z�
%�4�X���I��f�D�b�j22�|T�N&�@�`���T/�=$���~t��}�@���$��a+��L��n�I=3�,�ص���Y���X#��	����)�!�5�S�(|��utZQІ��;�Өۊ����h�-ul�N��i���?��OA����� �5.�!<��]���Z� ��_� ��s� �?x��t���re�伦A�������6@��.��})X��ȵ�����j1͸S��D#���6�D�Ϩ���Ϩ����z�<�m=.�]o�z�|�ۦ�8��[�=���N*�n;���{t�    ��I�$��	J�7D:LL�s��~o�T��l�8J��c"]꛾����	"�{-�IƐ3�"6�^8�����A6�xCz���.���e�|Oz���ˁ+�Έ+��RC�%uŃ���� �4κ����9qp i�?EK/w0���t�;��t��b��^���,f�<.˒�-�X:S3�	3�&#�i�;� �8���r'�L����-)�8���(N�($��	W�>��qtt�2�݃آ�q�u��­�Tf����ʙ�AG�{��KUЬ��J����S@Y�)9�o�-�S���;6I������6Ύ�ع��ƻ�P#Hƴp�a�� �3�b�Oyf�����;�e�t9X������ݞj�,�O���ḥ����I�s�%'-�?�$H7�S=�@���ƀcL��:���IF���R;������ii��kBɗ��w7�$	�y���Ĥ9%�0�i�2��]�H$��b�n0;�u-t�"�Nb���\~��Y9ʞȽ�v�J��bs���ZjJRs��5�E���Ȝ7�~.��\a���Yd[5A�-�ėV1�H	������1$����xMC��8]�|�*��&ύQ@�D��m�l�� �W���/�[2�P^[-�H6�����"��v�ā�Y�?�M�����H�*�r#rB�s�[�-u;�yH�@3I$[���:C?���Z6�Z�L�4�H�g�y�ҎE=�~T��I�.���م��ն�OcnoXIM��׵̘)��q�:Ћ�9S�=�c5��@z/�r)�`�-�<Ԏ�	{&,ٮ�L�?4�,V�t��\/���lԯ�	����Z��ˑ��/!�L�~�x�z3֛�ތoj3v��Y���Xo�7�����Uwc��c��"��LT歷��B��W8�v4� s��_W�m{�J�k�|ϙ�ׯ�D5���~����, �⤔sb���Y1�П�����6<���C�_�ꐾ���*���`_ghց���.a{��\��=1LDd�_mh��$֔ 9�?7�k,�-�r)��OWI�%9�Z�z�*��I>7}��<ĸ������hT��ܭ����}SjPOl���$��X��z7����w��*��c���8�~����n�wc���n6��?�x�)\�U�P[HZK zb�T'��.Q��hbK2_�ӊ�x���p�,$�ɜ��*�=�Up<s{�  �H�tѪ�l��/�_���@ύM����82?�H�R�^Fej>�� �r%���4�xns�P���L�����\��~Ɣz��p���c�mB��GF�s+I���I1G�B�UP���_IWL$��3A� ���Gž=dP'�iWIxh�č q�����2��e�q6|��-!rt1�V&c�1�y�[Y (p��
Ԏ�F,r\F���jJ�*�h6.Ws]���Dc:�鎜k%`j����$H
3$���B��4x�tW0^���?�t��N�9M��,�����s4d�Y�Æw+��}��4���3& x���/�����͎L"��q � ��{]h�9)79�a�xPT�%�K A�U�@�S����I�Hu���n��kt�=2f�����K�S�tQ�fǬ'�=�J Ju����.թ%���7$��6$�5�`j��e�M�d�q6��ﷺa-A	o�6��Ⱦ2/��E�֛��l+Jԛ�4N�@q���4"Ӧ6�9L�b��@�Jȝ$���f*9H�QE�]]#_�q�����uPdV�6�Sv���f|Gс������%S޵���]3�<,ۏ�?9%A��W�0uC�J�ж�����:m����"�h��y�j�*�x�����hA�do����}m5ė�?6j!H�U���8E�NQ��Yy1WIn�u����JKa�9��v�vc��+�tvFѰ5�J���2�qM���+r��Y\F >5�íFG��Ag<���4���W�s������~]l�����Ωw���9�AB�'����Z"߾D�gg�* �L/j.c#`�+
Ԙ^<�I.ᕿ~>�3���q/G�����`���,_gi<4\o�4���l�|��T�dl.��'�	 eB9]Ĥ� ���t��@�O�H��6T	����f0s%/Uw��ߕ��K�i��%����kA�'Id�{�\I],(�P�I)���.-L�*�^�>�S,J��������T`O%�M��a�Zy��c6���< O��w�,ղt�,!K��յ4��t�4� M��EkQ�E�XQ:�Kn�c-L�0+L���ԠZ�ja:R�����yU�'C�ڞZ�(�Csm`�l�����d��S����6C�6�bn�Α-��u���f+)_��*�_�����ڃ<� I������#j�!����c�<����)�6�<h���o.��b�[X���w�(y5Y�6ao�1n�S	lO�7-i�TJ��Ь�b,C���]����L�̌�<x�@#�if!�jj � �0X�:��@�V�6A�\�E��Y;��H�Ċ
KX�-�K���2,�4'	v!'��`��FsP��� �%C��o��V�O�P�m�M�݈n�(�~y,x2$�C�}�7��q�U�e!�|�]�ٳO¤=�����5�q.km�&X��&�sZ�MC:�-w�c��'l��j�� �F�Յt�P�X-b�'b=�Xu���Z�^G�z�v����X�����-��� ��sm�;X�DI��7����c'Y�FS��4���R�wGwx���G�b�>{���p?*f #H3�(�jc�lȌ{��/c� ��U/���?���7+������@����y�r�4��Z��Jz��?�zyk����V����:[�.�Am��L��Q)��@��"ilY
�����x�X�M֜Y��P��_ez���e�A��G�z��Y�K)ͻc�%�]d>���\5~Gz�U것�9c�Ѓ㔔�Sl���y��Nc���i�j�~�2�;2`����ܹ��0X��Y�y���q�9�C����;6D���P�=rx���#�&m�Nt�-���]�d�}�8���δ쉉��F �j9d�±n�O��ׂ$7������@
+������G�3n��_I a)g����V���� 
�U~�r=���G�k��9�kp�vɼ4�0Q_���z,QCH����iQ�ө%���c$j�8��rS�b�S���C<<U({ZUK�(nu.�-/^���\��~0�9t:�s�Vc�E��+ �� 5��������7/OE��;ӡ��R�^)��es���XD�%�M@@=@M'�\�B��F�]��8���P��;�X��O��"��H���3Oc��yҊ>�b�ML�@usn�=�p����6\�a�Hפ�`;�EIg�y1���y9u�]o,B���F� C=�B��,@�� ��j)���vK�9��`bB-ǵ�j9�!��)��B|���#*Eu2F-Ƶ�n1�:͸V*jA~��A>��T�q-Ʒ[����~�S5���}��ц)��Ud֯'��V��L� ��*K�ǡP���9$���r�������\��Z�����y�S,�0��"�+Q�ww;"X9�f��`3N������/��@��,��Ke/ �%���ɉ�wŉj~�����R�i�eZ�4(�%��;��S�Z�ڱQi�{�a�us�观Oss\��i�q����e���(�h�=U3�p#_t��� s�ha�>G�Z���p�C��7z�݊
�� ;�ޓou�b�z�������h1�O�R�Th-����� ���dI'i-����B=k���PΆ�^6�܅�O�
0'd<��X2'�tY�Y���}oM���w�e<\�Ά�ׯ��?u�`rR(��D$$�� "�7f�İX��l�1i6s_�IfqgH�@�˅3���|>o"�\B����H��L��8h��гڗ/��L�ʕ눙9%ZMH,�s�+���Æ��8���޲�Ε����dYnDHK��V؀Eɟ��W��\�t�����W����R>a.cp;����I8��XÖwt�N!�+#�>
�v�PJ>�����    ��m0���Kqh���?(�>k�5�Q�RUd������a�L�lF��ǹ�j�-�t���_�T��7�K�q>:�&mr����W7pGC�22���.Y��� g.e���B��o),��8gd`A�te�Y�Q*��]�!~e���W���kAn~ܣX;�u���H��Dz�q��v��vF*ʦ�Tÿ���{��p�Է��;�(D����NdF�M8t��>�|liX��w��p�p�V��w������1E�_�"o�pL1�
�p�HO)ȇ�r�����#���Sr�նdh�,���eoӜ�k6,���Y��k��ɖ���r4u�s�Γ�2	X����CN<�~�Vx�ŋơcB�S[meת�^��2-(ғ�qe���.��=.%De���8�V+���"v~a�p���W��.��&M<YĮ�^�f��n�M�zk�����)�d|��C4p��:u����II�*I�|D�G-���N	>C�܃E%u����Y�y�>��^s�}�vܮJ��Y����+ϫ�kf�/�����1���vW'���~_�=ht��c�S�v�?��	Ld����в�@�m� ��%�1R4��o���*��4.#��̛8�hp���G��}�U��K��5�~^ {di�X�E��S���
����A�̘K=%[/�t
�I�� C1� �ù�ϲ��1&WF���1�+�ǫ�;�2i�����F��2�݃p�^��8�����8,dވu�����N��Eb�$1�Î�cM�4M~=��&��쮦�67�4�i\�e���9*�S��f�A�1�\�)��sm���vm5.6�l�'����ف��h�
3�����$���%9��-n6��j��#��Tz9���J����	��05rO�^(��l"C��]��)�҈$b�q�1UK�#g$�c=]�1lPN��}P��~�S�J��L/�x0'�	D0h,�����po�.@$%�i�+Jm��1����y���7����4�˹���T653��й�$i��h�Ae
�8W_���C�TR�@�J���P��z�6�;�&U��c���SөG4��W�Ȩ)�k��R��R�v�(�;�b=�v�ٮ�Q����0���f;�Y5 9ڮE[g�`${��j����ܘwz�C^�Ԑwz�P��Ǩ��5*�/]��|�	A�tΥ��Slw����F�����P��Ӊ�k�cm�Jc��<���18ne3�  ��>g:Tu&����m?�ִ-��Fa�m�IQ&+!{.�ѱ���
���BDEK@.jIB�������Xq�����ucq�S)�u����ߓx��{��3� ������lI����ʭ�5�0Q|�!QMNd/��؊3x2��=&��&�/#r��\����e����.�i��h<��q}V�1*����v[M�_Fc���j��C�UVx�qP����F��h��0��*��gjzKc0�I�7��7/��/��Õ�'3=Gf����`�tgWo���D�4�"Jp*��1Z�ʪ�@�am΄���������i�ܒ@������q76����$#�%��\���:��Z��`�9��Đ������63�K�f��d]�Yw e�f��dl�j��~��c�ܰ�R�|CJ�TC�0���3�ĉ��bT4�~>'�������&!�Jl�dR+��Q)��-p��ͅ�i��,|D)��g[;Vq+`֩ѓ�h�|9�r�q�àQ����[��M��I1o�i_�Zrl8[�y2����Br��#dz�=={]���Ǧ1��s�� ���,��~�0"��Ɯ|�.mq�|��'� װ��z�S�'��ۺ���ܥl�^�B�O��dڝ��B��-��D$׶����Ϥ"�TA�~��@}�:(�Gry����L"d���V��]GE�x�D�7K�q�ր��F�Ѫ�*E�c�<iZʟ��*Z"hA�s�/P�Xy��/xO��8f��N�I��E�X�>Z�X�d2cL��g�勠q�	�"��?����U#��_��]�*<Jq��;K#�.�<.VF6H�<l�_��/(V�.xO�d�V�%��6���45HAܓNxS����	
!���������,�KIHcyd���ak��Xst�p�I>�+ UYZ
P�밙���3>(��M^���l����	j[�������)��an묉8�qtIY�:z���}��#tk�)���.�0����a�)?n�biy��&܊4@���"^D�ߵ��ɔ�W:_��V�&��H}Q�J���M?"F�*�ＵF̿>�w��wg̻���{��{�̽j�{ͺ�Ⱥ3��z��Ø�KT�>�d�O����+�/�M7ͽN���@�bn�KEu�4�(�'֎��-��t��c��i��sik
X��\h�Y�d@�t����O�^�m.��PE-��Q0{��W»Ǿ.��Pp�fޭd^���;��Q�1+BD,ލĐ��Q4�Y�)�p�����ٺڹ2`њ�w{l����`��J�,�'d�� 뀿c������+z�2uΟ1]8����W5����,2�J4�"f���j��+���@�#���~
��K������?d�ʍl=v�:g#0�$W��xB�R�+��I���"�w��h�y�=�[Q�)3� ��9	]R*��E�ppPr.6��oC۠�|��u�,*�i[��Gn���Q$�9ڙ�y�3;J����d1�tS�K��E7�̽
۴��-�ܐ9Wi�ּ���1��ۥ5�n)���q��r�YwKYw�o���|ǘ�o3󪬶�u��u����-�x��gc�H���gd&����$X9WRB��ț�lD:� �����Ɵ6��&'���~����,$�!�+CƯ�d�]r�Re����  �ep��^��]O�%�)�c�t�et�b��W����F��EJG�Yga= �����0���z�������_���NǙmV�vn��� � �u��f$���8�����n�Ϸw,޼���<vDs'��l�*	��-�M�I����~���sct9�0{i�-��[�\�o��wbA�.ϻ톢U���6��A������o&G���Ai�E!�o;x���y�˶���7�lF;r�3�.{�$��-_�浦��f��3?o�7�Qnܦϐ��h�a����9)��vopL2ȸ�"߇�� �����}�a��;1���I�A�%��IrM���-�$m{^��&����Nk#�g�^�H�0o��m$�a�\�KE�AZ����f��ـ���O�Ue¼�1�����#���7/i�3��A�b͋���s�E���fěgĠm��j�_͊�����)��fF��q�1W��-����t��8�6��+���T&6��%^H�#fD�eq@��X]{,�U<�~�ÿ#�1��[C����O8�/�#��;��cW��1Y˴m&�>�94�����ک�279�C�k�������"f�=3:�j~�~~���=�����AW���ʦ�<$�̼�'���bt9��]H���ݲ���b�Â����%'�K��6w-©��A3��O`�P� ݕa\/hU,�cF����$�3i7�K�b���,Q�(t�pvmH�?ӦX+���W�&V�p6�n��fgA�9�KԦ$���YB������!�>Ʋ#+؀"��!h!���v^�V( ��,��O	n
�}^h�T��2g��<�r�V�����;�U�2��#A&d��S���m�u������K�o�V��R7��e��S��4 �0�z֤�>���%o��PI�	�ޙ�Pe]��z�+����������~���k��1�`(�� ��J�SH)������!����ȕI]<5����i[�C���t=g��Ք������U�����A֎9��55a_��]&l��_�5��pvZχv���5��,'�[E	%�hLb��0g͆IA����g#�W�U_�$˒U'��	`m/�<8����a�L98V,fɓ�~;(��i<���Hb!�P�MImp�T`F��d�q̟�@Q�N��v���H�mIE4H�h��D���    k������{�I|I���y���>-=���`�ۋ���r�2�h�qظ�BG�%����@��@I���[$�ā�*M��&��N�M!�so�y臏W�ވ.�!�eQ���м�4��B�J��D;U��+R��x7;'�������=���z�������
�p����SuY�*,6�8{fLwg��6���E�r���ߨ�b�%vFѰ5�=�@�[0�k+���ʝ	������DY��8��bވ�gk����\�k�j6n��7�N?j��̱d��q�{/��H�D3$>���5�h,���ȵ��N�*�y	�X�b�q�f𛥲08�WDF�S=��������������MW�LRcf�#�w0�w��!}]!��t��6m�,��ϙ^b��j���:��a���sk���(�*_�E��Ucs����n�+��+���8�*M1/���y7.���i;&�:7�iƕ��v����p��]�C�r=���W��U�&kt�v/0<���T�����(`�p�q(�9=�ѫ��Ipb�QqKo~	���Y�isW�8���Z:�)/���%vv���N����+���~����3{��*WG��w��}s�VyWj^���۲>c�yn�����/�78'N�q�r�@C]Y\4�m�р-��x���4[�1�eي�$)R1�[�p�E��jM�2��RйjW����IE�=����Ysן�)�ƚ(���APL������KO�Ȳ�E����i>@oыM&ζ������&� �A_�&��qq_�T��\K;� �ݮ��kϘ��hE�A������N�}���ve�g�7��sx�9+�ˬ�L6�O[�s����(xQ#PݼL�Sn	���H�VC*5�,<�����l�f|�(*e�|ĜK"��!+gN���my��F�Z����	��~�O�-��5�Ig�����&��Y�Y}���f�;��1�S~	�*�?N	���w��I4��!ծ�/j��=����P�\���d-+\����3-�h��Ф�	J�}�{Im�`E@�P��?���jM��.�i	�wb'�<��8+�w�[��F*5�y����F����<�2��-}�$�kN����1'�����%���;Rs�Zn"ec�ǅ㧜�@e����%}ܼ�~�㌻��]�<)������S�Ă@!mڡ�~�"�=(I��,Z��B��R��Ty� aFL�c���4dD��G�L������AL3/�4g�s��F�@}�acK�$렳װ�Ř�G~o���Ug�=3Z0�w�9��.D��Z�eO��M
��V��^��͕H��o9��g)1;д�y���ϙ!��j͒7ϒs�)�C�ko����$���s�Ha.L�ż0ί\��M��$�m2��0���:t�~�_X֧��2����Qu�L����tAa� ���K��^:yKv-������Y��ףy�i~�6X���#=��M�aoe���(�j��Q�؊���i��F6�(�;��&���F�%U4#������lQ���[�q��v��N�������p'Px��L���\j�mP8��"#[�c7���}^�].p�ܽ;��Wַ�c�Ʃ�|(��t�pU�*�g[*l&�y���עa����l�0{bWr��]VＮ)V��������� R2���n��!	w���`n�W;�qD7G}�3S�k��7"S��)} s���/��9S�`R[M�_D�~��t��7�����1GFu*XM�_H�?��C�M�Ǆ>�@U�����Ah�a�K�6*"�%K}���*WNv�7��Mu-*�47h�G�*D:'v��7�4e��ʋ�2��p8�yi��4e��M��Bo��`��8�i���k�I�K]zET��\��ojҟxpz��T<g1��&c`9?����/LOo��̒
�f��dǐ�Q�%�y�1C���57�&7��i�_���6�q�o����鴙#U�l͏�������Nka��W�ٔL�s_��pԊ^3����ف�j�3&��m�7/�h�>V� gc���6?�Y��[J���-ⱚ�W�&7�jq%�C7�hq�<U>��t$3&`�	X������xd��;G�����D<$;Hs k��Ŋ�2q(�vҏ��}ѝ��X��Wy�u`eS�^R[�Rɮ\Ƒ�=��4>mK|�j<6�.�G�.ۦ��d����2s�^t �I��\б6�i����u˳mX�zF_ɓP:"�L<�q�<�=%����8Bi"ǥ"������4M���<�Z��St�&֫\�G�p�[ݔ�Cu2��Pe��^�Ս�Ҁ$�BЊ_�Ȧ��
 f'}Y�IH�$��c��ƽR�M�܁ĸ�)��L�"s�6���%g�$K����DI������2�J�V]�e�F��X���%c����"A]�y 5���,�r�g�*��sw~�yTfȀr�'P3��0c��8����v�1bvT�j^�^��s��Ps��p����I����f~���x;܀�w ����<�ҧf삋'�d�4B��%
(V�N-�~D�D�
X��	s��Sbd��(���<e�lO|,��W�.�ه��V�/�9 �uց���q��M��.%;i�d��t��l�kZS��g��"��呼�'sU?�+6��w����'EJ����g�԰q���-U��}^��]���X�8 xwѠ
8Ҳ���K243 �iG�v�8���)��� ϷCr���r�Ck'�x/�#��@���7�w�\�+�"2S-j!�]��+�M	�Ƞ���G�1���;V��2�)��!&�@8۶��zi��n\���CO�ɺT�$�P��9�>B��n@�>0����5,�b�-&�f�H�g�\����A����]��Vk�R[XPXO�f!}Z�rm���Ө����Q�)E�9���}�ȷJ�;�0�!h��	1N��������nn�T��t�ߺ�����n+"����!��$�T��F��Q�͂{�H� ��Ѝ�x$޷�u�rf z��5%�����-
)����ru�*�<m�3ܕрN�yBw����co'|��v{��q�e�9~a�n�6�\��,P�+�v�fj��K=��V� I�����C&&�E:�dGq�?,$�g�j�g�g4��*�C�������[P���*�H�0癚�1)��i�t��bqv�dD_-���d*V8Р�8q%��Рv0�������� E=ݹ�����3ˇ���G��t�_����s�f�,�,YAd����4x��5����Y ���3�Q<&�d7t+,��?'�o�k�-kM?р�X�����+�`����)b���ya)'g��Va-?�������T�_�	I��X�@��b�e��[P�׌S�/7�(��u=�b�.�mb�IE�#�k^f�ѶE���炞�K'^(Q(��.��/����P�مZ��q�2m5�-v�Z���'��>��ݼL��7�=g���B��w���63�'jv����0;%�Q����eל�������7{�֬O����}����|��	��y�_�t�9��������1W�cJg ��M�E��}R"�����z,�CO�K8�7+@���e�s̴���qׯ�jA��i�S�<N��`+}d�S�X�1�EAF.��¼~�-��_o��?������K�rF6>8�E�aI����貞�G��\*g���v�]�· |����{��1��Ԍ>�l3~rʉ|���N1h�L�	�Ҭ7�|oG7��cp�/���j!}�"6:���\
���FGe�c��p�W����U����@T��%ʥ��@.�1F�E�$��\�����%wM[K��`Np�$;f3���T������!s�\�Z�36�rӛ|��S�|��=�{#�JQN6����t��3d_26�̶�=��D��)��b����s�zP�*SnEHgv�1�������fiimS���ݎ&��o)�dO?�`�]�-@�D'�O�1��cW��� ���Vg��RZK�o)�g$�����Ӱ    � a���o�v�x!�ȁ�D�'5�p���.�H��H��\^�����|n�|6�_1�)X�X�g�ؗ��ia����O�$!�������H��%4W.��ؗ��E�m"H׌�����4?�=�<�α�ص�;����^��`���ϯ�����]����)�
��{� ���6v�"����3�+��k^�����kn�'��0��r�kV�'��2���ekf�'������Onr�Qswn�����T$��J�p8PL;�RO&�ո�2x��z����ӽ�䠍�N;�@��>!��B�KT��?"ջ�g~a��F`��/� ;/���}�u�[�E�^j~���Lj�Κ�ǿF?�ц Կ��_c$�����%�$�B
�$������Q���8B�n���:�_F�G�~>���aȒXJ�Y'��+�3���ʅ� ���<�	�޲��E��\�*�S�G�}9�։��\X1l?.�`�"L�
_f�dy�$Iw'��T2U���I�HoL���kH�ӳh��-)E	%��x�m�\��	�K�g��2��"D�(2{"T��W�0���,	R�R}�}�ԥ�Z�h�Ik;?z�� ?�p)7EaO;xA�?�Zh���p��T��g���?��"�S\f8�Θ�ǵ7́s�@�MX����`�f��j�at�1�?|T�����o�� ����c&T�j�a��4>U�j��s�⬘q�R�X��a��G:�z����c�_	4������VhL�my�<�~ ��b��x�dM��m�YC�x����a�!���L��(��2�M��4���'b��Yˇgf`�V�N�=�_
d��l� c��P ��	�ɷ:^�(V���6�?d���XM��G�z�ڍ�E�����=C�KT��9hp瞪��.-�I�kI* b���	:)k�S�b�����fPz�}���҂Ӆ�<J��
���s��~s���i"�_�!+0b�"j,��W#]�՛��0퇇�#��OBBn�
$x��G�
�an����]L�E��hϊS��������<�qx g��Z��B�Q�?�ٱTS=CHz݉�M�6T�,Q��N�֗�\���8�@���r��h�~`��k��i�&�ɐ.H3���U�Q�̨J�ʚI�1��p�{�*��7�d�^;����X���T$Y��X�D�#���p����������"k��N���\2 Mn~�Иn5}��էK��A��Ma؟��+�O���)�2U��O@�$H��F�́�Qe�vP�I��\r��˂#?���&��6=-t*~9k�����ΗaC�ú�h,�g��#HeuUX�_����^p��[$|��K�dZS�x*²>o�d�*��b2�N:� մ\�ȕ�;V�o6��W�;n�M��<�h4��:$�U�d�l���7߫bQ�M.j�ac�V���&ъ��.�E�fd(�5 ���9�;V"0�V��)*�zf��-&u�+�t�H�P
	r�p�FsƠ�<��.�������%
����ntz�8�g�?▀�S5�? ���`�Hq�+M����	Ӈn�W���~O�=jtH�\?��a�o2\�®��#_�)HIKe��ϔ�(�󤗰O�h"�i��Ǒ�����.Sؙ���׼WL3�4��Kݜ�u�#R�����Be�nj5���ZW�A
��~�!���.�
�i 'jʫe��=
.'���$�[_o��2@���E�/1+Y��������ŷ�D_ܼ��7V�cu�Oӌ�	���ȴ&��^��Au�Ҙ��8M��u@a�I��n��őeb88x�f;^#Q��U���%6�f"x����"fn4�y�6I��x���i��\~��ة��-��E�u�JN��bJ��`z�r:O�g�P$v��Mڞ�!7�{~v�� �Z�j9��R���X��Fv#�D�ũ����=����a8�h��3*$.�C:���:K.�6�]�*nѱ�dU?*e���߾����%|��M�|�3��L�Ⴑ22���`k�}`9�l�O2��ŶL���K�e���s��71��fP�C�nLDq_.)޴�"� �!�F�J�����Wp�%�* %��W�U�'Ǟ��ܑx��F[I6�6���x���L��Y�Y�Y�O�3(<����ǀ<���;~_��mO��XL� ~����<�ܵȣ�}��W�K�[̞>��o?�ta�P���A��E7���8tJyF
*jj�5XdI�'��@Ru���5YL��@R�vap,&d��/�ʾ���>��I.j�ʙO���n&�[z��%�'�ϵ@:����?���fO�l��DC�l��S�!l����0��3� O�4 ō$
Z.��sR�g����7>�;2��rȌ4Л��Y���\���+�_�.%��.`ԳL�Dj�e�`M�^�~@�"�|p�����w'��NP6@��z�Z�KK�/���m�g0��)R�6�c@��
xt^,S����M�P9B29b���h�E������]�+_��#6��c�𻤹�|Ht��ϓ�)GjX��+β���� ZK��kF}�xoFNͷS̈́�wmŎ �B+]���`�����#���F�0m�&ZS�N<F4 ��l�����˕�q,�2���cc鞐:�����0��d�m����WN��y��d��I�˄ssG��g&��Co�n�Й�������	�5s�M�v��kj�����2{��j޾���ۡ�yY�	u�P���Y�G�낛�T�ss��3p8E��\���c"hR�d��� ��$���V���0���D[�lU"��q�=M[��{��pJ7ԍ���?�����&#�`�;�`��� ?�b����i6+Z���/���i}6�¦�i��1p�0���E;�����a��j�Z �S� ��������茎��^������.ǁńe�T��vߑj)�A�G�%5t���x5�Ր����sGj����T<�J��3�nb�Y�q����)�a:�.���4�{�ya�:��C3��*���<b��ɭy���x�0L��\��rʉ������]�LRDSZP̱y�L#ػ<���iZ�-����w-I��oNS��+~��
��s�����B�R)�E�CU ����Wt��1�$���)�/�T͋����8�6p%��U������V�8_�&�.sT,�Sh�.��pުy�`��M�<��������q���%<���Jg�*7/�,r
�lj	�b�<�W�#�������`J�Bx�-����[|����~�<iw�3}��8��� �鞣�%����k�����ld���B��I���H�y����ַ&i�U%��"Z��o ��m��a�Z>k�|��9��8,�G(�����6,������ߪT=��[����/�J.֧L}��� ������Â�_�/6ǌҮ75[Jc�
�v�J�O)jܗ<��#/Qc��^�8�Η��QL�f��'zL������AW�Kb���f(�f�O�EƛZ�_�*xc@`/�B-��Zv!�ٛ����;o@|��[r�� $�ihv����'�-^��,,����
9NpL�F�o^����3 �O��,^ �}�cN�[��gw��}8��f�;��1�w|�n7�H�p�m��P�s$��a�����T���P/7�-��J.5ݎ�t��7Iip��=p�}��Y��~gz�9�����8O��7�A0>�����U��M���Jr�V����OT��4�l�E��P�L�_#XӤ��LX���o�u8��/~J5�=������Qפ�$%\��É�݆���g�����.U(�eN���y6�����.�-ˬ�|�2A��;�_��������n�׶陲���8~���.Uz���CQ���v�NQ�8$������	�	�(� Z��8$�.�O��n
-LVg�����qdb���D�LP��p;s�d������b�?{o�#�u�	>G�
�4�G����Gz
)RRIR	f�Z�h�n����D�g/��[a�yI�[�1 �J`�\|�?ҿd�����o�I    %�\�D_���ε{����l6�i#���J�Q\a��W������1=��(�z����6�2���j�{�E��x���If��-��R��@a��sA��np~npk��[���X�	�P馦�����&�%B�xv��L�*�ڇ	ۗw�\'W|�`#�o���fy��z�O]�g�u�,uH����6�}LV�����]��R��O��K�2+[���j�Tl�R���k�_��b50���L�-Ek�w��I< ��j��j�R��ߏKk�Q�ʞ�֋�����F�%���@����RC�Up��Rn"֎m����S�!����j�f��2Ho�i=�tf�7DS��)2���4�}��\�3�ל�����>,ڔY��$[����ɰ�Ow�w!�V�r�J+����Ė���e���#@��Bs���_lu-�.��A��.�->����B�\n�k»;v�($٩��F�B�Ⱥ����7z�·��BxԐˑ���fb���e%2F�y��y�@߶��4�&t�C���W��B��o��SqV�g�t]=G���G�;����K��^��GEW6�q�/@_Ny�$	k���-y����Q*I8�d#1O[~Z+6�<O� ��7�9l�D4lv�D��@wO������_i��U@2(���3��]Ƴ;��5ؠ�.-�,J�8�d�y����p� �΂�7´KL}
-�o�j���w=����}����P���������ۃuHX��-�o*,����X�aMR&�q�$�2�� ����Þ3*�^�3i1&���".7�.H�X�<�b��P�|�7�� f��w9M�Z������5�-�j��Ӎ::V�eTLǄ� ӷEq'��D�9ￅp��s��&5������)rĊe�L�C\�����c{�..۫"<���sz@��ʀ����J"Szo�;�.[�<��E2�r` ����k�[���l��	� �2�p`����6y������"��{���g�>��@p��b�+c� �� /��`_N\���v��O����m!mE8ei
���$��}s��E�_�+�P�hԢ�x�/dQ矔r\�5��M�Ee����A���w	
���]j"(%��|��A����.Hr"ם'2:-R� �L��F(@�]�2(M��d�����F��d*����Q��V��&���|d�P�ֆ0���Zi�o-z�'��;��T}�8S��lb�7�D�}ʿ����������o�<��� �?���{�Z����M�'��)��?��m���%���m��!
���� ������PN[Gi��J	H"���9K��g	�h������TlU��crt�iA@t��M���bM4h�S�q:љ�c@�
����7#`_�M�̒��q�Z?"{��J罌O(cj��+�wA�r߶n��K�}�-~����%��q��?8<�����O�ŁY��>����m��閺i4z���Or)9k@'���6��j�xI.�V�.�U�+_���m�;�mڷ<�L߱��m�d�:v������*D^;b��V��Qu����	���Y����a%��s��m��"u����S�*�4^��oD!�Ĺ)�y���q�^|��C[P�<���L�i�Pȍ	ʭ��W�yqy�����c�[��1�sS�.�l?�Hf5V��%��T��rgA�%�F�e��,ܜ����a�,]V��|a7�4f�j��jHaEz��j Z8��0�}4ѿmߥ�M��A<�8�q7�c�x('K��n$/�d3�I��Nb�]��!�˩T�7�� g�j���ǋ�or9]��HڲA�r-*�U���f���)z���jj��So����l����6-��=�l5c�{I�>�l^�\��^�J�{�l�A�1��W�]�Ju���b�x���E�%� ՄE!��@l�ˋC"�Ct���V���"��}1��,l-�a�ÿQ�V�ڝ[�B�6Nbbp�aAWKE��5{.L�(*
5�k�-N����Z�!��֊ûv�Sǝ!7MubE�fNX���0�2�z��+%��mg�P�[�>�t)���e����7�[�X�S �Cx-�?���쏢���X�����??�F�@S,�����_l���a����F{�����F�w�)<EZ!��I��O�$Tۋ��f�2����i|���9���Q�y���s!!λ���_�EA�\����*��Wy�x�)tO�bJ�U��7�S_�]F�TZa�# ���kL��{�:�e�"���0h��I��.`#�I�A4�M���O*�!��������ix��w���&�}Q��$�g��f�_��mpX��'���t�g�YQ�F_�p̖����u/:��p�_!Fﴼ�.7s�*v�w����m_��l�2R�l�dî.����(�g�a_����'x!\PEQ[9��r�R͡�V?�z�a��m��#
�t���d����Lܐ�=��r)S�{-G�<5IA�l�����ԍ�袦�#��N��3]
�8ڵa!����Iv/�Ϩ<,��to��X�PZ8hU�\���o���s�]�K�zh�28���^�c���J¹������������irK,[�*臄��}��YZ��.�#��4ϖ_�1oa���	����-�o~C�d��n"�AVXeŠ�6z�9�-�����5��a���t�N#0,��Co��tDn�
�Ȥ�K�)�&�L�ע�����|�^�eJR�߭���g��kU���^P�<�[@����4���$��)���Z+��_PTc���/�.E�?H����S��}��y��~nI��ݣ�`�/��5��8�]7���ЛN��;��٬N�p��~Q�̦���O((���nbS�qm*.J٪~�l�nZ�(�4�jn��{e���)`H�&���7,ھ?�ۃ��^��р�j������%��������V�� �j�S܎��qP�2��+�t)��X���ϵ���U�㛕7IPNi��r3��%L�l�U�b(ȣk��LmSjq�]�ŒD%�����1��I���MW�|��j�hD�#�-�op8F)݊�{�j�h� t�т,�#q�-���FⲈ���F�d[\Ͳ)3�ￛ!6,ײ�!܀��mϸ�`���̡��u���T�s�mL�����v����%�:(b٢5>'Z�q���_X{�-Tc���CJFa{�E��D��Ne�q@��T5ܽ���-&��4Ō�-ڃ�j��ز��T���~���� BU:6�/�;��A�n��&�<�#\J#�*̩7��6:W@����G�[J�ӻZ�/O^T�2.5�,o��Su�;�K����w���6����>+\�p/��iH��D��`�0�穮�k_�	����1�ua=ߝy��q�5��º�&8���я�Qi�>~����>W�G��?B�j	��&��#���w�||�\�u�Ϗ>�2�b<K;��]����Ž��h����6*R��h�Z�6��N�Ak/&�\�#�ד)i	�:#ώ�k���U�Z���*0JU�:L;>���0}����Q(���+��t&�ʭ�.���@������h9��^OEZ�$Q2/T�� �t  zZ./(��I<߽<[��2�.��|-3]\G�E�g��z�.�]'����O����Z�yV��2�bU�{	`�s����RE�O��cļP� 5�(2Y���j�遍��	������<�]e���D�6�����:y�8h�U�%-��L��6�￵K�!��ϊ��OO��=�ҵ<� ��=C1bmӬjh�\[�#����'�N�S�kRV����͏:�l����xy�v/��< (9B�yb���@ .I�Ɔ����R��\�M"yHu�ַ��N�b��P�}$�֡�}���YVOIjQ��Pտ<n!}k��]-�֠}H7��仯�/,�[S�B�����z-l��h�?*Ӊ�an������6�{��6�Zs
�J��LςEoN12Q��)H"����2�²BŐRiv�����    �6@Ĭ�O	���VH��;8}s����6�a��j��WA�t9��6���Y��)�mޕVh��.)��O+�wTb�s����A�5����ŧ���_�/�`��ƀ��ӭ'ϓiY��P/8�m��wj�0�{3�׆�UBMHl�[��h!��*=���7�����dI����F�)d��D	Hv�$zy�)�N����A�s�A�-�bk35X=�>����.�L�����5�����Wl��zV17H�%�(ήL3�
Ϩf �ツ��<�
G�Иժ ~щ��3��C�i�����dZܠa���̮r���٬�j��m�Q-6��GrJ�&{W�g�(g�� �����.�Rkz��2!��~_�Y���)w_:���g]�R8�ܔ5��̳�<)b���cWf�1ײ��[9lHPo,W8��k�c�$+Rɔ��\���/�'�m�nY�Y�XAq=�!�C�e��+���VrIUqU��!&`r�R�ap%�j�V�0c_K��<7c��-RӮ �.�m5-۠A2�/�@��k�����j������NP�2�����,�]X��� �O���k��ɤwߜA��$�Oʸ��og2v��[���\���3�\{�������[�������:̌�}Wנ�ܷ�����t�����d2�Ӓ��eW����Ǆ�F�b"�10�}�>�s�88�.�M+P��bƛ.����}�q�r�waH��Q����[u���.��u)
P6��5C*$�_��$Ir��&��<�ۺ����% ��l����і-�F��!@Y�n�  ���P������^�*�#��f�E���ya� bkr�T79F%��F#����er4.	Z� ��L���<�&62c��yx1 z�#n-x;��=���ȉ!'�B���d��v�!n�ZK�2�cַY�3�m�%TpĹ��x���o�l���ܯ#��`DJQ[IK[��_LԽ�Þ�N'
ύ춠t��#&�c�y�����@L/�i���E�04��D�ѩ��y �bk]t�aݣ�In�^r�жᨣ�������[l�j�r� ������i��NHiw�ձ�Y#�M4�����A��˄���x���u8O`Mj&�GUs��J���Y��IjK�����-]��q�V��TcB�N�Y>�2r������ü��a92t��몗��_D���:�Nr����`Iv{>{�*~6mA<DX#�f�k��aݵ�|y�|ODY ,��jP�Xae�<Ȳ��[Q7��#��V]~}�n��v�8�i�j��-F��>hƗ�����7�P���ǅ��������]0�Y���;������z�������a���/o��ĝ���ٚd�Ɓ�L�^ʁ~��_b��~�΁��O����d�.&��j���2����M�3<�I�
�@d-ʱ���� Lg�"��yV׏��~���8����s�L���nT�Y�$���R3,���|P�\Mpj��&��zP�GG�!�{`zGw�Z,U�K�6Qw�@�ː6�&k�Gt���%��\��c���
u��k�T�r�Ѝ>j�)�B���T֕S�=��+l�qt�m�>/�t�{E�JX>]]g%��9��aEg9��f��(Gu:��9�w����ì�9�45�a݀+׊Hʵ�qOǢ�f����ת��h��<2�D�I��K�tK������AԹ�7[Si^�Љ>�:O\�9�r����uLGS��Hr���t�~Xd~��,I���K�b����Ք�<a�\�:�9�*�R���f=>R1� ��ҥ��&��2~�eܣ���[)��R�S��Ҋ[��"��z�w��#�?������b��\�
��2���#������N7�|�M٫p���]�p8�4Zܠ�M4h!}�$�����M��ذZ5�3�3U��d�Dd�Ա����ڧ!�@�@(�e��r�4��X��4ϗ;{���Xn����ω��hn���yA<�-�o�h���=ot���A����ޥ�N���՜β��$.�
t�z��+Fx�A� �m<�v���͔���Z\˹ᡛ��D0I3���N�#�9�}h]��`���;����^R�KP��m��w�������%�1�Rλ�鳸I�lq܅���݋�?-X�F����1
���l��)u����e��Y���v|���0T��R6xR�>F�A}��d z ��~;�w�w2��4�3q>��a�4��4T���3P�Py�̓$�þX���v"�5�|C:��`=O%hJ��G���i��J��gX׊�ޫ*r��%��^�!�8�Ƴ+A�]}��5�:�:G�eX|r�N�IX|�2.N,�Od#Բd�M�OF|�V�2�43
�%U5
13j�D��4�[wf(�e:[0Уt�n��������	�9�4wq�}�:�@��1��|�9���:ct+��N�b�v{G\	h{���d�tJ%ȋ��Z��YK��7�т�q<��#��"h���5w� ����ػ��]�v��3j��cfs*�H�P]H	�K��^��Y'z��$3��,H �D�=�:�lvK��y�w/��:�@�l��ѣu]����]��9�>�uP�[���?5l��7���!Y���[�vj�d�����u~�u0���Oa�З^˦s�-��������{I�vp�����mk�`�=μ!�მu��n����=����?�I9��7m�0��k����HU,sF��&�������זQ(��m�^WEpLl�¬OGb��+�(
6o�*.�l�<��l�Hx�
�wx�ר{�T��8+fg�N�,���jJQ�خ�&�E��y��-c5��(�`�<͸R�& ɪYZe��Y+��k�v����A���~+G`�ƃ�5-�{�� ��~�ƽ0v����ha�#t��!���aVzx�s@ \���;���_����OX�����l��Mж��j�h�� ��f�(��s���T}Bu�Q��5 ^��x����!a���6�̳glO�7���4f\
�2y�>�=���yS����k��嚾�a�="v���x ��΋|0@��Ѥ�@�j��IV�Y��	���+&������ߛ��v����T/n��yh��U[rjW}�I�9Ƀt��z���g���>OrtW�x�')�j���������Z�uc�!�8�0="�~��L}f�3�&�3ٲ2�n%�*���<=�����8��s����S��ra�woZ�Ӈ�7���-�2�c�4�wt�o����HwY-�%e��N�����C�����z�j�f`8��e?�y���}�u�>;d���$
7-��k2X�̓ń)Xˌ���L��.�2���g4��Nj�N�S�t���
w/�w/=���L��l���E����s�����(�Y���;r���i=��$?8SѴ�Cow��l��Ac��o��a�F=b�M���;Z����S�G����l|Ι�d�{_��)0�ߤfWZ�w�MS;$_�^w��9v{N�}l��e!S��ӯ��X!uC�.�٢H�l��X6K�P$t���'Ri��묚MP�RTi_͐$UE�G��Ԍ[h�r�E�L�({�?�S��%M�}=�GS)�ǃ�A� y�p�N�%�R���6v�e���	�#~5	T�x
=t�8�f*�^�T3�����߂�g?�2��/�n�� �^�M����W�Eh�Fn���ߍ�q�ͷ������6��{���ZmcmWZT���@�90�+�h�+�G��7��`s��%��W��DI:��Q'��x��i�f%~�MV�?j���7�l����/�����9.�U�(��V{ 3_M�L&�J
/^�A�Ր� Ғ���-ȑ0U�q2�{�@]̋�^H�ߟ�u/��u5EyS� �ztH����+��_ײ=��L�Qp�-ￗ�^�,L�2���8Ӱ������
y�٨Q6��N�HhH�ʶ󅶑ӫ�����)��������H�$2r��TL�$�k�V�]�Й$��ї]pl�:k1܋�1l�akQ܋b�(�7�Z�B�#�M�u-�{A�A3> h80�    �o���6�m��H�m���A'(s�<�[e�
�Q�����.�9Kx{�lkBOF�H�Y�k�#J�+sÓl5��<QV�yl�E�<è����*�' B�-�;Q��g�NG~!�������!�ځ7���z�)<X��1aJ��������)�)��� CF��v����ϫ���V�wP]�����_����4�쒐nqS�Fhj-�5��[�,bby���v�(
\����+{վ�(r�u.��tK�l�֭�qg�5*����욫+v_��c�Y\���ޠ(&owL;OTԁS�6L��Ւ�[�a_�i:K���!�г��r] ���/߁�+m]+�物v�{��6-�LC��I����R�D�[y����q��J�6N�r��/7aN�?,j9��%��I����.V�߮ľz�˥��E��k��<MDZ���6!��j,�q��s>ޢ�d.Υ�k��f������'S�E�?���Lf쟘a�]r:M��c2�>���;�k�`r�]����U.����[�t�^�y2����c#��8ayĲ:N��������VLl�qb6���,�?.��b��'gG_����gd��ϑ��.W��X0xO�DE��䆯<}�ዝ�^�yz�������{tw}Aj�4�>�r�N"Ǣp,�D-�2�g��ىתY�Y�")�e��a6������>�7&��B[^5��Jln�ܕ��v��'��M�S�0������ОQ�<jE1W��3�V�)[�Ié����:[J���G�S�8�?�?z���ۯ|�0S�q����	ӱ�]t��ª�̕|��(��Z/C���md�ǚ>GF��b��6��)0O8X�L�w�ZL�2Z6n�q�.��������^a�#N��x1��n�C�(T�������-��h��|���**'�<H𴧁����Y\:eC�plY��� 4�#� �N�Q���
��T���#j�=O��L��j�/�-������Л��0d���#���r����M)�}R��$gn�g�w�u��G^Ssc5ry��m�"��X����7�ï����i����$��弚�O�é���v���IA	��5��宝���	�z	2�+ʞ�ʍ^?Wy��w;޴������mb<_&z�2Aɧ^7����q*g7	�9��t=5?ЩB���=��r���]Ş��K��,�|FG~m?�55+�yjg�`{�}�uB;C��>,����.�J�bh3{�9������'G� =ⱶ�4� &�1�`���h����h��Q�!�1�����x���/�DO<�������x8��P���$^�rg�'�������9)h&����n�� �iVx��8b���s8���1aإd��as���#t�P&���X;R�c� �RS9ȏ�N�2eÈ��KP<-W���ᾉ��XT7�a^���և�w�������{�Ț�u��L�\6��+�D�7)?MF4��c��@DYG���*����v��C��[��؉�78 ^�?�7��ZW׎w����OY�%��W��Q�����W�B��gEx�اL�e�,����ܤ#��j�ܝ��_X)\J���!��oE:���lv���*�Ԁ�w��s�:=tL���!v���p���k��@�Od�yj[X �������� `�~�m������w���� `ŊtQ�{��ZSM�EbrcdY�56 C< <1�e�	��,����eN�;S*J�`�����J@��:��e8�㠍G���lO�8��1t'���{������OS��Gl�^sN0��%��<؜�Z˻�lF0�8�:$[�V�%�_A�-�z��mY��B�>]�1w'6��RO�ӡr�/���F!���ԷT.�l��I��G_ح�ٴe�s[ĢIfl�V&�e�u�^vu��e�<\���F(��$�fy��x�\	.������殳TQ�a�{� �����@<!7S$�Ϸx8o�ٙ�erŝ�Q�Y����'<����Ѐ �7�>^t����o�|������>_[�&����j��b��ӽ�����������r�ye�L+@a���.~��:�k˸���]��Y�r��nF���Ou�˭t��>&d.�L���1a-yج%[�-͓b�hJE�׆��A*���ȋ����aۼi������6��(COe��-�i�/����,���U���A����Әk���h�&�Ւ?fx���AK���}Z�ǌ��<]������}��k+Bc"�_K���<:$ނ��q�ҕ\�v�k�
���^N��\z�F_)}�p��,(��������3�?%�A(WaޯJ�&�[Ǯ�Ut�}2_-��xr�?Nh.H,�h_}�̢#t�g�ѩnQ(=9TKqpq�Ɓ1�_��\+�Ծ�n�����T��;C�9�}�T�����:�ЪM�������T�씊�4 J��9J��Ȇ��nep��hn��"��~ˌ�Kg��jw6�'=��P���c^	t[/kc[���Ma1s��!���b�2�N�bLڧ �I��2<�˖��8M��堙��6G�_[?�^�V�R���w����u�ʃC�[ܽ��Q6N����q���s�l��|/9��<LʤѝK&�L���LW��a#?BW��8z�8�Bݖ�)H�\	[ڞ0uw��~"2� Sf�L��<Q}F+lJ�AP޾�g9X\�<[�ב����S�˙��Q`��F��.o���P5ݍ���*�|�)��%�@��ڢx�TF���$@�$S2z�qs�����<��g(_Ӂ������(�6�\�1#�^+hq:˱��9���G��MV,:a0����WXȸK�ql��}��ۣ|�z�Z	���S»]��x�k����7�
���П���a�xD��N�~��� ����n���/��r[�kW*Y W�B37ϓk�.�S���\%�'�Y#0^ˈ��D�+m�Bel����������Y\�5J�Y3�GL7��.G�ä�T*��rP	��s�
c��qk'^�v���oe�0d������)*�i>-R��̀�sR��y����BJ�������V?� �!t���G��Y|c���$�P�c�32M�̐����,���f�4[��Os�4�o�SY$1m�I2s	h�y�e���w-DDr��oW��tߊ�����s%xDCl#&�-ؼ@K��+�-���:@%�GvXN�c5�n�
04������Z�3��Xɡ'�-\b��2��.{dCn-�7�Ta�ҽ#=\��av>HM��[��*~�^��4X�rݽ��r��_����'Q}LJ����5͈m:�� ���eiS�}O��S��:�A�k���u�ܾ����S�.Z���}�·�/Z���0�M�"���l*KnRU���o"�~�&����gŉ�K�*��P�������<��n�a�K��Z������9�jUrAn���+�8N��q+ڗ������e��2ڽ1�1)�x'�9\U��ɼ�2�3�x|��`��T���A��,D1�(	e���)�1�<�G�ZI���Y;j
�C!�ΑhD+����.Q��M�]i�WpIT�Ɇʞ<O��$�-�[H&do�+D�f�ێ�%�>&:�}�Ԍ�Y]
�����w�/�Q�ֿ���`�!�f3Xr�#,����]�bd�V��S�M�bVeS�fa!�0���s$���p|H ������؞����E'����ޓ�S�*s.q��Z4\؀��g�dl���͋!0])wߜ��6W�Qhw�7�BH��¥]=��������H�q܈Y��+%�4�ɢ �T�HϦ |G�,�9�{�D��r�<��X��B%�$�}q���h�ۆ���7�+[��6�]�?�آ��Q�]fp���m����{������|S(���m�#�����l&@�w��G�+m�m��#G?q}��M�K�#���k�
���|�x�|ς��i���R���ʹ���
��E���R�����UfnP��mh��4��>�@�jƯ�}l�}�%&��I����Qn`�U��Xd?����H&'    @OIQ1�㪈���c��v-rKC䨁f�5�|Ј#��}CGO�bF<#Q�:��h/�&�!3
�&%A5֘�%K�'O��Bۘ*u��zn�G�I��}��9����8Fv�V4��yA<�L�cu�9"�0ޫ�@$ ��H�|�ۀ�Pnc�m����읓�%e�W�o���Im�^�"���B+�wNd�>իڻ&4�ԉ���Y��'FB;2����'�j�̦+��2-)�jǩ(De:��Aja�9퉝�1���˝�\��U;'��\�����۪���t���������_WT-Cʖ�R9�/h�pe �#d˲�,�o�����/�~O��j����U�lb:QY�Uj�?\�E��f�5�B�������y�Ȱ�o�~��e��������������j���,_"�h�rG
M�<N-E�/B�����-Re��YNŜ)n	�WEZ��5�w�L��礪�E%md܉~�+���d��~tsQ��Q���x�J���ܭ(7�L�J�4�^�o���M�N^��{���4�e����&�>E���lG��޻+���4ϖ���{��7�u�S�U�FO�h�hD��.�Sd&�B����D�>���6NKf{�|�
�~�qC�r%C�l��_�A>(Y(�ͬ{+v�H�	�$MS���iV��������")��Þ\��$ږ��s��.�l�f$VN �d����I�'
x������뷄5�9�}	�kH#U�1@�m�Ԋ�|a\�/�^�*�RfX'�.�lQ:��r"l��"_92�J=�؁\��z ���Ʊ�f�~p�v�Srq�z�����1L8��7w����M�_����ݒ��,l�V��� ��p��`b��n�M�2�%z��$G���g�`����	�a�^��;f���d�D6'���&�}\���t�7�`�@�9Δ�2UI�)/�'�;��6���>>+M�9ɛc���!y��"�.Pn��2caND�˶b���)84�$����� ʀ�����w͢PJ*,B���x{�yj�M�f�I�~܃�
�]��������zw�uAq5�I�{w$�U��̳ne���
�"�E3��'���	�FޚY߫؉��s(A`�M���S9��RU�S+fhR���v˵2�)o,�0Y~� 3Zӗ��m��D�����Y���\su���xݑJ+�1V���j���ݓe.+B����5hf�Nͫ:g8<��~��[Cq0we���X��BD}��|u%�lW�j+��UJJ�3BS�=�Z�L"�I��v�{E�Cc�P�,��H����N���N���d8�Pk��E,<u�:
��b�b��MO�����:��@p�R�X��7 �;�X3�����7��[aj[�%���,2��P�K�0��L�g���T^��26�!uͮ�c�Mxк�4ir�2�#y<� 
h�S�E�����E�(Yf"��a�)���1���Lj%�aH���_������un�Q[�
��=,�~`��+!��U"r��,�P3��e��i�?�^��!�.r;�)��#X�l�̊�M��W�)VJ�xP��|�&A����<Rw8��N�7%o�HQQ�9;�ƎCFg�U6$ܕ���vd��z�vd��)\=�V�nJ��ѧ�l�<۝�d�idW7Z�V�KJ,������ؖ>�R, ��x����,1�Z�w�ȼ�u]��Jϐ)�y���$4� �?��6��bS�a�cd��c֘Wa�X��ژpe�gMho���ym�i�����<,j�u��BplM7���2zhyS��FA��Um��(����#p¯q����r�Z��щr��E�D�{�h^���FH�^o�o�Cz���YOy�lt�VD�Oy�v���J�.(����DV}�Vr��6F�ZL� ��Qw|�a���2�dQh�ۗ��4��/n��_��Ӹ�f�8kC�g�ۥ宱r��_0��+a� ;Mzrv�g_���2�(�,�G58��k�&���4=�@�ydlX��1���C�����bL�?rk��(d��y�g���RM�*�Tv���a(��!��A����2I&{з�@"[�/r�v�EH&cbZ*��|�j;6Pj�a�x������脼��e�'�l
EU����i��7#J��
f3� ϣc��RmG�u�O"�,�v���Ն�r�Ϣ��T$y��d��=�L �!�ڂ�L0sydy�SC�4������7��>C��1�jg6b+�E b�����~�(���>"�=��M� �IT%*�����2�30_�&�����'�leY0q�'G�Q��}�4f�r?�ۉY�0mc��q��j��^��Jd�!�4T<` ��|����`5T��@��������j�;'T��Z�ƽ����hn�R��~�j���zĪ�t�Ej܃��;z�����{�Ú�)��Ri_�Q��.�7PB��?�f��Q9ѡ���h���<���:5>˻XoJ��"�����&Q��Ĺ֜'��N�Ӳ�K}P�h�Em�4 L��jZ��D�/�[�vBż߬��Gޛ��Kh|�9���۬��N̟� YцB��G8�w/�	�,��:�t�߯��/b����n��6C�s�f��<�d���D�7��������.9���}�]���ۧ���S���������3bnu;E9H��a�x�xN�(�J�ɗ��&'�~7e��2Ϟ�	�_(�ɳ�v	��81;$����O��æL "<�LO��IƷ��˶��K@�/?T�*��q�'�u��1�(
�4[�&�Jz�u8ur�%����/g���-7u���~�pP~؂��@����-�o��n(�k{�Cq��u�A,ΗSY̋�6#Ӂڴ2˲��|#�N/_ct��AQ�:\��v0.��	�4SCv+��*�,�=1�����	��ٴ�6�B"8`3"6!ʏhڣ�Ì 6�[�N����Ȕ鴘����9H�u_��<������_ͳy���X�Nɵ�٤Z�����y����et	�a����@ci��e��0o�vp�kC�b����;�
��'d+�/7 |�$���ٴ��@0�R*lO,'��;C�_�^��u|��2o�]SҠ<=��@�oWA���$k�����9�i��F�N��m��y�a�o�P\'��y��;_t0��y2��w�t م�l�������p>P�ieeC�X��n�d!4O������(��������s��G�s�aT�	˓Oy�9��#:W�ϵ�<�S-���.j�U�����]P�?��I7D�?�y��y~�i��2����tw���y�#���k S)m�l�������LùL��g�g�a���b��O�zS�܏�s�r�^t櫚�c��ɀ��B&��n�?���f/G��qn�PM�d���'8M�<�J���@�=����Գ�g�~�ؔ�S��5Ȝr1q�[�H/^�N��z�@-d���WCuZhJ\GhX��&f7񜳨����G:_����-F;0e���X]���-��, ���x��l���)�d��2�P7���w�OC�b�i���6ɹ��H����4�)�Y��5v��o�����/B�m'7� 6O��z[�3��4�c�ac�e%L����P؂���^ܦZ��7Fvx����7GV��˞+�zV�y�x��0,1s3��<��ø�P�p�q��\��4O&�6��	�i�rԮOq�	���Y0#
ܰc�ĳ���^����N(����:"X�
� �<��'��,��_"�����>�_Yb!�s�+�d%���V�۲��n�[��i	�s�:�5����ڒ���?8����<}�N����طHա������l��r~����6���p�������	M�a� ��:������!��c�@�ҞT��!���&V#��g���/�4f9b凔3� �����?��v��:l�f����:;���v�uҔ,�5ۺ
�H�VW���&3�E��2�B���H��,������F��bL(�:�~,h\:4�Q,�8��z�}�]���V� �T,��    �=[�� #k��L+���ۘ�[M&�ʂ�;檆1k�Gp�XM�N8����|��ҤΙ�26�d]��/����Z��i�!&���és�݂_��!h^4���-���	=u|�iE���=o�5�]�}N�(��Yȵ��A��Ĩ���E�l���ڤ��4bXU8���?X�Y���çC��r���4����]J�v���1]���2����ܭl��=�5`-��nE�I�T���N�[�ڟ  �geٲ�X{��q�2�Y�[j�e��������/Ow~���5Y5Z�Z$ Ƚ05�"M�]'\�g˦^ �U�O=A�Y�7j��H1U��̛��)�������&�g��.���T��k�L��8���7��Y��Q�O¨R�w*v���x�����lk�ssT	�>�NRm��|��Ilme�N�fHٸ��V:�tF��&��y�D3�hlbt+�wJ8�G��s����e�ZRA��Í�1v��7~@d_b���'�,G;ƐH��G؉�K�<��Q�����>̈́�sO�A#�a�P�ɔ[�^�Bi� )��
���kt5�׳K�6��~����:&\����z���z�z������������yw�sA�d�V0�`��K+oE�'��ؒL��e䳱M�6Y�:Fr�]j��!hsbO}�jf��,�R���m�����M�(h�a�_�>����%��ݶF��1���S;���'�F[M'���)
'��0����0!;`�/lZt����DtqT�I�ij�y���-cQ� ����\
s+�wXr���Q�;lp���Ь����Z<<�~{}z}��/��Q9�M� ���)W�ŵp�DP�S�QR��Ņ�Ew~��o\�A��%���Br7lly��͋�h>�]F5w�Z�}���y�24C�t#��tVoɹH����I3ӱ���=q�_�6-�$i�Yl��ѻ���kw���υkX��i��a׀��Q<�RN�?*Ws�9����Ʒ�W�,Y�Zi���d�G����*f�r�M��xR��n�O�8�n���?�Î�/�?��`���G_dS���_�$�w3����Ǡ���?̜��mD���'�ȸ���N.��EZ�,�_��cϾN�0�I<�)�Ml��R��m;O�@��xbV$��S&����J��/��jrf?��a�Le���'O������K}��,uS��L@�j��ʶ�8dS��U3SP�q�VT�7�=�-%ߩY�����cU�ˤLftkxYP����	_\���k}�jv�|��E�(��]t�cp�T]�*�E#�������;�A�mG�MSlx�#�����N����̓ɗ�#�EU'�F���d[�w1��d[<�W|y�ܽ����]�n	V��s���ע�=+����BosuӉ ���ru[	��ogp����wO������)s�p�[����K�	��2����~�v�����b��n��FJ�~�P��^�����&Z�"v䅻�"�Ur��n+T�k�368��_�[�8�H��0��1�veڮ8.B�e�2hl���G�<2�Z@�/�v��a��z�~r�c/B�,0c�%�Šo�6<` 򊏣QOL��P�5�V#~�.R`dK�JuR�Fz� �mf�4��E#����I��F֗1�Z��պ�[��k6�%,��![�f����y�ڮ-5n��8P�R�dz���	���Bw�z��gz���x���x"��k�f85�o�h)\oe�sh�&�E2��M��ۄ�mt���/�%�}�����;fhyx:�Z�녷E�Q����$ �,�rH��@Z��F�a��AP�@�+�+�ݖ��&A�"��_A �ag��]]�Z�Ha8���&��R6�����cGq�}@Y�l�dA��uc	��o��o�����#���bK�<����Eb��It<>��g5��SP>4�#y�����*��Y�ꉁc�,�y,�A7<2��ɪM�]��$��bO��2;;ꠅwd���O���c��f�D����E(sw�6^�1&u�I�c)}��ty~�9�,Ty�&$���y3��68�E���Y�=����Լ[�e
v��	�my@QL��ۉ�mtYB���[�I�b�0���n���d2$b�QcZ|�:��s��U\LNmwİ�Z�۝��GZ<�~3`��):r��5)��d�������h:��pH��%�{�H[��F�{ĸ��E�oD�O��1�����f�?ۂ�7�<�;r�]�x0��~���d�..�>On�������g�'�0?���rX�^u����$�'�=��lkӏ.ZJh�f�E�7t��.ƹ���z`����@`�/�#?��0:���h��00s�{0ed�d�i��˫�.�4�M̉��Q�eJ1c~��Ծ{��g_�����:�"}�,=�1U�6^�\M�9K�x�*ux��KE�G�A4DL22%�և0�d���~�2���6�T
������N���F���}�͗	\�;��ˈX�?�r��%b(�߲״g3[��&ON���1E�K��:n��cD��g�ƥ���*�����/�c��DԽ����v��حS�*�ö�������E����j�F�*SZY�2 C���9f�_P`t�W�Ե\�K����
�
���f��=Gn}�ʢZj��r�u�v��I��T�����"�/� �\6���x&�-u&�|)#F�������L1r|Dv��oq���Q;�O��\��5q����Q�嶇�E��,��!����8�+�we�$pG�mZd�ˤ;DNM��t�Ϯ��dC[��7aa���f�97�m�/�k�g&PX���\X��Y�����Օ�mP�VXn��GJ�Y�KB�6G��~S� `G���ւ�f��	j������`�$���k-�o�i���6� ZT�U�,���� j��Y+�c�Y
2��b���Ne�er���ԧ�"JKO유.��ٲf�6�.�E2_)$sGh9%w|p�Tӄ9Q���j�rǂ�uJ
@f����m
Sd��eo������&,?k=�>���V��>����$�{Ӂ�w	�m�Z�8�Q {[@���8��	}C;��|v������{�LI����!�Z�g�S��I�9�5S�	OV��&Q}Z'��X�W\��3�Ɲ����;�΢�M�}�Ҕ;iJ��~v����2rԺk)��ڠ�����4Wp�K�����	�7�ot¶��E�aF�h��U�t�/D��N�(�`On�E�q���m�/�v��Gl �{:q(���d�$h�J��#w�㮈��ד��W4F�̷d��;!ΰ*��+#]�Μ\�A��l$ыla��1!��e��`0a:^D2Y?���y��G�Up��;j�Pu���-ӿ����Ɛ�j�W"�h��N��M�� ^�?�-z|��V��:6-v{ʪڵ8����F�(��Rf����.{��0"��5����ר+�����?�1
2��+���43�����:�^���pt�(���m�[9���;u��C���%�'0p��iZ��������!�Q��N� �˘Ȍ�*���:v0Ephi�����y�ǈ�-���'A&9\�l��Mp���'�wCM��6Aj�����ڀJ�)j;I�-�(��ѕ�\�laŤv蕯v�c�F7ٵ��r��$xm�C,'(�U�Ud������8��P�5J�� `�N���eR��&��/��M�7���rq�"Km�a�Tԃ������F(�������FD���v)���9��3%N�9r���Ћy�`�B�V��ON��Cg���[Z"������e����%�ڊ������/I�����=iK��"_��L|gfX-�%Y�j��	]��)_믆Zr]i�z
L�u1��/�oބ
a.R��5�F҅�/S~s�|��;9Oa�����y:M��ɊM+���������zU�y���鵉]^��?�=1l��C��	�K�A׉4�'�V<��R��{U�+ѵ�/�]ΏN��Ȧ�Lc�� �.3T��؜�MB�E��Ao���j�W�;�    �&rʶHG^�����>`���Pj��y��OL�+sV)3(R�R��ͅ�5�f16
��R3�d�O��*���eoL5�0[��\⹤x����~&��)��a�V:?�t.����?����Oן>���NJ�G	5�8������xp�yO�����:���c��_qƖDò[d���%����Tj�|�*��(�d���S�Dv%<MM6�/�Y5�5�A��\�ה���mf
9���n+#��7����c�T�6�q��f!F���(�)H���*�!t�B�SB?2ܲ�gG�.��]���ot�4�o�$���д�3�
�}�Lxc[�7�q)��2���@\��{�~�A��������n���v]ճ�^��/{?��O�l�q�K�=0�=�0X2���A�ȑ�.|�(BE��Ͳ�y�%�%�^N8x�g�E��-�4f�E�+�׸�Dz��+4��䭬�8�°ڸ�D����� W�2�=�[�{k��G�濨(\�Cc-�@
{�����l]���pޚ���A*��|�e��NZ?�2^:��F2]�ꅊ��Y��xʮ5�L:���&M��p���VA��i6I	1�� ؄�'U��:�"�Zu瑌�<۶�αR��A_��*�mʘ��pEǶw`�Cg�^���%���LU�`7L�	ى%�;?zX�O�.�Vxe�>���p�+s�N>m��>�b�Tj�u�ѽw� �H����Y��� ��f�FDA&���>5���v�p��qtܙ����pX�la�3��6����@G��X��Otm���d�Z��	�?5#j�}��\�̳��^?�55тh���D~w�QS5#��*8D�[�E��m������St����ccb�i�bDe�Rρ(�������b
�,TE~���G5wG��:ؑ��-���p۩�=$�9$�]%�XjS��SV̛�ΰ��it��|Z��9�^�$q6�i��h����5g�y��
���B��oy�G��Z��s�/c��p�u~K����`�O�b�)(dӰD�2��d�f����C�?�����$ ������_�\R,��V$?�H��Ic��O)�
eܲ��O)��ٹ��*[���2��Ӥݻ���)���d+��R&0�{ME�*K���Ր��b�=������Z��4}�ܶ��P,O��i��t�*~Y~o��2�E���˖u�mM}3Վ�]5^��$����%5�����4:���x�����+���2�r��)�C�{PYv��xD�
�[p�c��XZ��������?,�_W��Zt`[-X`pn m%�ia��$�]�@P�,��k9a��i��24�Er��S�k�`+1 аּ�l`��s��/<�<��c�~��WqT#�5�@�:��� ���O�ķq�����e���8?�>��x���]����9Ao��h[��b4q�ַ�����s�8�b�F�MB~P�t:uHݽ.R��4��v43ʧa����onx�S�;�w� ���Dd�S8؃�L�'��h�o�]��דu�Z���izCx�.�!E��S�b����6HUx-Ui�N�/�l��Z&�zS�M��['�
	��kի�ױl7.K�V�-԰ao���@}/΂��k㌎{'�c�%`zq���{l$_h���	��|7(8N���V�P���@�񙳧�-\���GQ�>Re�J�h�;=��߈
�b��M��V�NQ�fSl\N��yP�6Sz��P�2��B��w��Rn*{:t,���4���Ý.-�{���8>��Q]�U�ù��|$�A/�C�ev]ռ$v/0ϡ+���t����[����\U�!d��j�����Ǯ��C�����H����ү�%����� R�.UlV1�T�)�ZF0%�P�A:�^i�;:*;4�R6�l�M�b�5�&��R�/]V�7�}�*��C0�����0�Sջ��/�w��(�U���x��&��X9�߆�JTM�i��PgG1�hL�͑k�[�OL���Pd�=��i������wA+[&��k�F�څ2�^��L�g`�_��Z��慚�m�K<~S7��$���<�b�l8&�b��9-�̆c��,��щ��d{�ӫ���3Fr���q~�N��B��8g�G\��i��.[��
K~�ݕ��Y���	-$O�M|c��-�q���lN��f�j����T�����/���������c�%��`�P�p���D���I6v�4�����i�,Ш?�J��Z���z�V{F<��d�G}��m����ɂ��Ӄؚ<렐��-bￅ�`��,ө����@:u�{`�a���ٞ�bC�{5�U�]����=uT�[�3�Z3�2]V;��dl&hX;�#^����s�'�J͡NMX��'��wU�_%e�^��`�㭓r-gi}݊��?�kct����S�I���^E��������)�|+ހ���@�.�O�FZP<�v��MH����$w���2�@cn�B���T�<gIj*a�� �|�T3mSeժf���_Y�/5�koj��/%q�xH|�Zl ��`�����&M/�����<��6�r���җw��ٙ�¬���E��z>�������ج8��~'mЖ����3�_�L�Z�n(�'�I�U6�R����_�y�W���r��Byy� G\��it��A�����χk��A�^��s�s����{yNp�r�Zp�0mMIM�ք��a[��w�e�� �5�1�nr=��+�̐ґ�33�A�qEnbx��g7����;;�Ͽ����~��濢��?L5K�����U ���R�>l z�!A�Æ�O�x>l`gK���L���M�L3D#���$�;�	�	���O0��	#�	۰�(�w/p;��jH
<�4J�����9e'<��4�zd���������h8�D�s����Q ��rH��eZ�bP�G5w�D7ItL`�)뎗3�R>:Q'	X�5�g�pj�zS��&|E?�H�+\ݲy�����3p澪E �h[�Y6r��y��O"�]���I��q�>^cN{?q�5ahǇ�gGlj9���4f9A��<Vҩ��*o��eU�صn�*���C:]�O^��n��@cҦ˟���-yRu��t��Ш�d==�
�]���'z��x��3C�3��c�Mj
�UH�d���4��/h����wq~M��٘�K	�E�$�>ώ~��)�s�`�wt�T7c�� w��J���\ԼM��!H4X��F{�y?Lر��i6�o�$l���Q�Zs7�B�*��թS��g:��C�1��!WgA\?VM����º4�aj;O�f�(B���݁J���X��8��.(�\+�wRv]ʮ�w�J^����kE�N��o6����Vx����k���O|C���5�
�]�{F��'e���d&��u��J�"��M.�㳥k��M�T13��&�����HWO�7(�~��gό���]���ż��+��ы��/�n����J�*ӇeZ!��%}�=��r�E�$����U�-^�$ ���M�8�Q�X&�dy��N�}�U���L�t�-���/4[��V��d���KK���H���rSN��[i��Һ�����~n9]�SN��VR?��.DR��mTZ����!3|r�b��̵ZV�T	�1�q�]"�h5�9b���K��IP����&�,r'��}�Q�΢?��ְ�׌��׉D��S(��f��2�P�ֹk�k�Y���
���	���`JNӥ�cw��SLH[l�1��b�&�CLiv)��pR+�w^�=�d�
�U�h�1K�eJ�|�ƥl9���բ�b�F�j�Ն���k�h���߸��Z[��r�����">�d�1%�+qSb��	4Ӭ���(w������Au�K����L-��ohᡠ-.ܸT�n�L�9yedG̞�2��s��Ec%r+�M�F���B�V����D�ACR���:a���@� ?��(k���-��j���%�����N�(�+��x�b4��""�ǈ���cvv�    M�M�KF��E�%��{Vm��F���72R]C�D���c��%������)�CK[�����3��ʤ�Uy�,��.�R���E�]���w:���u�P����y�Hj7�ſ���EEU�1 �͒�|}���ykI2Y���9�^;��bz�ڊ�o�e�V�c�g}��QX�c~?p#/��M�=�_��eZ;܎��|�vܫ&�vdY��N�Q��ɠa�o*���8��`'<���~����"H{�M� �rRt<��~5Om��Z�#���`x�uu�g�gr��Q��L��,�Z�"��B�jt�S�6���d�4pZ�b.S��2�&�+�����e︾�~b��ʉ�0O�5�w�\��ͩ����"��g�.�IA�3��{����cQ
D�ɿP�E��)�ЇIg��Ċˣ/͉O!�
3�ln�<ɫ�i~2�˯����,e�v��=��ƎP<l��������)H��ۉ&�id���,��fK}L+�0I�9 �Q@t�	DC��Ah��0t	������A�<���:
}�+|�OĀ84�C?t`=���e����W�ڿ�++M�x&��i�bZƋ����F�e�PiA��B��B߳��B��5���.�\n��q�����h��E�k\�>��6bC�5�V}�i�*��:�Џ��,+U��A��7wLp�Q-�o
�%am���!�=���7�)_=T�c���J�=�8��6�T�h�W�֨6L/�"1�(|UEI.3l��6�z��VA!�ǑѣVa�j��Ģ���cg�ڀ�ŀ�+CƻA�x�趔Zf�����,p�@ W�8B9�Oʖ�z^S�h�(����d����q�]�����Ɉ5��i�-��f�w�{}}�r��A&������{�kpk��'F1Q~����X�Z���	J�-����L1yP�!�������WC�Ï�>�vr'f� n�<��&=;�����Wp���g�Fz�؊0�i��V��.c�Q��A���
���v?L�3p�߽�lz���gQ�'{�V<?�xĂ�`�>1ۄ@�)e�TN����Z�e|����~�y�V����S�Z(�Pe��<�����=��R�*k�Xd�Fǔ���V�I��6��lh����E�]�����2�����%kB���\k���!����� Bz.f�T:R��aGt��ʤ�MV�Y�
O��9�k�l�)߂��|�4�l#�]�\%#�y`�֫ sS���l۷k�c[b�/*����E�5��x����1"��̆��ǖO�cGF�<UjM���4����P~��Y@{�����7﹯��V-���W��3��Q��c�u+���n�������V���`ƉH_�� ;�݉�@�ML�^8��]�pO�k��G�P��Z�Y�yC�F�S9|���X�9�6��zc�������(��2��a��7ta��lC���n�1[�>��7y�ڼ��ğ��-G"���9A~��u"�q�MB���������}I�fma+�����џL)�]$�R"jr��X�sVn�^�5��N�⋊�Z(��	�A9����3��];c]Gtk�-�S�[�d�(N����H�<�6;�S9{ϐ(y-C�Y��S���K�z�Bɛ��m�UR��RުO�~�@����%\������R텷BM�g�N�&�L��((��T��q����.䱐�xa(=Ĕ��5�gM���-J��1aEm#��t���2�i0z2�+6��E"�2��L���gde���D���f%Y�y4�Hj������F��E�.t9[��Uv% v"-,��s1��e4YM�G�&�!�a�a���6:?gnZ�K,�<���T�-�A�#�y�����}М�<-��*�A����&�g�L\v��H�^��-�������J^R��N�_9������&5!�KvX��0��V��Ŗ��>Wp��Ah�Nm�گ.~wy��ߟ`��o��c��� _��Vt����P���#���+רo
 �=��E����Ġva�݅��<��������K{j!ː����;݂��A��;z���d��	�����:,����5`��d��X���z����f���_BZP�q�Z77����37`�dE�,�A�x�%������%����z�|y�EY.[�<����H<��� Ĉ�#")R�.gjߠK��Ak��zDkoRY����'NYb-R��������s����N���Y��"�>��$�L.�0��~����iܗGDe�(؁�n��UB��Ѱ	"���T9�k�H;s�[�y���"�a{�O?�u�7�L��4X`��X []A��8��TP��,�X>����<[[-c�b���h
*�|Ų%�p|�u�#ΰ)��Or�I�y��
����+��$��-1GSv�S�E,�.4�A��>�����x��qrP�P���@�e�Ѝ����w��q��sN�K�G����&#�=�(��"�2��=�?.�����b�:��sՓ�eT��>\��^%����H=2G��Q�S��U�Z_u��v�@�p����wz��$�}"���Ѳ1�>OU��������j���_����*.��`��-Sw"Z��`��5݂�bjC��F�J�1�G�<�v�C���J$�Ƿ�+ۋp_�Fx�}-J�弚C�g�}FMm�� <����PH0%?����=ͺ7�����U�
6�5Y��q�\�ԞGǨe���Jb�	j)�b�&jL#,=M��ZX���t~�q':������s�՛ٔ&���7�C�-P������V���ǝ���ԍ߱]�/�o���g�;���aӏ����h��Y->Z����~�� ��/0���J�5U���e2�ߔ�fS�ZƋ��5�e��7��ݒ�D'�^[L>� �����o���[�R���G�=��J��*Lu��w�oE|bTv��z�Z�"m0vK0vep��w�;�.F���Slw�mzo	�>#���v�q�HH�ΪW[T��..�:�*��S6� �wQ͓�W�=�f�L�nP�����r�ě+UK2R[��Y �Ƌ,�4�Ύ>�O������^��f�
�L���Ө{�Х���EJP�,?k�ʻ����y="L��l�����1^m���tg.gjk�	J��F?A��W�J�?/Z%f �_i�Ԩ���@,�.��oa@�6��aa<�uY���V��#�� ;��lZ�ؒ�;ߜ��0��Z �I�n�+CQ6I���������R;
�~w����b3��f���rc{�G�N��d��X�	�(�y���������NC�ݦ0�������Rẓ*�|<M� �*��)��٫�:� Z�,����/���k�I#1�*��zj���Fn�ְ��/ d��\��Y����.q>V��($;��v3 ��-L�jy��p�9u�2�~*d��S!*R-�ղ\,���,�����:v_R!9�F�X alc� �e� �%����?y
W��H:Nr��ϳI���,��}���?D\e^�����d:�9j�6NR���D�h碇�TF��p�z���:�N�Ln�Q	3���c|�|���(�T��\յ��6�Vb�u�Z�%2�/�L@�1�ќ5��dd�?e�5)23��E���������X��q�@g�֦V^0M���NU�t�_��0���ɧ��[w�M~$�:SL���s��K��=	���nW������\�{S���ݮ��v}_p}�N�nw������5���t�vy����]�=�y��I��?�~Ƅˡ�f/�=���2I$뱖�D�t\�۽5	�䶩X��j����Qi����xy�� gc�����<�0s+�������C�����A���vjc�O:�@�����oi����O���1�h�O�l�����$hh����Y��$޺�Q(�S�a��h�˘��m�$�Ǟ!��8U�PM�Dv�rͪ����0���J4fO�"5]A�EH*�	&д��f�DEדaJ�9��U}	��4����yY^t{k~��б�e���	I�*�,�	    �й��D�:��'5٣�O��K�_�r�C��{%�44 ;��M��Jyn�٘Y>Y�kOѮ'pj����v�����ߒXh��ˢ�n�+����3g�S�T6N̕��F���5�l��V��ޙ:����T���C.��I<߷����]���"G$���a�(�;�Y��\�JS���t%K������;�J�¶.y9�bӧ��t��>(�Ţ�.|6��\�I��f�"��]B�k|aH���=5��t��_[�_f�NPR'C4��Na:jZ֯S�s�x�N~g��IF��oM�bM�ajUў�[���
K����L��;�pw4���W��	 ��q)�8�n�1s�$���
�	⨃B�ة@5)>��ӣ�à�"�C��x#�͵�_�	7hK��

c�v.K�Z��E+~�o�����rWR���e��,�K.{+�v����^��G��y���x�%�K!k�Rߋ:E�X��"=���j�}��>����hc~-jVnH8�#��Q�`����-��\I�k�W�4"��B��#�FV�J��JH(�45�l�IO�3wg7�P�lԫYf1	�Z��h-�.���/;��^�$�#��a�����p��ܗ�]�s��,C�9W=O�<tW�1��C��˱��-?A��g,A��}b� ���_Ժ���?Y�g��2��⪓k��f��/N5���c{-�#[ �b������*�K>+K(���ɔg�d����i�@�w���iu����Y�}��H�S[�#��n���v \~K�A�_�,�[��ž������C�[��s(s_6rqj��m5�:�e���%ǁ��!���w�����,-��{H��hu�'�I��8�����M��}bV�6�?� !:��J���=����
���7��N��E�nW�N*����kK=2y��]d�S �lj��BnL
���8CZ�(p�������Q������ә3O���̝s;�tD0P6*n ��c�d��JA1�F�� �m������PKd�&�/T��$�Rkk9�hr���*�:�*ԗw�k��b�M�
��h�������)��G={L/�d�<׊�y�V�g��/+o|,���i5s�y_;k�S>w$.�4�	CX�q���Cz܁�l�5��1G����n��� O8ȷ��v#�Ώ�p�>�"�`�� ,�]�<���dG�5㽦'c�J����#9Ã���T:����ɁZJ�H�1������= �~#c]� �w��Ҝ��B�@^��WIt�殤:v�b$�����T��M��6����lf����u]�=�g�NG�,�Pÿu��_Ҽq��|Yԝy	6�������2��J��"�dΜ���z��ޮ��M/hX�r2���ù�t�a)_��c�e��Z�WI^ԣ��#s��9z-i������;�ȵ�twcw��cל����#�.�Sq���sC7����0ߵ�r�ڲ����C���d�9�ү�a�T)���f����Rt��|��G�mLH[|ֳ4ԟ�_kJ�_��[<���M>�q�xh��1��2x�0��@��hwZT|�W��q�
�ec�C�MD �[�f�j9^�:@��["CZI^6)�b��(����k̂�4	�{#�bt�B��K�Z��Lٕ�Ի;�	������x�q\�a���n��L)��'b�
�%d��^}�'�8l폙����W� zQ�%*AXi���H�ߠ9-s����
�"m=�����1��ՙ��T�4�ĺ��8���݀�#
�����V�ғ�nqC��u�n<z �鎞��*n\V`84�-a��d�+A>�tq�,O���0g��.�������O�����^�."��O��j����������ҹ��Dl��5s[�A8b�z�Hk�n�Y�U�C�G�8$����Gı9؁��ؖtsd���Ƒ����h�dr���WM�8��4�j,��+�,�,��X�H�s�8<��mPV���1�P����w>�����W?����g2����m�{_���H����;�5����Ux8�r2��w�M�-V$���f�P����7�nV����(%E�Q�]~�y��Z��L��j�ȂLN�U�ޟ�i��p��Gj��!t>q5�hqy��B�s@xڨ52B���U�0�_�h��/0��(�ќ��fl\���������2�-�G���MKoE�<���UKRL�l�2�Ȍh�����o���j�ZE,�U%��߹�΅���]�����	ې��Z�p���\�yߡ����Vi�=�ᶉۤ�ݺu�F�M�\��ѡ���X�G�vm�[��L��<�d�5$x��e�G�֗����E�*l��Qu�����G�m�n_��dw�HrlT��U�z���������D=�_WZ�����@�V�
�aض�^c1��"���,�q�:�o&+E-sCE���?�_?r?	��a�n$���F@����`�Ov~�4E n�4�!1�.�%���6(�x�/��+h��	a�rק	����_��O�7=��g�6l��X��٧��l�����w�W��M�[�ɱ����?�b�o��|ol%��t��1>d���Y�������U�G���D���]�;F������WO���C�8r�;F95���J�2)p��T�+@��Hȩ]�E����"���A��o�G�/_}��;�	���V��-�2�����u�H�2n<�_�	HA�n^2K��F�G�o��넸��h��:�y6K�s��ak���d�j��|Ej�hjY�]=Z����E��X�ˇ��҂��������m����_��d�f�ό�'f�/��)f�D(X-�d�{r�za6h).�����{t�ޙ����Ҍ��,F2I�\H���-/_�=��|�{����b\�R�؛L��K���Y�b��i��_���2t0右y�$���cdj��?(�G5W��Z>�21ޕ���I���X��j�j�ʬn�z�@�g�m
Y�g|YMN@r-�������Q�߽�Y?!�M��?�)ὕ����'`��3lq�<��{�H%��cˆi*�I�T�tb��#���yzZ���C�b�Y�Gff�)�6���O\?�-uJ���og�FL��ڀ��� i����ԭ�9.����T���Qi���1>$�pUz���[�+��X�\whZGD�龸�J��l6]w`X�j��a;\#��\r܁e`�O?���/O�[�A���.\�oCF�Q��T�+�Ic2����$_�%Q���c�x�W~N�\��Ƭ�§��>���8c�����{+�~�������f!�}z�(ggvB�M�P�	Q��j�C1%m7s��ԣ֋9�`���0����b�{�D6�m�9�f�Z��������z�]���4O4`�-e O��kk���ͅ؝j6,�q;y1��<�$��K=}5f�R&�?qn�yp6+S����5�Yd�.���"6'3^�NE���e���V�I:�e���]�]��iG�b���,�����<�7�Hb-)�����V�0="`ch�e��&���Ԝ�U����l��
RO����j�k�a���^&�=�F���z$W+K��	�Yb��U�eV.H��H�]��]s�ʚ]}����)����.���u�܇��`�h�@^}���@�;JU2Y��BCs�e��<q!UP:2��J�f��5� e�Y��٣U��(���N����y��8?['���e-E�"�,Z�$f-��!�f���;X�f����]4=��׏4`S�U�锇��Ր3>�/&��wD|����?�1�m�2v��hla!�oe��������|#�����l��c%ΨFC�ڭ���x1�;�ޔ���)��,6<���<�c��}���{Mpq)�elg���r�]i!��?������f�شF(:D�-\�@��{pМ��m}��Mi�&_ˠہF�^���`1&����xFf�Ԁ�Y�Lw;����{P��Z�������s/���P�rA�$nj��v�D�w4�6m�$�5    ,��
jzx�Jx(HGi�ķ���P5f�u 	RKj^��Ý�d�5Υ�1�z]]�:�Gˆ��[e�2BRu��Dx�=_~���8]_~'���9Y%�٧91���D��t�8��ʅ��A�+)�ߣAcmM?zj����ٵ�Zee�ϖƪ���D��>j�ԙ�|�ܕ�S	( ��,cK�I�޶������qD<2!S�~%sO��`�Xh�_��<�]�������Qlj�L����t�sװ8W����̋��\�4mW8������f�Q�r9�^̚B�XS�$A�B\�E:si���:rF��:oMpc���n��6�k���HѼ��(��J���B׬Ja���+�$:>l�`s	��(r��MQ[k��`X���Jך��á`�X%E�H�2��<99Oa����8+x�%f�DNj�ɔ�~�8�
TȢG���@�,��m�}e������r�˥F� 2%b܄	�ˋu�ے���[�K1$�2�T&ǩR'�k��ݏ>�{��̂.���l�*��l_jo$�^Z�(�$pbnG;��"'��4�-��'b]6�W�p`�U�d�XZ��5�|����]0�jB��`��hc�ˈBm�sd���].���G�|.�ɳ
�t��(M���3��@UE%��1��TApY�����U>osi8ٹ��j�I�3/�U{�/�:&=�W�ܠ,E��GĠ\l���#� ����f5W��V������'���)�F�B�B/T؏6�*�"����JE�R��ս�3��r�i�gբֹyD\�����}p��b����`ga8پ(����aIsGK"�X��S����*H�,Vgv;�}83fPYշW9����B�_�~�k�o%ܕ�����Z8Џ.��l�7��.OO/��j)^į�D������#��Y��%*<Dq%�UMI�N��� �n��Z{y��<S�4�B�ÂzyG��&_e�EMT���I��`���/��8L9;���6y�!Tn$�s`��\���a�����h�h�F��ǀ�{��y&��-˘�{D�����Y�`�2j����4m�7�[{L#�VR�Y�G��K������P�t�=d8����	{�����7,��m.�';�8֍���.�G�����h'�Eƿ8�;�)����e�h*�POR�g�6��e�նG�BZb��������Ƹmq���Y�q����2eeRu/S	p�5�7,�1�!j�AXu���i�v��	���؜�/�ؒ�Wr��/@�:`����R�H�|��+~�w�afQ}G5��A�EZ�7���c��|4�1�t_~}��EO�\�K��%��=1f
��|þ{�o�;K0ޙ�0C��H6��U�V�5�	��Рmq:d�Y�G��ъ���_�`�f��fF �˒��*���*�,}Vl�v��u���UT�獣��T���YѼ<i��ثbU���wQbj���g�h.r+�k�O��=���)AjH�Z�o;���j���ƶ��/:��I�Su��)�jK����q�aMw���I`Oep�p���o|r&(��b_{�>����N�n�V,��/��5(a��b�# �v��[��-��S�3"� ?�	�8;��6�W��C��Oi-/1�6�uq�*_	�����ߑ.���@n_��?f�*F�7�C�� �^��?��=��-s�[%Im9:ڇ%���u�^�{�G�[�5��"9N-\�\r:B"y,\�Ε�����5�]Ben��-������^ ��
���j���,��d?�9����v~+��mbӍV�$�	�#V��o���D�>q������w^3�9)N�щ�/�ы�M9GiKyf<2I�
`�q��/75g�&��e��h��%�k
=/9�2�﹎˴>����3jy�b���G��σ�x?��.;�UE\�k�*���V���n�aq{�c�H����2�W47*���B�>8fR�������YZ�T2�[d�'����<�6@;p���k�L�ۿ� sDC�FDl�k�6�mL��/(;�0�F��o�*�?Մx��3���MH�%Fn�X��W���}���'5��n9��p�����M�&�=[����5��Z��y#��ĝ��yl߲wD�u�p��!��E��۔eNw��.p��S�1;Y%?���U��\����U7�CB4��	$��u5���LV@)�T�2�ʩA_Q|���F����s.UII��2Io�!W��X�~Ɣv�R��"v��n�K��k��[�o*�RRA�|[Ĺ�?��O�6�)��
u�U�F:���9߼O��o|L:�3����w ��T3{O䯋�e�m:V��k`ݳ�oK�}��Nau���+n%�T,�y�|M�h W�-�Xq�UA��&��qF� ���^f�z����(�!	��|[�3$��JqV���ZE�PZ%��),._��������C�{��"��P�9�E�<1�(�ֆ
>�t�#����嬱X��*<?�y�����,��ڨ�Ս���)-y��8Q���V�����&���jod t�^��ݼ��3�51�a�2IN���Ð���9��S�p4��g<�2���Y���H�e�~��f�j�k/�lg��������R��UQ�W"�&�� ��h���gmՒ��h��T{"��x�^���K�������y�D�YΔ2'C�ľ�c�b@��<� )JSg֙���Ԑ^ȃSX�)3��)g8}�=�1d}�'��p���ݥ�d8@�s�TR�B���d����X�LQN</m��F:ZM#��1�Ʈ�.Wi̴+�E��>ֹ
&�E��Գ=�����:��jW{*��������;:��߻�o���I@�S�,�d3��N��(S愅�,(Q�(t��Q�	�|\��ղ��� ��r�{����jfu��"��p:@�N���yy��1�<����B��v%�B�OILGb���?�CB*6j��ς�H�Q�x\�����:�Bc	��W�r�����rnLo.}2ZY垿�)��,�^�5wK^X%��B��V�b���2^7Ȉ�¢���e]�q�ZɽY��43H�۫f˷��A0��_Up��:6c��%�t�rg�e�q�)9��ܙ��rd4��;3,���̝xz���Ǐ˳�t�^A$�wVz#�Z	��RGF��M�y?��.��v�����?�/C|}f:7��BF������Į���!.Z3��>��h�rO�GrF9���0��k@ utHXk� �?�G�XD:X&X���yG:`.`��&�	�`x������e��Wa�O�m��wj���X�:{�hbX���z�Q��_�IQ2MZ�R�Xፚ"�����	(}�<�p��� ��`ϳ/�px삮��l.k�!;����w��Dl�zݐ���u�/le\���X�UB�L<.+��6�y �1'��r���u�f�-�IK����F����1�Ȕ6�f�-�i��|v�F���P�%{@�eݪ�xn1{��o3���$�s9ԸE~���b�,��km���׾?Vd#��\��b���i���!�J���%�L �����57�鬏7���h<�z_*	
Rl.Ȑ4�=�QX��&V[ �4��pHp��Kf��i��.���Y�B���P������O��>��x(��~�K��t����Eȏ��3N�G&]��$\Jq%�R֞U��fqʔ�J�{!���';	/
�'��
l�{���MY��|!�&�*�7
���c�`P�Q ���?�S�l !�7�}B�L�x!Kc�����[P> ���<;-��A|3ć�D�Y��� ���MF�S<ҟ����|W����4bUᯑ�'�伢:�!.�*��Ua�����B�~�{�����H�9�&VbBL&��I�kkP	��� ���7'�_����e�}^�~�w�$�TT2��$��$����`��t?p_C�)]��	SO���f\�f�ֻ溞w���L&;ϱ�+qjZ:H���f,Zcv3\�������$]]44���Z"\�q�qy�����*��k�F�e�x0�h�,    ��*��� %��Gr	����8^�UJ���X �昌�Ge%�`C��>�4�S�A�=9�
hZj^�@*�1�'HR7�E��dC�X[^�T���:��=�Vd�7Q�y���ac����7e��T�x�^�Ҁz��v���☲�5��~wx������ۃjxiH����l���}9�˦�h���9B�fo�I���ÄI�e�����Đ���T
c�"�m=~/_�m�Q=�����L��T�OFj��L O*�b�R<��K�.ߋ�&k�������^�+�*�vY�Y�|������Ұ	��@��ƕ����u�U�
Ho(�=�s�����y�)��np����i;u6*�JK}�l�PW?��R�}�~4%h��u'���	�,ԠN��-�Gb1�;�#g���+a���?yC�2fD)�jb�x��n�7����]\J3��<^/�ڕ��v�iݰݙar��J��3�ᰝ�j��P��*'=J�$1\U!dw��R�5�B�P� ���G�O��������{#�4��X�c��(,[�Y���� O��6�HC�v��9"tq��f�q��~�aV�}]�{(���sNp���>y�:��1����p����I��G)-�GU9�{h�h�(�����d�L��1�;s�4L�)�<�z��Bu��C���:脩�[:p�@���Wkm_�q�U�����s
6�{uӯ�~����p����u������r61�u���}���#�p�.#~ 3�y���d���	���3�j1&���4M ��av�H�/�Xm"z��Ĕ9���EY���K}@=Z$'���^����e:wo�8Ʋ���� Kg�L����n�t��ں8��9���Ϳ_j�r��E�����_j"�~������^��t�pk,����@���65I����B
�X�#q�JE1�!���qs".)!CǛ�g"��{�|���A���(��D���~/zM�0u�OȪ�.32&���`g2�^�ˏd��y���?�y�����*�2����/�������Pxå,F��dY�w>�RB@wG�;.'S����ѧ�1G�%CAv.իo���w#��^�=ᥑ�^�Y��C��}��hD�ڮ�0@�j5�?`�&�p�K���6�Ve��B��Eu�W9�{)'�lύ�g:/�q�~~���"�V�&O.͛_�^�r�&U_���LiI&��)���2�G��ي�|����U���I�Zr�?e_[�������gk����=m��݃n��m�}܃�U+��O]��KW��	���Cv��q�]�96�¦�|2?��	�cBX�� ��BI�:[.i^�Am�ծ�j|TCU6n{+�
1Q3V��o�.�3��)�q?�����y	�*^�0�._������2>W����,'���˘�le�?0d&D��~`�L�	�h�?0X`׍�	���3׹��{�'3F���>@�*��������PaZţ���DyP�ELɼ�n�����t������F�ɻ y��=��3�����];`�Z���Ů�x���f�ce�9^�"�H�շ�� \��{�|�O �W0��A��e&���PS�3�3&״������XV�o�L��̒e^����5E?V���A��ډj0���K'�#>�o�b�����%
֕Z�l����`�F���	]�SPP����$���OQ �u���n�,��,��j}�5�ib$�)�.�����.���ѩ,QɁ��L��o�G�k�A^�G�y?��N�
d�F�_Q���6��e�R�p���!Y`�VLwQTT�$���HY`&�CB��Lwp�|p�w�O���>&�M�����&M���)�n�>tx�|x�t��z���18��ґ�^_C�8Y�~�ҡ�jy�����'�Vފ���L8;Q5n�d��Q.)���Rڈd��x������!F��6 P[g��7$�:��9�3J^B͎��1^��F�����:t6�9":���ç��է���4@�1�,�3���Խ�U��i<�����n����	X�����T�ɲ=����K3��t�W^:�%�і ��0W�Y9�K�5���YC���W���\�u�`-���:él�]���N�������s���P��ο9�Ly4�9K�pz���U��V~]Ji�d"����� s*z^=�[HT���?�~��i�9�k._�� �u�#!F#_�Y_{'���m%���Mp�i�f��dp ʁ��]2�]�E��c%�����Ƀk�d�49ZE�.A<�6��j�C�L�"���x�ϐ�-���kh:]�<ϔ��(�S$_F���t1=�}`攌,A#o�Q�������U9�vRa�sn`�<{�2"/�iC3�D\�IT�G�������0�z���yv��y����U��1x%������u澚�2,���t)����iNdߟn�>T�椐
�&S�΍Tu�fT�L�������c�x��bf���n������r�O˛)H�Ccc�������KQ���"Y/���<˃[�j����a2uy�2w}��!�9.�!����Z��Ma��6�ƒ1�F՗���sQT_���^��$/OЭ,�Y�$�2=Ujar��N�i���'��,�q��9yٿu�6��!G�E���;8rG�Va�n���؍��.c�,����m�Q���Qu�u�6xc^��O7twp��k���5�v��b�Zq]*�HD�M+MwT�:��%h��:�N����"-� �;3R��x��z�*Ԭ�L?�.���u�ЁtaD:`U��!�P���ֱk �J!�Enj��I����̫R!�{��$�3�X_���1,S�V\��ȼՑ��ȴ�w��V��Z0���ݰ��aA c2s��q�[9���`\��K��0T��?����r��O�E٢��(�������,�P/N��	�R����|��<9�_Sk�T2D�$�	x]/���X�@�FT%<�{�z�!�XvC�
���<��\Elpy�$l��}�Cwġۤ�������W1�t#������N��]%cR1��7�×�	Rj�ĵ�[{��_�)E%���r�⪝?2++O�5B���-A��a�OI��<����r|&��wH1������Fp˷ʐ��=oj'������.XO ��1��!߃�A^�n�� �a��kVBU��r#����x�q/�	A�%�i/2/�ie��
�±��	��㦅����+V!P�7_���Vo<��Q1�uL{ŉ���b�·O������>�`�-!��8���*�Q.�R�d<���l��_�)�o͜���%��'��Y�����4g�w���V�}��m�� r0ڂ��?2�Ͻ�(�,Ǐ������a����Q� T)����;�����0�ˋzAc"%���ч�ᇣ�h,�M�/X���B�Y�����Uʢ%�H� _�w8ю8���8�i�L�|�m,�鵻,�m��6cjZO��Z)]��+��]%�F�JU͕��J]\���1Od��_����p��XM������E�J+s�TkIֹ�!:?��.@��˱��q��_��	*|sV��/d����ѐ(�����`�}�a؀�������=l復@��R��:Jm�O���U�%�@?��Am�r�v�9�RЀ�|���8	�8�E?�>���@�u�)Q؂���O ژm�;
�th ���(�:j��a�G�C(4�.X,%t$�OFða։p�䛰(Ǽ[������
2V�������؀cG�c;����x@P��)b���qx�DӳtN/O�BtBO�����+:-�zD���i���c�%N ��;�?ն9�f�0���q��"d�����M;��-J}:� טJ0��띔��'l}��xG[>e�[|�;��}Uj��ц��[�m��6��lw��G�T�n!�f�'�j�y��d�Ʒy�w��#6~'���_O�6���6~R���������ǻ�M���I����3v;��nvz��-y^�����    m��LL����7��"��=��1A�J����bzc�w���Jb�T�:D��1ק��t���寇����`�')H�x�}��<�\N$_�y)pp�>�i�$��1�o �H�r?A��=m'I`�oI&��F������MN	��!҇\{�cO)�e�'�LE�#�%٥H����3�, :Mָ��/Kw'�)�lpLh$$ϗb�T�F�K�m���	h$�ǽ���-�������S��=��;ߚI|�8���T6����7W/���C��`���s�����s���D�YD���Lّ�肋eF�E��������F`
<ͩZ����ڏ�g����h��z�@cm���gPH�?��bMݯ�O�%-�� 	�6v�}FaD��b�s�a�<��ۘh��Qaya��8Y��Q�o��(��r�¥���}���q
)X5{a�.V���秏��tГ�[�'�7a��n����ۺ)[��w�i�m�4���W��T���^�3Oי�J;^fK4��yj�s�jh�F���׺(_����c��?�Eҫ.��#�� M�:Ɛ�;8j������ S���ҭRӶ�(��]�.��H�xĬb�~�S�_0Q���)��	�&�_O�]up;��JD:�]�Q���mo��w��GlzÌ�������",L��"�l�m�'�܋��o��=����S�'��V1j�Y1jש׼y>]S�OdY#�Xp��S��.[����+��P�Z��!G��`�_&,����L�c!��V�c1A�n��h��H���֛'����<��dYéN鼒bReZ?��;O���d���(__A�/0*�<ʁ�2Mf%����N�\���c�21�K�jǁ1�cr��ڶ�1G*!�U�E���8��ey�K?/u�sP����v��m}�#W�����o(�~PiB�>[C�<_�k&�e�װ����G��4�]v��ȅRE�E���+�c����(M�R���A������#$6��-�D��SE������T$��Xe<6��$O����YUO`�w��>�,6n�,w�;�-e`	��`W[�=+������8�G�Li鶻'��;6���'�3e�V��x8 ���GɞE�gi*z<�Pʆ���m`<$��I8��@Nӝ��cMOİH��Ž�p��9�3d�JN���<]�n�BZ��-M����88Ј�
��򏬇ݪ�R�6��
��J�ʔ�⍸"'B���De�o�]��{���E�?�'�t8n��86e)t8n�#�I������]={��:>o|g�D�֍��*7}qtlTI�;�-g�Az�-��[�����
n���Te!TZD\:xI�	���1�z�9&=�tz������	]9�
R�[^�ׄx5�muHRS"�(��aeX��6�p)R��i��+� Egd[�fX� ��	@�@%��Ѓ�f�+%����`�n�A������._G����X+dOve�'���x����4��E�D��6�7H��D��8����f���r9�^�n��Tsila%�T��������:?�1^�Ռj��s��*���8��,��	&hU!���t*����I&�F)���I_b"�[�Fy}Ņ�@x W�5���W@~ʁ���d���casFp	u�y,N6���!ְ�e%]h�a�o��j.Yگ��@R�����X��B'��e�����Ƴ�{���G����"�f�[v^Ĺ�*Z�]����`2���tv�5�����jd���"l����`�1�ܟ'�q�v��\�C��vܝ"�k6IO/��)���W�i4�[��U�G=Q!7="�9W�[�'~���g��#NY٦|����o���&���]���9��r���ޚ�.���W��Z;�$.xC>�ڱ��S�l�J�b03Rǟʾ�������?��T�:��/�������fX�7+�j�G��I{�9���f+�7�Qe��"�ɬԛ�+�Y����J�}� \'�U�걌��o��V�0���5����>^�Q�ۣ�$�RfلF��ʒA��3��"�m\��B��yլ�G�Cw4�}B�m�S���jϔ�kV��/�E�<i�S�; f�U�I���h^����굖��^�ʞ*F�~
Џ#�PܴR��}�'���:� �ޒ��*(�\���X���Q�\v����������jb4�T���O	H<1r�J��ՎO�FU��5!o|I�1����봧e��>}!���7�,�n�Do#�إ����z�m4�L>���<�~t��k�>0�-24:o�PW1��k�^�S^�G�"�|l4��|b5H�o�������xH1�z�E��6�Oġ�}����_?��&N�����b����ۿd�Ƒ�Գ����^};�X0�^��}Ҭ��rSު��eqq�Q���nГ�}�fb�i���Nc`�M��[��t�����(�4.$�4w�Α��ɨ8�L�%�:�NȗW��ɡG���#��}k�"���k�� Gz�8o6����=7>U�wwbp����o2B�1����GM vt��E8j����[�SV� �&��q�9rܘ�Re5���7��܂��L�\�Ǯ��YaW�.ƿL���<[�g����4f�a���!��t)menq�|�}�̋���=󴊸\es�f��Θ�#1���1l
-u�ݎLȃ�0��k��gEQ�]ہu�e
Pq�`��)u�f�X`e��ڎ�^�L<a[(�Ez��]�I�`�q�3�[���j$�p�J_e��n?h���܅F �l"��無��įe"Z9�^��*�kA�#ºEt�C�͐�� ��`}CX�Մm��u��!����35���͙)��P�1[�L}J� {)/�����:����D��$���Z�K���v�Xk��I�kbeF3�H\#�G>�EL�߃`7�F�^4z$�U�E�ק1���\�w*�@JGpjL�|�M�QK��GiJ���<D��ؚr<H�9������h��_�Y�F�e�/����v�a���5T�K+�fs�=f�;G��6N#s'O�vKl���W���y�``=�xBB"Ҽ<OP�\eaƽ=��C��7��	_W�l����t0��h�<G��Sa8O2��`�F,��2^���a6��|�.�ۅ&�2��yE��ne�81>{����r��Fc�<#_-��Q�]��NF"�rx�{�D��x��8��C�|�Aےh>b�=��v��{�ð9�(��w1H���B�lǚ|1�����y�Sua<egQdg}o��j�A̫f�p��+�#U�I�T2��Iq��On�6f�\��g�C��*��p`���ޘ�K����	�V�b՘Lߡ4:$J-��N#����I-���e���J<Y#q.�-�w�DĹp;9x=�.�uTu���;y�LD[e�^y�w��q��j�Q�c�O�> ���$���7�4�]c��3ItU�J�Ė�g��Gk����Q���c�Kx�#�m��U�P~Q�&V�k����v��,��1�=����P��W�w����h�,L�����y��N��g#E#�����5�x11��Oç�&B��)NA���kV8n�SOZj�{��M�`o��L�<[
l�����'[ܲ�Y�a�X�ư�kw�XWyEq[/_�o1��u.��)��]pM��,��c�LYCb�����0zTK���Y�h��	;[*�N�����7
q�Z���ӆ�$�s��7������Z'���nu���c ���;�����Wo�?]x��D����Ko��� <J�4UP^��.R�%V_EZ�}V"O��D�_8����{Eo1�������䯊�dUOʣ�V#�f��<�U7��W�12> �ۥ�w�n��!QmKz���O�4�m��}�R~�L\��#5����݊�āE�*���{L#� ���\�<��j0�X��KG��O��(�	r����Z�>�k�U��9��VH�X�'�¾տV�����ŕEr�ݑ"�e��P+�OE��!�P�s���YC�ë�אx5F�;�j�����w\5�Ƅ�%�ì �  �ل���ot��0����mUX�}�]������5�)�;�j�*z�`5��hq�;�B̦�l��w�ՀS��ى� �A�ACjD�W/u	Z�$:�j��SА.��U�K��ĉ�b�|��'ɚ�z����3�kro!
��!�@{�H[�#�u�&�t�����h�m^�g���.��E�U��]��P����U<?���,c���M�Z���8�'(X/�5�}0��.��(��OJe[}����{�v߮�rG�=b�o�>��m�Iz��0�[.�A,�s3^�o�Kf�TR�̍�J���n��.T	J�Eb����V��O�u�5,u'���h�9H���������lAQ)i}
5(�Tj��U�/Vr	d�RG/K-�4F�t��S=eG�=��H��w.������#�'��we��l�BY�	�-ܷ�+��q�ʫo���B3)��+V�$����A��%��氞�W?d�H�g���^;&��SoۻJ�T
��{�8��]�FxD���,�#LxEVT}�_$�193Pn��L5��K��Zq���s�����V��'ː|G\%��� �ּ���qjN�{� ��tk߃I��aa��d���j<Q#����8}u�����!	�v���]��WE??�˳4Y�~ �t�=���s�E������Wߔ��Q	���\�w�b�G��|�~O���������iU�))$�,�9j��,/?�lتs�ob�4�B]�:� (��� VDՅ�">?[��+���c\�������<F�<��|��4�n�@�S��\���d��RݿjYg�}< �1�xϱɒu���Ա���>�q\΂"��z�y�W�RX������)�k.\8��)4���E�������;��{�4�����n8��p�s8ZSкy[r�i�p�F�m��!Gc��nH�֐�Ҝk֍�[��ǣ=RЍ���!Gd��D7(okPF��H7"okD��2i�t#�FD����N7"okD�[�.\Ս��uڷ�I��m���ۦ<w���E����nD�ֈ���zy��[�#8𓍌���۸L�߻�o�����9v�@���
J��ڗ@���"��s
iɂJ6 �؃NeZ����:	�$���w���'�ͤ�Ȣ���G�� ��M'���_�r�|��L� �z���'W����痯�1q5UkL�%���̮t���eAԇD}3������~���Jp��(�AW n��ų�]E�gJ�q�&
�&ж���8����*ǸvP/z�7�(d�
��Yݹ� ��}<V�,~y�+�ԧ#&Ϻl�}�z���|�������o�溟]���MJ����6כ�	�g�������sX�-eZ�8? ⱪ�avJ��(���8�����	L.$�/�e�1/#�>�<�3�Xg/IJ��WİQ��
1��WC$gOG�mΟ�s���!�9r�9 ��l�FF�}���\@�S���Q�����k܋�	��0y{_ʯ�e�����@����a�G�
�k� ���G�W�t&���G�3��r��c}:b�ZO�w�W�{�| �c]��k��߱N��u��ߘ�z��]1��M���mˀ���$��S�c�.��C��z�dU����6�\�#(���v�.�-��|����t�e�h�"Y*xp��KPd��U���Է����_%v�kص��t�����;o���#��-L�qraV�S`����9���Q�H�Z&�f�#�����xd�8�2�Tr��(���dѣ�}~�}�;r��<��Et�?�sh�^F���&�kR�#*S�Z�c��, -��L�ob)�L�=ҁ�d^@8�Ц	7Oҙ�o_桥^}J��z��|u�g�
h�B�ʵ���nv �R�ikR�)��Y��X�7\�VX��u5�.n3
�� :S��x��V�R�-�Nٖ!۲E:��iΈ�iKDy;mW�4�`�������~����:s�      �      x��]͏��?��� ��)��gƻ/������������iZ����Mm� �����k�����@|����?����*�?�I�|�g����R7Y��b�X�";^����������x*����{���m��(��?rl��'�%��͸�"�S.�l*|N��%�z�|1����WS�.gl&�D�c>U�񹐁�/�&�H�f���P�����d�t"���g1_�Z>g����V��0Z���;��{m���V����@����P��r_F@�f2�^	tH����]_\������b���YN�L�l s����,7��?6�L�Uʳ�̬~b�v�i�(@rh.X�m|�>�z���DҀT��;:�T��(�D�93�%��L,�7��6�h�� 㳋�R�������t$� �R���ʸ2~����f�^)��w_p_�#�c��$���(��� ��`7������t	x�zq�)�o�R$�'�@�DM�<jZ��3 Q"�'����˼M�2��%B-�'�y�t�5Ρ/N]�F˻��9 ��6�0/b��QA�ؠ�H���-�(�b)�A��Eb��B_�DL_�&6�(`~�ؗl�!���৿���� #U���d�%�@��Z>%�ϱ׃14�>���T�'s.��|.�Ff�"�B'5!yU<Ui�&�~�M�|1���
 ���W��P1RA~��ܸ�h6h�vD?�זD� �y�w
��o̬(2��`�w�r���X�a��W�5P��H��E`�� ����5:��O���m����Q��^>�|��Ba��✌�|����ţ���n2���=N��)"�1~�9)�u7)Y����i�"�����Bk�U
�B8gԢS���Ӎ���5��%�q��^D>y
�}�D�B'����qn.5��N�/̾����$cܰ�&G��I�"�up
�9�Ѭ�S2�t�� '(�Ck�w���0J��MS	����^�"�11�I��������li�ۜN;m�Q�Yf<{Sp��g��W��JM'#¶����q�`�<��H��@�vĂ��_Bh;�0�6�WN�������T01~( /�L"�}�CċH*���ac@���D�8jp��r�yby�t>����L��M�ղ����uE��@��p8����q�}zybM'����U@��g��;F�:D�"���s�b`Ͱ|�~[�]hV�����_�	Ǚ3Pлoh".��s�7�����݇܌�)���C�.<0V�7�i��Ԥo�"	s��J���ǀY�;��)4"��ڂ��P�%�g�x��T.J�z$�N$��rW})狠��;�T��5[zؖ�/t���q�x�$dY& �#ǻ{�eш^���M ��i�/x�ШV:X��� R�;��`����L�I���u�3�K����H�g_I_������\�����n�&��d1�F[��+B6�6�3�Q�. /۶tي�TvHS��8����t}��\��[gn�.�vJM�R�ԙ��s���n5L;1N����4�v|�����U�[���Z�,���N��@q�`�٘�y,��
��ĒB���8U�����MkLN���
N�#����� y��`�12A��1������)x�4�L�|�ӑ��D� i�0��\	��6x0���l��з����~�a�v�a�C�v�Ʈ4�6� �}���Q.�X�4x���٥\O�a�d0���P�G���	�Wky��Oˇ��H���V�Z�o����?��a�޵z�>�>I��V�Z�o���z���'���d��pM�CH$�9�)���T�l��i/O�2`�.�1n��  �!i`��SI�b�*7�3�~��bq)�y�.Wݣ���&Fi���P��^�i��_����r�R�W9�Q�4�Ho8$�勘�"T͂9�g�czw)�}�4���)�T�����hLj�D�S���i�Fs�	��Ot�d�
�C �U�(�T�� ]l��Ęp(@I�Qx8.it�q�m{��w�1�ʣ�_K}T�h�j*\>慑[3>��^�+	�tAG
�����	u��ٲm��a4*(��;!η�����4���5��n�F����hdbEJ!���&�_��el �N4�w���|��f��wb"TFd�.��u#�N��Q-��>g�0��61�ˣ�A��ړ�P��C��
�*�*�EzlpŌ�Zyj幾���Nw����Ss��Е�>��g2 ?;O���9���}l�:Ο�� ��V��ᝋ����q�Į%��h�������[�tS݆RL�;zӛK��l�/��ݓ������\��zN`nJ�,l�=NC���]<�sVw�)����\�a%8B�0������1 u�Ͼ_���ں������/bIPm n(n|�����C���{g�������-�X� 34���gz7�G�{m${m���;Hy>2o
�]$ێ��Br/��*7��>��۬�B6�8��S�"�V�k��#i	�Gc~�l\3^hSX�Y{�+j2t�"��8�b�Mʴ�i,⌇s��/��16��l���_Z��9���9}X `i����>d��F�q�c�E1Y(ȴ�{��5͌�L� ��c���9]�`��ꕙk�q2"͔�7�d������t
s,��� k�@m�ܶ*�ZRP��
|p�NJ�,�{C�㿂iڒ�R˰�2<F>�Z�OSK�fJq��`����Y,��ܻ>��v2�Ptmb<��m�V\X�iX�ɩj��� �A�� �6�n�O/_j
��p,�QK�c���Km��M(ʗȐ���B	(��^ML4�j���9N'����j���:�;���|����o���xz��j������fqU|��m��3qN��I&Moa�����D�W�^τ�x��s��Ŷ�ׅ��c�\�m���V���L=awU�b��T������ƴ�E�⧴�h��adϕ9a�#	�t0��y�n�K*����#@ޡ4Z}4��q�v˰P���Lw�?�;��� �%���5ka�N9:�?t
�G�°�p��E��ZgۜX�v����y�ص���ɾE��9�Li�Xg�<:,\p$F\���$�OB`�g�B�_� �f�Qֹ�Jv/��N\�
0���~����z��><���k���Y۹���#s���ى�������y;7Ϟ�������������t>���	�f�m�l�'"Я�h�U��59G-{��t�X���4��J��b�y���誗�TJ^�f3S,�^"���̑�p����A!�{�L�;�E`w�RC�ΐ�ҝg�Ԡ�3�}�۾�� W"[�M+�SH�TFBS]62��F`��$N*iM�;�Ž�|	O�"Y�l�ͦ�PRQ�*��^Ï�"�z^���e�����~pE��}<�e�X\��h�n�����J8� ��̣D�\���VJ���;$O"��Ǹ���E�sT �-�/T T�=�
t���'ླྀ���^Ǥ	_�"�*͇6i_k�@(J� �c���������\b�,?J0Izf��8���Q�t9��4H�=��	,��XR>�����G�����ރ�G���@g�p?j��N�,����ۿм*�ғ��؞�D����l���0��cbTbLa�T�&+l�f�BYd&�����˷I�`������A�~���K�~����Yڹ��I���Ξ�b���ZD�(n�����Ս⧗m��������=ؓev53Y�������������@�$�>|�_,�Bo�*��<�ǽ)i7��cdsw�ڍ��yܞ�v��;�Tukf�M�����4��S�M����{�S�1L��N!Qߣ�opO�>����2Z�;�ij?[?h���!ba�ڱ6#���[�;X��b� �������k0�w�E��.\9�!A_����>RSp��A� �r~y9("E�k]���&����+6�3R�N3M*��N�d%� �
  B�$��v�#堈���B9�"��B�堈lx�.Md��δ.]dǳs��AӱŊ�..Ed��EL�p�,�^�x�I�!���A�)Yww�#3Q�.P�JB�y{HmI(�:Ԧo��(2�����M�,JB��<PU��ޯE��A��<T���N��rt�I��-� ��|)Q�6Y��A1%!�S4X�	$%��,|~�EI�Z3��uI���ˎ5/	qd�S�%�2��U"��^��~�}l�J��,�:m���	&O٬D��N��~��du���O��Mi�6���,��$Du�
-�*��w�>]tP�\^ɋ�5p���8��]W���(�y�y_ρ,	eig-#�$���?�]S�g_
-�	�X|�8�l�R�\���wB�#D��B��ͅ�hF�m�O!�7"�j�${b��B"vfj�,fiN�L37_�.@ɺ��?����
2��Fœ]e���I}D0t�î"�J��A�V�U�.B�7��P���Y�����0���bWh%P�Q���8g֡���\���ĕ��\ɝ��U��G��5�1+y�;(+y�{�+��{�X��Y�̼"@�Vl�5�"0�ky9ݧo"��U�7/'6U�<]6Uua�]�ʥpU	r;/�Ur@�UUV	�@�Q{Y	0��W�Y	$lpsGg%Pf�cG�g%� �s_Mh%� w��iYa(N�nE��Y]<�p��Fb���s�R% ��2g+��y�n�� �s=C��h�^ج�
�@��z&t�� �sϽ����B�w�� �s�)�U bض�if{��Xs<)���`��M��_azn#����ӎ�K��| ���mu[=�P��r�3�C)��"��c9�#]�<���p/�{�Ӛ�k���%��(�M:���߂��]��뺋��g����m����'r�z���~�N�/\�M�L�9�m:ëH:þ�!�K4��C�s4v%�HS�q8v%� ?{�evo��g<��X�/��T�ea9Ɗ'���=~p?}Н�1�a$#�|����>��;�������9��6����֍�.x2��Ύw�.�Iz������Gf�2��=�m���q��RJ�$|Ӏ�	b}����_�SD|g�e����5"��^��_mp��{�.�}�����U�6�qZ��}�W�5bq"��4��R�|Jt	av,Len�+0W�b�$��]av:�"���U�����}y7��>r�+���s8�z��G�㲫��\�̟��š����'��D9ڲ�ʎD�E8C�����=�+�T,Ƹ�"�}�N��^��
?<FRJD�qF�˼�7�'��,!��^��3�	�sn�h2���&�F��m��	�.Ft�"�B����y��<t��!���<^���	��K�=Y�xLj�+�����{t�B6h���҃�S���xa3G8�;:�ji�Tq�u�hC��EQ�v��^٧�B�Og�|�����h�Qײ��p%K�Cd�!��;L�'m��쬴��!����w�8����Q��Eo3�*�;�!�[��o3������A��ji�9�q��m��x���i�������|�RJ����Ɵv���vL�mf�Wd�z��ٯ��;͝�����u櫧��� TK����~�mf���z�Ծ�nٯ��w����YӀ��ٽ(qlfV���״p��G�7.��ݱ��Hb����vw���J�[t�[��,���u�K�b��7빏=﫜��:\����}x���{���2�m�c��}���3�;��)�������nxL�Tiw�'|�1��d9V�i�z��y��rYܹ��D1!m|p�@�\�;N��°�G�	�3�P^��0P�ô�03*p���G3np�s	M���� ���!e��t��H-_���g���s���VS�Ǌ}����2>^���勐��rK����7���|��������p��dR0N�(�t�����dCfW�K-����Y`[����ӾJp�p+��:(��~�h�Yw]d�+��z(�B!g=��/�����AVr�P`��z��_f��Ճ��;�z���d'쾲�b�%2@9��cƿ��[N�o!�s�JŦ"1���z���ˏ4	�q, ��@1A1ZaY�z,�tg�ɘX0Q���GU&�AN3�iH��@�a���;�ZƠz��Ï�a��=2ZbQh޿4*A����'b�n���ń�f� ��eGܱ�H����k`E��KJ�ˈe;���	�dC [FP-��E�^�xw:k��kuاq�bv��$M��n���|3��h,`� ?Kd P$�
�������$5rG�L>K(�?���ϛ��v���i��kr��`�I"�Ip� ��~�	D��ܣ�f�����}��J�X��2e4p������ְ̽�$^��
���;�0JQ=��ho5��6
gk�e-��&�
fGR`-��&�.�f[�Z-��&���e�2�jɼ7���Y��fe�� e�=?���{������q��e��H����"���ms=�Т'ʝ}X��@$˗�0�v����ڥj=�~�e;"�S�BWENTW��w�*y��<�.��v}E��W��pc3����0� �[�H5G@%���i(�6���%������'ؔc�`���
,�4;�gm,�ڤ{��tkx�'�'�� |� �rEkt>�������_�o'���}�m�"»��ߟ�����K�     