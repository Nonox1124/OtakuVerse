package db

import (
    "errors"
	"database/sql"

    "otakuverse-api/pkg/openapi"
    "otakuverse-api/src/utils"
)

POSTGRES_INFO := \
	"host=" + utils.GetConfig().Database.URI +
	" port=" + utils.GetConfig().Database.Port +
	" user=" + utils.GetConfig().Database.User +
	" password" + utils.GetConfig().Database.Password +
	" dbname" + utils.GetConfig().Database.Name +
	" sslmode=disable"

func OpenDB() (*DB, err) {
    db, err := sql.Open("postgres", POSTGRES_INFO)
	if err != nil {
		return nil, err
	}
    return db, nil
}
