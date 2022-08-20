local Translations = {
    notify = {
        ["hud_settings_loaded"] = "HUD Ayarları Yükleniyor!",
        ["hud_restart"] = "HUD Tekrar Başlatılıyor!",
        ["hud_start"] = "HUD Başlatıldı!",
        ["hud_command_info"] = "Bu komut hud ayarlarını sıfırlar!",
        ["load_square_map"] = "Harita Yükleniyor...",
        ["loaded_square_map"] = "Harita Yüklendi!",
        ["load_circle_map"] = "Circle Harita Yükleniyor...",
        ["loaded_circle_map"] = "Circle Harita Yüklendi!!",
        ["cinematic_on"] = "Cinematic Mode Açık!",
        ["cinematic_off"] = "Cinematic Mode Kapalı!",
        ["engine_on"] = "Motor Açıldı!",
        ["engine_off"] = "Motor Kapatıldı!",
        ["low_fuel"] = "Benzinin Bitmek Üzere!",
        ["access_denied"] = "Yetkili Değilsin!",
        ["stress_gain"] = "Stresleniyorsun!",
        ["stress_removed"] = "Sakinleşiyorsun!"
    }
}
Lang = Locale:new({phrases = Translations, warnOnMissing = true})
