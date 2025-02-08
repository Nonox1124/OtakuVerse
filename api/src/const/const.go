package constants

/* =============== DATABASE ===============*/
    /* =============== TABLES ===============*/
        const WORKS_TABLE string = "works"
        var ALLOWED_TABLES = []string {WORKS_TABLE} // is a var because can't declare 
    /* =============== VALUES ===============*/
        const WORKS_VALUES string = "(title, author, status, synopsis, number_of_chapters, type, category, genre, url, image_url)"
