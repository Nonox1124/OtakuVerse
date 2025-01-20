package models

type DBInfos struct {
    URI                         string               `json:"URI"`
    Port                        string               `json:"Port"`
    User                        string               `json:"User"`
    Name                        string               `json:"Name"`
    Password                    string               `json:"Password"`
}

type Config struct {
    Env                               string               `json:"Env"`
    AppVersion                        string               `json:"AppVersion"`
    ListenAddr                        string               `json:"ListenAddr"`
    ListenPort                        string               `json:"ListenPort"`
    GinTrustedProxies                 []string             `json:"GinTrustedProxies"`
    Database                          DBInfos              `json:"Database"`
}
