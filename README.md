# Netflix__project
Netflix Content Analysis SQL Project
This project is designed to demonstrate SQL skills and techniques used by data analysts to explore and analyze Netflix Movies and TV Shows. It includes setting up the dataset schema, performing exploratory data analysis (EDA), and answering business questions through SQL queries. This is ideal for beginners building a solid SQL foundation.

Objectives
Set up a Netflix content table using a clean schema.

Exploratory Data Analysis (EDA) across content types, ratings, countries, durations, and genres.

Business Analysis using SQL to answer practical questions and derive insights.

Dataset
The data for this project is sourced from the Kaggle dataset.
Dataset Link: Movies Dataset

Schema
sql
DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix
(
    show_id      VARCHAR(5),
    type         VARCHAR(10),
    title        VARCHAR(250),
    director     VARCHAR(550),
    casts        VARCHAR(1050),
    country      VARCHAR(550),
    date_added   VARCHAR(55),
    release_year INT,
    rating       VARCHAR(15),
    duration     VARCHAR(15),
    listed_in    VARCHAR(250),
    description  VARCHAR(550)
);
