-- Table: public.item

-- DROP TABLE public.item;

CREATE TABLE IF NOT EXISTS public.item
(
    id integer NOT NULL DEFAULT nextval('item_id_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default",
    users_id integer,
    state_id integer,
    category_id integer,
    CONSTRAINT item_pkey PRIMARY KEY (id),
    CONSTRAINT item_category_id_fkey FOREIGN KEY (category_id)
        REFERENCES public.category (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT item_state_id_fkey FOREIGN KEY (state_id)
        REFERENCES public.state (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT item_users_id_fkey FOREIGN KEY (users_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.item
    OWNER to postgres;