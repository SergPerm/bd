-- Table: public.role_rules

-- DROP TABLE public.role_rules;

CREATE TABLE IF NOT EXISTS public.role_rules
(
    id integer NOT NULL DEFAULT nextval('role_rules_id_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default",
    role_id integer,
    rules_id integer,
    CONSTRAINT role_rules_pkey PRIMARY KEY (id),
    CONSTRAINT role_rules_role_id_rules_id_key UNIQUE (role_id, rules_id),
    CONSTRAINT role_rules_role_id_fkey FOREIGN KEY (role_id)
        REFERENCES public.role (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT role_rules_rules_id_fkey FOREIGN KEY (rules_id)
        REFERENCES public.rules (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.role_rules
    OWNER to postgres;