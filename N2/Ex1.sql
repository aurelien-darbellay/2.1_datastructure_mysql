CREATE SCHEMA IF NOT EXISTS `youtube`;
USE `youtube`;
CREATE TABLE IF NOT EXISTS `users`(
`users_id` INT(11) primary key not null auto_increment,
`users_username` varchar(25) not null,
`users_email` varchar(25) not null,
`users_bod` date null default null,
`sex` varchar(1) null default null,
`country` varchar(2) null default null,
`zipcode` int(8) null default null
);
CREATE TABLE IF NOT EXISTS `videos`(
`videos_id` int(11) primary key not null auto_increment,
`videos_description` tinytext null default null,
`videos_size_MB` float not null,
`videos_name` varchar(25) not null,
`videos_length_s` float not null,
`videos_thumbnail` blob null default null,
`videos_#reproductions` int(12) not null default 0,
`videos_#likes` int (12) not null default 0,
`videos_#dislikes` int(12) not null default 0,
`videos_users_id` int(11) not null,
`videos_accessibility` enum("public","private","hidden"),
`videos_timepublication`datetime not null,
constraint `fk_videos_users`
	foreign key (`videos_users_id`)
	references `users` (`users_id`)
	on delete cascade
	on update cascade
);
create table if not exists `labels` (
`labels_id` int(11) primary key not null auto_increment,
`name` varchar(25) not null
);
create table if not exists `videos_has_labels`(
`vhl_videos_id` int(11) not null,
`vhl_labels_id` int(11) not null,
primary key(`vhl_videos_id`,`vhl_labels_id`),
constraint `vhl_videos_id` foreign key(`vhl_videos_id`) references `videos` (`videos_id`) on delete cascade on update cascade,
constraint `vhl_labels_id` foreign key(`vhl_labels_id`) references `labels` (`labels_id`) on delete cascade on update cascade
);
create table if not exists `channels`(
`channels_id` int(11) primary key not null auto_increment,
`channels_name` varchar(25) not null,
`channels_description` text null default null,
`channels_datecreation` datetime not null,
`channels_users_id` int(11),
constraint `fk_channels_users` foreign key(`channels_users_id`) references `users`(`users_id`) on delete cascade on update cascade
);
create table if not exists `users_subscribe_channels`(
`subscription_channels_id` int(11) not null,
constraint `fk_subscription_channels` foreign key(`subscription_channels_id`) references `channels`(`channels_id`) on delete cascade on update cascade,
`subscription_users_id` int(11) not null,
constraint `fk_subscritpion_users` foreign key(`subscription_users_id`) references `users`(`users_id`) on delete cascade on update cascade,
primary key(`subscription_channels_id`,`subscription_users_id`)
);
create table if not exists `users_react_to_videos`(
`reaction_videos_id` int(11) not null,
constraint `fk_reaction_videos` foreign key(`reaction_videos_id`) references `videos`(`videos_id`) on delete cascade on update cascade,
`reaction_users_id` int(11) not null,
constraint `fk_reaction_users` foreign key(`reaction_users_id`) references `users`(`users_id`) on delete cascade on update cascade,
primary key(`reaction_videos_id`,`reaction_users_id`),
`reaction_type` enum("like","dislike"),
`reaction_timestamp` datetime not null
);
create table if not exists `playlists`(
`playlists_id` int(11) primary key not null auto_increment,
`playlists_created_by_users_id` int(11) not null, 
`playlists_created_at` datetime not null, 
`playlists_name` varchar(25) not null,
`playlists_state` enum("private","public"),
constraint `fk_created_by` foreign key(`playlists_created_by_users_id`) references `users`(`users_id`) on delete cascade on update cascade
);
create table if not exists `playlists_has_videos`(
`phv_playlists_id` int(11) not null,
`phv_videos_id` int(11) not null,
primary key(`phv_playlists_id`,`phv_videos_id`),
constraint `fk_phv_playlists` foreign key(`phv_playlists_id`) references `playlists`(`playlists_id`) on delete cascade on update cascade,
constraint `fk_phv_videos` foreign key(`phv_videos_id`) references `videos`(`videos_id`) on delete cascade on update cascade
);

create table if not exists `comments`(
`comments_id` int(11) primary key not null auto_increment,
`comments_content` tinytext not null,
`comments_created_at` datetime,
`comments_by_users_id` int(11) not null,
`comments_on_videos_id` int(11) not null,
constraint `fk_comments_users` foreign key(`comments_by_users_id`) references `users`(`users_id`) on delete cascade on update cascade,
constraint `fk_comments_videos` foreign key(`comments_on_videos_id`) references `videos`(`videos_id`) on delete cascade on update cascade
);

create table if not exists `users_react_to_comments`(
`reaction_comments_id` int(11) not null,
constraint `fk_reaction_comments` foreign key(`reaction_comments_id`) references `comments`(`comments_id`) on delete cascade on update cascade,
`reaction_comments_users_id` int(11) not null,
constraint `fk_reaction_comments_users` foreign key(`reaction_comments_users_id`) references `users`(`users_id`) on delete cascade on update cascade,
primary key(`reaction_comments_id`,`reaction_comments_users_id`),
`reaction_type` enum("like","dislike"),
`reaction_timestamp` datetime not null
);







