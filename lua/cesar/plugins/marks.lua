local marks_setup, marks = pcall(require, "marks")
if not marks_setup then
	return
end

marks.setup()
