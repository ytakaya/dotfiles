hs.hotkey.bind({"ctrl"}, "t", function()
    local wezterm = hs.application.find('wezterm')
    if wezterm:isFrontmost() then
        wezterm:hide()
    else
        hs.application.launchOrFocus("/Applications/WezTerm.app")
    end
end)
