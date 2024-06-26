local ls = require("luasnip")
local types = require("luasnip.util.types")
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })

ls.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,

    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { " « ", "NonTest" } },
            },
        },
    },
}

local s = ls.s
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local events = require "luasnip.util.events"

local toexpand_count = 0

local date = function() return { os.date('%Y-%m-%d') } end
ls.add_snippets(nil, {
    python = {
        s(
            {
                trig = "date",
                namr = "Date",
                dscr = "Date in the form YYYY-MM-DD",
            }, {
                f(date, {}),
            }),

        s(
            {
                trig = "pd",
                namr = "pandas",
                dscr = "import pandas as pd",
            },
            {
                t({ "import pandas as pd" })
            }
        ),

        s(
            {
                trig = "np",
                namr = "pandas",
                dscr = "import numpy as np",
            },
            {
                t({ "import numpy as np" })
            }
        ),

        s(
            {
                trig = "mpl",
                namr = "matplotlib",
                dscr = "import matplotlib.pyplot as plt",
            },
            {
                t({ "import matplotlib.pyplot as plt", "plt.style.use('presentation')"
                })
            }
        ),

        s(
            {
                trig = "pl",
                namr = "polars",
                dscr = "import polars as pl",
            },
            {
                t({ "import polars as pl"
                })
            }
        ),

        s(
            {
                trig = "ice",
                namr = "icecream",
                dscr = "import icecream and sensible defaults",
            },
            {
                t({ "from icecream import ic", "ic.configureOutput(prefix='log_info| ', includeContext=True)"
                })
            }
        ),

        s(
            {
                trig = "fr",
                namr = "for loop",
                dscr = "dummy for loop",
            },
            {
                t({'for ii in range('}),
                i(1),
                t({ '):', '\t' }),
                i(0),
            }

        ),

        s(
        {
            trig = "spark",
            namr = "spark init",
            dscr = "initialize spark context",
        },
        {
            t({'spark = (', '\tSparkSession.builder.appName('}),
            i(1),
            t({')', '\t.enableHiveSupport()', '\t.getOrCreate()', ')'}),

        }
        )


    },
})
