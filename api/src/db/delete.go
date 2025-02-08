package db

import (
    "errors"

    "otakuverse-api/src/constants"
)

func DeleteWorks(workID int) error {
    db, err := OpenDB()
    if err != nil {
        return err
    }
    defer db.Close()

    err = deleteFromTable(constants.WORKS_TABLE, "id=?", )
    if err != nil {
        return errors.New("DeleteWorks: " + err.Error())
    }
    return nil
}

func deleteFromTable(tableName, condition string, variables ...any) error {
    if tableName == "" || condition == "" {
        return errors.New("deleteFromTable: Missing informations. tableName: '" + tableName + "' condition: '" + condition + "'")
    }
    db, err := OpenDB()
    if err != nil {
        return err
    }
    defer db.Close()

    stmt, err := db.Prepare("DELETE FROM " + tableName + " WHERE " + condition)
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
