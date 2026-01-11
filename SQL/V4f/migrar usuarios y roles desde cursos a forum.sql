START TRANSACTION;

-- 1. Copiar usuarios
INSERT INTO forum.users (id, name, email, password, created_at, updated_at)
SELECT 
    id,
    CONCAT_WS(' ', firstname, lastname),
    email,
    password,
    created_at,
    updated_at
FROM cursos.users
ON DUPLICATE KEY UPDATE
    name = VALUES(name),
    email = VALUES(email),
    password = VALUES(password),
    updated_at = VALUES(updated_at);

-- 2. Copiar roles con mapeo
INSERT INTO forum.user_roles (user_id, role_id)
SELECT 
    model_id,
    CASE WHEN role_id = 1 THEN 1 ELSE 3 END
FROM cursos.model_has_roles
WHERE model_id IN (SELECT id FROM cursos.users)
ON DUPLICATE KEY UPDATE role_id = VALUES(role_id);

COMMIT;