CREATE TABLE public.restaurant (
	id SERIAL NOT NULL,
	address_id integer NOT NULL,
	PRIMARY KEY (id)
);

CREATE INDEX ON public.restaurant
	(address_id);


COMMENT ON TABLE public.restaurant
	IS 'Takes for association class Stock';

CREATE TABLE public.ingredient (
	id SERIAL NOT NULL,
	name varchar(100) NOT NULL,
	alergen boolean NOT NULL,
	unit varchar(25) NOT NULL,
	PRIMARY KEY (id)
);


COMMENT ON TABLE public.ingredient
	IS 'Takes for association class Stock and composition';

CREATE TABLE public.stock (
	ingredient_id integer NOT NULL,
	restaurant_id integer NOT NULL,
	quantity integer NOT NULL,
	PRIMARY KEY (ingredient_id, restaurant_id)
);


COMMENT ON TABLE public.stock
	IS 'Quantity is in the ingredient unit';

CREATE TABLE public.article (
	id SERIAL NOT NULL,
	name varchar(250) NOT NULL,
	unitprice real NOT NULL,
	receipt text NOT NULL,
	description text NOT NULL,
	vatrate100 integer NOT NULL,
	vattype varchar(20) NOT NULL,
	imgnumber integer,
	PRIMARY KEY (id)
);


COMMENT ON TABLE public.article
	IS 'Takes for association class OrderLine and ArticlesCategories';

CREATE TABLE public.composition (
	ingredient_id integer NOT NULL,
	article_id integer NOT NULL,
	quantity integer NOT NULL,
	PRIMARY KEY (ingredient_id, article_id)
);


COMMENT ON TABLE public.composition
	IS 'Quantity is in the ingredient unit';

CREATE TABLE public.category (
	id SERIAL NOT NULL,
	name varchar(25) NOT NULL,
	PRIMARY KEY (id)
);


COMMENT ON TABLE public.category
	IS 'Takes for association class Articles Categories';

CREATE TABLE public.orders (
	id SERIAL NOT NULL,
	datereceived timestamp without time zone NOT NULL,
	datepaid timestamp without time zone,
	dateprepared timestamp without time zone,
	dateshipped timestamp without time zone,
	datedelivered timestamp without time zone,
	restaurant_id integer NOT NULL,
	client_id integer NOT NULL,
	address_id integer NOT NULL,
	PRIMARY KEY (id)
);

CREATE INDEX ON public.orders
	(restaurant_id);
CREATE INDEX ON public.orders
	(client_id);
CREATE INDEX ON public.orders
	(address_id);


COMMENT ON TABLE public.orders
	IS 'Takes for an association class OrderLine';

CREATE TABLE public.client (
	id SERIAL NOT NULL,
	email varchar(355) NOT NULL,
	phonenumber varchar(12) NOT NULL,
	password varchar(50) NOT NULL,
	address_id integer NOT NULL,
	PRIMARY KEY (id)
);

ALTER TABLE public.client
	ADD UNIQUE (email);

CREATE INDEX ON public.client
	(address_id);


CREATE TABLE public.articlescategories (
	article_id integer NOT NULL,
	category_id integer NOT NULL,
	PRIMARY KEY (article_id, category_id)
);


CREATE TABLE public.addresses (
	id SERIAL NOT NULL,
	name varchar(100) NOT NULL,
	surname varchar(100),
	road varchar(250) NOT NULL,
	postalcode integer NOT NULL,
	city varchar(50) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE public.orderline (
	order_id integer NOT NULL,
	article_id integer NOT NULL,
	quantity integer NOT NULL,
	PRIMARY KEY (order_id, article_id)
);


ALTER TABLE public.restaurant ADD CONSTRAINT FK_restaurant__address_id FOREIGN KEY (address_id) REFERENCES public.addresses(id);
ALTER TABLE public.stock ADD CONSTRAINT FK_stock__ingredient_id FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(id);
ALTER TABLE public.stock ADD CONSTRAINT FK_stock__restaurant_id FOREIGN KEY (restaurant_id) REFERENCES public.restaurant(id);
ALTER TABLE public.composition ADD CONSTRAINT FK_composition__ingredient_id FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(id);
ALTER TABLE public.composition ADD CONSTRAINT FK_composition__article_id FOREIGN KEY (article_id) REFERENCES public.article(id);
ALTER TABLE public.orders ADD CONSTRAINT FK_orders__restaurant_id FOREIGN KEY (restaurant_id) REFERENCES public.restaurant(id);
ALTER TABLE public.orders ADD CONSTRAINT FK_orders__client_id FOREIGN KEY (client_id) REFERENCES public.client(id);
ALTER TABLE public.orders ADD CONSTRAINT FK_orders__address_id FOREIGN KEY (address_id) REFERENCES public.addresses(id);
ALTER TABLE public.client ADD CONSTRAINT FK_client__address_id FOREIGN KEY (address_id) REFERENCES public.addresses(id);
ALTER TABLE public.articlescategories ADD CONSTRAINT FK_articlescategories__article_id FOREIGN KEY (article_id) REFERENCES public.article(id);
ALTER TABLE public.articlescategories ADD CONSTRAINT FK_articlescategories__category_id FOREIGN KEY (category_id) REFERENCES public.category(id);
ALTER TABLE public.orderline ADD CONSTRAINT FK_orderline__order_id FOREIGN KEY (order_id) REFERENCES public.orders(id);
ALTER TABLE public.orderline ADD CONSTRAINT FK_orderline__article_id FOREIGN KEY (article_id) REFERENCES public.article(id);