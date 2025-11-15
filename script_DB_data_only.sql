USE [dbhakaton]
GO
INSERT [dbo].[category] ([categoty_id], [category_name]) VALUES (1, N'Местное сообщество и развитие территорий')
GO
INSERT [dbo].[category] ([categoty_id], [category_name]) VALUES (2, N'Социальная защита (помощь людям в трудной ситуации)')
GO
INSERT [dbo].[category] ([categoty_id], [category_name]) VALUES (3, N'Экология и устойчивое развитие')
GO
INSERT [dbo].[category] ([categoty_id], [category_name]) VALUES (4, N'Здоровье и спорт')
GO
INSERT [dbo].[category] ([categoty_id], [category_name]) VALUES (5, N'Культура и образование')
GO
INSERT [dbo].[category] ([categoty_id], [category_name]) VALUES (6, N'Защита животных')
GO
INSERT [dbo].[category] ([categoty_id], [category_name]) VALUES (7, N'Другое')
GO
INSERT [dbo].[NKO] ([NKO_id], [NKO_name], [category_id], [NKO_description], [NKO_contact_number], [NKO_address], [NKO_logo], [NKO_link], [NKO_lng], [NKO_lat]) VALUES (1, N'Муниципальный ресурсный центр "СОдействие"', 7, N'Муниципальный ресурсный центр "СОдействие" оказывает поддержку общественным инициативам и некоммерческим общественным организациям г.Железногорска. Если вы активный гражданин г.Железногорска и хотите реализовывать проекты, у вас есть своя некомерческая общественная организация или вы хотите её создать, но не знаете как, мы рады оказать Вам любой вид поддержки: информационную, консультационную, образовательную, финансовую, имущественную. Кроме того, вы можете просто попить чай и обсудить новые проекты, посетив нас по адресу г. Железногорск, ул. Свердлова, 47.', N'+7 (391) 974-55-55', N'Россия, Железногорск , Свердлова, 47', NULL, N'resursny-centr-26.orgs.biz', NULL, NULL)
GO
INSERT [dbo].[NKO] ([NKO_id], [NKO_name], [category_id], [NKO_description], [NKO_contact_number], [NKO_address], [NKO_logo], [NKO_link], [NKO_lng], [NKO_lat]) VALUES (2, N'Димитровградская местная общественная организация инвалидов-опорников «Преодоление»', 2, NULL, N'+7 (927) 823-63-51', N'433513, Ульяновская область, г.Димитровград, ул. Дрогобычская, дом 30', NULL, N'https://opuo.ru/list_nko/dimitrovgradskaya-mestnaya-obshchestvennaya-organizaciya-invalidov-opornikov-preodolenie/', NULL, NULL)
GO
INSERT [dbo].[NKO] ([NKO_id], [NKO_name], [category_id], [NKO_description], [NKO_contact_number], [NKO_address], [NKO_logo], [NKO_link], [NKO_lng], [NKO_lat]) VALUES (3, N'Ассоциация «Территориального общественного самоуправления города Димитровграда»', 1, N'Одним из важных направлений деятельности Ассоциация « ТОС г. Димитровграда» является содействие гражданам и некоммерческим организациям при решении вопросов, возникающих у них в процессе реализации социальных функций.

Целью деятельности Ассоциация « ТОС г. Димитровграда» является оказание услуг по поддержке правового, социального, организационно-технического и методического содействия гражданам и некоммерческим организациям при решении вопросов, возникающих у них в процессе реализации своих социальных функций.', N'+7 (953) 985-77-62', N'Ульяновская область , 433508 г. Димитровград, ул. Хмельницкого, д. 112, офис 2.', NULL, N'https://opuo.ru/list_nko/associaciya-territorialnogo-obshhestvennogo-samoupravleniya-goroda-dimitrovgrada/', NULL, NULL)
GO
INSERT [dbo].[NKO] ([NKO_id], [NKO_name], [category_id], [NKO_description], [NKO_contact_number], [NKO_address], [NKO_logo], [NKO_link], [NKO_lng], [NKO_lat]) VALUES (4, N'ОО ТОС АГО "12а микрорайон"', 1, N'Повышение качества жизни жителей 12а микрорайона г.Ангарска Иркутской области ( Благоустройство и содержании территории, организация культурных, спортивных и социально значимых мероприятий, взаимодействие с органами власти для учёта мнения жителей, , экологии и социальной помощи.', NULL, N'Иркутская областьб город Ангарск, микрорайон 12а', NULL, N'https://vk.com/id746471055', NULL, NULL)
GO
INSERT [dbo].[NKO] ([NKO_id], [NKO_name], [category_id], [NKO_description], [NKO_contact_number], [NKO_address], [NKO_logo], [NKO_link], [NKO_lng], [NKO_lat]) VALUES (5, N'Благотворительный общественно полезный фонд помощи социально незащищенным слоям населения "Платформа добрых дел"', 2, N'Благотворительный общественно полезный фонд помощи социально незащищенным слоям населения «Платформа добрых дел»
Основной вид деятельности (ОКВЭД) 64.99', NULL, N'Ростовская область, город Волгодонск', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[NKO] ([NKO_id], [NKO_name], [category_id], [NKO_description], [NKO_contact_number], [NKO_address], [NKO_logo], [NKO_link], [NKO_lng], [NKO_lat]) VALUES (6, N'МБУ "Молодежный центр"', 1, N'Основная деятельность:
-Консультирование и регистрация на площадке «Добро.РФ»
-Проведение ""Школы волонтеров"" 
-Формирование и сопровождение волонтерских корпусов (например, на общегородских мероприятиях, федеральных проектах (Формирование комфортной городской среды)
-Информирование граждан и организаторов о развитии добровольчества, благотворительности и гражданских инициатив (индивидуально)', N'+7 (341) 416-61-46', N'Удмуртская Республика, город Глазов, ул. Пряженникова, 51 а', NULL, N'https://vk.com/mcglazov', NULL, NULL)
GO
INSERT [dbo].[NKO] ([NKO_id], [NKO_name], [category_id], [NKO_description], [NKO_contact_number], [NKO_address], [NKO_logo], [NKO_link], [NKO_lng], [NKO_lat]) VALUES (7, N'Культурная база "Короленко 8" (МБУ "ЦМиТО УКСиМП")', 7, N'Ресурсный центр помощи НКО и сообществам, учреждениям культуры, образования', N'+7 (341) 416-63-55', N'Удмуртская республика, город Глазовб улица Короленко, 8', NULL, N'https://m.vk.com/korolenko8?from=groups', NULL, NULL)
GO
