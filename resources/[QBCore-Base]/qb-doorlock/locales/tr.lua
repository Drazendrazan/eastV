local Translations = {
    error = {
        lockpick_fail = "Hata: Kilit açılamadı.",
        door_not_found = "Bir kapı bulunamadı,kapı çerçevesini hedeflediğinize emin olun",
        same_entity = "Her iki kapı da aynı olamaz",
        door_registered = "Bu kapı zaten kayıtlı",
        door_identifier_exists = "Yapılandırmada bu tanımlayıcıya sahip bir kapı bulunmakta. (%s)",
    },
    success = {
        lockpick_success = "Başarılı"
    },
    general = {
        locked = "Kilitlendi",
        unlocked = "Kilit Açıldı",
        locked_button = "[E] - Kilitli",
        unlocked_button = "[E] - Kilit açıldı",
        keymapping_description = "Kapı kilidi ile etkileşim",
        keymapping_remotetriggerdoor = "Kapıyı uzaktan tetikle",
        locked_menu = "Kilitli",
        pickable_menu = "Kilitlenebilir",
        cantunlock_menu = 'Kilidi açamazsın',
        hidelabel_menu = 'Kapı Etiketini Gizle',
        distance_menu = "Maksimum uzaklık",
        item_authorisation_menu = "Öğe Yetkilendirme",
        citizenid_authorisation_menu = "Vatandaş kimlik yetkilendirme",
        gang_authorisation_menu = "Çete Yetkilendirme",
        job_authorisation_menu = "İş Yetkilendirme",
        doortype_title = "Kapı Tipi",
        doortype_door = "Tek Kapı",
        doortype_double = "Çift Kapı",
        doortype_sliding = "Tek Kayar Kapı",
        doortype_doublesliding = "Çift Kayar Kapı",
        doortype_garage = "Garaj",
        dooridentifier_title = "Benzersiz tanımlayıcı",
        doorlabel_title = "Kapı Etiketi",
        configfile_title = "Yapılandırma Dosyasının Adı",
        submit_text = "Gönder",
        newdoor_menu_title = "Yeni bir kapı ekle",
        newdoor_command_description = "Kapı Kilit Sistemine Yeni Bir Kapı Ekle",
        doordebug_command_description = "Hata Ayıklama Modu",
        warning = "Uyarı",
        created_by = "Tarafından yaratıldı",
        warn_no_permission_newdoor = "%{player} (%{license}) izinsiz yeni bir kapı eklemeye çalıştı (source: %{source})",
        warn_no_authorisation = "%{player} (%{license}) izinsiz kapı açmaya çalıştı (Sent: %{doorID})",
        warn_wrong_doorid = "%{player} (%{license}) geçersiz kapıyı çaldı (Sent: %{doorID})",
        warn_wrong_state = "%{player} (%{license}) geçersiz bir durumu güncellemeye çalıştı (Sent: %{state})",
        warn_wrong_doorid_type = "%{player} (%{license}) uygun bir kapı numarası göndermedi (Sent: %{doorID})",
        warn_admin_privilege_used = "%{player} (%{license}) admin ayrıcalığı ile bir kapı açtı"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})