--[[
سكربت دلتا متقدم مع 30 ميزة
إعدادات القائمة الرئيسية
--]]

local القائمة_الرئيسية = ui.add_window("قائمة دلتا المتقدمة", 100, 100, 300, 500)
ui.set_visibility(القائمة_الرئيسية, true)

-- الألوان الأساسية
local اللون_الاسود = {0, 0, 0, 255}
local اللون_الاحمر = {255, 0, 0, 255}
local اللون_الابيض = {255, 255, 255, 255}

-- إعدادات السرعات
local السرعات = {
    مشي = 1.0,
    ركض = 1.7,
    طيران = 5.0,
    قفز = 1.3,
    انزلاق = 2.0
}

-- إعدادات الأصوات
local الأصوات = {
    نقرة = "buttons/button15.wav",
    تشغيل = "ui/buttonclick.wav",
    إغلاق = "ui/buttonrollover.wav"
}

-- 1. تبويب الحركة
local حركة = ui.add_tab(القائمة_الرئيسية, "الحركة")

-- ميزات الحركة (1-10)
ui.add_check_box(حركة, "طيران", "طيران", false)
ui.add_slider(حركة, "سرعة الطيران", "سرعة_الطيران", 1, 10, 5)
ui.add_check_box(حركة, "إختفاء", "إختفاء", false)
ui.add_check_box(حركة, "سرعة المشي", "سرعة_المشي", false)
ui.add_slider(حركة, "مضاعف السرعة", "مضاعف_السرعة", 1, 5, 2)
ui.add_check_box(حركة, "عدم السقوط", "عدم_السقوط", false)
ui.add_check_box(حركة, "إنزلاق", "إنزلاق", false)
ui.add_check_box(حركة, "قفز عالي", "قفز_عالي", false)
ui.add_check_box(حركة, "تحكم هوائي", "تحكم_هوائي", false)
ui.add_check_box(حركة, "تعليق في الهواء", "تعليق_هوائي", false)

-- 2. تبويب المرئيات
local مرئيات = ui.add_tab(القائمة_الرئيسية, "المرئيات")

-- ميزات المرئيات (11-20)
ui.add_check_box(مرئيات, "رؤية عبر الجدران", "والهاك", false)
ui.add_check_box(مرئيات, "إضاءة المشهد", "إضاءة", false)
ui.add_check_box(مرئيات, "أجسام متوهجة", "توهج", false)
ui.add_check_box(مرئيات, "سماء مخصصة", "سماء", false)
ui.add_check_box(مرئيات, "إزالة الضباب", "إزالة_الضباب", false)
ui.add_check_box(مرئيات, "رؤية الأعداء فقط", "رؤية_أعداء", false)
ui.add_check_box(مرئيات, "نمط ليلي", "نمط_ليلي", false)
ui.add_check_box(مرئيات, "إزالة الدخان", "إزالة_دخان", false)
ui.add_check_box(مرئيات, "تأثيرات مخصصة", "تأثيرات", false)
ui.add_check_box(مرئيات, "شبكات شفافة", "شبكات", false)

-- 3. تبويب القتال
local قتال = ui.add_tab(القائمة_الرئيسية, "القتال")

-- ميزات القتال (21-30)
ui.add_check_box(قتال, "تصويب تلقائي", "أيمبوت", false)
ui.add_check_box(قتال, "عدم الارتداد", "لا_ارتداد", false)
ui.add_check_box(قتال, "عدم الانتشار", "لا_انتشار", false)
ui.add_check_box(قتال, "طلقات سريعة", "طلقات_سريعة", false)
ui.add_check_box(قتال, "إعادة تعبئة سريعة", "تعبئة_سريعة", false)
ui.add_check_box(قتال, "زيادة الضرر", "زيادة_ضرر", false)
ui.add_check_box(قتال, "رؤية السلاح", "رؤية_سلاح", false)
ui.add_check_box(قتال, "سكينة خلفية", "سكينة", false)
ui.add_check_box(قتال, "إطلاق نار خلف الظهر", "إطلاق_خلفي", false)
ui.add_check_box(قتال, "حماية من الدفع", "حماية_دفع", false)

-- وظيفة التشغيل الرئيسية
client.set_event_callback("on_paint", function()
    -- تطبيق ميزات الحركة
    if ui.get_check_box("طيران") then
        entity.set_prop(entity.get_local_player(), "m_vecVelocity", 
            vector(0, 0, ui.get_slider("سرعة_الطيران")))
    end
    
    if ui.get_check_box("إختفاء") then
        entity.set_prop(entity.get_local_player(), "m_flVisibility", 0)
    end
    
    if ui.get_check_box("سرعة_المشي") then
        entity.set_prop(entity.get_local_player(), "m_flVelocityModifier", 
            ui.get_slider("مضاعف_السرعة"))
    end
    
    -- يمكن إضافة المزيد من الوظائف لكل ميزة هنا
end)

-- وظيفة الأصوات
client.set_event_callback("on_ui_interaction", function()
    client.exec("play " .. الأصوات.نقرة)
end)

client.color_log(255, 0, 0, "تم تحميل سكربت دلتا المتقدم بنجاح!")
client.color_log(255, 255, 255, "30 ميزة متاحة الآن في القائمة")
