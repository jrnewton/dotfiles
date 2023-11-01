-- This file overrides 'flexprompt_autoconfig.lua'
-- put this in %LocalAppData%\clink\
-- Requires 'MesloLGS NF' fonts set as default in windows terminal

flexprompt = flexprompt or {}
flexprompt.settings = flexprompt.settings or {}
flexprompt.settings.charset = "unicode"
flexprompt.settings.connection = "disconnected"
flexprompt.settings.flow = "concise"
flexprompt.settings.heads = "pointed"
flexprompt.settings.left_frame = "none"
flexprompt.settings.left_prompt = "{battery:breakright}{histlabel}{cwd}{git}"
flexprompt.settings.lines = "two"
flexprompt.settings.nerdfonts_version = 3
flexprompt.settings.nerdfonts_width = 1
flexprompt.settings.powerline_font = true
flexprompt.settings.right_frame = "none"
flexprompt.settings.right_prompt = "{exit}{duration}"
flexprompt.settings.separators = "pointed"
flexprompt.settings.spacing = "normal"
flexprompt.settings.style = "rainbow"
flexprompt.settings.symbols =
{
    prompt =
    {
        ">",
        winterminal = "❯",
    },
}
flexprompt.settings.tails = "flat"
flexprompt.settings.use_8bit_color = true
flexprompt.settings.use_icons = false

-- manual changes

-- Run `git fetch` in a repo up to once every 60 minutes:
flexprompt.settings.git_fetch_interval = 15
flexprompt.settings.duration_threshold = 1

-- you also want this clink config:
--   set prompt.transient off
-- which ensures prompt is always repeated