local tiptext = ""
dohttpreq("http://whatthecommit.com/", function(data)
    if not data:is_nil_or_empty() then
        tiptext = string.sub(tostring(data), string.find(data, "<p>") + 3, string.find(data, "</p>") - 2)
    end
end)
local applicable = {
    "crimenet_basic_heists",
    "crimenet_fbifiles",
    "general_achievements",
    "general_difficulty",
    "general_escapes",
    "general_maplayout",
    "general_mastermind",
    "general_preplanning",
    "tactics_medicbag",
    "contact_bain",
    "contact_dentist"
}
function TipsTweakData:get_a_tip()
    return {
        image = applicable[math.random(#applicable)],
        index = math.random(2147483647),
        total = 2147483647,
        title = "Tip",
        text = tiptext
    }
end
