-- SELECT Track.Name as Track, Title as Album, Artist.Name as Artist, Genre.Name as Genre
-- FROM Track
--     JOIN Album ON Track.AlbumId = Album.AlbumId
--     JOIN Artist ON Album.ArtistId = Artist.ArtistId
--     JOIN Genre ON Track.GenreId = Genre.GenreId
-- WHERE  Album.AlbumId = 232;

/*
  BRONZE CHALLENGES
  -----------------
  1. Select the 'Name' column from the 'MediaType' table
  Expected:
  MPEG audio file
  Protected AAC audio file
  Protected MPEG-4 video file
  Purchased AAC audio file
  AAC audio file
*/

-- SELECT Name from MediaType;

/*
  2. Select the 'FirstName', 'LastName' and 'Title' Columns from the 'Employee' Table,
     Filtering the results to only those with a Title of 'IT Staff'
     Expected:
     Robert	  King	    IT Staff
     Laura	  Callahan	IT Staff
 */
--  SELECT FirstName, LastName, Title from Employee;

/*
  3. Join the 'Track' table and the 'MediaType' table to create a query
     that shows the Name of the Track, and the Name of the Media Type.
     Both tables have a 'MediaTypeId' column that you can join on.
     Both tables also have 'Name' columns, so you'll need to use aliases
     Expected: 3503 rows (Here's a sample, actual tracks may be different)
     For Those About To Rock (We Salute You)	    MPEG audio file
     Balls to the Wall	                          Protected AAC audio file
     Fast As a Shark	                            Protected AAC audio file

 */

-- SELECT Track.Name as Track, MediaType.name as MediaType
-- FROM Track
--     JOIN MediaType ON Track.MediaTypeId = MediaType.MediaTypeId

/*
  SILVER CHALLENGES
  -----------------

  4. Similar Query to above, but join the track table to the Genre table,
     show the names of the tracks and genres in the results.
     Figure out the columns you can join on, any aliases that you need.
     Filter the results to only show 'Jazz' tracks

     Expected: 130 rows (Here's a sample, actual tracks may be different)
     Desafinado	                              Jazz
     Garota De Ipanema	                      Jazz
     Samba De Uma Nota Só (One Note Samba)	  Jazz
*/

-- SELECT Track.Name as Track, Genre.Name as Genre
-- FROM Track
--     JOIN Genre ON Track.GenreId = Genre.GenreId
-- WHERE Genre.name = 'Jazz'

/*
  5. Create a Query that shows:
      The name of a track, the name of it's MediaType, and the name of it's genre.
      You'll need to join 3 tables together with the appropriate join columns.
      Add a filter to only show tracks with a MediaType of "Protected AAC audio file"
      and a Genre of "Soundtrack"

      If you create the query properly, there should be only one matching track.

      Expected: 1 row
      Koyaanisqatsi	    Protected AAC audio file	    Soundtrack
*/

-- SELECT Track.Name as Track, MediaType.Name as MediaType, Genre.Name as Genre
-- FROM Track
--     JOIN MediaType on Track.MediaTypeId = MediaType.MediaTypeId
--     JOIN Genre on Track.GenreId = Genre.GenreId
-- WHERE MediaType.Name = 'Protected AAC audio file' and Genre.Name = 'Soundtrack'

/*
  GOLD CHALLENGES
  -----------------
  6. Create a query that shows
        PlayList Name
        Track Name
        Album Title
        Artist Name

        Filter to only show results for the 'Grunge' playlist

    Expected: 15 rows (example)
    Grunge	  Hunger Strike	      Temple of the Dog	      Temple of the Dog
    Grunge	  Man In The Box	    Facelift	              Alice In Chains
    Grunge	  Evenflow	          Ten	                    Pearl Jam
 */
 
-- select Playlist.Name as Playlist, 
--       Track.Name as Track, 
--       Title as Album, 
--       Artist.Name as Artist
-- from Playlist
--     join PlaylistTrack on Playlist.PlaylistId = PlaylistTrack.PlaylistId
--     join Track on PlaylistTrack.TrackId = Track.TrackId
--     join Album on Track.AlbumId = Album.AlbumId
--     join Artist on Album.ArtistId = Artist.ArtistId
-- where Playlist.Name = "Grunge"; 
 

/*
  GOLD CHALLENGES
  -----------------
  7. Find a playlist that contains only 1 track.
    Expected: I'm not going to tell you, that'd be too easy.
*/
-- SELECT Playlist.Name, PlaylistTrack.TrackId AS Track, PlaylistTrack.PlaylistId
-- FROM Playlist
--   JOIN PlaylistTrack On Playlist.PlaylistId = PlaylistTrack.PlaylistId
-- GROUP BY Playlist.PlaylistId
-- HAVING COUNT(PlaylistTrack.TrackId) = 1;

-- or

-- select PlaylistId, count(TrackId) from PlaylistTrack
-- group by PlaylistId
-- having count(TrackId) = 1



-- ================================================================================


/*
  BRONZE CHALLENGES
  -----------------
  1. Select the InvoiceDate, BillingAddress, and Total from the Invoices table,
     Ordered by InvoiceDate Descending
     Expected : 412 rows (starting with the following)
     2013-12-22 00:00:00	  12,Community Centre	                        1.99
     2013-12-14 00:00:00	  Porthaninkatu 9	                            13.86
     2013-12-09 00:00:00	  Rua dos Campeões Europeus de Viena, 4350	  8.91
*/

-- SELECT InvoiceDate, BillingAddress, Total from Invoice
-- ORDER by InvoiceDate desc;

/*
  2. We need to fire the last three people hired.
     Select the EmployeeId, LastName, FirstName and HireDate
     of the 3 Employees with the most recent HireDate
     Expected : 3 rows (starting with the following)
      8	  Laura	  Callahan	  2004-03-04 00:00:00
      7	  Robert	King	      2004-01-02 00:00:00
      5	  Steve	  Johnson	    2003-10-17 00:00:00
*/

-- SELECT EmployeeId, LastName, FirstName, HireDate from Employee
-- ORDER BY HireDate desc
-- limit 3;
