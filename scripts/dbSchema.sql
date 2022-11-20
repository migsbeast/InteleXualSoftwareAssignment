CREATE TABLE "users" (
  "user_id" SERIAL PRIMARY KEY,
  "name" varchar(300),
  "email" varchar(100)
);

CREATE TABLE "files" (
  "file_id" SERIAL PRIMARY KEY,
  "name" varchar(300),
  "type" varchar(100)
);

CREATE TABLE "projects" (
  "project_id" SERIAL PRIMARY KEY,
  "name" varchar(300),
  "start_date" timestamp
);

CREATE TABLE "projectUsers" (
  "id" SERIAL PRIMARY KEY,
  "project_id" int,
  "user_id" int,
  FOREIGN KEY ("project_id") REFERENCES "projects"("project_id"),
  FOREIGN KEY ("user_id") REFERENCES "users"("user_id")
);

CREATE TABLE "projectFiles" (
  "project_id" int,
  "file_id" int,
  PRIMARY KEY (project_id, file_id),
  FOREIGN KEY ("project_id") REFERENCES "projects"("project_id"),
  FOREIGN KEY ("file_id") REFERENCES "files"("file_id")
);