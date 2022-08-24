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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type_id integer,
    age_in_billion_of_years numeric,
    distance_from_earth_in_millions_of_lightyears numeric
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50),
    planet_id integer NOT NULL,
    discovered_by character varying(100),
    discovery_date date,
    is_spherical boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50),
    star_id integer NOT NULL,
    type character varying(50),
    color character varying(30),
    number_of_moons integer,
    number_of_rings integer,
    has_water boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50),
    galaxy_id integer NOT NULL,
    constellation_id integer,
    age_in_billions_of_years numeric,
    distance_from_earth_in_lightyears numeric,
    color character varying(30)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', 'named by the ancient Greeks after the princess Andromeda');
INSERT INTO public.constellation VALUES (2, 'Canis Major', 'meaning "the greater dog," represents the larger of Orion''s two dogs');
INSERT INTO public.constellation VALUES (3, 'Canis Minor', 'meaning "the smaller dog" or "lesser dog," represents the smaller of Orion''s two dogs');
INSERT INTO public.constellation VALUES (4, 'Centaurus', 'represents the king of centaurs, Chiron');
INSERT INTO public.constellation VALUES (5, 'Cetus', 'represents the whale-like sea monster sent by Poseidon to wreak havoc on the kingdom of ancient Aethiopia');
INSERT INTO public.constellation VALUES (6, 'Cygnus', 'represents Cygnus, a man whose devotion was so touching that the gods turned him into a swan and placed him among the stars');
INSERT INTO public.constellation VALUES (7, 'Ophiuchus', 'represents Asclepius, the god of medicine');
INSERT INTO public.constellation VALUES (8, 'Orion', 'represents the mythical hunter Orion');
INSERT INTO public.constellation VALUES (9, 'Ursa Minor', 'meaning "the little bear" or "the lesser bear"');
INSERT INTO public.constellation VALUES (10, 'Virgo', 'represents both the goddess of justice and the goddess of the harvest');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'The Milky Way', 1, 13.61, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 2, 10.01, 2.5);
INSERT INTO public.galaxy VALUES (3, 'Cartwheel Galaxy', 3, 0.2, 500);
INSERT INTO public.galaxy VALUES (4, 'Comet Galaxy', 1, NULL, 3200);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy', 1, NULL, 21);
INSERT INTO public.galaxy VALUES (6, 'Tadpole Galaxy', 4, NULL, 420);
INSERT INTO public.galaxy VALUES (7, 'Whirlpool Galaxy', 1, 0.4, 31);
INSERT INTO public.galaxy VALUES (8, 'Cygnus A', 5, NULL, 600);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'typically has a rotating disc with spiral ''arms'' that curve out from a dense central region');
INSERT INTO public.galaxy_type VALUES (2, 'Barred Spiral', 'a spiral galaxy with a central bar-shaped structure composed of stars');
INSERT INTO public.galaxy_type VALUES (3, 'Lenticular', 'a galaxy having a central bulge surrounded by a flattened disk with no pattern of spiral arms');
INSERT INTO public.galaxy_type VALUES (4, 'Disrupted Spiral', 'a spiral galaxy that is disrupted and asymmetrical');
INSERT INTO public.galaxy_type VALUES (5, 'Elliptical', 'a type of galaxy with an approximately ellipsoidal shape and a smooth, nearly featureless image');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 3, NULL, NULL, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'Asaph Hall', '1877-08-17', false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Asaph Hall', '1877-08-11', false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'Galileo Galilei', '1610-01-08', true);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'Galileo Galilei', '1610-01-08', true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'Galileo Galilei', '1610-01-07', true);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'Galileo Galilei', '1610-01-07', true);
INSERT INTO public.moon VALUES (8, 'Kore', 5, 'Scott S. Sheppard, David C. Jewitt and Jan T. Kleyna', '2003-02-08', false);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 'William Herschel', '1789-08-28', true);
INSERT INTO public.moon VALUES (10, 'Titan', 6, 'Christiaan Huygens', '1655-03-25', true);
INSERT INTO public.moon VALUES (11, 'Atlas', 6, 'R. Terrile and the Voyager 1 team', '1980-01-01', false);
INSERT INTO public.moon VALUES (12, 'Calypso', 6, 'D. Pascu, P.K. Seidelmann, W. Baum, and D. Currie', '1980-03-01', false);
INSERT INTO public.moon VALUES (13, 'Hyperion', 6, 'William Lassell, William Cranch Bond, and George Phillips Bond', '1848-01-01', false);
INSERT INTO public.moon VALUES (14, 'Ariel', 7, 'William Lassell', '1851-10-24', true);
INSERT INTO public.moon VALUES (15, 'Cordelia', 7, 'Voyager science team', '1986-01-20', NULL);
INSERT INTO public.moon VALUES (16, 'Oberon', 7, 'William Herschel', '1787-01-11', true);
INSERT INTO public.moon VALUES (17, 'Ophelia', 7, 'Voyager science team', '1986-01-01', NULL);
INSERT INTO public.moon VALUES (18, 'Titania', 7, 'William Herschel', '1787-01-11', true);
INSERT INTO public.moon VALUES (19, 'Galatea', 8, 'Voyager 2 science team', '1989-07-01', false);
INSERT INTO public.moon VALUES (20, 'Proteus', 8, 'Voyager 2 science team', '1989-01-01', false);
INSERT INTO public.moon VALUES (21, 'Triton', 8, 'William Lassell', '1846-10-10', true);
INSERT INTO public.moon VALUES (22, 'Charon', 9, 'James Christie', '1978-06-22', true);
INSERT INTO public.moon VALUES (23, 'Hydra', 9, 'Hal Weaver et al.', '2005-06-01', false);
INSERT INTO public.moon VALUES (24, 'Kerberos', 9, 'large team lead by Mark Showalter', '2011-06-28', false);
INSERT INTO public.moon VALUES (25, 'Nix', 9, 'Hal Weaver and a large team of astronomers', '2005-06-01', false);
INSERT INTO public.moon VALUES (26, 'Styx', 9, 'large team lead by Mark Showalter', '2012-06-26', false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'terrestrial', 'dark gray', 0, 0, true);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'terrestrial', 'yellow-white', 0, 0, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'terrestrial', 'blue-green', 1, 0, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'terrestrial', 'red', 2, 0, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'gas giant', 'white, orange, brown, and red', 79, 4, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'gas giant', 'yellow-brown', 82, 7, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'ice giant', 'blue-green', 27, 13, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'ice giant', 'blue', 14, 6, true);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 'dwarf', 'reddish-brown', 5, 0, false);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri', 4, 'super Earth exoplanet', NULL, 0, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Tau Ceti f', 7, 'super Earth exoplanet', NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Wolf 1061c', 8, 'super Earth exoplanet', NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'Ross 128 b', 9, 'super Earth exoplanet', NULL, 0, NULL, NULL);
INSERT INTO public.planet VALUES (14, 'Luyten b', 10, 'super Earth exoplanet', NULL, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 1, NULL, 4.603, 0.00001518, 'white');
INSERT INTO public.star VALUES (2, 'Polaris', 1, 9, 0.07, 323, 'yellow');
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1, 4, 4.853, 4.367, 'yellow');
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 4, 4.853, 4.246, 'red');
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 8, 0.01, 642.5, 'red');
INSERT INTO public.star VALUES (6, 'Sirius', 1, 2, 0.23, 8.61, 'blue-white');
INSERT INTO public.star VALUES (7, 'Tau Ceti', 1, 5, 5.8, 11.9, 'yellow');
INSERT INTO public.star VALUES (8, 'Wolf 1061', 1, 7, NULL, 14.04, 'red');
INSERT INTO public.star VALUES (9, 'Ross 128', 1, 10, 9.45, 10.89, 'red');
INSERT INTO public.star VALUES (10, 'Luyten''s Star', 1, 3, 8, 12.2, 'red');
INSERT INTO public.star VALUES (11, 'Alpheratz', 2, 1, 0.07, 96.87, 'white');
INSERT INTO public.star VALUES (12, 'Mirach', 2, 1, NULL, 197, 'red');
INSERT INTO public.star VALUES (13, 'Deneb', 8, 6, 0.01, 2616, 'bluish-white');


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 37, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 26, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 15, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 13, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

