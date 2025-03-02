package router

import (
    "net/http"

    "github.com/gin-gonic/gin"

    "otakuverse-api/src/db"
    "otakuverse-api/pkg/openapi"
)

func HelperGetCredentialsUser(c *gin.Context) {
    var credentials openapi.UserProfile
    tempTokenString := "Add token here"
    var token openapi.Token = openapi.Token{Token: &tempTokenString}

    err := c.BindJSON(&credentials)

    defer func() {
        if err != nil {
            c.IndentedJSON(http.StatusInternalServerError, err.Error())
        } else {
            c.IndentedJSON(http.StatusOK, token)
        }
    }()

    if err != nil {
        return
    }
    // check if valid credentials
    // add token generation here
}

func HelperPostCredentialsUser(c *gin.Context) {
    var credentials openapi.UserProfile
    tempTokenString := "Add token here"
    var token openapi.Token = openapi.Token{Token: &tempTokenString}

    err := c.BindJSON(&credentials)

    defer func() {
        if err != nil {
            c.IndentedJSON(http.StatusInternalServerError, err.Error())
        } else {
            c.IndentedJSON(http.StatusOK, token)
        }
    }()

    if err != nil {
        return
    }
    err = db.InsertCredentials(credentials)
    // add token generation here
}

func HelperDeleteCredentialsUser(c *gin.Context) {
    var credentials openapi.UserProfile

    err := c.BindJSON(&credentials)

    defer func() {
        if err != nil {
            c.IndentedJSON(http.StatusInternalServerError, err.Error())
        } else {
            c.IndentedJSON(http.StatusOK, "")
        }
    }()

    if err != nil {
        return
    }
    // check if valid token and credentials
    err = db.DeleteCredentials(credentials)
}

func HelperPatchCredentialsUser(c *gin.Context) {
    var credentials openapi.UserProfile
    tempTokenString := "Add token here"
    var token openapi.Token = openapi.Token{Token: &tempTokenString}

    err := c.BindJSON(&credentials)

    defer func() {
        if err != nil {
            c.IndentedJSON(http.StatusInternalServerError, err.Error())
        } else {
            c.IndentedJSON(http.StatusOK, token)
        }
    }()

    if err != nil {
        return
    }
    // check if valid token and credentials
    // update credentials
    //return new token
}