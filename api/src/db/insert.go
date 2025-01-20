package db

import (
    "errors"
	"database/sql"

    "otakuverse-api/pkg/openapi"
    "otakuverse-api/src/utils"
    "otakuverse-api/src/const"
)

func InsertNewWorks(newWork openapi.Work) err {
    db, err := OpenDB()
	if err != nil {
		return err
	}
	defer db.Close()

    err := InsertIntoTable(WORKS_TABLE, WORKS_VALUES, newWork.Title, newWork.Author, newWork.Status, newWork.Synopsis, newWork.NumberOfChapters, newWork.Type, newWork.Category, newWork.Genre, newWork.Url, newWork.ImageUrl)
	if err != nil {
		return errors.New("InsertNewWorks: ", err)
	}
    return nil
}

func InsertIntoTable(tableName, tableContent string, variables ...any) error {
	nbOfVars := 0
	if tableName == "" || tableContent == "" {
		return errors.New("InsertIntoTable: Missing informations. tableName: '" + tableName + "' tableContent: '" + tableContent + "'")
	}
	db, err := OpenDB()

	if err != nil {
		return err
	}
	defer db.Close()

	request := "INSERT INTO " + tableName + " " + tableContent + " VALUES ("

	for _ := range variables {
		if nbOfVars == 0 {
			request += ", ?"
		} else {
			request += "?"
		}
		nbOfVars += 1
	}
	if nbOfVars < 1 {
		return errors.New("InsertIntoTable: No variables were passed.")
	}
	request += ")"

    stmt, err := db.Prepare(request)
	if err != nil {
		return errors.New("Failed to prepare statement:", err)
	}
	defer stmt.Close()

	_, err = stmt.Exec(variables)
	if err != nil {
		return errors.New("Failed to insert new works:", err)
	}
    return nil
}