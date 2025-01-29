package db

import (
    "errors"
	// "database/sql"

    // "otakuverse-api/pkg/openapi"
    // "otakuverse-api/src/utils"
    "otakuverse-api/src/constants"
)

func DeleteWorks(workID int) error {
    db, err := OpenDB()
	if err != nil {
		return err
	}
	defer db.Close()

    err = InsertIntoTable(constants.WORKS_TABLE, "id=?", )
	if err != nil {
		return errors.New("DeleteWorks: " + err.Error())
	}
    return nil
}

func DeleteFromTable(tableName, condition string, variables ...any) error {
	if tableName == "" || condition == "" {
		return errors.New("DeleteFromTable: Missing informations. tableName: '" + tableName + "' condition: '" + condition + "'")
	}
	db, err := OpenDB()

	if err != nil {
		return err
	}
	defer db.Close()

    stmt, err := db.Prepare("DELETE FROM " + tableName + " WHERE " + condition)
	if err != nil {
		return errors.New("DeleteFromTable: Failed to prepare statement:" + err.Error())
	}
	defer stmt.Close()

	_, err = stmt.Exec(variables)
	if err != nil {
		return errors.New("DeleteFromTable: Failed to insert new works:" + err.Error())
	}
    return nil
}