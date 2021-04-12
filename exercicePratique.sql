/*Exercice 1 : */
select noserv, service, ville from serv;

/*Exercice 2 : */
select * from serv;

/*Exercice 3 : */
select noserv, service from serv;

/*Exercice 4 : */
select * from emp;

/*Exercice 5 : */
select emploi from emp;

/*Exercice 6 :*/
select distinct emploi from emp;

/*Exercice 7 : */
select * from emp where noserv = 3;

/*Exercice 8 : */
select noemp, nom, prenom from emp where emploi = "TECHNICIEN";

/*Exercice 9 : */
select noserv, service from serv where noserv > 2;

/*Exercice 10 : */
select noserv, service from serv where noserv <= 2;

/*Exercice 11 : */
select * from emp where comm < sal;

/*Exercice 12 : */
select * from emp where comm is null;

/* Exercice 13 : */
select * from emp where comm is not null order by comm;

/* Exercice 14 : */
select * from emp where sup is not null;

/* Exercice 15 : */
select * from emp where sup is null;

/*Exercice 16 : */
select nom, emploi, sal, noserv from emp where noserv = 5 and sal > 20000;

/*Exercice 17 : */
select * from emp where noserv = 6 and sal >= 9500 and emploi = 'vendeur';

/*Exercice 18 : */
select * from emp where emploi = 'directeur' or emploi = 'president';

/*Exercice 19 : */
select nom, emploi, noserv from emp where emploi = 'DIRECTEUR' and noserv != 3;

/* Exercice 20 : */
select * from emp where emploi = 'Directeur' or emploi = 'Technicien' and noserv = 1;

/* Exercice 21 : */
select * from emp where (emploi = 'Directeur' or emploi = 'Technicien') and noserv = 1;

/* Exercice 22 : */
select * from emp where noserv = 1 and ( emploi = 'Directeur' or emploi = 'technicien');

/* Exercice 23 : */
select * from emp where emploi != 'DIRECTEUR' and emploi != 'TECHNICIEN' and noserv = 1;

/* Exercice 24 : */
select * from emp where emploi in ('TECHNICIEN', 'COMPTABLE', 'VENDEUR');

/* Exercice 25 : */
select * from emp where emploi not in ('TECHNICIEN', 'VENDEUR', 'COMPTABLE');

/* Exercice 26 : */
select * from emp where emploi = 'DIRECTEUR' and noserv in (2, 4, 5);

/* Exercice 27 : */
select * from emp where sup is not null and noserv not in (1,3,5);

/* Exercice 28 : */
select * from emp where sal between 20000 and 40000;

/* Exercice 29 : */
select * from emp where sal not between 20000 and 40000;

/* Exercice 30 : */
select * from emp where emploi != 'DIRECTEUR' and embauche like '1988%';

/* Exercice 31 : */
select * from emp where noserv between 2 and 5 and emploi = 'DIRECTEUR';

/* Exercice 32 : */
select * from emp where nom like 'M%';

/* Exercice 33 : */
select * from emp where nom like '%T';

/* Exercice 34 : */
select * from emp where nom like '%E%E%';

/* Exercice 35 : */
select * from emp where nom like '%E%' and nom not like '%E%E%';

/* Exercice 36 : */
select * from emp where nom like '%N%' and nom like '%O%';

/* Exercice 37 : */
select * from emp where nom like '_____N';

/* Exercice 38 : */
select * from emp where nom like '__R%';

/* Exercice 39 : */
select * from emp where nom not like '_____';

/* Exercice 40 :*/
select nom, prenom, noserv, sal from emp where noserv = 3 order by sal;

/* Exercice 41 : */
select nom, prenom, noserv, sal from emp where noserv = 3 order by sal desc;

/* Exercice 42 : */
select nom, prenom, noserv, sal from emp where noserv = 3 order by 4;

/* Exercice 43 : */
select nom, prenom, noserv, sal, emploi from emp order by emploi, sal desc;

/* Exercice 44 : */
select nom, prenom, noserv, sal, emploi from emp order by 5, 4 desc;

/* Exercice 45 : */
select nom, prenom, noserv, coalesce(comm, 0) as comm from emp where noserv = 3 order by comm;

/* Exercice 46 : */
select nom, prenom, noserv, comm from emp where comm is not null and noserv = 3 order by comm;

/* Exercice 47 : */
select nom, prenom, emploi, service from emp, serv where emp.noserv = serv.noserv ;

/* Exercice 48 : */
select nom, emploi, emp.noserv, service from emp, serv where emp.noserv = serv.noserv;

/* Exercice 49 : */
select nom, emploi, e1.noserv, service from emp as e1, serv as s1 where e1.noserv = s1.noserv;

/* Exercice 50 : */
select nom, emploi, serv.* from emp, serv where emp.noserv = serv.noserv;

/* Exercice 51 : */
select * from emp as subalterne, emp as superieur where subalterne.sup = superieur.noemp and subalterne.embauche < superieur.embauche order by subalterne.nom, superieur.nom;

/*Exercice 52 : */
select * from emp;

/* Exercice 53 : */
select noserv from serv where noserv not in( select distinct serv.noserv from serv, emp where emp.noserv = serv.noserv);

/* Exercice 54 : */
select distinct serv.* from emp right join serv on emp.noserv = serv.noserv where noemp is not null ;

/* Exercice 54 bis : */
select noserv from serv where noserv in( select distinct serv.noserv from serv, emp where emp.noserv = serv.noserv);

/* Exercice 55 :*/
select emp.* from emp left join serv on emp.noserv = serv.noserv where serv.ville = 'LILLE';

/* Exercice 56 : */
select * from emp where sup = (select sup from emp where nom = 'DUBOIS') and nom != 'DUBOIS';

/* Exercice 57 : */
select * from emp where embauche = (select embauche from emp where nom = 'DUMONT');

/* Exercice 58 : */
select nom, embauche from emp where embauche < (select embauche from emp where nom = 'MINET');

/* Exercice 59 : */
select nom, prenom, embauche from emp where embauche < (select min(embauche) from emp where noserv = 6);

/* Exercice 60 : */
select nom, prenom, sal from emp as e1 where exists ( select * from emp as e2 where noserv = 3 and e2.sal < e1.sal ) order by sal;

/* Exercice 61 : */
select nom, emp.noserv, emploi, sal from emp, serv where emp.noserv = serv.noserv and ville = (select ville from emp, serv where emp.noserv = serv.noserv and emp.nom = 'HAVET');

/* Exercice 62 : */
select * from emp where emploi in (select emploi from emp where noserv = 3) and noserv = 1;

/* Exercice 63 : */
select * from emp where emploi not in (select emploi from emp where noserv = 3) and noserv = 1;

/* Exercice 64 : */
select * from emp where emploi = (select emploi from emp as e1 where nom = 'CARON' and emp.sal > e1.sal);

/* Exercice 65 :  */
select * from emp where emp.noserv = 1 and emploi in (select emploi from emp join serv on emp.noserv = serv.noserv and serv.service = 'VENTES');

/* Exercice 66 : */
select * from emp join serv on emp.noserv = serv.noserv where ville = 'LILLE' and emploi = (select emploi from emp where nom = 'RICHARD') order by nom;

/* Exercice 67 : */
select * from emp as e1 where sal > (select avg(sal) from emp as e2 where e1.noserv = e2.noserv group by noserv )  order by noserv;

/* Exercice 68 :*/
select * from emp, serv where emp.noserv = serv.noserv and service = 'INFORMATIQUE' and YEAR(embauche) in (select YEAR(embauche) from emp, serv where emp.noserv = serv.noserv and serv.service = 'VENTES');

/* Exercice 69 : */
select nom, emploi, ville from emp as e1, serv where e1.noserv = serv.noserv and e1.noserv != (select noserv from emp as e2 where e1.sup = e2.noemp);

/* Exercice 70 : */
select nom, prenom, service, sal from emp natural join serv where exists ( select * from emp as e2 where emp.noemp = e2.sup) order by sal desc;

/* Exercice 71 : */
select nom, emploi, CONVERT(FORMAT(sal+coalesce(comm,0), 2, 'fr_FR'), DECIMAL(10,2)) as 'format(sal)' from emp order by 1;

/* Exercice 72 : */
select nom, sal, comm from emp where comm > (2 * sal);

/* Exercice 73 : */
select nom, prenom, emploi, round((comm*100)/(sal+comm), 2) as '% commissions' from emp where emploi = 'vendeur' order by 4 desc;

/* Exercice 74 :  */
select nom, emploi, service, round((sal+coalesce(comm,0))*12) as revenue_annuelle from emp natural join serv where emploi = 'vendeur';

/* Exercice 75 : */
select nom, prenom, emploi, sal, comm, sal+coalesce(comm,0) as revenue from emp;

/* Exercice 76 : */
select nom, prenom, emploi, sal as 'salaire', comm as commissions, sal+coalesce(comm,0) as gain_mensuel from emp;

/* Exercice 77 : */
select nom, prenom, emploi, sal as 'salaire', comm as commissions, sal+coalesce(comm,0) as "gain mensuel" from emp;

/* Exercice 78 : */
select nom, emploi, (sal/22) as journalier, ((select journalier)/8) as horaire, round((select journalier),2) as 'journalier(arrondi)', round((select journalier)/8, 2) as 'horaire(arrondi)' from emp;

/* Exercice 79 : */
select nom, emploi, (sal/22) as journalier, ((select journalier)/8) as horaire, truncate((select journalier),2) as 'journalier(arrondi)', truncate((select journalier)/8, 2) as 'horaire(arrondi)' from emp;

/* Exercice 80 : */
select concat(rpad(service,15, '-'),">", ville) from serv;

/* Exercice 81 : */
select nom, prenom, emploi , (case emploi
		when 'president' then 1
        when 'directeur' then 2
        when 'comptable' then 3
        when 'vendeur' then 4
        when 'technicien' then 5
        else 0
end) as code from emp;

/* Exercice 82 : */
select if(noserv = 1, "*****", nom) as nom, prenom from emp natural join serv;

/* Exercice 83 : */
select SUBSTR(service, 1, 5) from serv;
select left(service, 5) from serv;

/* 84 : */
select * from emp where YEAR(embauche) = 1988;

/* 85 */
select upper(nom) as Majuscule, concat(upper(substr(nom,1,1)), lower(substr(nom,2))) as mixte, lower(nom) as Minuscule from emp;

/* 86 */
select nom, locate("M", nom) as M, locate("E", nom) as E from emp;

/* 87 */
select service, length(service) from serv;

/* 88 */
select nom, emploi, sal, rpad("", sal/2000, "*") from emp order by sal;
/* 89*/
select nom, emploi, embauche from emp;

/* 90 */
select nom, emploi, date_format(embauche, '%d-%m-%y') as embauche from emp;

/* 91 */
select nom, emploi, date_format(embauche, '%W %D %M %Y') as embauche from emp;

/* 95 */
select nom, embauche, datediff(embauche, now()) as anciennete from emp;

/* 96 */
select *, timestampdiff(month, embauche, now()) as anciennete from emp;

/* 97 */
select nom, prenom,embauche, date_add(embauche, interval 12 year)as 'embauche+12' from emp;

/* 98 */
select * from emp where timestampdiff(month, embauche, now())/12 > 12;

/* 99 */
select "Luqmân" as nom, "Lalaoui" as prenom, datediff(now(), '2002-11-12') nombreDeJours;

/* 100 */
select "Luqmân" as nom, "Lalaoui" as prenom, date_add('2002-11-12', INTERVAL 10000 day) nombreDeJours;

/* 101 */
select emploi, avg(sal+coalesce(comm,0)) from emp where emploi = 'vendeur';

/* 102 */
set @temp = 'directeur';
select emploi, avg(sal+coalesce(comm,0)) from emp where emploi = @temp;

/* 103 */
select sum(sal+coalesce(comm,0)) from emp where emploi = 'vendeur';

/* 104 */
select max(sal), min(sal), (max(sal)-min(sal)) as difference from emp;

/* 105 */
select year(embauche),quarter(embauche), count(*) from emp group by year(embauche),quarter(embauche) order by year(embauche),month(embauche);

/* 106 */
select min(length(service)) from serv;

/* 107 */
select nom, emploi, sal+coalesce(comm,0) as revenue from emp where sal+coalesce(comm,0) = (select max(sal+coalesce(comm,0)) from emp);

/* 108 */
select count(*) from emp where noserv = 3 and comm is not null;

/* 109 */
select count(distinct emploi) from emp where noserv = 1;

/* 110 */
select count(noemp) from emp where noserv = 3;