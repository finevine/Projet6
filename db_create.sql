-- Database: Projet6
-- Author: Vincent
CREATE DATABASE ocpizza
	WITH OWNER = vft
		ENCODING = 'UTF8'
		TABLESPACE = pg_default
		LC_COLLATE = 'fr_FR.UTF-8'
		LC_CTYPE = 'fr_FR.UTF-8'
		TEMPLATE = template0 --so that I can use collate fr_FR
		CONNECTION LIMIT = -1;