package db

import (
	"errors"
	// "database/sql"

	"otakuverse-api/pkg/openapi"
	"otakuverse-api/src/constants"
)

func DeleteCredentials(credentials openapi.UserProfile) error {
    db, err := OpenDB(constants.TableNameCredentials)
    if err != nil {
        return err
    }
    defer db.Close()

    err = deleteFromTable(constants.UsersTable, constants.TableNameCredentials, "")
    if err != nil {
        return errors.New("DeleteCredentials: " + err.Error())
    }
    return nil
}

func DeleteWorks(workID int) error {
    db, err := OpenDB(constants.TableNameGlobalWorks)
    if err != nil {
        return err
    }
    defer db.Close()

    err = deleteFromTable(constants.WorksTable, constants.TableNameGlobalWorks, "id=?")
    if err != nil {
        return errors.New("DeleteWorks: " + err.Error())
    }
    return nil
}

func deleteFromTable(table, tableName, condition string, variables ...any) error {
    if table == "" || tableName == "" || condition == "" {
        return errors.New("deleteFromTable: Missing informations. table: '" + table + "' tableName: '"+ tableName + "' condition: '" + condition + "'")
    }
    db, err := OpenDB(tableName)
    if err != nil {
        return err
    }
    defer db.Close()

    stmt, err := db.Prepare("DELETE FROM " + table + " WHERE " + condition)
    if err != nil {
        return errors.New("deleteFromTable: Failed to prepare statement:" + err.Error())
    }
    defer stmt.Close()

    _, err = stmt.Exec(variables...)
    if err != nil {
        return errors.New("deleteFromTable: Failed to delete" + err.Error())
    }
    return nil
}
