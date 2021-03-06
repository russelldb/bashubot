# Generates help commands for Hubot.
#
# These commands are grabbed from comment blocks at the top of each file.
#
# Commands: 
# hubot help - Displays all of the help commands that Hubot knows about.
# hubot help <query> - Displays all help commands that match <query>.

module.exports = (robot) ->
  robot.respond /help\s*(.*)?$/i, (msg) ->
    cmds = robot.helpCommands()
    if msg.match[1]
      cmds = cmds.filter (cmd) -> cmd.match(new RegExp(msg.match[1]))
    emit = cmds.join("\n")
    unless robot.name is 'Hubot'
      emit = emit.replace(/(H|h)ubot/g, robot.name)
    msg.send emit
