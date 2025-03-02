package router

import (
    "net/http"

    "github.com/gin-gonic/gin"

    "otakuverse-api/src/db"
    "otakuverse-api/pkg/openapi"
)

func HelperGetWorks(c *gin.Context, name string) {
    worksInfos, err := db.GetWorks(name)
    if err != nil {
        c.IndentedJSON(
            http.StatusInternalServerError,
            err.Error(),
        )
        return
    }
    c.IndentedJSON(
        http.StatusOK,
        worksInfos,
    )
}

func HelperDeleteWork(c *gin.Context, id int) {
    err := db.DeleteWorks(id)
    if err != nil {
        c.IndentedJSON(
            http.StatusInternalServerError,
            err.Error(),
        )
        return
    }
    c.IndentedJSON(
        http.StatusOK,
        "",
    )
}

func HelperPostWork(c *gin.Context) {
    var newWork openapi.Work
    err := c.BindJSON(&newWork)
    if err == nil {
        err = db.InsertNewWorks(newWork)
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
        "",
    )
}

func HelperPatchWork(c *gin.Context, workID openapi.Id) {
    var newWork openapi.Work
    err := c.BindJSON(&newWork)
    if err == nil {
        err = db.UpdateWork(newWork, workID)
    }
    if err != nil {
        c.IndentedJSON(
            http.StatusInternalServerError,
            err.Error(),
        )
    } else {
        c.IndentedJSON(
            http.StatusOK,
            "",
        )
    }
}