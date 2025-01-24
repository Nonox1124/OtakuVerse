package db

import (
    "errors"
	"database/sql"

    "otakuverse-api/pkg/openapi"
    "otakuverse-api/src/utils"
    "otakuverse-api/src/const"
)

func DeleteWorks(workID int) err {
    db, err := OpenDB()
	if err != nil {
		return err
	}
	defer db.Close()

    err := DeleteFromTable(WORKS_TABLE, "id = ?", Work)
	if err != nil {
		return errors.New("DeleteWorks: ", err)
	}
    return nil
}

func DeleteFromTable(tableName, conditions string, variables ...any) error {
	if tableName == "" || conditions == "" {
		return errors.New("DeleteFromTable: Missing informations. tableName: '" + tableName + "' tableContent: '" + tableContent + "'")
	}
	db, err := OpenDB()
	if err != nil {
		return err
	}
	defer db.Close()

    stmt, err := db.Prepare("DELETE FROM " + tableName + " WHERE " + conditions)
	if err != nil {
		return errors.New("DeleteFromTable: Failed to prepare statement:", err)
	}
	defer stmt.Close()

	_, err = stmt.Exec(variables)
	if err != nil {
		return errors.New("DeleteFromTable: Failed to insert new works:", err)
	}
    return nil