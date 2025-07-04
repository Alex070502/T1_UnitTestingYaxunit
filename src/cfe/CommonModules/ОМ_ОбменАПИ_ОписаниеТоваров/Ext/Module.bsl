﻿

Процедура ИсполняемыеСценарии() Экспорт 
	
	ЮТТесты.ДобавитьТестовыйНабор("API Описание товаров").ВТранзакции()
	.ДОбавитьТест("ОписаниеТоваровПоАртикулуПозитив", "Получение описания товаров ", "Позитив, Лоскутов Алексей, Task-1")  
	.ДОбавитьТест("ОписаниеТоваровПоАртикулуНегатив", "Получение описания товаров - Неопределено ", "Негатив, Лоскутов Алексей, Task-1")
	.ДОбавитьТест("ОписаниеТоваровПоАртикулуПозитивСоздание", "", "Позитив")
	
	;
	
	
	
КонецПроцедуры

Процедура ОписаниеТоваровПоАртикулуПозитив() Экспорт 
	
	//1. Подготовка параметров и генерация данных для выполнения функции
	Артикул = "Bos0009";
	
	//2. Выполнение функции
	ТоварОбъект = ОбменАПИ_ОписанияТоваров.ТоварПоАртикулу(Артикул);
	
	//3. Проверка результата
	ЮТест.ОжидаетЧто(ТоварОбъект)
	.ИмеетТип("СправочникОбъект.Товары")
	.Свойство("Артикул").Равно(Артикул)		
	;
КонецПроцедуры   

Процедура ОписаниеТоваровПоАртикулуНегатив() Экспорт  
	
	
	//1. Подготовка параметров и генерация данных для выполнения функции
	Артикул = "11111111111111112323322";
	
	//2. Выполнение функции
	ТоварОбъект = ОбменАПИ_ОписанияТоваров.ТоварПоАртикулу(Артикул);
	
	//3. Проверка результата
	ЮТест.ОжидаетЧто(ТоварОбъект)
	.ИмеетТип("Неопределено")	
	;
КонецПроцедуры 

Процедура ОписаниеТоваровПоАртикулуПозитивСоздание() Экспорт 
	
	//1. Подготовка параметров и генерация данных для выполнения функции
	Артикул = "Test1234";
	Наименование = "Test_Хлеб";
	
	//Создание товара
	НовыйТовар = ЮТест.Данные().КонструкторОбъекта("Справочники.Товары")
		.ФикцияОбязательныхПолей()
		.Установить("Наименование", Наименование)
		.ФикцияРеквизитов("Поставщик, Вид, ШтрихКод, Описание") 
		.Записать();
	
	//2. Выполнение функции
	Товар = ОбменАПИ_ОписанияТоваров.ТоварПоАртикулу(Артикул);
	
	//3. Проверка результата
	ЮТест.ОжидаетЧто(Товар)
		.ИмеетТип("СправочникОбъект.Товары")
		.Свойство("Артикул").Равно(Артикул)
		.Свойство("Наименование").Равно(Наименование)
	;
	
	
	
	
	
	
КонецПроцедуры



