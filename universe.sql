--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_types integer,
    distance_from_earth integer,
    age_in_million_years numeric(4,3)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    name character varying(30) NOT NULL,
    is_spherical boolean,
    distance_from_planet_million_miles integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    moons integer,
    has_life boolean,
    star_id integer,
    name character varying(30) NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_moon (
    planet_moon_id integer NOT NULL,
    planet_id integer,
    moon_id integer,
    name character varying(30) NOT NULL
);


ALTER TABLE public.planet_moon OWNER TO freecodecamp;

--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_moon_planet_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_moon_planet_moon_id_seq OWNER TO freecodecamp;

--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_moon_planet_moon_id_seq OWNED BY public.planet_moon.planet_moon_id;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    is_spherical boolean NOT NULL,
    name character varying(30),
    planets integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_moon planet_moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon ALTER COLUMN planet_moon_id SET DEFAULT nextval('public.planet_moon_planet_moon_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (4, 'Milky Way', 'Spiral galaxy', 1, 25000, 3.234);
INSERT INTO public.galaxy VALUES (5, 'Andromeda', 'Spiral galaxy', 1, 2300000, 2.567);
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 'Spiral galaxy', 1, 3000000, 1.789);
INSERT INTO public.galaxy VALUES (7, 'Messier 87', 'Elliptical galaxy', 2, 55000000, 6.123);
INSERT INTO public.galaxy VALUES (8, 'Sombrero', 'Spiral galaxy', 1, 29000000, 4.456);
INSERT INTO public.galaxy VALUES (9, 'Centaurus A', 'Elliptical galaxy', 2, 12000000, 1.789);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 13, 'Moon 1', true, 0);
INSERT INTO public.moon VALUES (2, 13, 'Moon 2', true, 0);
INSERT INTO public.moon VALUES (3, 14, 'Moon 3', true, 1);
INSERT INTO public.moon VALUES (4, 14, 'Moon 4', true, 1);
INSERT INTO public.moon VALUES (5, 15, 'Moon 5', true, 1);
INSERT INTO public.moon VALUES (6, 15, 'Moon 6', true, 2);
INSERT INTO public.moon VALUES (7, 16, 'Moon 7', true, 0);
INSERT INTO public.moon VALUES (8, 16, 'Moon 8', true, 0);
INSERT INTO public.moon VALUES (9, 17, 'Moon 9', true, 0);
INSERT INTO public.moon VALUES (10, 17, 'Moon 10', true, 0);
INSERT INTO public.moon VALUES (11, 18, 'Moon 11', true, 1);
INSERT INTO public.moon VALUES (12, 18, 'Moon 12', true, 2);
INSERT INTO public.moon VALUES (13, 19, 'Moon 13', true, 0);
INSERT INTO public.moon VALUES (14, 19, 'Moon 14', true, 0);
INSERT INTO public.moon VALUES (15, 20, 'Moon 15', true, 0);
INSERT INTO public.moon VALUES (16, 20, 'Moon 16', true, 0);
INSERT INTO public.moon VALUES (17, 21, 'Moon 17', true, 0);
INSERT INTO public.moon VALUES (18, 21, 'Moon 18', true, 0);
INSERT INTO public.moon VALUES (19, 22, 'Moon 19', true, 0);
INSERT INTO public.moon VALUES (20, 22, 'Moon 20', true, 0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 1, true, 7, 'Mercury');
INSERT INTO public.planet VALUES (14, 2, false, 7, 'Venus');
INSERT INTO public.planet VALUES (15, 1, false, 8, 'Earth');
INSERT INTO public.planet VALUES (16, 1, false, 8, 'Proxima b');
INSERT INTO public.planet VALUES (17, 0, false, 9, 'Proxima c');
INSERT INTO public.planet VALUES (18, 0, false, 9, 'Proxima d');
INSERT INTO public.planet VALUES (19, 79, false, 10, 'Jupiter');
INSERT INTO public.planet VALUES (20, 82, false, 10, 'Saturn');
INSERT INTO public.planet VALUES (21, 27, false, 11, 'Uranus');
INSERT INTO public.planet VALUES (22, 14, false, 11, 'Neptune');
INSERT INTO public.planet VALUES (23, 0, false, 12, 'Pluto');
INSERT INTO public.planet VALUES (24, 0, false, 12, 'Eris');


--
-- Data for Name: planet_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_moon VALUES (1, 13, 1, 'Planet 13 - Moon 1');
INSERT INTO public.planet_moon VALUES (2, 16, 8, 'Planet 16 - Moon 8');
INSERT INTO public.planet_moon VALUES (3, 20, 14, 'Planet 20 - Moon 14');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (7, 8, true, 'Sun', 8);
INSERT INTO public.star VALUES (8, 6, false, 'Alpha Centauri', 3);
INSERT INTO public.star VALUES (9, 9, true, 'Proxima Centauri', 0);
INSERT INTO public.star VALUES (10, 4, false, 'Barnard''s Star', 0);
INSERT INTO public.star VALUES (11, 5, true, 'Sirius', 2);
INSERT INTO public.star VALUES (12, 7, false, 'Betelgeuse', 0);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_moon_planet_moon_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_moon planet_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_name_key UNIQUE (name);


--
-- Name: planet_moon planet_moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_pkey PRIMARY KEY (planet_moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_moon planet_moon_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: planet_moon planet_moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

