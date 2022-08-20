drop database if exists hw;
create database if not exists hw;

use hw;


create table `companies` (
                             `id` int not null auto_increment,
                             `name` varchar(255) not null,
                             `city` varchar(255) not null,
                             primary key (`id`)
);


create table `customers` (
                             `id` int not null auto_increment,
                             `name` varchar(255) not null,
                             `city` varchar(255) not null,
                             `industry` varchar(255) not null,

                             primary key (`id`)
);


create table `developers`(
                             `id` int not null auto_increment,
                             `name` varchar(45) not null,
                             `age` int not null,
                             `gender` varchar(255),
                             `salary` long not null,

                             primary key (`id`)

);


create table `projects`(
                           `id` int not null auto_increment,
                           `name`  varchar(255) not null,
                           `field`  varchar(255) not null,
                           `cost` int not null ,
                           `create_date` date not null,

                           primary key (`id`)
);


create table `skills` (
                          `id` int not null auto_increment,
                          `language` varchar(45) not null,
                          `level` enum('Junior', 'Middle', 'Senior') not null,
                          primary key (`id`)
);


create table companies_projects(
                                   `id_company` int not null,
                                   `id_project` int not null,
                                   primary key (`id_company`,`id_project`),
                                   foreign key (`id_company`) references companies(`id`),
                                   foreign key (`id_project`) references projects (`id`) on DELETE cascade
);


create table projects_customers(
                                   `id_customer`int not null,
                                   `id_project`int not null,
                                   primary key(`id_customer`,`id_project`),
                                   foreign key (`id_customer`) references customers(`id`) on DELETE cascade,
                                   foreign key (`id_project`) references projects (`id`) on DELETE cascade
);


create table developers_skills(
                                  `id_developer` int not null,
                                  `id_skill` int not null,
                                  primary key(`id_developer`,`id_skill`),
                                  foreign key(`id_developer`) references developers(`id`) on DELETE cascade,
                                  foreign key(`id_skill`) references skills(`id`) on DELETE cascade
);


create table projects_developers(
                                    `id_project` int not null,
                                    `id_developer` int not null,
                                    primary key(`id_project`,`id_developer`),
                                    foreign key(`id_project`) references projects(`id`) on DELETE cascade,
                                    foreign key(`id_developer`) references developers(`id`) on DELETE cascade
);


