function toggleApp(appName, key)
    hs.hotkey.bind({"ctrl"}, key, function()
        local app = hs.application.find(appName)
        if app == nil then
            hs.application.launchOrFocus("/Applications/" .. appName .. ".app")
        elseif app:isFrontmost() then
            app:hide()
        else
            hs.application.launchOrFocus("/Applications/" .. appName .. ".app")
        end
    end)
end
  
toggleApp("WezTerm", "t")
-- toggleApp("Slack", "s")
toggleApp("Notion", "n")
-- toggleApp("Todoist", "l")
-- toggleApp("Arc", "a")
toggleApp("Microsoft Outlook", "o")
-- toggleApp("Visual Studio Code", "v")