-- default tip text in case the httpreq() messes up, so we dont crash displaying a tip that has nil text
local tiptext = ""

-- get text from website
dohttpreq(
        "http://whatthecommit.com/index.txt",
        function(data, id)
                if not data:is_nil_or_empty() then
                        -- format the text to not be a (tiny) webpage
                        tiptext = string.sub(
                                tostring(data),
                                string.find(data, "<pre>") + 5,
                                string.find(data, "</pre>")
                        )
                end
        end
)

-- list of all tip icons that kinda make sense
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

-- override tip-getting function
function TipsTweakData:get_a_tip()
        return {
                image = applicable[math.random(#applicable)],
                index = math.random(2147483647),
                total = 2147483647,
                title = "tip",
                text = tiptext
        }
end

--[[
note that we don't override any other tip-related functions despite the entirety of TipsTweakData now becoming useless.
this is because we want our mod to have as few incompatibilities as possible, and even though it would be optimisation
to override those functions into nothing, that would be creeping outside of its original intended purpose.
]]--
