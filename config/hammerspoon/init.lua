hs.hotkey.bind({"ctrl"}, "t", function()
    local wezterm = hs.application.find('wezterm')
    if wezterm:isFrontmost() then
        wezterm:hide()
    else
        hs.application.launchOrFocus("/Applications/WezTerm.app")
    end
end)

hs.hotkey.bind({"ctrl"}, "n", function()
    local nortion = hs.application.find('Notion')
    if nortion:isFrontmost() then
        nortion:hide()
    else
        hs.application.launchOrFocus("/Applications/Notion.app")
    end
end)
