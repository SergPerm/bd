-- Table: public.comments

-- DROP TABLE public.comments;

CREATE TABLE IF NOT EXISTS public.comments
(
    id integer NOT NULL DEFAULT nextval('comments_id_seq'::regclass),
    comment text COLLATE pg_catalog."default",
    item_id integer,
    CONSTRAINT comments_pkey PRIMARY KEY (id),
    CONSTRAINT comments_item_id_fkey FOREIGN KEY (item_id)
        REFERENCES public.item (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.comments
    OWNER to postgres;