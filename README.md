
     ,-----.,--.                  ,--. ,---.   ,--.,------.  ,------.
    '  .--./|  | ,---. ,--.,--. ,-|  || o   \  |  ||  .-.  \ |  .---'
    |  |    |  || .-. ||  ||  |' .-. |`..'  |  |  ||  |  \  :|  `--, 
    '  '--'\|  |' '-' ''  ''  '\ `-' | .'  /   |  ||  '--'  /|  `---.
     `-----'`--' `---'  `----'  `---'  `--'    `--'`-------' `------'
    ----------------------------------------------------------------- 


MySQL commands!
Start of MySQL Lesson

$ mysql-ctl start
$ mysql -u $C9_USER -p
mysql> show databases;
mysql> use c9;
mysql> show tables;
mysql> use mysql;
mysql> show tables;
mysql> desc db;
mysql> select * from db;
mysql> select Host, Db, Insert_priv from db;

download chinook
$ wget https://raw.githubusercontent.com/lerocha/chinook-database/master/ChinookDatabase/DataSources/Chinook_MySql_AutoIncrementPKs.sql

$ mysql -u $C9_USER -p < Chinook_MySql_AutoIncrementPKs.sql
That creates the Chinook by running the sql script

log into mysql and show the databases
mysql> show databases;
mysql> use Chinook;
mysql> drop database Chinook;
To run the script from within mysql
mysql> source Chinook_MySql_AutoIncrementPKs.sql

To do next:
SELECT

==== Querying the database ======
Where ---> Filters things
JOIN !Important
ORDER BY
Count
Min
Max
avg
Round
SUM

INSERT
UPDATE
Delete
Create Table

mysql> select * from Album where Album Id = 232;

======= Select and Join ======
select * from Track join Album on Track.AlbumId = Album.AlbumId
select * from Track join Album on Track.AlbumId = Album.AlbumId where TrackId = 1000;
