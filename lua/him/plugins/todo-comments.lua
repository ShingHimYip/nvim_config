-- import comment plugin safely
local setup, todocomment = pcall(require, "todo-comments")
if not setup then
	return
end

-- TODO testing
--
-- NOTE enable comment
todocomment.setup()
