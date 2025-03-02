package router

import (
    "net/http"

    "github.com/gin-gonic/gin"

    "otakuverse-api/src/db"
    "otakuverse-api/pkg/openapi"
)

func HelperGetCredentialsUser(c *gin.Context) {
    // non implemented func
}

func HelperPostCredentialsUser(c *gin.Context) {
    var credentials openapi.UserProfile
    err := c.BindJSON(&credentials)
    if err == nil {
        err = db.InsertCredentials(credentials)
    }
    if err != nil {
        c.IndentedJSON(
            http.StatusInternalServerError,
            err.Error(),
        )
        return
    }
    c.IndentedJSON(
        http.StatusOK,
        "Add user token here",
    )
}

func HelperDeleteCredentialsUser(c *gin.Context) {
    // non implemented func
}

func HelperPatchCredentialsUser(c *gin.Context) {
    // non implemented func
}