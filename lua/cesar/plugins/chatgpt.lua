local chatgpt_status, chatgpt = pcall(require, "chatgpt")
if not chatgpt_status then
	return
end

chatgpt.setup()
