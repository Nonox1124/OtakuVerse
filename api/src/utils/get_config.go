package utils

import (
    "sync"

    "github.com/spf13/viper"

    "otakuverse-api/src/models"
)

var once sync.Once

// Singleton is a global type used to store pointer of our configuration
type Singleton models.Config

var instance *Singleton

func GetConfig() *Singleton {
    once.Do(func() { // <-- atomic, does not allow repeating
        instance = new(Singleton) // <-- thread safe
    })
    return instance
}

// LoadConfig loads config from filename
func LoadConfig(configFile, filePath string) error {
    viper.SetConfigName("config")
    viper.SetConfigType("json")
    viper.AddConfigPath("/app")
    viper.AddConfigPath(".")
    if err := viper.ReadInConfig(); err != nil {
        if _, ok := err.(viper.ConfigFileNotFoundError); ok {
            // Config file not found; ignore error
        } else {
            // Config file was found but another error was produced
            panic(err)
        }
    }
    viper.SetDefault("ENV", "DEV")
    viper.SetDefault("LISTENADDR", "0.0.0.0")
    viper.SetDefault("LISTENPORT", "8080")
    viper.SetDefault("GINTRUSTEDPROXIES", []string{"127.0.0.1"})
    viper.AutomaticEnv() // override from env
    // inject viper values into config object to avoid replacing calls to config by viper everywhere
    // should replace it later
    config := GetConfig()
    viper.Unmarshal(&config)
    return nil
}
