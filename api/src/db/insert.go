package db

import (
	"errors"
	"database/sql"

	"otakuverse-api/pkg/openapi"
	"otakuverse-api/src/constants"
)

func InsertCredentials(newUser openapi.UserProfile) error {
	db, err := OpenDB(constants.UsersTable)
	if err != nil {
		return err
	}
	defer db.Close()
	tableContent := "(" + constants.UsersQueryValues + ")"

	err = insertIntoTable(db, constants.WorksTable, tableContent,
		newUser.Email, newUser.Username, newUser.Password)
	if err != nil {
		return errors.New("InsertCredentials: " + err.Error())
	}
	return nil
}

func InsertNewWorks(newWork openapi.Work) error {
	db, err := OpenDB(constants.TableNameGlobalWorks)
	if err != nil {
		return err
	}
	defer db.Close()
	tableContent := "(" + constants.WorksQueryValues + ")"

	err = insertIntoTable(db, constants.WorksTable, tableContent,
		newWork.Title, newWork.Author, newWork.Status, newWork.Synopsis,
		newWork.NumberOfChapters, newWork.Type, newWork.Category, newWork.Genre,
		newWork.Url, newWork.ImageUrl)
	if err != nil {
		return errors.New("InsertNewWorks: " + err.Error())
	}
	return nil
}

func insertIntoTable(db *sql.DB, tableName, tableContent string, variables ...any) error {
	request := "INSERT INTO " + tableName + " " + tableContent + " VALUES ("

	values := FormatArgumentString(variables...)
	if values == "" {
		return errors.New("insertIntoTable: No variables were passed.")
	}
	request += values + ")"
	stmt, err := db.Prepare(request)
	if err != nil {
		return errors.New("Failed to prepare statement:" + err.Error())
	}
	defer stmt.Close()

	_, err = stmt.Exec(variables...)
	if err != nil {
		return errors.New("Failed to insert:" + err.Error())
	}
	return nil
}
