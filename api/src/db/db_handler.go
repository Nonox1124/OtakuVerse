package db

import (
	_ "github.com/lib/pq"
	"database/sql"
	"fmt"
	"strings"

    "otakuverse-api/src/constants"
    "otakuverse-api/src/utils"
)

func isValidTable(table, tableName string) bool {
	var allowedTables []string

	switch tableName {
		case constants.TableNameCredentials:
			allowedTables = constants.AllowedTablesCredentials
		case constants.TableNameGlobalWorks:
			allowedTables = constants.AllowedTablesGlobalWorks
		case constants.TableNameUserWorks:
			return true // each user has its own table
		default:
			return false
	}

	for _, allowedTable := range allowedTables {
		if allowedTable == table {
			return true
		}
	}
	return false
}

func getPostgresInfos(dbName string) string {
	conf := utils.GetConfig().Database
	return "host=" + conf.URI + " port=" + conf.Port + " user=" + conf.User +
	" password=" + conf.Password + " dbname=" + dbName + " sslmode=disable"
}

func OpenDB(dbName string) (*sql.DB, error) {
    db, err := sql.Open("postgres", getPostgresInfos(dbName))
	if err != nil {
		return nil, err
	}
    return db, nil
}

func FormatArgumentString(args ...any) string {
	formatedString := ""
	index := 1
	for _, _ = range args {
		if index == 1 {
			formatedString += fmt.Sprintf("$%d", index)
		} else {
			formatedString += fmt.Sprintf(", $%d", index)
		}
		index += 1
	}
	return formatedString
}

func FormatPatchArgumentString(arguments string) string {
	var formatedContent []string
	elemList := strings.Split(arguments, ", ")
	for i, elem := range elemList {
		formatedContent = append(formatedContent, fmt.Sprintf("%s=$%d", elem, i + 1))
	}
	return strings.Join(formatedContent, ", ")
}