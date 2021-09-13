-- Table: public.state

-- DROP TABLE public.state;

CREATE TABLE IF NOT EXISTS public.state
(
    id integer NOT NULL DEFAULT nextval('state_id_seq'::regclass),
    name character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT state_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.state
    OWNER to postgres;