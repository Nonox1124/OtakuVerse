package db

import (
    // "errors"
	_ "github.com/lib/pq"
	"database/sql"

    // "otakuverse-api/pkg/openapi"
    "otakuverse-api/src/utils"
)

func getPostgresInfos() string {
	conf := utils.GetConfig().Database
	return "host=" + conf.URI + " port=" + conf.Port + " user=" + conf.User +
	" password" + conf.Password + " dbname" + conf.Name + " sslmode=disable"
}

func OpenDB() (sb *sql.DB, err error) {
    db, err := sql.Open("postgres", getPostgresInfos())
	if err != nil {
		return nil, err
	}
    return db, nil
}
