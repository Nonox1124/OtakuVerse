package db

import (
    "errors"

    "otakuverse-api/src/constants"
)

func GetWorks(workID int) error {
    db, err := OpenDB()
    if err != nil {
        return err
    }
    defer db.Close()

    err = getFromTable(constants.WORKS_TABLE, "id=?", )
    if err != nil {
        return errors.New("GetWorks: " + err.Error())
    }
    return nil
}

func getFromTable(tableName, condition string, variables ...any) error {
    if tableName == "" || condition == "" {
        return errors.New("getFromTable: Missing informations. tableName: '" + tableName + "' condition: '" + condition + "'")
    }
    db, err := OpenDB()
    if err != nil {
        return err
    }
    defer db.Close()

    stmt, err := db.Prepare("GetWorks FROM " + tableName + " WHERE " + condition)
    if err != nil {
        return errors.New("getFromTable: Failed to prepare statement:" + err.Error())
    }
    defer stmt.Close()

    _, err = stmt.Exec(variables)
    if err != nil {
        return errors.New("getFromTable: Failed to insert new works:" + err.Error())
    }
    return nil
}
