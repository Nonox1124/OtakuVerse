package db

import (
	"errors"
	"strconv"

	"otakuverse-api/pkg/openapi"
	"otakuverse-api/src/constants"
)

func UpdateWork(newWork openapi.Work, workID openapi.Id) error {
	db, err := OpenDB()
	if err != nil {
		return err
	}
	defer db.Close()

	err = updateDB(constants.WorksTable, constants.WorksQueryValues , workID,
		newWork.Title, newWork.Author, newWork.Status, newWork.Synopsis,
		newWork.NumberOfChapters, newWork.Type, newWork.Category, newWork.Genre,
		newWork.Url, newWork.ImageUrl)
	if err != nil {
		return errors.New("InsertNewWorks: " + err.Error())
	}
	return nil
}

func updateDB(tableName, tableContent string, itemID int, variables ...any) error {
	if tableName == "" || tableContent == "" {
		return errors.New("updateDB: Missing informations. tableName: '" +
		tableName + "' tableContent: '" + tableContent + "'")
	}
	db, err := OpenDB()

	if err != nil {
		return err
	}
	defer db.Close()

	values := FormatPatchArgumentString(tableContent)
	if values == "" {
		return errors.New("insertIntoTable: No variables were passed.")
	}
	request := "UPDATE " + tableName + " SET " + values

    request += " WHERE Id = " + strconv.Itoa(itemID)
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
