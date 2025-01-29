package db

import (
    "errors"
	"database/sql"

    "otakuverse-api/src/constants"
    "otakuverse-api/pkg/openapi"
)

func GetWorks(variables ...string) ([]openapi.Work, error) {
    db, err := OpenDB()
    if err != nil {
        return nil, err
    }
    defer db.Close()

    rows, err := getFromTable(constants.WORKS_TABLE, "id=?", variables)
    if err != nil {
        return nil, errors.New("GetWorks: " + err.Error())
    }

    defer rows.Close()

	works := []openapi.Work{}
	for rows.Next() {
		work := openapi.Work{}
		err := rows.Scan(&work.Author, &work.Category, &work.Genre, &work.ImageUrl,
            &work.NumberOfChapters, &work.Status, &work.Synopsis, &work.Title,
            &work.Type, &work.Url,
        )
		if err != nil {
            return nil, errors.New("GetWorks: fail to scan work: " + err.Error())
		}
		works = append(works, work)
	}
	return works, nil
}

func getFromTable(tableName, condition string, variables ...any) (*sql.Rows, error) {
    if tableName == "" || condition == "" {
        return nil, errors.New("getFromTable: Missing informations. tableName: '" + tableName + "' condition: '" + condition + "'")
    }
    db, err := OpenDB()
    if err != nil {
        return nil, err
    }
    defer db.Close()

    rows, err := db.Query("SELECT FROM " + tableName + " WHERE " + condition + " LIMITE 5", variables)
    if err != nil {
        return nil, errors.New("getFromTable: Failed to execute the query:" + err.Error())
    }
    return rows, nil
}
