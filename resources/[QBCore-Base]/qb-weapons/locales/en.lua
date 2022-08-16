local Translations = {
    error = {
        canceled = 'İptal edildi',
        max_ammo = 'Mermi kapasitesi doldu',
        no_weapon = 'Silaha sahip değilsin.',
        no_support_attachment = 'Bu silaha eklenti takamazsın.',
        no_weapon_in_hand = 'Elinde bir silah yok.',
        weapon_broken = 'Silahın kırık veya kullanılamaz halde.',
        no_damage_on_weapon = 'Silah sağlam bir hasarı yok..',
        weapon_broken_need_repair = 'Silahın bozulmuş, kullanmadan önce tamir etmelisin.',
        attachment_already_on_weapon = '%{value} Zaten silahına takılı.'
    },
    success = {
        reloaded = 'Şarjör takıldı'
    },
    info = {
        loading_bullets = 'Şarjör Değiştiriyorsun',
        repairshop_not_usable = 'Şuanda tamir edemezsin',
        weapon_will_repair = 'Silah zaten iyi durumda.',
        take_weapon_back = '[E] - Sırtına as',
        repair_weapon_price = '[E] Tamir et, ~g~$%{value}~w~',
        removed_attachment = '%{value} eklenti silahtan çıkarıldı!',
        hp_of_weapon = 'Silahının durumu'
    },
    mail = {
        sender = 'Mike',
        subject = 'Tamir',
        message = 'Your %{value} is repaired u can pick it up at the location. <br><br> Peace out madafaka'
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
