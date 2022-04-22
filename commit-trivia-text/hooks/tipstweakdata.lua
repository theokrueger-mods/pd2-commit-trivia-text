local tiptext = ""

dohttpreq(
        "http://whatthecommit.com/index.txt",
        function(data, id)
                 if not data:is_nil_or_empty() then
                         tiptext = string.sub(
                                 tostring(data),
                                 string.find(data, "<pre>") + 5,
                                 string.find(data, "</pre>")
                         )
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
                title = "tip",
                text = tiptext
        }
end
