-- From https://chrisant996.github.io/clink/clink.html#customizing-the-prompt
local green  = "\x1b[92m"
local yellow = "\x1b[93m"
local cyan   = "\x1b[36m"
local normal = "\x1b[m"

-- A prompt filter that discards any prompt so far and sets the
-- prompt to the current working directory.  An ANSI escape code
-- colors it yellow.
local cwd_prompt = clink.promptfilter(30)
function cwd_prompt:filter(prompt)
    return os.getcwd()..normal..">"
end

-- A prompt filter that appends the current git branch.
local git_branch_prompt = clink.promptfilter(100)
function git_branch_prompt:filter(prompt)
    local line = io.popen("git branch --show-current 2>nul"):read("*a")
    local branch = line:match("(.+)\n")
    if branch then
        return cyan.."["..branch.."]".." "..normal..prompt
    end
end

-- A prompt filter that adds a line feed and angle bracket.
-- local bracket_prompt = clink.promptfilter(150)
--function bracket_prompt:filter(prompt)
--    return prompt.."\n> "
--end