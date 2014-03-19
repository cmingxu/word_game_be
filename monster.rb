$LOAD_PATH.unshift File.dirname(__FILE__) + "/src"

require "cli"
require "monster_config"
require "server"

require "awesome_print"

ap MonsterConfig.get("port")
Server.start
