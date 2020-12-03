data:extend(
{
    {
        type = "technology",
        name = "lo-radio-telemetry",
        icon = "__lo-radio-telemetry__/resources/icons/telemetry.png",
		icon_size = 64,
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "lo-radio-transmitter"
            },
            {
                type = "unlock-recipe",
                recipe = "lo-radio-receiver"
            },
            {
                type = "unlock-recipe",
                recipe = "lo-radio-constant"
            },
        },
        prerequisites = {"circuit-network"},
        unit =
        {
            count = 50,
            ingredients =
            {
--                {"science-pack-1", 1},
--                {"logistic-science-pack", 1},
            },
            time = 1
        },
        order = "a-d-e",
    },
}
)