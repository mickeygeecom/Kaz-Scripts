

description "kaz_robbery"


dependency "vrp"

client_scripts{
  "cfg/bank.lua",
  "client.lua"
}

server_scripts{ 
  "@vrp/lib/utils.lua",
  "cfg/bank.lua",
  "server.lua"
}
