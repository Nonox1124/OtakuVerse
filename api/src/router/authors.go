package router

import (
    "net/http"

    "github.com/gin-gonic/gin"

    "otakuverse-api/src/db"
    // "otakuverse-api/pkg/openapi"
)

func HelperGetAuthors(c *gin.Context) {
    authorsInfos, err := db.GetAuthors()
    if err != nil {
        c.IndentedJSON(
            http.StatusInternalServerError,
            err.Error(),
        )
        return
    }
    c.IndentedJSON(
        http.StatusOK,
        authorsInfos,
    )
}

func HelperPostAuthor(c *gin.Context) {
    // non implemented func
}

func HelperDeleteAuthor(c *gin.Context) {
    // non implemented func
}