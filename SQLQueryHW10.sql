--24 exercises JOINS exercises on movie Database

--Task 1
SELECT RE.rev_name
FROM Movies.Reviewer AS RE
LEFT JOIN Movies.Rating AS RA ON RE.rev_id = RA.rev_id
WHERE RA.rev_stars IS NULL 

--Task 2
SELECT A.act_fname, A.act_lname, MC.role
FROM Movies.Actor AS A
JOIN Movies.Movie_cast AS MC ON A.act_id = MC.act_id
JOIN Movies.Movie AS M ON MC.mov_id = M.mov_id
WHERE M.mov_title = 'Annie Hall'

--Task 3
SELECT D.dir_fname, D.dir_lname, M.mov_title
FROM Movies.Director AS D
JOIN Movies.Movie_Direction AS DT ON D.dir_id = DT.dir_id
JOIN Movies.Movie_cast AS MC ON DT.mov_id = MC.mov_id
JOIN Movies.Movie AS M ON MC.mov_id = M.mov_id
WHERE M.mov_title = 'Eyes Wide Shut'

--Task 4
SELECT D.dir_fname, D.dir_lname, M.mov_title
FROM Movies.Director AS D
JOIN Movies.Movie_Direction AS DT ON D.dir_id = DT.dir_id
JOIN Movies.Movie_cast AS MC ON DT.mov_id = MC.mov_id
JOIN Movies.Movie AS M ON MC.mov_id = M.mov_id
WHERE MC.role = 'Sean Maguire'

--Task 5
SELECT A.act_fname, A.act_lname, M.mov_title, M.mov_year
FROM Movies.Actor AS A
JOIN Movies.Movie_cast AS MC ON A.act_id = MC.act_id
JOIN Movies.Movie AS M ON MC.mov_id = M.mov_id
WHERE M.mov_year NOT BETWEEN 1990 AND 2000

--Task 6
SELECT D.dir_fname, D.dir_lname, G.gen_title, COUNT(G.gen_title) AS COUNT
FROM Movies.Director AS D
JOIN Movies.Movie_Direction AS MD ON D.dir_id = MD.dir_id
JOIN Movies.Movie_Genres AS MG ON MD.mov_id = MG.mov_id
JOIN Movies.Genres AS G ON MG.gen_id = G.gen_id
GROUP BY D.dir_fname, D.dir_lname, G.gen_title
ORDER BY D.dir_fname, D.dir_lname

--Task 7
SELECT M.mov_title, M.mov_year, G.gen_title
FROM Movies.Movie AS M
JOIN Movies.Movie_Genres AS MG ON M.mov_id = MG.mov_id
JOIN Movies.Genres AS G ON MG.gen_id = G.gen_id

--Task 8
SELECT M.mov_title, M.mov_year, G.gen_title, D.dir_fname, D.dir_lname
FROM Movies.Movie AS M
JOIN Movies.Movie_Genres AS MG ON M.mov_id = MG.mov_id
JOIN Movies.Genres AS G ON MG.gen_id = G.gen_id
JOIN Movies.Movie_Direction AS MD ON MG.mov_id = MD.mov_id
JOIN Movies.Director AS D ON MD.dir_id = D.dir_id

--Task 9 
SELECT M.mov_title, M.mov_year, M.mov_dt_rel, M.mov_time, D.dir_fname, D.dir_lname
FROM Movies.Movie AS M
JOIN Movies.Movie_Direction AS MD ON M.mov_id = MD.mov_id
JOIN Movies.Director AS D ON MD.dir_id = D.dir_id
WHERE M.mov_dt_rel < '1989-01-01'
ORDER BY M.mov_dt_rel DESC

--Task 10
SELECT G.gen_title, AVG(M.mov_time) AS AVG, COUNT(G.gen_title) AS COUNT 
FROM Movies.Movie AS M
JOIN Movies.Movie_Genres AS MG ON M.mov_id = MG.mov_id
JOIN Movies.Genres AS G ON MG.gen_id = G.gen_id
GROUP BY G.gen_title

--Task 11
SELECT M.mov_title, M.mov_year, D.dir_fname, D.dir_lname, A.act_fname, A.act_lname, MC.role
FROM Movies.Movie AS M
JOIN Movies.Movie_Direction AS DT ON M.mov_id =DT.mov_id
JOIN Movies.Director AS D ON DT.dir_id = D.dir_id
JOIN Movies.Movie_cast AS MC ON M.mov_id = MC.mov_id
JOIN Movies.Actor AS A ON MC.act_id = A.act_id
WHERE M.mov_time = (SELECT MIN(mov_time) FROM Movies.Movie)


--Task 12
SELECT M.mov_year
FROM Movies.Movie AS M
JOIN Movies.Rating AS R ON M.mov_id = R.mov_id
AND R.rev_stars IN(3, 4)
ORDER BY M.mov_year

--Task 13
SELECT RW.rev_name, M.mov_title, R.rev_stars
FROM Movies.Movie AS M
JOIN Movies.Rating AS R ON M.mov_id = R.mov_id
JOIN Movies.Reviewer AS RW ON R.rev_id = RW.rev_id 
AND RW.rev_name IS NOT NULL
ORDER BY RW.rev_name, M.mov_title, R.rev_stars

--Task 14
SELECT M.mov_title, MAX(R.rev_stars) AS Max_stars
FROM Movies.Movie AS M
JOIN Movies.Rating AS R ON M.mov_id = R.mov_id
GROUP BY M.mov_title
HAVING MAX(R.rev_stars) > 0

--Task 15
SELECT M.mov_title, D.dir_fname, D.dir_lname, R.rev_stars
FROM Movies.Movie AS M
JOIN Movies.Movie_Direction AS MD ON M.mov_id = MD.mov_id
JOIN Movies.Director AS D ON MD.dir_id = D.dir_id
LEFT JOIN Movies.Rating AS R ON MD.mov_id = R.mov_id
WHERE R.rev_stars IS NOT NULL

--Task 16
SELECT M.mov_title, A.act_fname, A.act_lname, MC.role
FROM Movies.Movie AS M
JOIN Movies.Movie_cast AS MC ON M.mov_id = MC.mov_id
JOIN Movies.Actor AS A ON MC.act_id = A.act_id 
WHERE A.act_id IN (SELECT act_id FROM Movies.Movie_cast GROUP BY act_id HAVING COUNT(*) > 1)

--Task 17
SELECT D.dir_fname, D.dir_lname, M.mov_title, A.act_fname, A.act_lname, MC.role
FROM Movies.Movie AS M
JOIN Movies.Movie_cast AS MC ON M.mov_id = MC.mov_id
JOIN Movies.Actor AS A ON MC.act_id = A.act_id 
JOIN Movies.Movie_Direction AS DT ON MC.mov_id = DT.mov_id
JOIN Movies.Director AS D ON DT.dir_id = D.dir_id
WHERE A.act_fname = 'Claire' AND a.act_lname = 'Danes'

--Task 18
SELECT A.act_fname, A.act_lname, M.mov_title, MC.role
FROM Movies.Actor AS A
JOIN Movies.Movie_cast AS MC ON A.act_id = MC.act_id 
JOIN Movies.Movie_Direction AS MD ON MC.mov_id = MD.mov_id
JOIN Movies.Director AS D ON MD.dir_id = D.dir_id
JOIN Movies.Movie AS M ON M.mov_id = MD.mov_id
WHERE A.act_fname = D.dir_fname AND A.act_lname = D.dir_lname

--Task 19
SELECT A.act_fname, A.act_lname
FROM Movies.Movie AS M
JOIN Movies.Movie_cast AS MC ON M.mov_id = MC.mov_id
JOIN Movies.Actor AS A ON MC.act_id = A.act_id
WHERE M.mov_title = 'Chinatown'

--Task 20
SELECT m.mov_title
FROM Movies.Movie AS M
JOIN Movies.Movie_cast AS MC ON M.mov_id = MC.mov_id
JOIN Movies.Actor AS A ON MC.act_id = A.act_id
WHERE (A.act_fname = 'Harrison') AND (A.act_lname = 'Ford')

--Task 21
SELECT M.mov_title, M.mov_year, R.rev_stars, M.mov_rel_country
FROM Movies.Movie AS M
JOIN Movies.Rating AS R ON M.mov_id = R.mov_id
WHERE R.rev_stars = (SELECT MAX(rev_stars) FROM Movies.Rating)

--Task 22
WITH MysteryMovie AS (
SELECT M.mov_title, M.mov_year, MAX(R.rev_stars) AS Highest_rating
FROM Movies.Movie AS M 
JOIN Movies.Movie_Genres AS MG ON M.mov_id = MG.mov_id
JOIN Movies.Genres AS G ON MG.gen_id = G.gen_id
JOIN Movies.Rating AS R ON M.mov_id = R.mov_id
WHERE G.gen_title = 'Mystery' 
GROUP BY M.mov_title, M.mov_year)
SELECT * FROM MysteryMovie
WHERE Highest_rating = (SELECT MAX(Highest_rating) FROM MysteryMovie)

--Task 23
SELECT M.mov_year, G.gen_title, COUNT(g.gen_title) Count_gentitle, AVG(R.rev_stars) Average_rating 
FROM Movies.Movie AS M 
JOIN Movies.Movie_Genres AS MG ON M.mov_id = MG.mov_id
JOIN Movies.Genres AS G ON MG.gen_id = G.gen_id
JOIN Movies.Rating AS R ON M.mov_id = R.mov_id
WHERE G.gen_title = 'Mystery'
GROUP BY  M.mov_year, G.gen_title

--Task 24
SELECT DISTINCT M.mov_title, A.act_fname,A.act_lname, M.mov_year, 
       MC.role, G.gen_title, D.dir_fname, D.dir_lname, 
	   M.mov_dt_rel, R.rev_stars
FROM Movies.Movie AS M
JOIN Movies.Movie_cast AS MC ON M.mov_id = MC.mov_id
JOIN Movies.Actor AS A ON MC.act_id = A.act_id
JOIN Movies.Movie_Genres AS MG ON M.mov_id = MG.mov_id
JOIN Movies.Genres AS G ON MG.gen_id = G.gen_id
JOIN Movies.Movie_Direction AS MD ON M.mov_id = MD.mov_id
JOIN Movies.Director AS D ON MD.dir_id = D.dir_id
JOIN Movies.Rating AS R ON M.mov_id = R.mov_id
WHERE A.act_gender = 'F'

