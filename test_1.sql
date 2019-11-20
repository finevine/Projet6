/* Je récupère toutes les colonnes de la table projet
   + le nom et le prénom de l'utilisateur */
SELECT
    cat.name, COUNT(assoc.article_ID) article,
FROM
    article art, category cat, ArticlesCategories assoc,
    LEFT JOIN assoc ON art.id = assoc.article_ID
WHERE
    cat. = 'System42'
;

-- SELECT u.user_name, COUNT(a.project_id) projects
-- FROM users AS u
-- LEFT JOIN association a ON u.user_id = a.user_id
-- GROUP BY u.user_name

-- Users Table
-- user_id
-- user_name

-- Association Table
-- user_id
-- project_id

-- Project Table
-- project_id
-- project_name
