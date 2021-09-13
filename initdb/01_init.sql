CREATE ROLE dev_user WITH LOGIN PASSWORD 'devdev';
CREATE SCHEMA approval AUTHORIZATION dev_user;
-- default schema for search_path
ALTER ROLE dev_user SET search_path TO approval;
