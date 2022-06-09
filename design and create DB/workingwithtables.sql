create table contacts
(	contact_id int(11) not null auto_increment,
	last_name varchar(30) not null,
    first_name varchar(25),
    birthday date,
    constraint contacts_pk primary key (contact_id)
);

CREATE TABLE suppliers
( supplier_id INT(11) NOT NULL AUTO_INCREMENT,
  supplier_name VARCHAR(50) NOT NULL,
  account_rep VARCHAR(30) NOT NULL DEFAULT 'TBD'
);

alter table suppliers
add PRIMARY KEY (supplier_id);

ALTER TABLE contacts
  RENAME TO people;