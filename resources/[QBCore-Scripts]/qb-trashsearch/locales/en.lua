local Translations = {
    info = {
        search = 'Çöpleri Karıştır',
    },
    error = {
        cooldown = 'Tekrar aramak için %{time} saniye beklemeniz gerekiyor',
        hasBeenSearched = "Bu çöp kutusu zaten arandı!",
        nothingFound = "Hiçbir şey bulamadın!",
    },
    progressbar = {
        searching = "Çöpler karıştırılıyor",
    },
    reward = {
        money = "%{amount}$ Para buldun!",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})