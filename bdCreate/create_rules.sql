-- Table: public.rules

-- DROP TABLE public.rules;

CREATE TABLE IF NOT EXISTS public.rules
(
    id integer NOT NULL DEFAULT nextval('rule_id_seq'::regclass),
    name character varying(100) COLLATE pg_catalog."default",
    description text COLLATE pg_catalog."default",
    CONSTRAINT rule_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.rules
    OWNER to postgres;