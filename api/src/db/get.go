package db

import (
    "errors"
	"database/sql"

    "otakuverse-api/src/constants"
    "otakuverse-api/pkg/openapi"
)

func GetAuthors() ([]openapi.Work, error) {
    db, err := OpenDB()
    if err != nil {
        return nil, err
    }
    defer db.Close()

    rows, err := getFromTable(constants.WORKS_TABLE, "")
    if err != nil {
        return nil, errors.New("GetAuthors: " + err.Error())
    }

    defer rows.Close()

	authors := []openapi.Work{}
	for rows.Next() {
		work := openapi.Work{}
		err := rows.Scan(&work.Author, &work.Category, &work.Genre, &work.ImageUrl,
            &work.NumberOfChapters, &work.Status, &work.Synopsis, &work.Title,
            &work.Type, &work.Url,
        )
		if err != nil {
            return nil, errors.New("GetAuthors: fail to scan work: " + err.Error())
		}
		authors = append(authors, work)
	}
	return authors, nil
}

func GetWorks(variables ...string) ([]openapi.WorkInformation, error) {
    db, err := OpenDB()
    if err != nil {
        return nil, err
    }
    defer db.Close()

    vars := make([]any, len(variables))
    for i, v := range variables {
        vars[i] = "%" + v + "%"
    }
    rows, err := getFromTable(constants.WORKS_TABLE, "title ILIKE $1", vars...)
    if err != nil {
        return nil, errors.New("GetWorks: " + err.Error())
    }

    defer rows.Close()
	works := []openapi.WorkInformation{}
	for rows.Next() {
		work := openapi.WorkInformation{}
		err := rows.Scan(&work.Id, &work.Title, &work.Author, &work.Status,
            &work.Synopsis, &work.NumberOfChapters, &work.Type,
            &work.Category, &work.Genre, &work.Url, &work.ImageUrl,
        )
		if err != nil {
            return nil, errors.New("GetWorks: fail to scan work: " + err.Error())
		}
		works = append(works, work)
	}
	return works, nil
}

func getFromTable(tableName, condition string, variables ...any) (*sql.Rows, error) {
    query := "SELECT * FROM " + tableName
    if (tableName != "" && condition == "") || (tableName == "" && condition != "") {
        return nil, errors.New("getFromTable: Missing informations. tableName: '" + tableName + "' condition: '" + condition + "'")
    }
    db, err := OpenDB()
    if err != nil {
        return nil, err
    }
    defer db.Close()

    if tableName != "" {
        query += " WHERE " + condition
    }
    query += " LIMIT 5"
    rows, err := db.Query(query, variables...)
    if err != nil {
        return nil, errors.New("getFromTable: Failed to execute the query:" + err.Error())
    }
    return rows, nil
}
