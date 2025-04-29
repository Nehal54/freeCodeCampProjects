--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    age_in_millions_of_years integer,
    description text,
    has_life boolean
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
    name character varying(30) NOT NULL,
    description text,
    planet_id integer,
    orbital_period_days numeric(6,2),
    is_tidally_locked boolean
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
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,1),
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(30) NOT NULL,
    purpose text,
    is_operational boolean
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    galaxy_id integer,
    spectral_type character varying(10)
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
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 'Home sweet home! Spiral-shaped, full of drama (black holes, supernovas, and a few billion exes).', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 'Our neighbor galaxy—currently in a long-distance relationship with the Milky Way (collision in 4.5B years).', true);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 9500, 'Fancy hat-shaped galaxy. Known for its stylish dust rings and mysterious dark energy vibes.', false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 400, 'A cosmic watercolor painting—spiral arms so perfect they look photoshopped.', true);
INSERT INTO public.galaxy VALUES (5, 'Zogblax-9', 200000, 'Ancient galaxy full of retired alien civilizations. Mostly yoga and tea planets now.', true);
INSERT INTO public.galaxy VALUES (6, 'Pizzara', 42, 'A young, chaotic galaxy shaped like a spinning pizza. Scientists suspect cosmic cheese.', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Earth''s original moon. Constantly judging the other moons.', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Cheese', 'A myth. Or is it? 99% dairy, 1% conspiracy theories.', 1, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Phobos', 'Mars'' anxious moon. Orbiting faster than my deadlines.', 2, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Deimos', 'Phobos'' chill twin. Probably listening to space lo-fi.', 2, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Io', 'Most volcanic body in solar system. Basically a pizza oven.', 3, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Europa', 'Ice shell hiding an ocean. Home to space whales?', 3, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Ganymede', 'Largest moon in solar system. Has its own magnetic field.', 3, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Callisto', 'Most cratered moon. The "teen acne" phase never ended.', 3, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Karen', 'Demands to speak to Jupiter''s manager.', 3, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Triton', 'Orbits backwards. The rebel of the solar system.', 4, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Nereid', 'Eccentric orbit. The "it''s complicated" moon.', 4, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Charon', 'So big it makes Pluto wobble. Power couple goals.', 5, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Nix', 'Chaotic rotation. Basically tumbling through space.', 5, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Bark Side', 'Always howling in tidal lock. Good boy.', 8, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Squeaky Toy', 'Mysterious high-pitched noises detected.', 8, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Andromoon', 'Glows purple. Smells like lavender.', 9, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Prime Jr.', 'Tiny but pretentious. Wears a monocle.', 9, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Om', 'Hums at 432Hz. The "most enlightened" moon.', 10, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Chakra', 'Glistens in 7 colors. Sells space crystals.', 10, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Basil', 'Greenish hue. Fresh.', 11, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Garlic', 'Orbits suspiciously close. Vampire-free zone.', 11, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4500, 0.0, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 4500, 0.2, true, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 4600, 0.8, false, 1);
INSERT INTO public.planet VALUES (4, 'Neptune', 4500, 4.5, false, 1);
INSERT INTO public.planet VALUES (5, 'Pluto', 4500, 5.9, false, 1);
INSERT INTO public.planet VALUES (6, 'Ember', 8000, 0.6, false, 2);
INSERT INTO public.planet VALUES (7, 'Cinder', 8500, 1.2, false, 2);
INSERT INTO public.planet VALUES (8, 'Dogworld', 200, 8.6, true, 3);
INSERT INTO public.planet VALUES (9, 'Prime-1', 9500, 2500.0, true, 4);
INSERT INTO public.planet VALUES (10, 'Zenith', 140000, 10000.0, true, 6);
INSERT INTO public.planet VALUES (11, 'Margherita', 5, 0.0, false, 7);
INSERT INTO public.planet VALUES (12, 'Calzone-5', 8, 0.1, false, 7);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (6, 'Hubble', 'Capture stunning cosmic photos and ignore Earth drama', true);
INSERT INTO public.satellite VALUES (7, 'Voyager 1', 'Deliver mixtapes to aliens at 17 km/s', true);
INSERT INTO public.satellite VALUES (8, 'Death Star', 'Moon impersonation gone wrong', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, 1, NULL);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 8500, 1, NULL);
INSERT INTO public.star VALUES (3, 'Sirius', 250, 1, NULL);
INSERT INTO public.star VALUES (4, 'Andromeda Prime', 10000, 2, NULL);
INSERT INTO public.star VALUES (5, 'Sombrero Spark', 5000, 3, NULL);
INSERT INTO public.star VALUES (6, 'Zogblaxian Elder', 150000, 5, NULL);
INSERT INTO public.star VALUES (7, 'Pepperoni-7', 10, 6, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 8, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_is_tidally_locked_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_is_tidally_locked_key UNIQUE (is_tidally_locked);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_orbital_period_days_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_orbital_period_days_key UNIQUE (orbital_period_days);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: satellite satellite_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_unique UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

