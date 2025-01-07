package main

import (
    "otakuverse-api/src/router"
    "otakuverse-api/src/utils"
)

func main() {
    if err := utils.LoadConfig("config", "."); err != nil {
        panic(err)
    }
    router := router.SetupRouter()
    router.Run(utils.GetConfig().ListenAddr + ":" + utils.GetConfig().ListenPort)
}
