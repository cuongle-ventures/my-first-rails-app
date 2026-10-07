# My Awesome Project

A small shop API built with Rails. Manages customers and products.

## Prerequisites

- Ruby 3.4.2
- Bundler
- SQLite 3

## Setup

```bash
bundle install
bin/rails db:prepare
```

## How to run

```bash
bin/rails server
```

The app runs at http://localhost:3000. Health check: `GET /up`.

Run tests:

```bash
bin/rails test
```

## DB schema

**customers**

| Column     | Type     |
| ---------- | -------- |
| id         | integer  |
| first_name | string   |
| last_name  | string   |
| active     | boolean  |
| created_at | datetime |
| updated_at | datetime |

**products**

| Column      | Type     |
| ----------- | -------- |
| id          | integer  |
| name        | string   |
| description | string   |
| created_at  | datetime |
| updated_at  | datetime |

## Endpoints

| Method | Path             |
| ------ | ---------------- |
| GET    | /customers       |
| GET    | /customers/:id   |
| POST   | /customers       |
| PATCH  | /customers/:id   |
| DELETE | /customers/:id   |
| GET    | /products        |
| GET    | /products/:id    |
| POST   | /products        |
| PATCH  | /products/:id    |
| DELETE | /products/:id    |
