drop table if exists images;
drop table if exists clusters;
drop table if exists regions;


create table regions
(
	name char(25) not null primary key,
	num_images int,
	mean_point POINT,
	radius int
);


create table clusters
(
	id bigint not null primary key autoincrement,
	gps POINT not null,
	radius float(12, 9),
	region_name char(25) not null,
	foreign key (region_name)
		references regions(name),
	num_images int
);

create table images
(
	id BIGINT not null,
	source varchar(10) not null,
	primary key(id, source),
	region varchar(25),
	foreign key(region)
		references regions(name),
	date_taken datetime not null,
	index (date_taken),
	date_retrieved datetime,
	gps POINT,
	latitude FLOAT(12, 9),
	longitude FLOAT (12, 9),
	url VARCHAR(2083) not null,
	cluster_id int,
	foreign key (cluster_id)
		references clusters(id),
	alt_id BIGINT,
	userid varchar(20),
	haspeople int default 0,
	useable int default 0,
	notes varchar(500) default null

);

INSERT INTO regions (name) values ("Smoky Mountains");
