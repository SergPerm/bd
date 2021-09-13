-- Table: public.attachs

-- DROP TABLE public.attachs;

CREATE TABLE IF NOT EXISTS public.attachs
(
    id integer NOT NULL DEFAULT nextval('attachs_id_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default",
    item_id integer,
    CONSTRAINT attachs_pkey PRIMARY KEY (id),
    CONSTRAINT attachs_item_id_fkey FOREIGN KEY (item_id)
        REFERENCES public.item (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.attachs
    OWNER to postgres;