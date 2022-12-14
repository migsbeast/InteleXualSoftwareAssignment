insert into "projects" (project_id, name, start_date) values ('1', 'Stehr Group', '20200519 18:23:54');
insert into "projects" (project_id, name, start_date) values ('2', 'Kautzer, Smitham and Satterfield', '20200125 13:21:17');
insert into "projects" (project_id, name, start_date) values ('3', 'StokesErdman', '20200112 02:21:46');
insert into "projects" (project_id, name, start_date) values ('4', 'Lemke Group', '20200726 11:54:47');
insert into "projects" (project_id, name, start_date) values ('5', 'Mann, Trantow and Zemlak', '20190909 01:04:00');

insert into "users" (user_id, name, email) values ('1', 'Shanie Bunny', 'sbunny2s@amazon.com');
insert into "users" (user_id, name, email) values ('2', 'Clifford Thurstan', 'cthurstan2t@opera.com');
insert into "users" (user_id, name, email) values ('3','Trista Francesco', 'tfrancesco2u@merriamwebster.com');
insert into "users" (user_id, name, email) values ('4','Michal Sussams', 'msussams2v@cnet.com');
insert into "users" (user_id, name, email) values ('5','Phylys Kilbee', 'pkilbee2w@nba.com');
insert into "users" (user_id, name, email) values ('6','Swen Swanborrow', 'sswanborrow2x@sphinn.com');
insert into "users" (user_id, name, email) values ('7','Noella Selby', 'nselby2y@rediff.com');
insert into "users" (user_id, name, email) values ('8','Pail Lumsdale', 'plumsdale2z@odnoklassniki.ru');
insert into "users" (user_id, name, email) values ('9','Bellanca Robion', 'brobion30@answers.com');
insert into "users" (user_id, name, email) values ('10','Massimo Faltskog', 'mfaltskog31@noaa.gov');
insert into "users" (user_id, name, email) values ('11','Sabrina Shanks', 'sshanks32@sbwire.com');
insert into "users" (user_id, name, email) values ('12','Chancey Waterman', 'cwaterman33@weebly.com');
insert into "users" (user_id, name, email) values ('13','Lanni Cryer', 'lcryer34@ezinearticles.com');
insert into "users" (user_id, name, email) values ('14','Kristos Rist', 'krist35@noaa.gov');
insert into "users" (user_id, name, email) values ('15','Kenton Vasilischev', 'kvasilischev36@nationalgeographic.com');

insert into "files" (file_id, name, type) values ('1', 'MiguelRodriguezResume', 'pdf');
insert into "files" (file_id, name, type) values ('2', 'auto1', 'PNG');
insert into "files" (file_id, name, type) values ('3', 'auto3', 'PNG');
insert into "files" (file_id, name, type) values ('4', 'auto5', 'PNG');
insert into "files" (file_id, name, type) values ('5', 'auto7', 'MP4');
insert into "files" (file_id, name, type) values ('6', 'code1', 'PNG');
insert into "files" (file_id, name, type) values ('7', 'portrait', 'PNG');
insert into "files" (file_id, name, type) values ('8', '3americas1', 'PNG');
insert into "files" (file_id, name, type) values ('9', '3americas3', 'PNG');
insert into "files" (file_id, name, type) values ('10', 'npc1', 'MP4');

insert into "projectUsers" (id, project_id, user_id) values ('1', 1, 1);
insert into "projectUsers" (id, project_id, user_id) values ('2', 1, 2);
insert into "projectUsers" (id, project_id, user_id) values ('3', 1, 3);
insert into "projectUsers" (id, project_id, user_id) values ('4', 2, 4);
insert into "projectUsers" (id, project_id, user_id) values ('5', 2, 5);
insert into "projectUsers" (id, project_id, user_id) values ('6', 2, 6);
insert into "projectUsers" (id, project_id, user_id) values ('7', 3, 7);
insert into "projectUsers" (id, project_id, user_id) values ('8', 3, 8);
insert into "projectUsers" (id, project_id, user_id) values ('9', 3, 9);
insert into "projectUsers" (id, project_id, user_id) values ('10', 4, 10);
insert into "projectUsers" (id, project_id, user_id) values ('11', 4, 11);
insert into "projectUsers" (id, project_id, user_id) values ('12', 4, 12);
insert into "projectUsers" (id, project_id, user_id) values ('13', 5, 13);
insert into "projectUsers" (id, project_id, user_id) values ('14', 5, 14);
insert into "projectUsers" (id, project_id, user_id) values ('15', 5, 15);

insert into "projectFiles" (project_id, file_id) values (1, 1);
insert into "projectFiles" (project_id, file_id) values (1, 2);
insert into "projectFiles" (project_id, file_id) values (2, 3);
insert into "projectFiles" (project_id, file_id) values (2, 4);
insert into "projectFiles" (project_id, file_id) values (3, 5);
insert into "projectFiles" (project_id, file_id) values (3, 6);
insert into "projectFiles" (project_id, file_id) values (4, 7);
insert into "projectFiles" (project_id, file_id) values (4, 8);
insert into "projectFiles" (project_id, file_id) values (5, 9);
insert into "projectFiles" (project_id, file_id) values ( 5, 10);
