package db

import (
	"errors"

	"otakuverse-api/pkg/openapi"
	"otakuverse-api/src/constants"
)

func InsertNewWorks(newWork openapi.Work) error {
	db, err := OpenDB()
	if err != nil {
		return err
	}
	defer db.Close()

	err = insertIntoTable(constants.WORKS_TABLE, constants.WORKS_VALUES,
		newWork.Title, newWork.Author, newWork.Status, newWork.Synopsis,
		newWork.NumberOfChapters, newWork.Type, newWork.Category, newWork.Genre,
		newWork.Url, newWork.ImageUrl)
	if err != nil {
		return errors.New("InsertNewWorks: " + err.Error())
	}
	return nil
}

func insertIntoTable(tableName, tableContent string, variables ...any) error {
	if tableName == "" || tableContent == "" {
		return errors.New("insertIntoTable: Missing informations. tableName: '" +
		tableName + "' tableContent: '" + tableContent + "'")
	}
	db, err := OpenDB()

	if err != nil {
		return err
	}
	defer db.Close()

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

	// interfaceVariables := make([]interface{}, len(variables))
	// for i, v := range variables {
	// 	interfaceVariables[i] = v
	// }

	_, err = stmt.Exec(variables...)
	if err != nil {
		return errors.New("Failed to insert:" + err.Error())
	}
	return nil
}
