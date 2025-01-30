package db

import (
	"errors"
	"fmt"

	"otakuverse-api/pkg/openapi"
	"otakuverse-api/src/constants"
)

func InsertNewWorks(newWork openapi.Work) error {
	db, err := OpenDB()
	if err != nil {
		return err
	}
	defer db.Close()

	err = insertIntoTable(constants.WORKS_TABLE, constants.WORKS_VALUES, newWork.Title, newWork.Author, newWork.Status, newWork.Synopsis, newWork.NumberOfChapters, newWork.Type, newWork.Category, newWork.Genre, newWork.Url, newWork.ImageUrl)
	if err != nil {
		return errors.New("InsertNewWorks: " + err.Error())
	}
	return nil
}

func insertIntoTable(tableName, tableContent string, variables ...any) error {
	nbOfVars := 0
	if tableName == "" || tableContent == "" {
		return errors.New("insertIntoTable: Missing informations. tableName: '" + tableName + "' tableContent: '" + tableContent + "'")
	}
	db, err := OpenDB()

	if err != nil {
		return err
	}
	defer db.Close()

	request := "INSERT INTO " + tableName + " " + tableContent + " VALUES ("

	for i := range variables {
		if nbOfVars == 0 {
			request += fmt.Sprintf("$%d", i+1)
		} else {
			request += fmt.Sprintf(", $%d", i+1)
		}
		nbOfVars += 1
	}
	if nbOfVars < 1 {
		return errors.New("insertIntoTable: No variables were passed.")
	}
	request += ")"
	fmt.Println(request)
	stmt, err := db.Prepare(request)
	if err != nil {
		return errors.New("Failed to prepare statement:" + err.Error())
	}
	defer stmt.Close()

	interfaceVariables := make([]interface{}, len(variables))
	for i, v := range variables {
		interfaceVariables[i] = v
	}

	_, err = stmt.Exec(interfaceVariables...)
	if err != nil {
		return errors.New("Failed to insert:" + err.Error())
	}
	return nil
}
