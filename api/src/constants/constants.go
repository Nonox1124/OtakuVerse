package constants

/* =============== DATABASE =============== */
const TableNameCredentials string = "credentials"
    /* =============== TABLES =============== */
    const SessionsTable string = "sessions"
        /* =============== QUERY =============== */
        const SessionsQueryValues string = "token, email"
    const UsersTable    string = "users"
        /* =============== QUERY =============== */
        const UsersQueryValues string = "email, username, password"

const TableNameGlobalWorks string = "global_works"
    /* =============== TABLES =============== */
    const AuthorTable      string = "authors"
    const WorksTable       string = "works"
        /* =============== QUERY =============== */
        const WorksQueryValues string = "title, author, status, synopsis, number_of_chapters, type, category, genre, url, image_url"

const TableNameUserWorks string = "user_works"

/* =============== ALLOWED TABLES =============== */
// declared as var because can't declare as const
var AllowedTablesCredentials = []string {SessionsTable, UsersTable}
var AllowedTablesGlobalWorks = []string {AuthorTable, WorksTable}
var AllowedTablesUserWorks = []string {}