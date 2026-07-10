-- ============================================
-- AUTH SERVICE
-- ============================================
CREATE DATABASE auth_service;
CREATE USER auth_service_user WITH ENCRYPTED PASSWORD '12341234';
GRANT ALL PRIVILEGES ON DATABASE auth_service TO auth_service_user;

\c auth_service
GRANT ALL ON SCHEMA public TO auth_service_user;
ALTER DATABASE auth_service OWNER TO auth_service_user;

-- ============================================
-- JOB SERVICE
-- ============================================
\c postgres
CREATE DATABASE job_service;
CREATE USER job_service_user WITH ENCRYPTED PASSWORD '12341234';
GRANT ALL PRIVILEGES ON DATABASE job_service TO job_service_user;

\c job_service
GRANT ALL ON SCHEMA public TO job_service_user;
ALTER DATABASE job_service OWNER TO job_service_user;

-- ============================================
-- APPLICATION SERVICE
-- ============================================
\c postgres
CREATE DATABASE application_service;
CREATE USER application_service_user WITH ENCRYPTED PASSWORD '12341234';
GRANT ALL PRIVILEGES ON DATABASE application_service TO application_service_user;

\c application_service
GRANT ALL ON SCHEMA public TO application_service_user;
ALTER DATABASE application_service OWNER TO application_service_user;

-- ============================================
-- REVOKE CROSS-DATABASE CONNECT (cô lập từng service)
-- ============================================
\c postgres
REVOKE CONNECT ON DATABASE auth_service FROM PUBLIC;
REVOKE CONNECT ON DATABASE job_service FROM PUBLIC;
REVOKE CONNECT ON DATABASE application_service FROM PUBLIC;

GRANT CONNECT ON DATABASE auth_service TO auth_service_user;
GRANT CONNECT ON DATABASE job_service TO job_service_user;
GRANT CONNECT ON DATABASE application_service TO application_service_user;

-- ============================================
-- VERIFY
-- ============================================
\l