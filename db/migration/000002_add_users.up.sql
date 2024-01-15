CREATE TABLE public.users (
    username varchar NOT NULL,
    hashed_password varchar NOT NULL,
    full_name varchar NOT NULL,
    email varchar NOT NULL,
    password_changed_at timestamptz NOT NULL DEFAULT '0001-01-01 00:00:00Z',
    created_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT users_pk PRIMARY KEY (username),
    CONSTRAINT users_unique UNIQUE (email)
);

ALTER TABLE public.accounts ADD CONSTRAINT accounts_users_fk FOREIGN KEY ("owner") REFERENCES public.users(username);

-- CREATE UNIQUE INDEX ON "accounts" ("owner", "currency")
ALTER TABLE public.accounts ADD CONSTRAINT accounts_unique UNIQUE ("owner",currency);
