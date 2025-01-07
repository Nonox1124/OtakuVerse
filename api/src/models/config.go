package models

type Config struct {
    Env                               string               `json:"Env"`
    AppVersion                        string               `json:"AppVersion"`
    ListenAddr                        string               `json:"ListenAddr"`
    ListenPort                        string               `json:"ListenPort"`
    GinTrustedProxies                 []string             `json:"GinTrustedProxies"`
}
