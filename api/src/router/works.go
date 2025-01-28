package router

import (
    "net/http"

    "github.com/gin-gonic/gin"

    "otakuverse-api/db/db"
    "otakuverse-api/pkg/openapi"
)

func HelperGetWorks(c *gin.Context, username string) {
    // non implemented func
}

func HelperDeleteWork(c *gin.Context, id int) {
    var requestBody openapi.LauncherRequest
    err := c.BindJSON(&requestBody)
    DeleteWorks(id)
    if err != nil {
        go_modules_logger.GetLogger().Error("SteamHelper: Error while Json binding :" + err.Error())
// replace by str "ok"Error.New()
        c.IndentedJSON(
            http.StatusBadRequest,
            err,
        )
        return
    }
    c.IndentedJSON(
        http.StatusBadRequest,
        "",
    )
}

func HelperPostWork(c *gin.Context) {
    // non implemented func
}