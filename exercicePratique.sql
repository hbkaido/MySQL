/* Exercice 24 */
select * from emp where emploi in ('TECHNICIEN', 'VENDEUR', 'COMPTABLE');

/* Exercice 25 */
select * from emp where emploi not in ('TECHNICIEN', 'VENDEUR', 'COMPTABLE');

/* Exercice 26 */
select * from emp where noserv in (2, 4, 5) and emploi in ('DIRECTEUR');

/* Exercice 27 */
select * from emp where noserv not in (1, 3, 5) and sup is not null;

/* Exercice 28 */
select * from emp where sal between 20000 and 40000;

/* Exercice 29 */
select * from emp where sal not between 20000 and 40000;

/* Exercice 30 */
select * from emp where embauche between '1988-01-01' and '1988-12-31' and emploi not like 'DIRECTEUR';

/* Exercice 31 */
select * from emp where emploi = 'DIRECTEUR' and noserv between 2 and 5;

/* Exercice 32 */
select * from emp where nom like 'M%';

/* Exercice 33 */
select * from emp where nom like '%T';

/* Exercice 34 */
select * from emp where nom like '%E%E%';

/* Exercice 35 */
select * from emp where nom like '%E%' and nom not like '%E%E%';

/* Exercice 36 */
select * from emp where nom like '%N%O%' or nom like '%O%N%';

/* Exercice 37 */
select * from emp where nom like '_____N';

/* Exercice 38 */
select * from emp where nom like '__R%';

/* Exercice 39 */
select * from emp where nom like '______';

/* Exercice 40 */
select nom, prenom, noserv, sal from emp where noserv = 3 order by sal;

/* Exercice 41 */
select nom, prenom, noserv, sal from emp where noserv = 3 order by sal desc;

/* Exercice 43 */
select nom, prenom, noserv, sal, emploi from emp order by emploi, sal desc;

/* Exercice 45 */
select nom, prenom, noserv, comm from emp where noserv = 3 order by comm;

/* Exercice 46 */
select nom, prenom, noserv, comm from emp where noserv = 3 and comm is not null order by comm desc;

/* Exercice 47 */
select nom, prenom, emploi, service from emp, serv where emp.noserv = serv.noserv;

/* Exercice 48 */ 
select nom, emploi, emp.noserv, service from emp join serv on emp.noserv = serv.noserv order by noserv;

/* Exercice 49 */
select nom, emploi, e1.noserv, service from emp as e1, serv as s1 where e1.noserv = s1.noserv;

/* Exercice 50 */
select nom, emploi, serv.noserv, serv.service, serv.ville from emp join serv where emp.noserv = serv.noserv;

/* Exercice 51 */
select emp.nom, emp.embauche, emp.sup, sup.noemp, sup.nom as nomSup, sup.embauche as embaucheSup from emp, emp as sup where sup.noemp = emp.sup and emp.embauche<sup.embauche order by emp.nom, sup.nom;

/* Exercice 52 */
select prenom, emploi, noserv from emp where emploi = 'DIRECTEUR' union select prenom, emploi, noserv from emp where noserv = 1 and emploi = 'TECHNICIEN';

/* Exercice 53 */
select serv.noserv from serv where serv.noserv not in (select emp.noserv from emp where emp.emploi is not null);

/* Exercice 54 */
select serv.service from serv where serv.noserv in (select emp.noserv from emp where emp.emploi is not null);

/* Exercice 54 bis */
select serv.noserv from serv where serv.noserv in (select emp.noserv from emp where emp.emploi is not null);

/* Exercice 55 */
select nom, prenom, emploi, serv.noserv, serv.ville from emp, serv where serv.ville in (select 'LILLE' from serv) and emp.noserv = serv.noserv order by serv.noserv, nom;

/* Exercice 56 */
select emp.noemp, emp.nom, emp.sup, sup.noemp, sup.nom as nomSup from emp, emp as sup where sup.noemp = emp.sup and emp.sup = (select sup from emp where nom = 'DUBOIS') and emp.nom not in ('DUBOIS');

/* Exercice 57 */
select nom, prenom, embauche from emp where embauche = (select embauche from emp where nom = 'DUMONT');

/* Exercice 58 */
select nom, prenom, embauche from emp where embauche < (select embauche from emp where nom = 'MINET') order by embauche;

/* Exercice 59 */
select nom, prenom, embauche from emp where embauche < (select min(embauche) from emp where noserv = 6) order by embauche;

/* Exercice 60 */
select nom, prenom, sal from emp where sal > (select max(sal) from emp where noserv = 3) order by sal;

/* Exercice 61 */
select nom, prenom, emp.noserv, emploi, sal, ville from emp join serv where ville in (select 'LILLE' from serv) and emp.noserv = serv.noserv order by serv.noserv;

/* Exercice 62 */
select nom, prenom, emploi, noserv from emp where noserv = 1 and emploi in (select emploi from emp where noserv = 3);

/* Exercice 63 */
select nom, prenom, emploi, noserv from emp where noserv = 1 and emploi not in (select emploi from emp where noserv = 3);

/* Exercice 64 */
select nom, prenom, emploi, sal from emp where emploi = (select emploi from emp where nom ='CARON') and sal > (select sal from emp where nom ='CARON');

/* Exercice 65 */
select nom, prenom, emploi, noserv from emp where noserv = 1 and emploi in (select emploi from serv,emp where service ='VENTES' and emp.noserv = serv.noserv);

/* Exercice 66 */
select nom, prenom, emploi, emp.noserv, ville from emp, serv where (emploi, ville) in (select emploi, ville from emp, serv where nom ='RICHARD' and ville ='LILLE') and emp.noserv = serv.noserv order by nom;

/* Exercice 67 */
select nom, prenom, emploi, noserv, sal from emp where sal > (select avg(sal) from emp) order by noserv;

/* Exercice 68 */
select nom, prenom, emploi, service, YEAR(embauche) from emp, serv where service = 'INFORMATIQUE' and embauche in (select embauche from emp, serv where service = 'VENTES')  and emp.noserv = serv.noserv;

/* Exercice 69 */
select emp.noserv, emp.nom, emp.sup, sup.noserv, sup.noemp, sup.nom as nomSup from emp, emp as sup where sup.noemp = emp.sup and sup.noserv != emp.noserv;

/* Exercice 70 */
select nom, prenom, emploi, service, sal from emp, serv where noemp in (select sup from emp) and emp.noserv = serv.noserv order by sal desc;