-- public.accounts definition

-- Drop table

-- DROP TABLE public.accounts;

CREATE TABLE public.accounts (
	id bigserial NOT NULL,
	"owner" varchar NOT NULL,
	balance int8 NOT NULL,
	currency varchar NOT NULL,
	created_at timestamptz NOT NULL DEFAULT now(),
	CONSTRAINT accounts_pk PRIMARY KEY (id)
);

-- public.entries definition

-- Drop table

-- DROP TABLE public.entries;

CREATE TABLE public.entries (
	id bigserial NOT NULL,
	account_id int8 NOT NULL,
	amount int8 NOT NULL,
	created_at timestamptz NOT NULL DEFAULT now(),
	CONSTRAINT entries_pk PRIMARY KEY (id)
);


-- public.entries foreign keys

ALTER TABLE public.entries ADD CONSTRAINT entries_accounts_fk FOREIGN KEY (account_id) REFERENCES public.accounts(id);

-- public.transfers definition

-- Drop table

-- DROP TABLE public.transfers;

CREATE TABLE public.transfers (
	id bigserial NOT NULL,
	from_account_id int8 NOT NULL,
	to_account_id int8 NOT NULL,
	amount int8 NOT NULL,
	created_at timestamptz NOT NULL DEFAULT now(),
	CONSTRAINT transfers_pk PRIMARY KEY (id)
);


-- public.transfers foreign keys

ALTER TABLE public.transfers ADD CONSTRAINT transfers_accounts_fk FOREIGN KEY (from_account_id) REFERENCES public.accounts(id);
ALTER TABLE public.transfers ADD CONSTRAINT transfers_accounts_fk_1 FOREIGN KEY (to_account_id) REFERENCES public.accounts(id);