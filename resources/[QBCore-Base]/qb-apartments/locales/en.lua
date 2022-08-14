local Translations = {
    error = {
        to_far_from_door = 'Kapı zilinden çok uzaktasın',
        nobody_home = 'Evde kimse yok..',
    },
    success = {
        receive_apart = 'Bir daire aldın',
        changed_apart = 'Daireleri taşıdın',
    },
    info = {
        at_the_door = 'Kapıda birisi var!',
    },
    text = {
        enter = 'Daireye gir',
        ring_doorbell = 'Zili çal',
        logout = 'Karakterden çık',
        change_outfit = 'Kıyafetini değiştir',
        open_stash = 'Depoyu aç',
        move_here = 'Buraya hareket et',
        open_door = 'Kapıyı aç',
        leave = 'Daireden çık',
        close_menu = '⬅ Menüyü kapat',
        tennants = 'Kiracılar',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
