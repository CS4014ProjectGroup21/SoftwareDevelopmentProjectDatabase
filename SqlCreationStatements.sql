CREATE TABLE IF NOT EXISTS Users (
first_name varchar(128) NOT NULL,
last_name varchar(128) NULL DEFAULT NULL,
Date_of_Birth date NOT NULL,
User_id int(10) unsigned NOT NULL AUTO_INCREMENT,
email varchar(128) NOT NULL,
password char(128) NOT NULL,
date_joined datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,

score int(10) NOT NULL DEFAULT 0,


PRIMARY KEY (User_id)
);



CREATE TABLE IF NOT EXISTS Banned (
BannedUser_id int(10) unsigned NOT NULL,
Banner_id int(10) unsigned NOT NULL,
Banned_id int(10) unsigned NOT NULL AUTO_INCREMENT,
Date_of_Expiry date NOT NULL,
Date_of_Ban datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,


PRIMARY KEY (Banned_id),
CONSTRAINT fk_BannedUserid FOREIGN KEY (BannedUser_id) REFERENCES Users (User_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_Bannerid FOREIGN KEY (Banner_id) REFERENCES Users (User_id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS Subject (
SubjectUser_id int(10) unsigned NOT NULL,
Subject_id int(10) unsigned NOT NULL AUTO_INCREMENT,
Major_Subject text(128) NOT NULL,

PRIMARY KEY (Subject_id),
CONSTRAINT fk_SubjectUserid FOREIGN KEY (SubjectUser_id) REFERENCES Users (User_id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS Flagged (
FlaggedUser_id int(10) unsigned NOT NULL,
Flagger_id int(10) unsigned NOT NULL,
FlaggedTask_id int(10) unsigned NOT NULL,
Flagged_id int(10) unsigned NOT NULL AUTO_INCREMENT,
Date_of_Flag datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
Validated tinyint(1) NOT NULL DEFAULT 0,


PRIMARY KEY (Flagged_id),
CONSTRAINT fk_FlaggedUserid FOREIGN KEY (FlaggedUser_id) REFERENCES Users (User_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_Flaggerid FOREIGN KEY (Flagger_id) REFERENCES Users (User_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_FlaggedTaskid FOREIGN KEY (FlaggedTask_id) REFERENCES Tasks (Task_id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS Claimed (
ClaimedUser_id int(10) unsigned NOT NULL,
Claimer_id int(10) unsigned NOT NULL,
ClaimedTask_id int(10) unsigned NOT NULL,
Claimed_id int(10) unsigned NOT NULL AUTO_INCREMENT,
Date_of_Claim datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,


PRIMARY KEY (Claimed_id),
CONSTRAINT fk_ClaimedUserid FOREIGN KEY (ClaimedUser_id) REFERENCES Users (User_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_Claimerid FOREIGN KEY (Claimer_id) REFERENCES Users (User_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_ClaimedTaskid FOREIGN KEY (ClaimedTask_id) REFERENCES Tasks (Task_id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS Tags (
TaggedTask_id int(10) unsigned NOT NULL,
Tags_id int(10) unsigned NOT NULL AUTO_INCREMENT,
Tags text(128) NOT NULL,


PRIMARY KEY (Tags_id),
CONSTRAINT fk_TaggedTaskid FOREIGN KEY (TaggedTask_id) REFERENCES Tasks (Task_id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS TaskStatus (
StatusTask_id int(10) unsigned NOT NULL,
Status_id int(10) unsigned NOT NULL AUTO_INCREMENT,
Status text(128) NOT NULL,


PRIMARY KEY (Status_id),
CONSTRAINT fk_StatusTaskid FOREIGN KEY (StatusTask_id) REFERENCES Tasks (Task_id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS Tasks (
TasksUser_id int(10) unsigned NOT NULL,
Task_id int(10) unsigned NOT NULL AUTO_INCREMENT,
Task_Title char(128) NOT NULL,
Task_Type char(128) NOT NULL,
Task_desc char(128) NOT NULL,
Number_of_Pages int(10) NOT NULL,
Number_of_Words int(10) NOT NULL,
File_Format char(128) NOT NULL,
Sample_Document text(128) NOT NULL,
Date_of_Upload datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,


PRIMARY KEY (Task_id),
CONSTRAINT fk_TasksUserid FOREIGN KEY (TasksUser_id) REFERENCES Users (User_id) ON DELETE CASCADE ON UPDATE CASCADE
);
