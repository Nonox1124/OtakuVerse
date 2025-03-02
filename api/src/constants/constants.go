package constants

/* =============== DATABASE =============== */
    /* =============== TABLES =============== */
        const WorksTable string = "works"
        var AllowedTables = []string {WorksTable} // is a var because can't declare
    /* =============== VALUES =============== */
        const WorksValues string = "(title, author, status, synopsis, number_of_chapters, type, category, genre, url, image_url)"
    /* =============== QUERIES =============== */
        const WorksQueryValues string = "title, author, status, synopsis, number_of_chapters, type, category, genre, url, image_url"