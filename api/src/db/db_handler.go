package db

import (
	_ "github.com/lib/pq"
	"database/sql"
	"fmt"
	"strings"

    "otakuverse-api/src/constants"
    "otakuverse-api/src/utils"
)

func isValidTable(table string) bool {
	for _, allowedTable := range constants.AllowedTables {
		if allowedTable == table {
			return true
		}
	}
	return false
}

func getPostgresInfos() string {
	conf := utils.GetConfig().Database
	return "host=" + conf.URI + " port=" + conf.Port + " user=" + conf.User +
	" password=" + conf.Password + " dbname=" + conf.Name + " sslmode=disable"
}

func OpenDB() (sb *sql.DB, err error) {
    db, err := sql.Open("postgres", getPostgresInfos())
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