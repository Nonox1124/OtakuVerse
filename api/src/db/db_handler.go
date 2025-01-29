package db

import (
    // "errors"
	"database/sql"

    // "otakuverse-api/pkg/openapi"
    "otakuverse-api/src/utils"
)

func getPostgresInfos() string {
	return "host=" + utils.GetConfig().Database.URI +
	" port=" + utils.GetConfig().Database.Port +
	" user=" + utils.GetConfig().Database.User +
	" password" + utils.GetConfig().Database.Password +
	" dbname" + utils.GetConfig().Database.Name +
	" sslmode=disable"
}

func OpenDB() (sb *sql.DB, err error) {
    db, err := sql.Open("postgres", getPostgresInfos())
	if err != nil {
		return nil, err
	}
    return db, nil
}
