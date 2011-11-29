INSERT INTO `persons` (`id`, `first_name`, `last_name`, `date_registration`)
VALUES (1, 'Mickael', 'Pham', NOW());

INSERT INTO `persons` (`id`, `first_name`, `last_name`, `date_registration`)
VALUES (2, 'Henry', 'Chea', NOW());

INSERT INTO `accounts` (`person_id`, `ssn`, `type`, `balance`)
VALUES (1, '495-43-2345', 1, 0.0);

INSERT INTO `accounts` (`person_id`, `ssn`, `type`, `monthly_fee`)
VALUES (2, '234-98-2341', 2, 7.99);

INSERT INTO `addresses` (`person_id`, `street`, `city`, `state`, `country`, `zip`)
VALUES (1, '375 South 9th Street', 'San Jose', 'CA', 'United States', '95112');

INSERT INTO `addresses` (`person_id`, `street`, `city`, `state`, `country`, `zip`)
VALUES (2, '360 South 11th Street', 'San Jose', 'CA', 'United States', '95112');

INSERT INTO `categories` (`id`, `title`)
VALUES (1, 'default');

INSERT INTO `movies` (`id`, `name`, `rent_amount`, `category_id`)
VALUES (1, 'Batman Begins', 2.99, 1);

INSERT INTO `movies` (`id`, `name`, `rent_amount`, `category_id`)
VALUES (2, 'Back To The Future I', 1.99, 1);

INSERT INTO `movies` (`id`, `name`, `rent_amount`, `category_id`)
VALUES (3, 'Sherlock Holmes', 2.99, 1);

INSERT INTO `movies` (`id`, `name`, `rent_amount`, `category_id`)
VALUES (4, 'Transformers', 3.99, 1);

INSERT INTO `movies` (`id`, `name`, `rent_amount`, `category_id`)
VALUES (5, '500 days of Summer', 2.99, 1);

INSERT INTO `rentals` (`id_persons`, `id_movies`, `date`, `status`)
VALUES (1, 1, NOW(), 'returned');

INSERT INTO `rentals` (`id_persons`, `id_movies`, `date`, `status`)
VALUES (1, 2, NOW(), 'returned');

INSERT INTO `rentals` (`id_persons`, `id_movies`, `date`, `status`)
VALUES (1, 3, NOW(), 'returned');

INSERT INTO `rentals` (`id_persons`, `id_movies`, `date`, `status`)
VALUES (1, 4, NOW(), 'returned');

INSERT INTO `rentals` (`id_persons`, `id_movies`, `date`, `status`)
VALUES (2, 1, NOW(), 'returned');

INSERT INTO `rentals` (`id_persons`, `id_movies`, `date`, `status`)
VALUES (2, 3, NOW(), 'rented');

INSERT INTO `rentals` (`id_persons`, `id_movies`, `date`, `status`)
VALUES (2, 5, NOW(), 'returned');
