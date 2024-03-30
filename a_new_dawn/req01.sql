CREATE SCHEMA IF NOT EXISTS nexus;

CREATE SCHEMA IF NOT EXISTS nexus_it;

CREATE SCHEMA IF NOT EXISTS techwave;

CREATE SCHEMA IF NOT EXISTS finstar;

CREATE SCHEMA IF NOT EXISTS nexus_food;

CREATE SCHEMA IF NOT EXISTS guardforce;

CREATE TYPE nexus.position AS ENUM (
    'JUNIOR',
    'SENIOR',
    'MANAGER',
    'DIRECTOR'
);

CREATE TYPE nexus.relationship_type AS ENUM (
    'PARENT',
    'SUBSIDIARY',
    'AFFILIATE'
);

CREATE TYPE nexus_food.nutriscore AS ENUM (
    'A',
    'B',
    'C',
    'D',
    'E'
);

CREATE TABLE IF NOT EXISTS nexus.employees
(
    id SERIAL,
    first_name varchar(25),
    last_name varchar(25),
    employee_position nexus.position, 
    salary numeric(10, 2),

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS nexus_it.employees
(
    id SERIAL,
    first_name varchar(25),
    last_name varchar(25),
    employee_position nexus.position, 
    salary numeric(10, 2),

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS techwave.employees
(
    id SERIAL,
    first_name varchar(25),
    last_name varchar(25),
    employee_position nexus.position, 
    salary numeric(10, 2),

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS finstar.employees
(
    id SERIAL,
    first_name varchar(25),
    last_name varchar(25),
    employee_position nexus.position, 
    salary numeric(10, 2),

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS nexus_food.employees
(
    id SERIAL,
    first_name varchar(25),
    last_name varchar(25),
    employee_position nexus.position, 
    salary numeric(10, 2),

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS guardforce.employees
(
    id SERIAL,
    first_name varchar(25),
    last_name varchar(25),
    employee_position nexus.position, 
    salary numeric(10, 2),

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS nexus.nexus_relations
(
    id SERIAL,
    parent_company varchar(25),
    child_company varchar(25),
    relationship_type nexus.relationship_type,

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS nexus_it.software_assets
(
    id SERIAL,
    software_name varchar(50),
    license_key uuid,
    expiration_date date,

    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS techwave.project_milestones
(
    id SERIAL,
    milestone_name varchar(50),
    due_date date,
    completion_status boolean,

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS finstar.investments
(
    id SERIAL,
    investment_name varchar(50),
    investment_type varchar(25),
    amount_invested numeric(15, 5),
    date_invested date,

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS nexus_food.products
(
    id SERIAL,
    product_name varchar(25),
    product_nutriscore nexus_food.nutriscore,

    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS guardforce.incident_reports
(
    id SERIAL,
    incident_description text,
    incident_date timestamp,
    incident_location varchar(50),
    reported_by varchar(50),

    PRIMARY KEY (id)
);
