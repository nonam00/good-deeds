# Карта добрых дел

Веб-платформа для размещения и поиска благотворительных организаций на интерактивной карте. Проект позволяет пользователям находить организации по категориям и локации, а также регистрировать свои организации на карте.

## 📋 Описание

**Карта добрых дел** — это полномасштабное веб-приложение, предоставляющее интерактивную карту с размещёнными на ней благотворительными и некоммерческими организациями. Пользователи могут:

- Просматривать организации на карте
- Искать организации по категориям, местоположению и ключевым словам
- Регистрироваться и создавать собственные организации
- Управлять информацией о своей организации
- Администраторы могут модерировать заявки на добавление организаций

## 🏗️ Архитектура

Проект использует микросервисную архитектуру и состоит из следующих компонентов:

### Backend (ASP.NET Core)
- **WebApi** — основной API сервер с RESTful endpoints
- **Domain** — доменная модель и бизнес-логика
- **Application** — слой приложения с CQRS паттерном (Commands/Queries)
- **Infrastructure** — внешние сервисы (JWT, Email, File storage, Maps)
- **Persistence** — работа с базой данных через Entity Framework Core

### Frontend (React + TypeScript)
- SPA приложение на React 18
- TypeScript для типобезопасности
- Yandex Maps для интерактивной карты
- Zustand для управления состоянием
- React Router для маршрутизации

### File Service (Go)
- Микросервис для работы с файлами
- Интеграция с MinIO (S3-совместимое хранилище)
- Генерация presigned URLs для загрузки/скачивания

### Инфраструктура
- **PostgreSQL** — основная база данных
- **Redis** — кеширование и сессии
- **MinIO** — S3-совместимое хранилище файлов
- **MailHog** — тестовый SMTP сервер для разработки
- **Nginx** — reverse proxy и статический файловый сервер

## 🛠️ Технологический стек

### Backend
- **.NET** (ASP.NET Core)
- **Entity Framework Core** — ORM
- **PostgreSQL** — база данных
- **JWT** — аутентификация
- **CQRS** — паттерн разделения команд и запросов
- **Domain-Driven Design** — проектирование доменной модели

### Frontend
- **React 18**
- **TypeScript**
- **Vite** — сборщик
- **React Router DOM** — маршрутизация
- **Zustand** — управление состоянием
- **Yandex Maps API** — интерактивные карты

### Infrastructure
- **Docker** & **Docker Compose** — контейнеризация
- **Nginx** — веб-сервер и reverse proxy
- **Redis** — кеширование
- **MinIO** — объектное хранилище
- **MailHog** — тестирование email

### File Service
- **Go** — язык программирования
- **MinIO SDK** — клиент для S3-совместимого хранилища

## 📁 Структура проекта

```
good-deeds/
├── backend/                    # Backend приложение (.NET)
│   ├── Application/           # Слой приложения (CQRS)
│   │   ├── Organizations/     # Команды и запросы для организаций
│   │   ├── Users/             # Команды и запросы для пользователей
│   │   └── Shared/            # Общие компоненты
│   ├── Domain/                # Доменная модель
│   │   ├── Models/            # Сущности (User, Organization, Category)
│   │   ├── Events/            # Доменные события
│   │   └── ValueObjects/      # Объекты-значения (Address, Coordinates)
│   ├── Infrastructure/        # Внешние сервисы
│   │   ├── Auth/              # JWT провайдер
│   │   ├── Email/             # Отправка email
│   │   ├── Files/             # Клиент для file-service
│   │   └── Map/               # Интеграция с картами
│   ├── Persistence/           # Работа с БД
│   │   ├── Repositories/      # Репозитории
│   │   └── EntityTypeConfigurations/  # Конфигурации EF Core
│   └── WebApi/                # REST API
│       ├── Controllers/       # API контроллеры
│       └── Middleware/        # Промежуточное ПО
│
├── frontend/                  # Frontend приложение (React)
│   ├── src/
│   │   ├── app/               # Точка входа приложения
│   │   ├── pages/             # Страницы приложения
│   │   ├── features/          # Функциональные модули
│   │   ├── widgets/           # UI компоненты
│   │   ├── shared/            # Общие компоненты
│   │   └── stores/            # Zustand stores
│   └── public/                # Статические файлы
│
├── file-service/              # Микросервис для файлов (Go)
│   ├── cmd/server/            # Точка входа сервера
│   ├── internal/              # Внутренние модули
│   └── pkg/                   # Публичные пакеты
│
├── docker-compose.yaml        # Конфигурация Docker Compose
├── nginx.conf                 # Конфигурация Nginx
└── init.sql                   # Инициализация PostgreSQL
```

## ✨ Основные возможности

### Для пользователей
- 🔐 Регистрация и аутентификация через JWT
- 📧 Подтверждение email при регистрации
- 🗺️ Просмотр организаций на интерактивной карте
- 🔍 Поиск организаций по:
  - Названию и описанию
  - Категориям
  - Городу
- ➕ Создание и редактирование своей организации
- 📍 Автоматическое определение координат по адресу

### Для администраторов
- ✅ Модерация заявок на добавление организаций
- 🔄 Активация/деактивация организаций
- 🗑️ Удаление организаций

## 🚀 Быстрый старт

### Предварительные требования

- [Docker](https://www.docker.com/) и [Docker Compose](https://docs.docker.com/compose/)
- [.NET SDK](https://dotnet.microsoft.com/download) (для разработки backend)
- [Node.js](https://nodejs.org/) и npm (для разработки frontend)
- [Go](https://golang.org/) (для разработки file-service)

### Запуск через Docker Compose

1. Клонируйте репозиторий:
```bash
git clone <repository-url>
cd good-deeds
```

2. Создайте файлы с переменными окружения:

**Backend** (`backend/WebApi/.env`):
```env
POSTGRES_USER=postgres
POSTGRES_PASSWORD=your_password
POSTGRES_DB=good-deeds
ConnectionStrings__PostgresDb=Host=db;Port=5432;Database=good-deeds;Username=postgres;Password=your_password

JWT__SecretKey=your_secret_key_here_minimum_32_characters
JWT__Issuer=GoodDeeds
JWT__Audience=GoodDeeds

SMTP__Host=mailhog
SMTP__Port=1025
SMTP__FromEmail=noreply@gooddeeds.ru
SMTP__FromName=Карта добрых дел

MAP__ApiKey=your_yandex_map_api_key
MAP__GeocoderUrl=https://geocode-maps.yandex.ru/1.x

FILE_SERVICE__BaseUrl=http://file-service:8005

REDIS__ConnectionString=redis:6379
REDIS__Password=your_redis_password
REDIS__User=your_redis_user
```

**Docker Compose** (`.env` в корне проекта):
```env
POSTGRES_USER=postgres
POSTGRES_PASSWORD=your_password
POSTGRES_DB=good-deeds

MINIO_ROOT_USER=minioadmin
MINIO_ROOT_PASSWORD=minioadmin123

REDIS_PASSWORD=your_redis_password
REDIS_USER=your_redis_user
```

3. Запустите все сервисы:
```bash
docker-compose up --build
```

4. Дождитесь запуска всех сервисов (может занять несколько минут при первом запуске, необходимо время для сборки контейнеров)

5. Откройте приложение:
- Frontend: http://localhost:5173
- Backend API: http://localhost/api или http://localhost:8080
- MinIO Console: http://localhost:9001
- MailHog UI: http://localhost:8025

### Локальная разработка

#### Backend

1. Перейдите в директорию backend:
```bash
cd backend
```

2. Восстановите зависимости:
```bash
dotnet restore
```

3. Запустите базу данных через Docker:
```bash
docker-compose up db redis minio mailhog -d
```

4. Настройте строку подключения в `WebApi/appsettings.Development.json`

5. Запустите API:
```bash
cd WebApi
dotnet run
```

API будет доступен по адресу: http://localhost:8080

#### Frontend

1. Перейдите в директорию frontend:
```bash
cd frontend
```

2. Установите зависимости:
```bash
npm install
```

3. Запустите dev-сервер:
```bash
npm run dev
```

Приложение будет доступно по адресу: http://localhost:5173

#### File Service

1. Перейдите в директорию file-service:
```bash
cd file-service
```

2. Установите зависимости:
```bash
go mod download
```

3. Настройте переменные окружения и запустите:
```bash
go run cmd/server/main.go
```

## 📚 API Документация

Подробная документация по API доступна в файле [backend/WebApi/README.md](backend/WebApi/README.md)

### Основные endpoints:

- `POST /1/auth/register` — регистрация пользователя
- `POST /1/auth/login` — вход в систему
- `GET /1/auth/activate` — активация аккаунта
- `POST /1/auth/logout` — выход из системы
- `GET /1/users/info` — информация о текущем пользователе
- `GET /1/organizations` — список активных организаций
- `GET /1/organizations/search` — поиск организаций
- `POST /1/organizations/anonymous` — анонимная заявка на добавление организации
- `POST /1/users/organizations` — создание организации (требует авторизаци

## База данных

Проект использует PostgreSQL с расширениями:
- `pg_trgm` — для полнотекстового поиска
- `btree_gin` — для индексации

Миграции EF Core применяются автоматически при запуске приложения.


**Карта добрых дел** — помогаем находить добро рядом с вами! 🌍❤️
