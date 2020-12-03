local lo_radio_transmitter = copyPrototype("lamp", "small-lamp", "lo-radio-transmitter")

	lo_radio_transmitter.name = "lo-radio-transmitter"
	lo_radio_transmitter.icon = "__lo-radio-telemetry__/resources/icons/radio-transmitter.png"
	lo_radio_transmitter.flags = {"placeable-neutral", "player-creation"}
	lo_radio_transmitter.minable = {hardness = 0.2, mining_time = 0.75, result = "lo-radio-transmitter"}
	lo_radio_transmitter.max_health = 125
	lo_radio_transmitter.corpse = "medium-remnants"
	lo_radio_transmitter.collision_box = {{-0.7, -0.7}, {0.7, 0.7}}
	lo_radio_transmitter.selection_box = {{-0.8, -0.8}, {0.8, 0.8}}
	lo_radio_transmitter.vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65}
	lo_radio_transmitter.fast_replaceable_group = "lo-radio-equipment"
	lo_radio_transmitter.light =
        {
            intensity = 0.0,
            size = 0
        }
    lo_radio_transmitter.energy_source =
        {
          type = "electric",
          usage_priority = "secondary-input",
          buffer_capacity = "5kJ",
        }
	lo_radio_transmitter.energy_usage_per_tick = "1kW"
	lo_radio_transmitter.picture_off =
        {
            filename = "__lo-radio-telemetry__/resources/entity/radio-transmitter.png",
            priority = "high",
            width = 235,
            height = 207,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = {2.69, -1.91}
        }
	lo_radio_transmitter.picture_on =
        {
            filename = "__lo-radio-telemetry__/resources/blank.png",
            priority = "high",
            width = 1,
            height = 1,
            frame_count = 1,
            axially_symmetrical = false,
            direction_count = 1,
            shift = {0.0, 0.0}
        }
	lo_radio_transmitter.circuit_wire_connection_point =
        {
            shadow =
            {
                red = {1.09, -0.19},
                green = {0.34, 0.56},
            },
            wire =
            {
                red = {0.66, -0.53},
                green = {-0.13, 0.22},
            }
        }
	lo_radio_transmitter.circuit_wire_max_distance = 100
	lo_radio_transmitter.additional_pastable_entities = {"lo-radio-receiver","lo-radio-constant"}

local lo_radio_receiver = copyPrototype("constant-combinator", "constant-combinator", "lo-radio-receiver")
	lo_radio_receiver.icon = "__lo-radio-telemetry__/resources/icons/radio-receiver.png"
	lo_radio_receiver.flags = {"placeable-neutral", "player-creation"}
	lo_radio_receiver.minable = {hardness = 0.2, mining_time = 0.75, result = "lo-radio-receiver"}
	lo_radio_receiver.max_health = 100
	lo_radio_receiver.corpse = "medium-remnants"
	lo_radio_receiver.collision_box = {{-0.7, -0.7}, {0.7, 0.7}}
	lo_radio_receiver.selection_box = {{-0.8, -0.8}, {0.8, 0.8}}
	lo_radio_receiver.fast_replaceable_group = "lo-radio-equipment"
	lo_radio_receiver.item_slot_count = 300
	lo_radio_receiver.sprites =
        {
            north =
            {
                filename = "__lo-radio-telemetry__/resources/entity/radio-receiver.png",
                width = 203,
                height = 179,
                frame_count = 1,
                shift = {2.25, -1.91},
            },
            east =
            {
                filename = "__lo-radio-telemetry__/resources/entity/radio-receiver.png",
                width = 203,
                height = 179,
                frame_count = 1,
                shift = {2.25, -1.91},
            },
            south =
            {
                filename = "__lo-radio-telemetry__/resources/entity/radio-receiver.png",
                width = 203,
                height = 179,
                frame_count = 1,
                shift = {2.25, -1.91},
            },
            west =
            {
                filename = "__lo-radio-telemetry__/resources/entity/radio-receiver.png",
                width = 203,
                height = 179,
                frame_count = 1,
                shift = {2.25, -1.91},
            }
        }
	lo_radio_receiver.activity_led_sprites =
        {
            north =
            {
                filename = "__lo-radio-telemetry__/resources/blank.png",
                width = 1,
                height = 1,
                frame_count = 1
            },
            east =
            {
                filename = "__lo-radio-telemetry__/resources/blank.png",
                width = 1,
                height = 1,
                frame_count = 1
            },
            south =
            {
                filename = "__lo-radio-telemetry__/resources/blank.png",
                width = 1,
                height = 1,
                frame_count = 1
            },
            west =
            {
                filename = "__lo-radio-telemetry__/resources/blank.png",
                width = 1,
                height = 1,
                frame_count = 1
            }
        }
        lo_radio_receiver.activity_led_light =
        {
            intensity = 0,
            size = 0
        }
        lo_radio_receiver.activity_led_light_offsets =
        {
            {0, 0},
            {0, 0},
            {0, 0},
            {0, 0}
        }
        lo_radio_receiver.circuit_wire_connection_points =
        {
            {
                shadow =
                {
                    red = {-0.09, 0.19},
                    green = {0.81, 0.47},
                },
                wire =
                {
                    red = {-0.41, -0.19},
                    green = {0.37, 0.0},
                }
            },
            {
                shadow =
                {
                    red = {-0.09, 0.19},
                    green = {0.81, 0.47},
                },
                wire =
                {
                    red = {-0.41, -0.19},
                    green = {0.37, 0.0},
                }
            },
            {
                shadow =
                {
                    red = {-0.09, 0.19},
                    green = {0.81, 0.47},
                },
                wire =
                {
                    red = {-0.41, -0.19},
                    green = {0.37, 0.0},
                }
            },
            {
                shadow =
                {
                    red = {-0.09, 0.19},
                    green = {0.81, 0.47},
                },
                wire =
                {
                    red = {-0.41, -0.19},
                    green = {0.37, 0.0},
                }
            }
        }
        lo_radio_receiver.circuit_wire_max_distance = 100
		lo_radio_receiver.additional_pastable_entities = {"lo-radio-transmitter","lo-radio-constant"}


local lo_radio_constant = copyPrototype("constant-combinator", "constant-combinator", "lo-radio-constant")
        lo_radio_constant.icon = "__lo-radio-telemetry__/resources/icons/radio-constant.png"
        lo_radio_constant.flags = {"placeable-neutral", "player-creation"}
        lo_radio_constant.minable = {hardness = 0.2, mining_time = 0.75, result = "lo-radio-constant"}
        lo_radio_constant.max_health = 100
        lo_radio_constant.corpse = "medium-remnants"
        lo_radio_constant.collision_box = {{-0.7, -0.7}, {0.7, 0.7}}
        lo_radio_constant.selection_box = {{-0.8, -0.8}, {0.8, 0.8}}
        lo_radio_constant.fast_replaceable_group = "lo-radio-equipment"
        lo_radio_constant.item_slot_count = 90
        lo_radio_constant.sprites =
        {
            north =
            {
                filename = "__lo-radio-telemetry__/resources/entity/radio-constant.png",
                width = 203,
                height = 179,
                frame_count = 1,
                shift = {2.25, -1.91},
            },
            east =
            {
                filename = "__lo-radio-telemetry__/resources/entity/radio-constant.png",
                width = 203,
                height = 179,
                frame_count = 1,
                shift = {2.25, -1.91},
            },
            south =
            {
                filename = "__lo-radio-telemetry__/resources/entity/radio-constant.png",
                width = 203,
                height = 179,
                frame_count = 1,
                shift = {2.25, -1.91},
            },
            west =
            {
                filename = "__lo-radio-telemetry__/resources/entity/radio-constant.png",
                width = 203,
                height = 179,
                frame_count = 1,
                shift = {2.25, -1.91},
            }
        }
        lo_radio_constant.activity_led_sprites =
        {
            north =
            {
                filename = "__lo-radio-telemetry__/resources/blank.png",
                width = 1,
                height = 1,
                frame_count = 1
            },
            east =
            {
                filename = "__lo-radio-telemetry__/resources/blank.png",
                width = 1,
                height = 1,
                frame_count = 1
            },
            south =
            {
                filename = "__lo-radio-telemetry__/resources/blank.png",
                width = 1,
                height = 1,
                frame_count = 1
            },
            west =
            {
                filename = "__lo-radio-telemetry__/resources/blank.png",
                width = 1,
                height = 1,
                frame_count = 1
            }
        }
        lo_radio_constant.activity_led_light =
        {
            intensity = 0,
            size = 0
        }
        lo_radio_constant.activity_led_light_offsets =
        {
            {0, 0},
            {0, 0},
            {0, 0},
            {0, 0}
        }
        lo_radio_constant.circuit_wire_connection_points =
        {
            {
                shadow =
                {
                    red = {-0.09, 0.19},
                    green = {0.81, 0.47},
                },
                wire =
                {
                    red = {-0.41, -0.19},
                    green = {0.37, 0.0},
                }
            },
            {
                shadow =
                {
                    red = {-0.09, 0.19},
                    green = {0.81, 0.47},
                },
                wire =
                {
                    red = {-0.41, -0.19},
                    green = {0.37, 0.0},
                }
            },
            {
                shadow =
                {
                    red = {-0.09, 0.19},
                    green = {0.81, 0.47},
                },
                wire =
                {
                    red = {-0.41, -0.19},
                    green = {0.37, 0.0},
                }
            },
            {
                shadow =
                {
                    red = {-0.09, 0.19},
                    green = {0.81, 0.47},
                },
                wire =
                {
                    red = {-0.41, -0.19},
                    green = {0.37, 0.0},
                }
            }
        }
        lo_radio_constant.circuit_wire_max_distance = 100
		lo_radio_constant.additional_pastable_entities = {"lo-radio-transmitter","lo-radio-receiver"}



local lo_radio_constant_inv_ctl = copyPrototype("constant-combinator", "constant-combinator", "lo-radio-constant-remote")
        lo_radio_constant_inv_ctl.icon = "__lo-radio-telemetry__/resources/icons/radio-constant.png"
        lo_radio_constant_inv_ctl.flags = {"placeable-neutral", "player-creation"}
        lo_radio_constant_inv_ctl.minable = {hardness = 0.2, mining_time = 0.75, result = "lo-radio-constant"}
        lo_radio_constant_inv_ctl.max_health = 1000000
        lo_radio_constant_inv_ctl.corpse = "medium-remnants"
        lo_radio_constant_inv_ctl.collision_box = {{0.0, 0.0}, {0.0, 0.0}}
        lo_radio_constant_inv_ctl.selection_box = {{0.0, 0.0}, {0.0, 0.0}}
        lo_radio_constant_inv_ctl.fast_replaceable_group = "lo-radio-equipment"
        lo_radio_constant_inv_ctl.item_slot_count = 90
		lo_radio_constant_inv_ctl.placeable_by = {item ="lo-radio-constant", count = 1}
        lo_radio_constant_inv_ctl.sprites =
        {
            north =
            {
                filename = "__lo-radio-telemetry__/resources/blank.png",
                width = 1,
                height = 1,
                frame_count = 1,
                shift = {0.0, 0},
            },
            east =
            {
                filename = "__lo-radio-telemetry__/resources/blank.png",
                width = 1,
                height = 1,
                frame_count = 1,
                shift = {0.0, 0},
            },
            south =
            {
                filename = "__lo-radio-telemetry__/resources/blank.png",
                width = 1,
                height = 1,
                frame_count = 1,
                shift = {0.0, 0},
            },
            west =
            {
                filename = "__lo-radio-telemetry__/resources/blank.png",
                width = 1,
                height = 1,
                frame_count = 1,
                shift = {0.0, 0},
            }
        }
        lo_radio_constant_inv_ctl.activity_led_sprites =
        {
            north =
            {
                filename = "__lo-radio-telemetry__/resources/blank.png",
                width = 1,
                height = 1,
                frame_count = 1,
            },
            east =
            {
                filename = "__lo-radio-telemetry__/resources/blank.png",
                width = 1,
                height = 1,
                frame_count = 1,
            },
            south =
            {
                filename = "__lo-radio-telemetry__/resources/blank.png",
                width = 1,
                height = 1,
                frame_count = 1,
            },
            west =
            {
                filename = "__lo-radio-telemetry__/resources/blank.png",
                width = 1,
                height = 1,
                frame_count = 1,
            }
        }
        lo_radio_constant_inv_ctl.activity_led_light =
        {
            intensity = 0,
            size = 0
        }
        lo_radio_constant_inv_ctl.activity_led_light_offsets =
        {
            {0, 0},
            {0, 0},
            {0, 0},
            {0, 0}
        }
        lo_radio_constant_inv_ctl.circuit_wire_connection_points =
        {
            {
                shadow =
                {
                    red = {0, 0},
                    green = {0, 0},
                },
                wire =
                {
                    red = {0, 0},
                    green = {0, 0},
                }
            },
            {
                shadow =
                {
                    red = {0, 0},
                    green = {0, 0},
                },
                wire =
                {
                    red = {0, 0},
                    green = {0, 0},
                }
            },
            {
                shadow =
                {
                    red = {0, 0},
                    green = {0, 0},
                },
                wire =
                {
                    red = {0, 0},
                    green = {0, 0},
                }
            },
            {
                shadow =
                {
                    red = {0, 0},
                    green = {0, 0},
                },
                wire =
                {
                    red = {0, 0},
                    green = {0, 0},
                }
            }
        }
        lo_radio_constant_inv_ctl.circuit_wire_max_distance = 100
		lo_radio_constant_inv_ctl.additional_pastable_entities = {"lo-radio-transmitter","lo-radio-receiver"}
		
data:extend({lo_radio_transmitter,lo_radio_receiver,lo_radio_constant,lo_radio_constant_inv_ctl})
