local status_ok, dashboard = pcall(require, "dashboard")
if not status_ok then
  return
end

dashboard.custom_center = {
  {
    icon = '  ',
    desc = 'Recently latest session                  ',
    shortcut = 'SPC s l',
    action ='SessionLoad'
  },
}
